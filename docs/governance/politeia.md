# <img class="dcr-icon" src="/img/dcr-icons/Politeia.svg" /> Politeia proposals and voting

---

**What is Politeia?**

Politeia, or Pi, is a platform which is being developed to support Decred’s governance. It facilitates the submission, tracking, and discussion of Decred governance proposals by the stakeholder community.

The Politeia web platform (at [proposals.decred.org](https://proposals.decred.org/)) facilitates browsing, discussing and submitting proposals.

**Politeia proposals**

There are two broad types of proposal:

1. Proposals that aim to establish Voter support for a course of action, e.g. direction of software development, adopting or changing some policy.
2. Proposals that commit to spending DCR from the Decred Treasury, creating a budget that some entity can draw down against as they demonstrate progress towards the proposal's aim.

There is a fee for submitting a proposal (0.1 DCR), to limit the potential for proposal spamming. There is also a fee for registering a Politeia account (0.1 DCR), to limit comment spam and up/down voting sock-puppetry. Fees may be altered if a) they're not a sufficient spam-deterrent, or b) the price of DCR changes considerably.

Reddit-style **up/down voting** is used for **proposal and comment sorting only**. Up/down votes are not anonymous.

Ticket-voting on proposals doesn’t happen directly on Politeia, but within [Decrediton](https://docs.decred.org/getting-started/user-guides/decrediton-setup.md) or [politeiavoter CLI](https://github.com/decred/politeia/tree/master/politeiavoter) with dcrwallet

**Censorship**  

When proposals are submitted, they are checked by Politeia administrators. Proposals that are deemed spam or invalid will be censored.

Politeia is built around the concept of _transparent censorship_, using [dcrtime](https://github.com/decred/dcrtime). Users cannot be silently censored, they can prove that censorship has occurred. When a proposal/comment is submitted, a censorship token is generated. Content creators can use these tokens to demonstrate that their specific proposal/comment was submitted, in a particular form, at a particular point in time.

**Politeia users have cryptographic identities** (pub/priv key pairs) that can be used to demonstrate censorship of one's submissions. When you register for a Politeia account, a key-pair identity will be generated for you, this is stored in your browser by default.

If you change browser/device you can import your Pi identity key or generate a new one, but for now it is important to *verify your account from the same browser you used to sign up*. The cryptographic Pi identity is only used for demonstrating that your submissions have been censored.

**Submitting and approving proposals**

Politeia's aim is to serve as the decision-making force behind the Decred Decentralized Autonomous Entity (DAE). This is an ambitious aim, Politeia and its accompanying processes are in an experimental stage and thus subject to change.

For now, the process is something like this:

1. Submit proposal.
2. Proposal reviewed by Politeia admins, spam is censored.
3. Valid proposals appear publicly on Politeia, open for discussion, but voting does not begin immediately.  	
4. Ticket-voting interval (~1 week) can be triggered by the proposal owner. Until ticket-voting is triggered, the proposal can be edited by its owner in response to community feedback.
5. Ticket-voting starts, ticket-holders vote through their wallet. Every ticket that was live 256 blocks before voting started is eligible to vote on the proposal. Votes by eligible tickets can be cast any time within the voting interval. Once votes are cast they cannot be changed.
6. When the ticket-voting period ends, the proposal is formally approved or rejected. There is a quorum requirement of 20% tickets voting Yes/No. For a proposal to pass it must achieve 60% Yes votes.
7. When a proposal with a budget and deliverables is approved, work can begin. The proposal owner can submit claims against that budget as deliverables are completed.
8. Payment claims will be handled manually by Decred Holdings Group until such times as this process can be adequately decentralized.

Proposal voting works, initially, as a robust signalling mechanism from the Decred stakeholders to the people who control the Decred Treasury wallet. Over time, this will be iterated towards a DAE that decentralizes the functions currently performed by trusted humans. When the DAE is ready, it will control the Decred Treasury wallet directly.

For proposals that request funding, an initial set of guidelines and examples has been prepared. It can be found at the bottom of [this page](https://github.com/decred/politeia/blob/master/politeia.md). Guidelines for good proposals and policies for censoring proposals will be iterated once Politeia is live.
