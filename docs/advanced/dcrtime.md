# <img class="dcr-icon" src="/img/dcr-icons/Servers.svg" /> Dcrtime

---

Dcrtime is a timestamping application that allows users to store hashes of arbitrary data on the Decred blockchain. Inspired by Peter Todd's [opentimestamps](https://petertodd.org/2016/opentimestamps-announcement), dcrtime was originally built to store timestamped hashes of data from [Politeia](../../governance/politeia/overview), Decred's proposal system, on the Decred blockchain. 

Although dcrtime was created for Politeia, it is expected to have generic utility as a timestamping service. Dcrtime is implemented as a client and server application, with all code open source and  available in the [dcrtime repo](https://github.com/decred/dcrtime). Decred also offers a free timestamping service through its public mainnet server. We expect this to be particularly useful in scenarios where transparency, accountability and time-ordering are of key importance, in either a public or private context (e.g. computer security, data integrity and various compliance contexts).

In this page, we list some [notable uses](#notable-uses) of dcrtime, as well as describe the high-level [timestamping process](#timestamping-process), [dcrtime architecture](#dcrtime-architecture), and [dcrtime's implementation details](#dcrtime-implementation) via examples.

## Notable uses

Below are some notable uses of dcrtime:

* **Politeia:** all data submitted to Politeia (proposals, votes, comments, comment upvotes/downvotes, etc.) is commited to a public [git repository](https://github.com/decred-proposals/mainnet) every hour. Each commit is then hashed and timestamped onto the Decred blockchain using dcrtime. 
* **Dcrtimestamptweet:** A Twitter bot ([@dcrtimestampbot](https://twitter.com/dcrtimestampbot), [git repo](https://github.com/tiagoalvesdulce/dcrtimestamptweet)) that uses dcrtime to timestamp a thread when a chosen keyword is mentioned. This bot uses [IPFS](https://en.wikipedia.org/wiki/InterPlanetary_File_System) as a decentralized database to store the tweet thread. 
* **Timestamping election data:** In the 2018 Brazillian presidential election, candidate Fernando Haddad [used dcrtime](https://cointelegraph.com/news/brazilian-presidential-candidate-uses-blockchain-to-publish-government-plan) to timestamp his government plan and information about his campaign. 

## Timestamping process

Dcrtime allows a nearly unlimited number of hashes to be timestamped. It does this by creating a single merkle root from any number of hashes and including it in a transaction on the Decred blockchain. This process can be summarized as follows:

1. A 32-byte hash is created for each document or piece of data to be timestamped.
2. A single merkle root is calculated from the hashes.
3. This merkle root is included in an on-chain transaction, "anchoring" the data in the Decred blockchain by timestamping the data.
4. A transaction hash and merkle path is generated, which can then be used to query the Decred blockchain and retreive the block containing the transaction (and associated timestamp).


## Dcrtime architecture

The dcrtime service is comprised of four components:

* **dcrtime:** Reference client application
* **dcrtimed (proxy mode):** The dcrtimed server application in proxy mode. In proxy mode, dcrtimed forwards requests to the backend server (the same dcrtimed server application but in server mode). This is done as a security measure, so that a daemon with a wallet passphrase is not directly connected to the internet. This also allows the frontend to scale.
* **dcrtimed (server mode):** The dcrtimed server application in server mode. In server mode, dcrtimed manages timestamps forwarded to it by the dcrtimed proxy and creates the Decred transaction that anchors transactions in the blockchain.
* **dcrwallet:** A Decred wallet daemon.
* **dcrd:** A full node implementation of Decred.

The diagram below illustrates how the components are connected. 

![dcrtime architecture](/img/dcrtime_architecture_diagram.png)

## Dcrtime implementation

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

It also creates a "Collection timestamp" corresponding to the time the file was received by the server {SB: true?}.

`Collection timestamp: 1497009600`

If we immediately ask the server if the timestamp has been verified, it will show `Not anchored`. This is because our transaction containing the digest (specifically the merkle root of the digest) has not yet been mined into a block.

```
$ dcrtime --testnet -v
cd90cc268d9ceef6e276bfa7a615c5f85b5a27b0d917ee3f1f1e5d5598f2fa00
cd90cc268d9ceef6e276bfa7a615c5f85b5a27b0d917ee3f1f1e5d5598f2fa00 Verify
cd90cc268d9ceef6e276bfa7a615c5f85b5a27b0d917ee3f1f1e5d5598f2fa00 Not anchored
```

If we wait until the transaction containing the merkle root has been mined into a block and call dcrtime again, the dcrtime server will verify that the transaction has been anchored, as well as provide the merkle path (path to the merkle root) {SB: accurate?}, the transaction ID (TxID) of the transaction containing the merkle root, and a `Chain Timestamp` providing the time the block was mined. 

```
$ dcrtime --testnet -v 8496855341883fdc90cc532f8304d1c46a60586fb15d99f07e41bb5ab19c79c6
8496855341883fdc90cc532f8304d1c46a60586fb15d99f07e41bb5ab19c79c6 Verify
8496855341883fdc90cc532f8304d1c46a60586fb15d99f07e41bb5ab19c79c6 OK
  Chain Timestamp: 1497013614
  Merkle Root    : 8496855341883fdc90cc532f8304d1c46a60586fb15d99f07e41bb5ab19c79c6
  TxID           : 4172a560a7035c169c4da60cba2cb1fbac686bd01224e09a1a56ce5e6f31cff0
```

Note that the dcrtime client does verify the merkle path that the server returns. 

Our file is now anchored in the Decred blockchain. Any third party can now prove that `myfile.txt` existed, in its exact form, at the time the block was mined (Chain Timestamp) {SB: is the 'Cellection timestamp relevant here?'}. This can be proved by taking our original `myfile.txt` file, calculating its merkle root, and comparing it to the merkle root stored in the transaction submitted by dcrtime (which we can look up via the TxID in the [block exporer](https://explorer.dcrdata.org/)).

### Politeia

Building on our simple example, the following example illustrates how dcrtime is used to timestamp data in Politeia.

Each hour, the Politeia server commits all data uploaded to it (proposals, votes, comments, etc.) to a public git [repo](https://github.com/decred-proposals/mainnet). It then creates {SB: sequence correct?} a hash of each commit, timestamps each commit hash using dcrtime, and anchors the hashes on the Decred blockchain. Once the transaction containing the merkle root of the hash is mined, the corresponding merkle path and transaction hash is stored in the proposal repository. This allows all commits to the repo to be verified against a copy of the Decred blockchain. {SB: It would be nice to understand this better myself, and possibly put in the docs. Specifically, is there just one hash (the hash of a commit that contains all the changes)? Is each piece of data hashed and timestamped separately? Assuming each piece of data has its own merkle root in a larger tree (what is put into the transaction), how does the user traverse the tree to find the merkel root they're interested in?}

The diagram below provides a high-level illustration of the timestamping process.

![dcrtime politeia](/img/dcrtime_politeia_diagram.png)



