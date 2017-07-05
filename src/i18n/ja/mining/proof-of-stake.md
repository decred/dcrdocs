# Proof-of-Stake (PoS) Mining 

Last updated for v1.0.0

This document is meant to be an educational resource for Proof-of-Stake mining (staking) with Decred. It will cover the purpose of the Proof-of-Stake protocol, a brief introduction to the staking process, a ticket lifecycle, and get you started with ticket buying. 

---

## Overview 

Decred's unique Proof-of-Stake protocol serves multiple purposes:

To provide a metric for stakeholders/end-user support of any consensus updates. That is, stakeholders are able to vote on specific proposals/agenda on the Decred blockchain. Agendas may include deciding whether or not the dev team spends time implementing a specific feature, activating the code of a feature already submitted for implementation, or making other decisions such as how the dev subsidy should be spent. More information on voting can be found in our [Mainnet Voting Guide](/getting-started/user-guides/agenda-voting.md).

Decred's PoS also provides a system of checks and balances for nonconforming miners. Stakeholders can vote a block invalid if it doesn't match to the consensus rules of the network. 

---

## Staking 101 

To participate in proof-of-stake mining, stakeholders lock some DCR in return for a ticket. Every ticket owned gives a stakeholder the ability to cast a single vote. Upon voting, each ticket returns a small reward plus the original **Ticket Price** of the ticket. Each ticket is selected to vote at random, giving an average vote time of 28 days, but possibly requiring up to 142 days, with a .5% chance of expiring before being chosen to vote (this expiration returns the original **Ticket Price** without a reward). Every block mined must include 5 votes (Miners are penalized by a reward deduction if less than 5 votes are included). Every block mined can also include up to 20 fresh ticket purchases. A new ticket requires 256 block to mature before it is entered into the **Ticket Pool* and able to be called upon to vote.

There are a few important variables that you should familiarize yourself with while staking.

Every 144 blocks (~12 hours), the stake difficulty algorithm calculates a new **Ticket Price** in an attempt to keep the **Ticket Pool** size near the target pool size of 40,960 tickets. This 144 block window is referred to as the `StakeDiffWindowSize`.

The **Ticket Price**/**Stake Difficulty** is the price you must pay for a ticket during a single 144 block window.

The **Ticket Pool** is the total number of tickets in the Decred network.

The **Ticket Fee** (`ticketfee`) is the fee rate that must be included in the ticket purchase to incentivize Proof-of-Work miners to include that ticket in a new block. **Ticket Fee** usually refers to the DCR/kB fee rate for a ticket purchase transaction. Therefore, with a higher transaction size, you will end up paying a higher absolute fee. For example, solo-staking ticket purchases are around 300 Bytes, which means a **Ticket Fee** of .3 DCR/kB will result in the spending on .1 DCR if, and only if, that ticket gets included in a block.

When the **Ticket Price** gets relatively low for a single **Ticket Window**, you can usually expect a fee market to form, with many stakeholders trying to buy tickets before the window ends. When the **Ticket Price** is not at an extremely low and profitable price, the default **Ticket Fee** of 0.01 DCR/kB rate is usually high enough to be included in a block.  

When a ticket is called to vote, the wallet that has voting rights for that ticket must be online. If the wallet is not online to cast its vote, the ticket will be marked as `missed` and you will not receive a reward for that ticket. Stakepools are offered as a solution for those that cannot have a voting wallet online 24/7.

Stakepools allow stakeholders to generate ticket purchase transactions that give a stakepool voting rights for your ticket. They vote on your behalf, usually requiring a small fee for participation (under 7%) which covers the cost of hosting the minimum of 3 servers required to run a stakepool. This fee is known as the **Pool Fee** and is only taken out of the small PoS reward. A list of stakepools can be found [below](#list-of-stakepools).

---

## Ticket Lifecycle 

Purchasing a ticket for PoS is quite simple (see below) but what happens to it after you buy it?
A ticket on main net (test net uses different parameters) will go through a few stages in its lifetime:

1. You buy a ticket using a Paymetheus <!--, Decrediton,--> or dcrwallet wallet. The total cost of the each single ticket transaction should be **Ticket Price** + **Ticket Fee**(`ticketfee`).
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

## How to Stake 

A wallet that is open and unlocked 24/7 is *highly recommended* for staking. Any loss in uptime may result in a loss of vote and reward. Stakepools are available for those unable to keep a personal voting wallet online forever.

The only other requirement for staking is that you buy a ticket. Below you can find guides for buying tickets using [Paymetheus](#paymetheus) and [dcrwallet](#dcrwallet).

If you intend to use a stakepool, you must first sign up for one. Links to officially recognized stakepools are provided [here](#list-of-stakepools).

---

## Paymetheus 

The Paymetheus application is unable to vote itself, which means that voting rights must be assigned to a stakepool.

Please see the [Purchase Tickets tab guide](/getting-started/user-guides/using-paymetheus.md#purchase-tickets-tab) for Paymetheus to learn how to buy tickets using Paymetheus and a stakepool.

---

## dcrwallet 

The [Buying Tickets with dcrwallet](/getting-started/user-guides/dcrwallet-tickets.md) guide will show you how to buy tickets manually and automatically for pool or solo staking.

---

## <i class="fa fa-life-ring"></i> List of Stakepools 

These stakepools are officially recognized:

* [<i class="fa fa-external-link-square"></i> https://dcr.stakepool.net](https://dcr.stakepool.net)
* [<i class="fa fa-external-link-square"></i> https://dcr.stakeminer.com](https://dcr.stakeminer.com)
* [<i class="fa fa-external-link-square"></i> https://pool.d3c.red](https://pool.d3c.red)
* [<i class="fa fa-external-link-square"></i> https://stakepool.dcrstats.com](https://stakepool.dcrstats.com)
* [<i class="fa fa-external-link-square"></i> https://stake.decredbrasil.com](https://stake.decredbrasil.com)
* [<i class="fa fa-external-link-square"></i> https://stakepool.eu](https://stakepool.eu)
* [<i class="fa fa-external-link-square"></i> https://dcr.ubiqsmart.com](https://dcr.ubiqsmart.com)
* [<i class="fa fa-external-link-square"></i> https://ultrapool.eu](https://ultrapool.eu)

You can find a comparison of each pool's fees and statistics by visiting the
[<i class="fa fa-external-link-square"></i> Decred website](https://decred.org)
and clicking the 'Stakepools' link within the footer at the bottom of the page.

---

<!-- TODO: **Purchasing Tickets with Decrediton** -->

## Additional Information 

[Mainnet Voting Guide](/getting-started/user-guides/agenda-voting.md)

[Proof-of-Stake Commands](/advanced/program-options.md#pos-commands)

[Proof-of-Stake FAQ - General](/faq/proof-of-stake/general.md)

[Proof-of-Stake FAQ - Buying Tickets and Fees](/faq/proof-of-stake/buying-tickets-and-fees.md)

[Proof-of-Stake FAQ - Solo Mining](/faq/proof-of-stake/solo-mining.md)

[Proof-of-Stake FAQ - Stake Pools](/faq/proof-of-stake/stake-pools.md)

[Proof-of-Stake FAQ - Voting Tickets](/faq/proof-of-stake/voting-tickets.md)

[Proof-of-Stake Mining Parameters](/advanced/program-options.md#pos-network-parameters)
