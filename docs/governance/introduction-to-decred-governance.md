# <img class="dcr-icon" src="/img/dcr-icons/Governance.svg" /> Introduction to Decred Governance

---

*Decred* (/ˈdi:ˈkred/, /dɪˈkred/, dee-cred) is an open, progressive, and self-funding cryptocurrency with a system of community-based governance integrated into its blockchain. The project mission is to develop technology for the public benefit, with a primary focus on cryptocurrency technology.

Decred's governance is based on the principle of ticket-holder voting. The ultimate decision-making force for the project is the voting of active tickets.

---

Holders of DCR can time-lock their funds in exchange for [tickets](../proof-of-stake/proof-of-stake.md). Tickets allow one to participate in Decred's governance in three ways, two on-chain and one off-chain.

In each block, five live tickets are selected pseudo-randomly and called to vote on-chain. Tickets are called to vote after an average of around 28 days, once a ticket has voted the DCR which was time-locked to buy it matures (un-locks) after 256 blocks, along with a portion of the block reward.

On-chain voting serves the following purposes:

1. [Consensus rule voting](consensus-rules-voting.md) to *approve or reject a proposed change to the consensus rules* of the protocol. A proposed change must be approved by 75% of non-abstaining tickets to take effect.

1. Voting to *approve the work of PoW Miners*. In order for a PoW Miner to receive their share of the block reward, at least three of the five tickets called in the subsequent block must approve their block. This gives ticket-holders power over PoW Miners in the case of undesirable behavior by miners (e.g. mining empty blocks), although this power is yet to be exercised on mainnet.

Decred's on-chain governance is supplemented by *Politeia proposal voting*, which doesn't happen directly on-chain but is woven into the Decred blockchain in some ways. 

Politeia proposals concern the direction of the project, they may involve the spending of [Decred Treasury funds](http://explorer.dcrdata.org/address/Dcur2mcGjmENx4DhNqDctW5wJCVyT3Qeqkx) (10% of the block reward goes into the Treasury to support development of the project) or amending the [Decred Constitution](decred-constitution.md) or other policies.

Politeia is built around the concept of _transparent censorship_, using [dcrtime](https://github.com/decred/dcrtime). Users cannot be silently censored, they can prove that censorship has occurred.

The [Politeia web platform](https://proposals.decred.org/) is a reddit-style space to facilitate submitting, viewing and discussing proposals.

Politeia proposals are approved/rejected through "snap" voting. When proposals move to a vote, all live tickets at that moment are eligible to vote Yes/No on the proposal while voting remains open (one week period). Ticket-holders vote through their wallet.
