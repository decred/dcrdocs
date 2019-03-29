# <img class="dcr-icon" src="/img/dcr-icons/TicketLive.svg" /> PoS Voting General FAQ

---

#### 1. What are tickets?

A ticket is a token you buy to participate in the PoS system. You can buy tickets through the command line interface of dcrctl, or through a GUI like Decrediton[^1]. Whenever you buy a ticket, you pay the current ticket price and a ticket fee using your DCR. When a ticket is purchased, it goes to a temporary "mempool". Twenty tickets can be mined into each block and tickets are chosen to be mined based on their fee per kilobyte. Once your ticket is mined, it will move from the current "allmempool" to the "immature" ticket pool. After 256 blocks (about 20 hours) it then will mature and go into the live ticket pool where it is eligible to be chosen to vote.

---

#### 2. Do I need to be constantly connected to the network to participate in PoS?

A wallet needs to be online 24/7 to respond to vote if one of your tickets is selected. There are two main ways to do this: 1) a solo staking wallet which you set up and keep online all the time, or 2) you can use a [Voting Service Provider](../../proof-of-stake/how-to-stake.md#pos-using-a-voting-service-provider-vsp) (VSP). A VSP is a community-run wallet to which you can assign the voting rights of your tickets. The VSP will vote on your behalf, charging a small percentage of the PoS reward as a fee for this service.

It is important to note that you are only assigning voting rights to the VSP, not your actual funds. A VSP does not have access to your funds at any time.

---

#### 3. What is the "ticket price"?

The price for tickets is determined by an algorithm that aims to keep the ticket pool size, which is the total amount of tickets in the PoS system ticket pool, around a target size of 40,960 tickets.

The ticket price goes up or down according to the demand for tickets, and the number of tickets currently in the pool. Every 144 blocks the algorithm adjusts the ticket price. This is called a buying window. Each block can contain 20 newly bought tickets. This means that in every buying window a maximum of 2880 tickets can be added to the PoS system ticket pool.

The ticket price is always refunded, no matter if your ticket votes, misses or expires.

---

#### 4. What are fees?

The PoS system utilizes two types of fees, a "txfee" (also known as a 'split' fee) and a "ticketfee".

The txfee is a fee you pay the network for handling the transaction to buy your ticket. This fee is at default set to a low amount (0.0001 DCR/kB) and should not be changed.
The ticketfee is the fee you pay if your ticket gets mined. This fee is an incentive for PoW miners to mine your ticket and add it to the ticket pool.

In case the buying window is full, meaning there are more tickets being bought than there are available to be mined during that window, the ticketfee will be used to determine which tickets get put into
the ticket pool. The tickets with the highest ticketfee will be selected by the PoW miners.

Fees are calculated in DCR per kilobyte. Since a ticket is only about 300 bytes (for solo) or 540 bytes (for VSP) in size, the actual fees you pay will be lower than what you set as the specific fee amount.

Both txfees and ticketfees will *not* be returned when a ticket votes, expires, or misses a vote.

Returning the funds back to your wallet after a ticket votes or is revoked does not incur a fee.

---

#### 5. What is a Voting Service Provider?

A Voting Service Provider (VSP) is similar in some ways to a PoW mining pool, but for the PoS system. Through the options in your Decred wallet, you can give your voting rights to a VSP. If your ticket is selected to vote, the VSP will cast the vote for you and you are rewarded with the PoS reward minus the VSP fee (usually 1-5%). Unlike mining pools, the PoS reward is not split amongst the users of the VSP. The full reward goes to the owner of the specific ticket that voted.

A VSP allows you to buy tickets and vote without the requirement of maintaining an online and unlocked wallet. It is important to note that your funds never leave your wallet. You are not sending anything to the VSP, just giving it authority to vote on your behalf. A VSP cannot access your funds.

VSPs will usually implement multi-wallet redundancy by having many wallets physically distributed around the globe. This means there's less chance of a vote being missed because one wallet is down.
It also reduces latency between the wallet and network which can reduce the chance of a vote being missed.

---

#### 6. What happens to my funds when I buy a ticket?

Funds used to purchase tickets are locked until your ticket is selected to vote or expires; tickets expire if they aren't selected to vote after 40,960 blocks (about 4 months). If your ticket does successfully vote when called, you will receive the PoS reward.

If you submit a ticket, and it is not added to the ticket pool (included in a block by PoW miners), the `ticketfee` set when you purchased your ticket is never paid. The `txfee` for buying the ticket is paid out of the unlocked DCR sent back to your wallet.

---

#### 7. What are the chances of my ticket voting?

The PoS system in Decred uses a Poisson distribution to determine the chances of a ticket voting at any given time. Given the target pool size of 40,960 tickets, the average time for any one ticket to vote is 28 days, and each ticket has a 99.5% chance to vote before expiry. Note that these values will change with the pool size.

---

#### 8. What is Proof-of-Stake (PoS) voting?

Because the block validation performed by the Proof-of-Stake (PoS) system behaves like a voting system, it can be used to vote on other issues too.

When selected to validate a block, the tickets vote on whether or not to approve the previously mined block. This requires 3 out of 5 selected tickets to vote yes.

By adding another parameter to the ticket that doesn't interfere with the approval of the mined blocks, the system can track the amount of tickets using that parameter over a number of blocks. You can set this parameter in your wallet at any time before the ticket votes.

For example, you could choose the color of your ticket to be either red or blue, set that option, and the system will count for the next 1000 blocks how many red tickets and how many blue tickets there are. Maybe there are 3000 red tickets, 1500 blue tickets, and 500 that didn't select a colour.

If you replace the red or blue option with a yes or no option, you have a voting system that can count votes over time. By using the PoS voting, system anyone who holds DCR and locked it for tickets can vote on issues set in an agenda.

This voting system can be used for any governance issue. For Decred, the most prominent use will be to vote on hardforks, which are technical changes to the way the currency works. Some examples:

- Increase the maximum block size.
- Change the algorithm PoS uses to determine the ticket price.
- Vote on major new features for the currency (e.g. lightning network, enhanced privacy).
- Change the PoW algorithm.
- Pretty much anything the community decides would be in the best interest of the currency.

Currently, a platform for the community to submit and advocate a voting agenda is in development.

---

#### 9. Is Proof-of-Stake (PoS) susceptible to large exchanges using their customers’ DCR?

The amount of DCR a person (or exchange) possesses doesn't matter, only the number of tickets. Funds used to purchase tickets are locked until the ticket they purchased votes. This means that DCR involved in PoS are effectively nontransferable. For an exchange to use their customers’ DCR for voting, they would have to transfer them out of the wallets and lock them for up to 5 months. People would notice their balances change (DCR locked in PoS will not show as spendable) and they would not be able to withdraw any funds so the exchange would suffer a large loss of liquidity.

Furthermore, there is a hard limit of 20 tickets added per block, so no exchange could flood the pool faster than this.

Finally, there's a soft cap on the total number of tickets in the pool. Every 144 blocks (2880 tickets) the ticket price is adjusted based on the number of tickets in the pool and the rate that new tickets were added in the last window. Eventually the ticket price would be so high that even an exchange wouldn't be able to buy many tickets. And remember that even if they did that their DCR are locked so they can't buy more when the price drops again.

---

#### 10. Is Proof-of-Stake (PoS) susceptible to influence from large balance holders such as the original developers?

The pool size limits above apply here. This stops one person/group flooding the PoS pool with large numbers of their own tickets. Even if they bought up the whole pool (with huge fees) the most they would likely get is about 4000 tickets (based on previous ticket windows where the ones around 30 DCR usually go up to 100 for the next window, and the max for the one after that is often over 300). So a large balance holder could probably buy 2 windows out. A window at 30 would be 86,400 DCR, then the next at 100 would be 288,000 DCR. So it would cost 374,400 DCR to buy 5,760 tickets. With a target pool size of 40,960 tickets, 374,400 DCR would give you about 14% of all tickets.

Now the holder could wait a couple of days for the price to drop then start buying back up again. Except that most of their funds will be locked in the ones they bought earlier (although some will have voted) so their buying power for the new window is greatly reduced. But let's say they have super capital and bought all the DCR on all exchanges. So they are able to buy another two windows and replace those tickets that voted and were successful in buying all the tickets (at very high fees and/or prices). Let's say that takes them to about 25% of the tickets.

Tickets for a block are chosen with a random distribution. To force a vote to go a certain way you would need 3 out of 5 votes for a given block which is 60%. Even with that huge expenditure of capital, they are less than half way there. And a vote isn't decided on a single block so you would need 60% of 75% of blocks in the voting period.

And THEN you still need the PoW miners to confirm the votes. If they think someone is trying to game the system, they can choose to invalidate blocks.

So basically this is close to impossible, even if a single person has a HUGE percentage of DCR.

But then we come to the Voting Service Providers. VSPs, while not having access to any of their users' funds, do have the ability to change votes on tickets assigned to them. This is why it is suggested that when joining a VSP, people don't just go for the largest one. Decred is short for 'decentralised credit' so part of the spirit of PoS is ensuring that the VSPs don't get too large in relation to the others. However, even the largest at almost 20% would still only get on average one vote per block.

Decred was specifically designed to minimise impact from both large PoW mining pools and PoS VSPs as well as individuals (including developers) with large holdings.

---

#### 11. Why is the ticket pool target size 40,960?

This target was selected prior to Decred's launch to ensure that tickets would have a 99.5% chance of voting before they expire.

---

## :fa-book: Links

[^1]: [Decrediton Ticket Purchasing Guide](../../wallets/decrediton/using-decrediton.md#tickets)
