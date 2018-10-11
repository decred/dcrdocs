# <img class="dcr-icon" src="/img/dcr-icons/UserProjects.svg" /> Politeia

Politeia (Pi for short) is the Decred proposal system developed to give stakeholders sovereignty over Decred's development through an open, immutable, and censorship resistant web application.

---

## Proposals

Community members may submit proposals through Pi with one of 3 main goals in mind:
1. To alter/determine the Decred roadmap.
2. To amend the Decred Constitution.
3. To create a budget for a project to be paid for through the Decred Treasury.

Pi is an open platform meaning anyone on the internet can create an account and submit a proposal for Decred stakeholder consideration.

---

## Spam Resistance
Since Pi is an open proposal platform it is likely to attract spam.

In order to limit spam, there are two fees a user must pay to participate:
1. **Account creation fee** (0.1DCR) - A one time fee that must be paid when registering an account on Pi.
2. **Proposal submission fee**(0.1DCR) - A fee that must be paid when submitting a proposal.

!!! note
​    These fees are subject to change based on their effectiveness at discouraging spam and change in DCR price.

To provide a second layer of defense against spam, all submitted proposals are reviewed by human administrators.

---

## Transparent Censorship 

Pi was developed to facilitate transparent censorship in order to ensure that Pi administrators do no have the ability to silently censor a proposal.

When a user submits a proposal for review, they recieve a **censorship token** which serves as an immutable record of an individual identity's proposal being submitted for review.

If an administrator is found to be unfairly censoring proposals, the creators of the censored proposals can use their censorship tokens to prove they were censored and hold that administrator publicly accountable.

!!! note
   Censhorship tokens are tied to the cryptographic identity of the user who submitted its corresponding proposal. All users recieve a cryptographic identity (public/private key pair) specific to their browser when they register an account on Pi.

   When registering an account on Pi it is important to verify your account in the same brower that you used to register. After you are successfully verified your identity can be imported into a different browser. 

---

## Data Immutability

In order to ensure governance through Pi is resistant to manipulation (internal or external), its data is made immutable.

All data generated through Pi is stored off-chain but made cryptographically verifiable through **chain anchoring**. Leveraging the power of git and dcrTime, hashes of changes to pi data are periodically anchored into the blockchain, creating a timestamped record of the data.

Chain anchoring allows the creation of an immutable record of Pi data without the need for large amounts of on-chain storage.

---

## The Proposal Process

The stages a proposal will go through from submission to voted are as follows:
1. **Review** - Once  proposals are submitted they are reviewed Pi admins. If the proposal is determined to be spam, it is censored. All acceptable proposals are released for public conciderations. 
2. **Discussion** - Once released, the proposal is discussed by the community. During this stage the proposal may be edited by the writer in response to community feedback.
3. **Voting** - Once ready, the proposal writer invokes the voting on their proposal. Ticketholder votes on whether to approve or deny the the proposal are collected over 1 week period. If approved by a majority vote, than the actions outlined within the proposal may be performed.

!!! note
​    Pi is a step toward fully decentralizing the governance of Decred's development. Currently, pi serves as a signaling mechanism from stakeholders to the trusted humans in control of the Decred Treasury wallet (Decred Holdings Group). Relinquishment of control over the Treasury to a DAE in order to achieve true decentralization is planned for the future.