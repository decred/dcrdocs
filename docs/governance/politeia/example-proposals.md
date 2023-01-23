# ![](../../img/dcr-icons/Politeia.svg){ .dcr-icon } Example Politeia Proposals

---

Below are two example Politeia proposals that utilize the template provided in the
Politeia [Proposal Guidelines](proposal-guidelines.md). The first example proposes the 
development of a new software feature. The second a marketing initiative.

- [Software Feature Proposal](#software-feature-proposal)
- [Marketing Proposal](#marketing-proposal)

## Software Feature Proposal

### What

In the *What* section, provide a short description of the problem that will 
be addressed.

!!! example
    Develop a set of JavaScript libraries to enable JavaScript developers to
    easily add support for Decred into their applications.

### Why

In the *Why* section, answer why the proposal is needed and why it is
a good idea.

!!! example
    According to stats collected by GitHub.com, JavaScript has been the most
    popular programming language for the last 6 years in a row.
    The number of developers and companies building with JavaScript is enormous,
    and providing a toolkit for them to easily integrate with the Decred
    blockchain will expose the project to a massive pool of talent and innovation.

### How

In the *How* section, describe the steps you will perform to accomplish your
goals.

!!! example
    The basic framework for the JavaScript toolkit is already built and is
    available on GitHub.
    So far I have implemented:

    - secp256k1 elliptical curve for generation of keypairs, signature creation
      and verification.
    - BIP-0044 keys and PGP mnemonic seeds.

    I will be continuing to develop this project and plan to add:

    - Clients for the dcrdata block explorer.
    - Serializable and de-serializable JavaScript versions of important types from
      the dcrd/wire package.
    - Network parameters for mainnet, testnet3, and simnet.
    - A light wallet which will include sending and receiving DCR, staking, SPV
      and LN.
    - DEX integration

    All of this code is open source, published under the
    [ISC license](https://github.com/decred/politeia/blob/master/LICENSE).

    In the case that this proposal is approved, the ownership of the existing
    GitHub repository will be transferred to the Decred organization.

### Who

In the *Who* section, describe the entity making the proposal, who will
complete the work, and who will draw down on the proposal's budget.

!!! example
    This proposal is submitted by @allstake (on Matrix, /u/Satoshi2000 on reddit).
    You may remember me from a discussion in #proposals, where I solicited feedback
    on this idea (Matrix link).
    I have been active in the blockchain space for two years, with a particular
    interest and passion for blockchain governance.
    See my GitHub (github.com/satoshi200) for examples of my work, including an
    event-driven lambo address creation module.

### When

In the *When* section, describe the project's milestones, expected 
completion dates, and the draw schedule (how much is paid for each milestone delivered).

!!! example
    | Feature | Estimate | Cost |
    |---------|----------|-----:|
    | secp256k1 curve, BIP-0044, mnemonic seeds | 40 hours of work<br/>_(already complete)_ | $1,600 |
    | Block explorer clients                    | 6 hours of work                           | $240   |
    | dcrd/wire types                           | 10 hours of work                          | $400   |
    | Network parameters                        | 3 hours of work                           | $120   |
    | Wallet send/receive                       | 45 hours of work                          | $1,800 |
    | Wallet staking                            | 40 hours of work                          | $1,600 |
    | Wallet SPV                                | 100 hours of work                         | $4,000 |
    | Wallet LN                                 | 120 hours of work                         | $4,800 |
    | DEX integration                           | 120 hours of work                         | $4,800 |

    This will bring the grand total to 484 hours at a rate of 40 USD/hr.
    This proposal will therefore be capped **$19,360**.

    The proposed schedule is to do this work over 16 weeks, breaking this period
    into three milestones.

    **Milestone 1**

    Block explorer clients, wire types, parameters, wallet send/receive and
    staking.

    104 hours, to be completed by week 4.

    **Milestone 2**

    Wallet SPV and LN.

    220 hours, to be completed by week 11.

    **Milestone 3**

    DEX integration.

    120 hours, to be completed by week 16.

## Marketing Proposal

### What

In the *What* section, provide a short description of the problem that will 
be addressed.

!!! example
    This proposal would fund a Decred presence at Real Blockchain Conference, in Dublin, Ireland, July 11-13.
    It would cover costs for a booth, swag, and people to staff the booth.

### Why

In the *Why* section, answer why the proposal is needed and why it is
a good idea.

!!! example
    Real Blockchain Conference is a top cryptocurrency conference and totally not made up. Last year's conference had 5,000 attendees and they seemed cool, good solid Decred stakeholder material.
    With epic swag and a physical embodiment of Stakey in attendance, a presence at this conference would raise awareness of Decred.

### How

In the *How* section, describe the steps you will perform to accomplish your
goals.

!!! example
    - I will organize Decred's presence at this event, it will take about 20 hours of my time at 40$/hour: $800
    - Conference registration/booth fees: $3,000
    - Booth decorations: $1,000
    - Decred swag to give away: $2,000
    - 3 staff on the booth for 3 (10 hour) days each at $30/hr: (3 x 3 x 10 x 30) $2,700
    - Stakey costume: $500
    - Stakey costume occupant: 3 (10 hour) days at $40/hr (that suit is warm!): $1,200
    - Travel expenses for booth staff: Up to $2,000
    - Accommodation for booth staff. We will stay at the conference hotel costing $200/night, it is unlikely that all booth staff need accommodation, but the maximum would be 200 x 3 nights x 4 staff = $2,400

    Maximum total budget: $15,600

### Who

In the *Who* section, describe the entity making the proposal, who will
complete the work, and who will draw down on the proposal's budget.

!!! example
    This proposal is submitted by @AllYourStake (on Matrix, /u/StakeGovernor2000 on reddit).
    You may remember me as the organizer of Decred's presence at such blockchain events as Real Blockchain Conference 2017 and Buckets of Blockchain 2018.
    I don't know exactly who the 3 booth staff and 1 Stakey suit wearer will be, I will be one of the staff and @Contributor1 is also interested.

### When

In the *When* section, describe the project's milestones, expected 
completion dates, and the draw schedule (how much is paid for each milestone delivered).

!!! example
    Registration fees are due by September 30th, I will pay these up-front and request full reimbursement immediately.
    I will front the cost of the swag and Stakey suit, and claim this along with my travel/accommodation expenses and payment for my work, after the event.
    Booth staff who are already Decred contributors will bill for their hours and expenses directly, I will serve as intermediary for any staff costs not associated with established contributors.
