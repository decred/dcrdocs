# <img class="dcr-icon" src="/img/dcr-icons/Servers.svg" /> dcrtime

---

dcrtime is a timestamping application that allows users to store hashes of arbitrary data on the Decred blockchain. Inspired by Peter Todd's [OpenTimestamps](https://petertodd.org/2016/opentimestamps-announcement), dcrtime was originally built to store timestamped hashes of data from [Politeia](../governance/politeia/overview.md), Decred's proposal system, on the Decred blockchain. It can also be used as a generic timestamping service.

dcrtime is implemented as a client and server application, with all code open source and available in the [dcrtime repo](https://github.com/decred/dcrtime). Decred also offers a free timestamping service through its [public mainnet server](https://timestamp.decred.org/) and a web application, [dcrtimegui](https://github.com/decred/dcrtimegui), that uses dcrtime as the backend. We expect this to be particularly useful in scenarios where transparency, accountability and time-ordering are of key importance, in either a public or private context (e.g. computer security, data integrity and various compliance contexts).

In this page, we list some [notable uses](#notable-uses) of dcrtime, as well as describe the high-level [timestamping process](#timestamping-process), [dcrtime architecture](#dcrtime-architecture), and [dcrtime's implementation details](#dcrtime-implementation) via examples.

## Notable uses

Below are some notable uses of dcrtime:

* **Politeia:** all data submitted to Politeia (proposals, votes, comments, comment upvotes/downvotes, etc.) is commited to a public [git repository](https://github.com/decred-proposals/mainnet) every hour. Each commit is then hashed and timestamped onto the Decred blockchain using dcrtime. 
* **dcrtimestamptweet:** A Twitter bot ([@dcrtimestampbot](https://twitter.com/dcrtimestampbot), [git repo](https://github.com/tiagoalvesdulce/dcrtimestamptweet)) that uses dcrtime to timestamp a thread when a chosen keyword is mentioned. This bot uses [IPFS](https://en.wikipedia.org/wiki/InterPlanetary_File_System) as a decentralized database to store the tweet thread. 
* **Timestamping election data:** In the 2018 Brazillian presidential election, candidate Fernando Haddad [used dcrtime](https://cointelegraph.com/news/brazilian-presidential-candidate-uses-blockchain-to-publish-government-plan) to timestamp his government plan and information about his campaign. 

## Timestamping process

dcrtime allows a nearly unlimited number of hashes to be timestamped. It does this by creating a single merkle root from any number of hashes and including it in a transaction on the Decred blockchain. This process can be summarized as follows:

1. A 32-byte hash is created for each document or piece of data to be timestamped.
1. A single merkle root is calculated from the hashes.
1. This merkle root is included in an on-chain transaction, "anchoring" the data in the Decred blockchain by timestamping the data.
1. A transaction hash and merkle path is generated, which can then be used to query the Decred blockchain and retrieve the block containing the transaction (and associated timestamp).

To help verify an anchor against the blockchain, a command line tool [dcrtime_checker](https://github.com/decred/dcrtime/tree/master/cmd/dcrtime_checker) is provided.  

## dcrtime architecture

The dcrtime service is comprised of four components:

* **dcrtime:** Reference client application
* **dcrtimed (proxy mode):** The dcrtimed server application in proxy mode. In proxy mode, dcrtimed forwards requests to the backend server (the same dcrtimed server application but in server mode). This is done as a security measure, so that a daemon with a wallet passphrase is not directly connected to the internet. This also allows the frontend to scale.
* **dcrtimed (server mode):** The dcrtimed server application in server mode. In server mode, dcrtimed manages timestamps forwarded to it by the dcrtimed proxy and creates the Decred transaction that anchors transactions in the blockchain.
* **dcrwallet:** A Decred wallet daemon.
* **dcrd:** A full node implementation of Decred.

The diagram below illustrates how the components are connected. 

![dcrtime architecture](/img/dcrtime_architecture_diagram.png)

## dcrtime implementation

In this section, we'll explore how the dcrtime architecture is implemented using two examples: a simple example where we timestamp a single text file from the command line, and a more complex example that uses dcrtime to episodically timestamp data from Politeia.

If you wish to follow along, instructions on setting up dcrtime can be found in the [dcrtime repo](https://github.com/decred/dcrtime).

### Simple example

In this example, we'll use the dcrtime Command Line Interface (CLI) to timestamp a single text file, `myfile.txt`.

The below command submits the file to Decred's timestamping server running on testnet.

```
$ dcrtime --testnet -v myfile.txt
8496855341883fdc90cc532f8304d1c46a60586fb15d99f07e41bb5ab19c79c6 Upload myfile.txt
8496855341883fdc90cc532f8304d1c46a60586fb15d99f07e41bb5ab19c79c6 OK     myfile.txt
Collection timestamp: 1497009600
```

As we can see from the output, dcrtime first creates a "digest" from `myfile.txt` (a base64 encoded hash of the file):

`8496855341883fdc90cc532f8304d1c46a60586fb15d99f07e41bb5ab19c79c6`

It also creates a "Collection timestamp" corresponding to the time the file was received by the server.

`Collection timestamp: 1497009600`

If we immediately ask the server if the timestamp has been verified, it will show `Not anchored`. This is because our transaction containing the digest has not yet been mined into a block.

```
$ dcrtime --testnet -v
cd90cc268d9ceef6e276bfa7a615c5f85b5a27b0d917ee3f1f1e5d5598f2fa00
cd90cc268d9ceef6e276bfa7a615c5f85b5a27b0d917ee3f1f1e5d5598f2fa00 Verify
cd90cc268d9ceef6e276bfa7a615c5f85b5a27b0d917ee3f1f1e5d5598f2fa00 Not anchored
```

If we wait until the transaction containing the merkle root has been mined into a block and call dcrtime again, the dcrtime server will verify that the transaction has been anchored, as well as provide the merkle path (path to the merkle root), the transaction ID (TxID) of the transaction containing the merkle root, and a `Chain Timestamp` providing the time the block was mined. 

```
$ dcrtime --testnet -v 8496855341883fdc90cc532f8304d1c46a60586fb15d99f07e41bb5ab19c79c6
8496855341883fdc90cc532f8304d1c46a60586fb15d99f07e41bb5ab19c79c6 Verify
8496855341883fdc90cc532f8304d1c46a60586fb15d99f07e41bb5ab19c79c6 OK
  Chain Timestamp: 1497013614
  Merkle Root    : 8496855341883fdc90cc532f8304d1c46a60586fb15d99f07e41bb5ab19c79c6
  TxID           : 4172a560a7035c169c4da60cba2cb1fbac686bd01224e09a1a56ce5e6f31cff0
```

Note that the dcrtime client does verify the merkle path that the server returns. 

Our file is now anchored in the Decred blockchain. Any third party can now prove that `myfile.txt` existed, in its exact form, at the time the block was mined (Chain Timestamp). 

### Politeia

Building on our simple example, the following example illustrates how dcrtime is used to timestamp data in Politeia.

Politeia commits user data (new proposals, edits, etc.) as needed to a public git [repo](https://github.com/decred-proposals/mainnet). For performance reasons, incoming vote and comment data are stored in the Politeia backend in "journal" files. These journal files are then committed to the repo when other data such as a new proposal is submitted, or every hour if no other data is submitted. Once Politeia verifies that these commits are in the repo, dcrtime is used to anchor the git hash for each commit. For each hash anchored, an anchor file is committed to the `/anchors` directory in the repo. To facilitate verification, metadata for each anchor is also appended to a single text file, `anchor_audit_trail.txt`, which provides a chonological record of anchors. 

The diagram below provides a high-level diagram of the timestamping process.

![dcrtime politeia](/img/dcrtime_politeia_diagram.png)

To illustrate, let's examine an anchor from a real proposal, the [Decred Bug Bounty Proposal: Phase 2](https://proposals.decred.org/proposals/073694ed82d34b2bfff51e35220e8052ad4060899b23bc25791a9383375cae70) proposal. This anchor hashes two commits to the blockchain. The first [commit](https://github.com/decred-proposals/mainnet/commit/9125d351db4a429681cd7158d2c17d62a2b47c4c) contains all vote data submitted in the last hour. The second [commit](https://github.com/decred-proposals/mainnet/commit/afcca3b205ab6ec749d26e1903414aa35acd9767) contains all comments submitted in the last hour. First, Politeia will submit an anchor commit, which appends an "Audit Trail Record" containing metadata to `anchor_audit_trail.txt`, as shown below.  

```
1561489213: --- Audit Trail Record b3a3a7e8a28a2e4b889622851228c9f606bb542599a57511f7c15b6edd847a65 ---
1561489213: 9d3b1aac6988d02038ad829fc1a2c6ca530d385f000000000000000000000000 Flush vote journals.
1561489213: 0b935a75bfea54c38c0e08efbea7d1fbe24dab68000000000000000000000000 Flush comment journals.
```
Politeia will then wait for the transaction containing the anchor data to be mined into a block. Once it receives confirmation that the transaction has been mined, it will submit an anchor confirmation [commit](https://github.com/decred-proposals/mainnet/commit/233708a380061982fd44bfb64a5ace325cf59315) that contains information needed to prove the data existed at the time the block was mined. This includes the TxID of the transaction. If we enter this TxID into the [block explorer](https://explorer.dcrdata.org/tx/9584e34a8f3c805c2df71f45632c73b69bd9c29b37322d7003cd9cc9b8b8fe2e), we can indeed see the merkle root embedded in an OP_RETURN transaction.

`OP_RETURN 5aa2c14bf8d17617b2ae9bb8772e8da2fc2008c98a2ea090b61b53fddec3412e`

#### Politeia Data

For for information on the data stored by Politeia, see the [Navigating Politeia Data](navigating-politeia-data.md) page



