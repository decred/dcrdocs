# <img class="dcr-icon" src="/img/dcr-icons/TicketVoted.svg" /> Proof-of-Stake (PoS) Mining

Last updated for v1.1.0

---

## Overview 

Decred's unique Proof-of-Stake protocol serves multiple purposes:

1. Allowing stakeholders to vote for or against proposed changes to the Decred blockchain. If stakeholders vote in support of a change, the chain will hardfork and the new feature becomes active automatically. More information on voting can be found in the [Mainnet Voting Guide](/getting-started/user-guides/agenda-voting.md).

1. Providing a mechanism for stakeholders to keep check of nonconforming proof-of-work miners. Stakeholders can vote a block invalid even if it conforms to the consensus rules of the network. This allows stakeholders to discourage unfavourable mining behavior such as mining empty blocks.

1. Allowing long-term holders of Decred to lock up their funds for a length of time in order to accrue new coins from the [Block Reward](/advanced/inflation/).

---

## How Proof-of-Stake Works

To participate in proof-of-stake mining, stakeholders lock some DCR in return for a ticket. Every ticket owned gives a stakeholder the ability to cast a single vote. Upon voting, each ticket returns a small reward plus the original **Ticket Price** of the ticket. Each ticket is selected to vote at random, giving an average vote time of 28 days, but possibly requiring up to 142 days, with a .5% chance of expiring before being chosen to vote (this expiration returns the original **Ticket Price** without a reward). Every block mined must include 5 votes (Miners are penalized by a reward deduction if fewer than 5 votes are included). Every block mined can also include up to 20 fresh ticket purchases. A new ticket requires 256 block to mature before it is entered into the **Ticket Pool* and able to be called upon to vote.

There are a few important variables that you should familiarize yourself with while staking.

Every 144 blocks (~12 hours), the stake difficulty algorithm calculates a new **Ticket Price** in an attempt to keep the **Ticket Pool** size near the target pool size of 40,960 tickets. This 144 block window is referred to as the `StakeDiffWindowSize`.

The **Ticket Price**/**Stake Difficulty** is the price you must pay for a ticket during a single 144 block window.

The **Ticket Pool** is the total number of tickets in the Decred network.

The **Ticket Fee** (`ticketfee`) is the fee rate that must be included in the ticket purchase to incentivize Proof-of-Work miners to include that ticket in a new block. **Ticket Fee** usually refers to the DCR/kB fee rate for a ticket purchase transaction. Therefore, with a higher transaction size, you will end up paying a higher absolute fee. For example, solo-staking ticket purchases are around 300 Bytes, which means a **Ticket Fee** of .3 DCR/kB will result in the spending on .1 DCR if, and only if, that ticket gets included in a block.

When the **Ticket Price** gets relatively low for a single **Ticket Window**, you can usually expect a fee market to form, with many stakeholders trying to buy tickets before the window ends. When the **Ticket Price** is not at an extremely low and profitable price, the default **Ticket Fee** of 0.001 DCR/kB rate is usually high enough to be included in a block.

When a ticket is called to vote, the wallet that has voting rights for that ticket must be online. If the wallet is not online to cast its vote, the ticket will be marked as `missed` and you will not receive a reward for that ticket. Stakepools are offered as a solution for those that cannot have a voting wallet online 24/7.

Stakepools allow stakeholders to generate ticket purchase transactions that give a stakepool voting rights for your ticket. They vote on your behalf, usually requiring a small fee for participation (under 7%) which covers the cost of hosting the minimum of 3 servers required to run a stakepool. This fee is known as the **Pool Fee** and is only taken out of the small PoS reward. A list of stakepools can be found [below](#list-of-stakepools).

---

## Ticket Lifecycle 

Purchasing a ticket for PoS is quite simple (see below) but what happens to it after you buy it?
A ticket on main net (test net uses different parameters) will go through a few stages in its lifetime:

1. You buy a ticket using a Decrediton or dcrwallet wallet. The total cost of the each single ticket transaction should be **Ticket Price** + **Ticket Fee**(`ticketfee`).
2. Your ticket enters the `mempool`. This is where your ticket waits to be mined by PoW miners. Only 20 fresh tickets are mined into each block.
3. Tickets are mined into a block in with higher **Ticket Fee** transactions having a higher priority. Note that the **Ticket Fee** is DCR per KB of the transaction. A few common transaction sizes are 298 Bytes (a solo ticket purchase) and 539 Bytes (a pool ticket purchase).
4. **A -** If your ticket is mined into a block, it becomes an immature ticket. This state lasts for 256 blocks (about 20 hours). During this time the ticket cannot vote. At this point, the ticket fee is non-refundable. <br /> 
**B -** If your ticket is not mined, both the **Ticket Price** and **Ticket Fee** are returned to the purchasing account.
5. After your ticket matures (256 blocks), it enters the **Ticket Pool** and is eligible for voting.
6. The chance of a ticket voting is based on a Poisson distribution with a mean of 28 days. After 28 days a ticket has a 50% chance to have already voted.
7. Given a target pool size of 40960 tickets, any given ticket has a 99.5% chance of voting within ~142 days (about 4.7 months). If, after this time, a ticket has not voted, it expires. You receive a refund on the original **Ticket Price**.
8. A ticket may miss its call to vote if the voting wallet does not respond or two valid blocks are found within close proximity of each other. If this happens, you receive a refund on the original **Ticket Price**.
9. After a ticket has voted, missed, or expired, the funds (ticket price and subsidy if applicable, minus the fee) will enter immature status for another 256 blocks, after which they are released. If a ticket is missed or expired, a ticket revocation transaction is submitted by the wallet which then frees up the locked ticket outputs. **NOTE:** Revocations can only be submitted for a corresponding missed ticket. You cannot revoke a ticket until it is missed.

---

## Additional Information 

[Mainnet Voting Guide](/getting-started/user-guides/agenda-voting.md)

[Proof-of-Stake Commands](/advanced/program-options.md#pos-commands)

[Proof-of-Stake FAQ - General](/faq/proof-of-stake/general.md)

[Proof-of-Stake FAQ - Buying Tickets and Fees](/faq/proof-of-stake/buying-tickets-and-fees.md)

[Proof-of-Stake FAQ - Solo Mining](/faq/proof-of-stake/solo-mining.md)

[Proof-of-Stake FAQ - Stake Pools](/faq/proof-of-stake/stake-pools.md)

[Proof-of-Stake FAQ - Voting Tickets](/faq/proof-of-stake/voting-tickets.md)

[Proof-of-Stake Mining Parameters](/advanced/program-options.md#pos-network-parameters)
