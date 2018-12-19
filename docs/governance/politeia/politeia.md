# <img class="dcr-icon" src="/img/dcr-icons/Politeia.svg" /> Politeia Proposals and Voting

---

## What is Politeia?

Politeia is a platform that supports Decred’s governance. It facilitates the submission, tracking, and discussion of Decred governance proposals by the stakeholder community. The Politeia [web platform](https://proposals.decred.org/) facilitates browsing, discussing and submitting proposals.

Reddit-style **up/down voting** is used for comment sorting. Up/down votes are not anonymous.

Voting on proposals does not happen directly on Politeia, as it requires signatures from your Decred wallet. Voting can be done from [Decrediton](../../getting-started/user-guides/decrediton-setup.md) or on the command line using the [politeiavoter CLI](https://github.com/decred/politeia/tree/master/politeiavoter) tool. 

There are two broad types of proposal:

1. Proposals that aim to establish voter support for a course of action. For example, the direction of software development, or adopting or changing some policy.
2. Proposals that commit to spending DCR from the Decred Treasury. These proposals create a budget that some entity can draw down against as they demonstrate progress towards the proposal's aim.

## How Politeia Works

To vote, stakeholders must time-lock DCR to buy tickets. While tickets are live they can be used to cast a vote for or against each open Politeia proposal. For more information on tickets and their role in Decred's governance, see the [Introduction to Decred Governance](../../governance/introduction-to-decred-governance.md) page.

There is a fee for submitting a proposal (0.1 DCR) to limit the potential for proposal spamming. There is also a fee for registering a Politeia account (0.1 DCR) to limit comment spam and up/down voting sock-puppetry. Fees may be altered if a) they aren't serving as a sufficient spam-deterrent, or b) the price of DCR changes considerably.

### Transparent Censorship

When proposals are submitted, they are checked by Politeia administrators. Proposals that are deemed spam or invalid will be censored.

Politeia is built around the concept of **transparent censorship**, using [dcrtime](https://github.com/decred/dcrtime). Users cannot be silently censored; they can prove that censorship has occurred. When a user registers, a **cryptographic identity** (pub/priv key pair) is created. This cryptographic identity is then used to create a "censorship token" for each user submission (proposal, comment, comment upvote/downvote). If a user is censored, these tokens can be used to prove that a specific submission was submitted, the time it was submitted, and the exact form of the submission. This cryptographic identity is stored in the user's browser by default, but can be exported and re-imported at any time. 


### Proposal Lifecycle

Below is the basic process for submitting and evaluating proposals:

1. A proposal is submitted.
2. The proposal is reviewed by Politeia admins. Spam is censored. 
3. Valid proposals appear publicly on Politeia. They are open for discussion, but voting does not begin immediately, and the proposal can be edited by its owner in response to community feedback. 
4. The proposal owner authorizes voting to start. An admin then triggers the start of voting.	
5. The ticket-voting interval of 2016 blocks (~1 week) begins. A snapshot of the live ticket pool is taken at 256 blocks prior to the start of voting. Every ticket in the pool when this snapshot was taken can vote 'Yes' or 'No' on the proposal. Tickets bought after the snapshot cannot vote on the proposal. If a ticket is called to vote on-chain during the ticket-voting interval (to validate blocks or vote on consensus rule changes), it still has until the end of the ticket-voting interval to vote on the proposal. 
6. When the ticket-voting period ends, the proposal is formally approved or rejected. There is a quorum requirement for a vote to be considered valid: 20% of the eligible tickets must vote 'Yes' or 'No'. The threshold for a proposal to be approved is 60% 'Yes' votes.
7. When a proposal with a budget and deliverables is approved, work can begin. The proposal owner can submit claims against the budget as deliverables are completed.
8. Payment claims will be handled manually by Decred Holdings Group (DHG) until such times as this process can be handled by the Decred Decentralized Autonomous Entity (DAE).

For guidance on creating a good proposal, see the [Proposal Guidelines](../../governance/politeia/proposal-guidelines.md) and [Example Proposals](../../governance/politeia/example-proposals.md) pages.


## Politeia Data

All proposals, comments, and votes are anchored on the Decred blockchain using [dcrtime](https://github.com/decred/dcrtime) and stored in a public [git repository](https://github.com/decred-proposals/mainnet). See the [Navigating Politeia Data](../../advanced/navigating-politeia-data.md) page for instructions on accessing and interpreting Politeia data. 




