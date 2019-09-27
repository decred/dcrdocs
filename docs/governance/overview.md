# <img class="dcr-icon" src="/img/dcr-icons/Governance.svg" /> Introduction to Decred Governance

---

Decred is a Decentralized Autonomous Organization (DAO). Changes to the system, for example consensus rule changes, happen in a decentralized manner. Decred’s governance is based on the principle of ticket-holder voting. To participate in governance, users must time-lock DCR to purchase tickets. There are multiple things ticket holders can vote on. Some of them are on-chain, and some of them are off-chain.

## On-Chain Voting
Validation of blocks and voting on consensus rule changes occurs on-chain. Voting on higher-level issues, such as how to spend [Treasury funds](https://dcrdata.decred.org/address/Dcur2mcGjmENx4DhNqDctW5wJCVyT3Qeqkx), or significant policy decisions (e.g. amend the [Decred constitution](decred-constitution.md)) occurs off-chain in Politeia, a web platform where the community at large can submit, discuss and vote on proposals.

On-chain voting serves two main purposes: validating blocks created by Proof-of-Work (PoW) miners and voting on proposed consensus rule changes.

### Block Voting

In each block, five tickets are selected pseudo-randomly and called to [vote on-chain](../proof-of-stake/overview.md). Tickets vote to approve or reject the previous block of transactions created by a PoW miner. At least three out of five tickets called to vote must respond for the block to be considered valid. This power provides a check against malicious PoW miner behavior (e.g. mining empty blocks), as well as forming the basis of Decred’s [fork resistance](https://medium.com/decred/detailed-analysis-of-decred-fork-resistance-93022e0bcde7). After a ticket is called to vote, the DCR locked in that ticket is unlocked and returned to the purchaser’s wallet, along with the PoS reward if the ticket successfully voted. Decred is a hybrid PoW/PoS system.

### Consensus Rule Voting

Tickets can also vote about [consensus rule changes](consensus-rule-voting/overview.md). A proposed change must be approved by 75% of non-abstaining tickets to take effect. The change will automatically activate, so this is a change in the software itself, and not just theoretical.
At the point of voting, a [DCP](https://github.com/decred/dcps/blob/master/dcp-0000/dcp-0000.mediawiki) was already created. Note that for changes in the source code that are not changing the consensus mechanism, creating a DCP is not required. (Typical [FOSS](https://en.wikipedia.org/wiki/Free_and_open-source_software) model applies.)

---

## Off-Chain Voting

Decisions concerning the direction of the project, such as how to spend Treasury funds, or amending the [Decred Constitution](https://docs.decred.org/governance/decred-constitution/) or other policies, are made via proposals on [Politeia](politeia/overview.md).

### Politeia voting

Anyone may submit a proposal, and all data on Politeia (proposals, comments, upvotes/downvotes) is periodically anchored into the Decred blockchain, using [dcrtime](../advanced/dcrtime.md/). This enables users to [cryptographically prove](politeia/politeia-censorship.md/) if censorship has occurred. In this way, Politeia is built around the idea of transparent censorship. Users cannot be silently censored. These votes can be about allocating money from the Treasury, or changing the Constitution or other policies.

A Politeia vote is not changing the software itself. It is theoretical, and later an on-chain consensus rule change can happen, that is aligned with the Constitution or other policies, that were voted off-chain.
Anyone may submit a proposal, and all data on Politeia (proposals, comments, upvotes/downvotes) is periodically anchored into the Decred blockchain, using [dcrtime](../advanced/dcrtime.md). This enables users to [cryptographically prove](politeia/politeia-censorship.md) if censorship has occurred. In this way, Politeia is built around the idea of _transparent censorship_. Users cannot be silently censored. 
