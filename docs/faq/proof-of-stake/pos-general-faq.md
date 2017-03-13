# **<i class="fa fa-ticket"></i> PoS General FAQ**

---

#### **1. What is Proof-of-Stake mining?**

Besides Proof-of-Work (PoW) mining Decred has Proof-of-Stake (PoS) mining. In PoS mining the participants buy tickets using their Decred coins (DCR). These tickets go into the PoS pool and are randomly called upon to vote on the previous block. Every block 5 tickets are chosen from the pool and if at least 3 of those validate the previously mined block, the newly mined block is approved, added to the chain and both PoW miners and PoS miners are paid. If the block is not validated by the PoS miners the PoW miners do not get paid, but the PoS miners do. This is to incentivize PoW miners to mine according to the wishes of the PoS miners.

This PoS system has several advantages that solve problems PoW only systems might encounter. For example, because the PoS miners have to validate the blocks the PoW miners mine, the PoW miners cannot decide on their own to change the rules of the network (a 51% attack). Or, when the Decred chain hardforks the old, smaller, chain will die off quickly due to not being validated by the PoS component of the chain.

The PoS system rewards participants for their staking. Every Decred block has a PoS reward component that will be distributed to every ticket chosen to validate that block. The system is designed in such a way that the average time for the ticket to be selected is 28 days. If a ticket hasn't been selected after 40960 blocks (about 4 months) it will be revoked by the system and the DCR used to purchase the ticket will be returned to the ticket owner.

Another interesting feature this PoS system allows is the ability to vote. Because the block validation can be considered a vote, by adding extra votebit components to the ticket the system can track and count votes over a series of blocks. These votes can be about anything.

In the Decred Proof-of-Stake system, anyone holding DCR can participate by buying a ticket.

---

#### **2. What are tickets?**

A ticket is a token you buy to participate in the PoS system. You can buy tickets through the command line interface of dcrctl, or through a GUI like Paymetheus[^1] or Decrediton. Whenever you buy a ticket you pay the current ticket price and a ticket fee using your DCR. Once your ticket is mined it will move from the current 'allmempool' to the 'immature' ticket pool. After 256 blocks (about 22 hours) it then will mature and go into the live ticket pool and is ready to be chosen to validate a block.

Remember, your wallet has to be online and unlocked for your ticket to cast a valid vote on a block when it is selected. If you don't want to leave your wallet unlocked and online have a look at a PoS stake pool.

---

#### **3. What is ticket price?**

The price for tickets is determined by an algorithm. This algorithm aims to keep the pool size, which is the total amount of tickets in the PoS pool, at around the target. The target is set to 40960 tickets. The ticket price will go up or down according to the demand for tickets.

Every 144 blocks the algorithm adjusts the ticket price. This is called a buying window. Each block can contain 20 new votes. This means that in every buying window a maximum of 2880 tickets can be added to the PoS pool.

---

#### **4. What are fees?**

The PoS system utilizes two types of fees, a txfee and a ticketfee.
	
The txfee is a fee you pay the network for handling the transaction to buy your ticket. This fee is at default set to a low amount (0.01 DCR/kB) and should not be changed.
The ticketfee is the fee you pay if your ticket gets mined. This fee is an incentive for miners to mine your ticket and add it to the ticket pool.

In case the buying window is full, meaning there are more tickets being bought than there are available to be mined, the ticketfee will be used to determine which tickets get put into the pool. The tickets with the highest ticketfee will be selected by the miners.

Fees are calculated in DCR per kilobyte. Since a ticket is only about 300bytes in size, the actual fees you pay will be lower than what you set as the specific fee amount.

Both txfees and ticketfees will not be returned when a ticket votes, expires, or misses a vote.

Returning the funds back to your wallet after a ticket votes or is revoked does not generate a fee.

---

#### **5. What is a stake pool?**

A stake pool is the equivalent of a mining pool, but for the PoS system. Through the options in your DCR wallet you can give your voting rights to a stake pool. If your ticket is selected to validate a block the stake pool will cast the vote for you and you are rewarded with the PoS reward. Unlike the mining pools, the PoS reward is not split amongst the users of the stake pool, but the full reward goes to the owner of the ticket.

The use of a stake pool will allow you to buy tickets with your DCR but not have your own wallet unlocked and always online.

