# <img class="dcr-icon" src="/img/dcr-icons/Politeia.svg" /> Example Politeia Proposals

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

> Add monitoring RPC call that can be used for status reporting and as a heartbeat to ensure that politeiawww is functioning properly.

### Why

In the *Why* section, answer why the proposal is needed and why it is
a good idea.

> Currently there is no prescribed way to remotely determine if politeiawww is functioning correctly. This is problematic because if there is a problem with politeiawww, the Politeia website could experience outages and Decred admins would not be aware of it until users were negatively impacted. We propose to add a single RPC that doubles as the heartbeat and a status monitor.
> The idea is that monitoring software can periodically issue the RPC and determine if an alert needs to be sent out to the admins.

### How

In the *How* section, describe the steps you will perform to accomplish your
goals.

> 1. Design and document RPC.
> 2. Add a privileged RPC called Status that replies with StatusReply.
>     * The Status RPC is an empty structure
>     * The StatusReply structure returns a tri-state status: OK, Warning, Critical. In addition to the status the RPC returns a server message that can be forwarded to the administrators in case of Warning or Failure.
>     * The StatusReply returns interesting statistics such as: number of proposals in memory, number of comments in memory etc.
> 3. Add refclient unit tests that validate all 3 conditions.
> 4. Add RPC to politeiawwwcli so that the status calls can be scripted.

The software implementing the RPC will be published in the Politeia GitHub [repo](https://github.com/decred/politeia) under the [ISC license](https://github.com/decred/politeia/blob/master/LICENSE) that applies to all code in this repo. 

### Who

In the *Who* section, describe the entity making the proposal, who will
complete the work, and who will draw down on the proposal's budget.

> This proposal is submitted by @allstake (on Slack, /u/Satoshi2000 on reddit). You may remember me from a discussion in #dcrdata, where I solicited feedback on this idea (Matrix link).
> I have been active in the blockchain space for two years, with a particular interest and passion for blockchain governance.
> See my GitHub (github.com/satoshi200) for examples of my work, including an event-driven lambo address creation module.

### When

In the *When* section, describe the project's milestones, expected 
completion dates, and the draw schedule (how much is paid for each milestone delivered).

> We are proposing doing the design and documentation first, then finish the work with the implementation of the code.
> We allow for some time between the deliverables in order for the community to provide feedback on the initial design and 
> documentation.
>
> 1. 2 hours to design and add documentation on how to use the call with some
> examples.
> 1. 8 hours to add the call, determine what status to set when and figure out what statistics return.
> 1. 4 hours to add refclient validation tests.
> 1. 2 hours to add RPC to politeiawwwcli
>
> In addition allow for 1 hour of overhead (going back and forth on slack/github etc). This will bring the grand total to 17 hours at a rate of $40/hr.
> This proposal will therefore be capped $680.
> The proposed schedule is to do this work over 2 weeks in order to allow back and forth on the details.
>
> Week 1 deliverables
>
> 1. Design RPC
> 1. Write documentation that includes examples
>
> 2 hours, to be completed on August 15 2018
>
> Week 2 deliverables
>
> 1. Implement RPC
> 1. Implement validation tests
> 1. Implement politeiawwwcli
>
> 15 hours, to be completed on August 29 2018
>
> An invoice for all work will be submitted upon completion of all deliverables in an estimated two weeks time. 


## Marketing Proposal

### What

In the *What* section, provide a short description of the problem that will 
be addressed.

> This proposal would fund a Decred presence at Real Blockchain Conference, in Dublin, Ireland, July 11-13.
> It would cover costs for a booth, swag, and people to staff the booth.

### Why

In the *Why* section, answer why the proposal is needed and why it is
a good idea.

> Real Blockchain Conference is a top cryptocurrency conference and totally not made up. Last year's conference had 5,000 attendees and they seemed cool, good solid Decred stakeholder material.
> With epic swag and a physical embodiment of Stakey in attendance, a presence at this conference would raise awareness of Decred.

### How

In the *How* section, describe the steps you will perform to accomplish your
goals.

> * I will organize Decred's presence at this event, it will take about 20 hours of my time at 40$/hour: $800
> * Conference registration/booth fees: $3,000
> * Booth decorations: $1,000
> * Decred swag to give away: $2,000
> * 3 staff on the booth for 3 (10 hour) days each at $30/hr: (3 x 3 x 10 x 30) $2,700
> * Stakey costume: $500
> * Stakey costume occupant: 3 (10 hour) days at $40/hr (that suit is warm!): $1,200
> * Travel expenses for booth staff: Up to $2,000
> * Accommodation for booth staff. We will stay at the conference hotel costing $200/night, it is unlikely that all booth staff need accommodation, but the maximum would be 200 x 3 nights x 4 staff = $2,400
>
> Maximum total budget: $15,600

### Who

In the *Who* section, describe the entity making the proposal, who will
complete the work, and who will draw down on the proposal's budget.

> This proposal is submitted by @AllYourStake (on Slack, /u/StakeGovernor2000 on reddit).
> You may remember me as the organizer of Decred's presence at such blockchain events as Real Blockchain Conference 2017 and Buckets of Blockchain 2018.
> I don't know exactly who the 3 booth staff and 1 Stakey suit wearer will be, I will be one of the staff and @Contributor1 is also interested.

### When

In the *When* section, describe the project's milestones, expected 
completion dates, and the draw schedule (how much is paid for each milestone delivered).

> Registration fees are due by September 30th, I will pay these up-front and request full reimbursement immediately.
> I will front the cost of the swag and Stakey suit, and claim this along with my travel/accommodation expenses and payment for my work, after the event.
> Booth staff who are already Decred contributors will bill for their hours and expenses directly, I will serve as intermediary for any staff costs not associated with established contributors.
