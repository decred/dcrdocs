# <img class="dcr-icon" src="/img/dcr-icons/Politeia.svg" /> Politeia Censorship

---

This page details the Politeia censorship model, its motivations, and provides instructions for proving censorship of submissions to Politeia (proposals, proposal comments, comment upvotes/downvotes).

## Why censorship is required

Censorship is a necessary tool for administrators for several reasons. For one, Politeia cannot host illegal content. For another, because the fee to submit a proposal is relatively low (0.1 DCR), there is a risk the system could be flooded with spam proposals that waste the time and attention of stakeholders. 


## Transparent censorship 

Politeia is based on the concept of *__transparent censorship__*. A limitation observed with other platforms such as Reddit, is that moderators can censor silently. This can lead to situations where content is censored because it goes against the preferred narrative of the moderators. In these cases, it is often the users' word against that of the moderators'. In Politeia, admins can censor content, but can only do so transparently. If a user's submission is censored, they can cryptographically prove that the censorship occurred. If admins censor a proposal, they must also provide a reason, which is viewable to the user.


## Proving censorship

When a user registers, a cryptographic identity (pub/priv key pair) is created. This cryptographic identity is then used to create a “censorship token" for each user submission (proposal, comment, comment upvote/downvote). If a user's submission is censored, they can use this token to cryptographically prove their submission was censored, the time it was submitted, and the exact form of the submission. 

If a user's proposal is censored, it will not appear publicly on Politeia, but will still be visible to the user and admins. The censored proposal will still appear on the user's `Your Proposals` page, along with the reason the proposal was censored. Below is an example proposal that was censored as spam. 

![Example Censored Proposal](/img/politeia/censored-proposal.png)

## Recourse

If a user feels they have been unjustly censored, they are free to show their provably censored proposal to the [community](../../getting-started/beginner-guide.md#community) at large and build support for their proposal. Proposals can be resubmitted at any time. Users are responsible for hosting any censored content if they wish to share it externally.   

### Don't trust, verify

Clicking on the `Download Proposal Bundle` link on the proposal page will download a JSON file to the user's computer containing information about the proposal, including the proposal's censorship record. The censorship record contains all the information needed to prove a proposal was submitted, including the time it was submitted, its exact form at the time of submission, and if it was censored. Politeia provides a verification tool, politeia_verify, that can be used verify a proposal submission using its censorship record. Source code and instructions for using politeia_verify can be found [here](https://github.com/decred/politeia/tree/master/politeiad/cmd/politeia_verify).