Stake pools will usually implement multi-wallet redundancy by having many wallets physically distributed around the globe. This means there's less chance of a vote being missed because one wallet is down. It also reduces latency between the wallet and network which can reduce the chance of a vote being missed.

Stake pools may charge a fee for this service.

---

#### **6. What happens to my DCR?**

So you successfully bought a ticket with some of your DCR. These coins will be locked into the PoS pool	until the ticket is selected to validate a block or it expires. When your coins are in the PoS pool they are locked and safe, nothing can happen to them. If your ticket is selected to validate a block you will be refunded the total amount of your DCR and, as a reward for participating, you get the DCR PoS reward.

The only cost for using this system are the fees you set. The txfee will be deducted for the transaction of your ticket across the network. The ticketfee will be deducted for incorporation into the PoS pool and paid to the miners. If your ticket does not get mined the ticketfee will be returned to you along with the DCR paid for the ticket price.

In case your ticket isn't selected to vote after 40960 blocks (about 4 months), the system will revoke your ticket and the DCR you paid for it will be transferred back into your wallet. You will not get the PoS reward. There is a low, about 2%, chance of this happening. The average time for a ticket to vote is 28 days.

In case your ticket is selected to vote but your wallet cannot vote, e.g. it isn't online or unlocked, the system marks the ticket as missed and the DCR you paid for it will be transferred back into your wallet after the system revokes your ticket. You will not get the PoS reward. To avoid this scenario the use of a stakepool is advised.

You will always get back the amount of DCR you paid for a ticket minus the fees.

---

#### **7. What is Proof-of-Stake voting?**

Because the block validation performed by the PoS system behaves like a voting system it can be used to vote on other issues too.

When selected to validate a block the tickets vote on whether or not to approve the mined block. This requires 3 out of 5 selected tickets to vote yes.

By adding another parameter to the ticket that doesn't interfere with the approval of the mined blocks, the system can track the amount of tickets using that parameter over a number of blocks. You can set this parameter in your wallet at any time before the ticket votes. 

For example, you could choose the color of your ticket to be either red or blue, set that option, and the system will count for the next 1000 blocks how many red tickets and how many blue tickets there are. Maybe there are 3000 red tickets, 1500 blue tickets, and 500 that didn't select a colour.

If you replace the red or blue option with a yes or no option, you have a voting system that can count votes over time. By using the PoS voting system anyone who holds DCR can vote on issues set in an agenda.

This voting system can be used for any issue. For Decred the most prominent use will be to vote on hardforks.

---

#### **8. What is hardfork voting?**

Like any other cryptocurrency Decred might need to hardfork at some point.

One of the agenda issues set for the PoS voting system could be a hardfork. If such an issue is set, the new version of the decred files will include the hardfork but it will not activate until the PoS system has voted on it.

For a hardfork vote to start two critical conditions have to be met:

- First, 75% of the PoW miners have to upgrade to the latest version of the current network block version. This check runs over the past 100 blocks.
- Second, 75% of the PoS miners have to upgrade to the latest version. This check runs over the past 2016 blocks.

If these checks are met the voting process begins. Tickets can be set with an additional parameter of yes/no/abstain. You do this in your wallet before the ticket votes. Tickets marked as abstain will not be counted in the total amount of votes.

The PoS system then starts counting tickets with these parameters set over a predetermined amount of blocks. If over this interval the amount of votes is 75%, or more, 'yes' the vote has passed. A lock in period of a set number of blocks will start before the hardfork goes live, so everyone has a chance to upgrade and not be hardforked off the network.

Because the code for the hardfork is already in the then current version of Decred there is no need for the developers to interfere or the majority of PoW miners and PoS miners to upgrade after a decision has been reached. If the vote on a hardfork passes it will be implemented automatically after the lock in period.

The hardfork vote can fail at multiple points. The vote might not start at all if the PoW miners or PoS miners do not upgrade. After that, the treshold of 75% votes might not be reached.

In case a vote fails a new round will start at the beginning of the process. This means checking whether the PoW miners have upgraded, if the PoS miners have upgraded, and then another vote counting period. This will continue for a certain amount of rounds, after which, if the vote hasn't passed, the agenda issue will be tabled.

---

## **<i class="fa fa-book"></i> Links**

[^1]: [Paymetheus Ticket Purchasing Guide](/getting-started/user-guides/using-paymetheus.md#-purchase-tickets-tab)
