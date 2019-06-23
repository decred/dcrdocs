# <img class="dcr-icon" src="/img/dcr-icons/Servers.svg" /> Dcrtime

---

Dcrtime is a timestamping application that allows users to store hashes of arbitrary data on the Decred blockchain. Inspired by Peter Todd's [opentimestamps](https://petertodd.org/2016/opentimestamps-announcement), dcrtime was initially built to anchor data from Politeia, Decred's proposal system, on the Decred blockchain. This is done to ensure maximum transparency and accountability of proposal and voting data by allowing third parties to cryptographically verify when data was submitted to Politeia. Although dcrtime was created for Politeia, it is expected to have generic utility as a timestamping service. Dcrtime is implemented as a client and server application, with all code available on the [dcrtime repo](https://github.com/decred/dcrtime).



ensuring transparency and accountability for proposal and voting data. 

The primary motivation for dcrtime is the desire for the proposal system to have maximum transparency and accountability, while having a minimal onchain footprint. In terms of its onchain footprint and overall design, dcrtime draws on the work of Peter Todd’s opentimestamps, which allows a nearly unlimited number of hashes to be timestamped onchain with the inclusion of a single merkle root in a transaction. The process used by dcrtime can be summarized as follows:

allow users to submit 32-byte hashes, which are accumulated, organized into a merkle tree and hashed down to a merkle root
create an episodic onchain transaction that includes that merkle root
allow users to verify their data is timestamped by responding to queries by hash with the corresponding merkle root, transaction hash and a merkle path for that hash once the transaction is mined
Although dcrtime has been designed as a component of the proposal system, it is expected to have generic utility as a public timestamping service. Any third party that is interested in using dcrtime to generate externally verifiable timestamps can do so free of charge by using our public mainnet server. We expect this to be particularly useful in scenarios where transparency, accountability and time-ordering are of key importance, in either a public or a private context, e.g. computer security, data integrity and various compliance contexts. A more detailed discussion of dcrtime can be found below.

dcrtime architecture
The dcrtime service is comprised of four components:

dcrtime architectural overview
dcrtime architectural overview
The proxy is a simple daemon that proxies dcrtime API calls to the non-public dcrtime server. The proxy and server are in fact the same daemon but run in either proxy or server mode. The reason these two daemons are separated is to prevent a daemon sitting on the internet with a wallet passphrase in memory and also in order to be able to scale the frontend. It accepts a JSON REST API call and ensures it can be decoded and immediately transmits it to the backend daemon that does the work. The reply from the dcrtime server is also relayed back to the caller. The magic really happens in the dcrtime server, and for the remainder of this entry, we will not make further mention of the proxy.

Now that it is clear how dcrtime works in conjunction with dcrd and dcrwallet, it is useful to understand how it fits into the larger proposal system. The proposal system’s second component, a version-controlled repository, will episodically drop timestamped “anchors”. As data is added to the proposal repository, each commit has a corresponding hash, and commit hashes will episodically be timestamped using dcrtime. Anchored hashes will have their corresponding merkle path and transaction hash stored in the proposal repository once the transaction containing the merkle root is mined. By storing the anchor data in the proposal repository, the proposal system can have all of its commits and anchors verified against a copy of the Decred blockchain.

decred proposal system
decred proposal time
dcrtime example
The server collects digests that are sent to it and every hour these digests are reduced to a single merkle root. This merkle root is then anchored in the decred chain in a transaction. An example of such a transaction on testnet can be seen here. The merkle root can be found in the entry that is an OP_RETURN followed by a digest. In our example it is:

OP_RETURN 9788d5d7b85f2b68ec21d26e738dce6cdd367ee0ec58b53ad6bd4d46b0bc3018
We included the client reference application which conveniently is called dcrtime. Uploading a digest to the server can be done as follows:

$ dcrtime --testnet -v myfile.txt
8496855341883fdc90cc532f8304d1c46a60586fb15d99f07e41bb5ab19c79c6 Upload myfile.txt
8496855341883fdc90cc532f8304d1c46a60586fb15d99f07e41bb5ab19c79c6 OK     myfile.txt
Collection timestamp: 1497009600
If we immediately ask the server for it the server will return information and indicate that it has not been anchored yet. For example:

$ dcrtime --testnet -v
cd90cc268d9ceef6e276bfa7a615c5f85b5a27b0d917ee3f1f1e5d5598f2fa00
cd90cc268d9ceef6e276bfa7a615c5f85b5a27b0d917ee3f1f1e5d5598f2fa00 Verify
cd90cc268d9ceef6e276bfa7a615c5f85b5a27b0d917ee3f1f1e5d5598f2fa00 Not anchored

Once the digest has been anchored we can retrieve it and find out the transaction the merkle root was anchored in. Note that the client does verify the merkle path that the server returns.

$ dcrtime --testnet -v 8496855341883fdc90cc532f8304d1c46a60586fb15d99f07e41bb5ab19c79c6
8496855341883fdc90cc532f8304d1c46a60586fb15d99f07e41bb5ab19c79c6 Verify
8496855341883fdc90cc532f8304d1c46a60586fb15d99f07e41bb5ab19c79c6 OK
  Chain Timestamp: 1497013614
  Merkle Root    : 8496855341883fdc90cc532f8304d1c46a60586fb15d99f07e41bb5ab19c79c6
  TxID           : 4172a560a7035c169c4da60cba2cb1fbac686bd01224e09a1a56ce5e6f31cff0
Conclusion
dcrtime represents the first of two components of Decred’s proposal system. Interested third parties can make use of the free public timestamping service provided via dcrtime, which runs hourly, on the hour, as of this post. If you are interested in using dcrtime for timestamping, please contact us on Slack for assistance. If you would like to comment on this article, join us on the Decred Forum.

## What is Politeia?

Politeia is a platform that supports Decred’s governance. It facilitates the submission, tracking, and discussion of Decred governance proposals by the stakeholder community. The Politeia [web platform](https://proposals.decred.org/) facilitates browsing, discussing and submitting proposals.

Reddit-style **up/down voting** is used for comment sorting. Up/down votes are not anonymous.

Voting on proposals does not happen directly on Politeia, as it requires signatures from your Decred wallet. Voting can be done from [Decrediton](../../wallets/decrediton/decrediton-setup.md) or on the command line using the [politeiavoter CLI](https://github.com/decred/politeia/tree/master/politeiavoter) tool. 

There are two broad types of proposal:

1. Proposals that aim to establish voter support for a course of action. For example, the direction of software development, or adopting or changing some policy.
2. Proposals that commit to spending DCR from the Decred Treasury. These proposals create a budget that some entity can draw down against as they demonstrate progress towards the proposal's aim.

## How Politeia Works

To vote, stakeholders must time-lock DCR to buy tickets. While tickets are live they can be used to cast a vote for or against each open Politeia proposal. For more information on tickets and their role in Decred's governance, see the [Introduction to Decred Governance](../../governance/overview.md) page.

There is a fee for submitting a proposal (0.1 DCR) to limit the potential for proposal spamming. There is also a fee for registering a Politeia account (0.1 DCR) to limit comment spam and up/down voting sock-puppetry. Fees may be altered if a) they aren't serving as a sufficient spam-deterrent, or b) the price of DCR changes considerably.

### Transparent Censorship

When proposals are submitted, they are checked by Politeia administrators. Proposals that are deemed spam or invalid will be censored.

Politeia is built around the concept of **transparent censorship**, using [dcrtime](https://github.com/decred/dcrtime). Users cannot be silently censored; they can prove that censorship has occurred. When a user registers, a **cryptographic identity** (pub/priv key pair) is created. This cryptographic identity is then used to create a "censorship record" for each user submission (proposal, comment, comment upvote/downvote). If a user is censored, these censorship records can be used to prove that a specific submission was submitted, the time it was submitted, and the exact form of the submission. This cryptographic identity is stored in the user's browser by default, but can be exported and re-imported at any time. 


### Proposal Lifecycle

Below is the basic process for submitting and evaluating proposals:

1. A proposal is submitted.
1. The proposal is reviewed by Politeia admins. Spam is censored. 
1. Valid proposals appear publicly on Politeia. They are open for discussion, but voting does not begin immediately, and the proposal can be edited by its owner in response to community feedback. 
1. If a proposal becomes clearly inactive (proposal owner stops commenting on the proposal, does not authorize the start of voting), an admin may mark the proposal as ‘Abandoned’. Abandoned proposals appear in the ‘Abandoned’ tab on Politeia. They are publicly viewable, but cannot be edited, commented on, or be authorized to vote. An admin can mark a proposal as abandoned at any time before the proposal owner authorizes voting. Once the proposal owner authorizes voting on a proposal, it cannot be abandoned unless the proposal owner revokes voting on the proposal.
1. The proposal owner authorizes voting to start. An admin then triggers the start of voting.	
1. The ticket-voting interval of 2,016 blocks (~1 week) begins. A snapshot of the live ticket pool is taken at 256 blocks prior to the start of voting. Every ticket in the pool when this snapshot was taken can vote 'Yes' or 'No' on the proposal. Tickets bought after the snapshot cannot vote on the proposal. If a ticket is called to vote on-chain during the ticket-voting interval (to validate blocks or vote on consensus rule changes), it still has until the end of the ticket-voting interval to vote on the proposal.
1. When the ticket-voting period ends, the proposal is formally approved or rejected. There is a quorum requirement for a vote to be considered valid: 20% of the eligible tickets must vote 'Yes' or 'No'. The threshold for a proposal to be approved is 60% 'Yes' votes.
1. When a proposal with a budget and deliverables is approved, work can begin. The proposal owner can submit claims against the budget as deliverables are completed.
1. Payment claims will be handled manually by Decred Holdings Group (DHG) until such times as this process can be handled by the [Decred Decentralized Autonomous Entity (DAE)](#decentralized-autonomous-entity-dae).

For guidance on creating a good proposal, see the [Proposal Guidelines](../../governance/politeia/proposal-guidelines.md) and [Example Proposals](../../governance/politeia/example-proposals.md) pages.

### Decentralized Autonomous Entity (DAE)

Politeia's aim is to serve as the decision-making force behind the Decred Decentralized Autonomous Entity (DAE). Because Politeia and its accompanying processes are still in an experimental stage, Politeia will serve initially as a robust signaling mechanism from Decred shareholders to the community members controlling the Decred Treasury wallet. Over time, this will be iterated towards a DAE that decentralizes the functions currently performed by trusted humans, and the DAE will control the project fund wallet directly.

## Politeia Data

All proposals, comments, and votes are anchored on the Decred blockchain using [dcrtime](https://github.com/decred/dcrtime) and stored in a public [git repository](https://github.com/decred-proposals/mainnet). See the [Navigating Politeia Data](../../advanced/navigating-politeia-data.md) page for instructions on accessing and interpreting Politeia data. 




