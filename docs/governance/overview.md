# <img class="dcr-icon" src="/img/dcr-icons/Governance.svg" /> Introduction to Decred Governance

---

Decred has been deliberately engineered to prevent powerful individuals or
central planning committees from gaining a disproportionate influence over the
future of the project.
Instead, Decred’s governance is based on the principle of ticket-holder voting.
Proposed changes to the system are voted upon, and only implemented if the
voters approve.
Anybody who holds enough DCR may time-lock their coins to [purchase
tickets](../proof-of-stake/overview.md) and participate in governance.
Some of the ticket holder voting occurs on-chain, and some of it off-chain.

- Validation of blocks and voting on consensus rule changes occurs on-chain.
- Voting on higher-level issues, such as how to spend [Treasury
  funds](https://dcrdata.decred.org/address/Dcur2mcGjmENx4DhNqDctW5wJCVyT3Qeqkx),
  or significant policy decisions such as amendments to the [Decred
  constitution](decred-constitution.md), occur off-chain in
  [Politeia](politeia/overview.md).

---

## On-Chain Voting

In each mined block, five tickets are selected pseudo-randomly and called to
[vote on-chain](../proof-of-stake/overview.md).
On-chain voting serves two main purposes: validating blocks created by
Proof-of-Work (PoW) miners and voting on proposed consensus rule changes.
After a ticket is called to vote, the DCR locked in that ticket is unlocked and
returned to the purchaser’s wallet, along with the PoS reward if the ticket
successfully voted.

### Block Voting

Tickets vote to approve or reject the previous block of transactions created by
a PoW miner.
At least three out of five tickets called to vote must vote for the block to be
mined.
If the majority of votes are rejecting the previous block, the miner who
produced that block loses their block reward, and the transactions from that
block are returned to the mempool.
This power provides a check against malicious PoW miner behavior (e.g. mining
empty blocks), as well as forming the basis of Decred’s [fork
resistance](https://medium.com/decred/detailed-analysis-of-decred-fork-resistance-93022e0bcde7).

### Consensus Rule Voting

Tickets vote on whether to activate proposed [consensus rule
changes](consensus-rule-voting/overview.md).
A proposed change must be approved by 75% of non-abstaining tickets to take
effect.
The proposed rule change will be coded in advance and will lie dormant in the
full node software, so it can be automatically activated without human
intervention if the voters approve the change.

---

## Off-Chain Voting

Decisions concerning the direction of the project, such as how to spend Treasury
funds, or amending the [Decred
Constitution](decred-constitution.md) or other
policies, are made via proposals on [Politeia](politeia/overview.md).
Politeia voting is not recorded on chain, but it is still backed by
cryptographic techniques which prevent sybil attacks and unfair censorship.

### Politeia voting

Anyone may submit a proposal on Politeia, the only requirement is paying a
minimal fee which is designed to prevent spam.
Ticket holders are then able to vote on whether they are for or against the
proposal.
The voting period lasts one week, and anybody who holds tickets at the moment
voting begins will be able to vote on the proposal.
All data on Politeia (proposals, comments, upvotes/downvotes) is periodically
anchored into the Decred blockchain, using [dcrtime](../advanced/dcrtime.md).
This enables users to [cryptographically prove](politeia/politeia-censorship.md)
if censorship has occurred.
