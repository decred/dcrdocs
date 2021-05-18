# ![](../../img/dcr-icons/TicketLive.svg){ .dcr-icon } Proof-of-Stake General FAQ

---

#### 1. When did Decred's Proof-of-Stake start?

Proof-of-Stake (PoS) was included in the first release of Decred software in February 2016.

Ticket purchases were possible as soon as the intial coins became spendable,
however voting did not begin until block 4,096, aka the
[Stake Validation Height](https://devdocs.decred.org/core-blockchain-concepts/proof-of-stake/stake-validation-height/).

The initial 4,096 blocks acted as a bootstrapping phase which allowed the ticket
pool to grow towards its target size. This helped to ensure the continuity of
the blockchain by reducing the risk of the ticket pool being emptied once voting
began, and helped to decentralize the initial batch of tickets amongst a wider
group of participants.

---

#### 2. Do I need to be constantly connected to the network to participate in PoS?

A wallet needs to be online 24/7 to cast votes when tickets are selected.
There are two main ways to do this:

1. A solo staking wallet which you set up yourself and keep online all the time.
1. Using a [Voting Service
   Provider](../../proof-of-stake/how-to-stake.md#pos-using-a-voting-service-provider-vsp)
   (VSP) which will vote on your behalf, charging a small percentage of the PoS
   reward as a fee for this service.

---

#### 3. What is the "ticket price"?

The price for tickets is determined by an algorithm that aims to keep the ticket pool size, which is the total amount of tickets in the PoS system ticket pool, around a target size of 40,960 tickets.

The ticket price goes up or down according to the demand for tickets, and the number of tickets currently in the pool. Every 144 blocks the algorithm adjusts the ticket price. This is called a buying window. Each block can contain 20 newly bought tickets. This means that in every buying window a maximum of 2880 tickets can be added to the PoS system ticket pool.

The ticket price is always refunded, no matter if your ticket votes, misses or expires.

---

#### 4. What is a Voting Service Provider?

A Voting Service Provider (VSP) is similar in some ways to a PoW mining pool, but for the PoS system. Through the options in your Decred wallet, you can share your voting rights with a VSP. If your ticket is selected to vote, the VSP will cast the vote for you and you are rewarded with the PoS reward. Unlike mining pools, the PoS reward is not split amongst the users of the VSP. The full reward goes to the owner of the specific ticket that voted.

A VSP allows you to buy tickets and vote without the requirement of maintaining an online and unlocked wallet. It is important to note that your funds never leave your wallet. You are not sending anything to the VSP, just giving it authority to vote on your behalf. A VSP cannot access your funds.

VSPs will usually implement multi-wallet redundancy by having many wallets physically distributed around the globe. This means there's less chance of a vote being missed because one wallet is down.
It also reduces latency between the wallet and network which can reduce the chance of a vote being missed.

---

#### 5. Can I cancel my ticket?

No. The fact that funds cannot be withdrawn is a key element in Decred's PoS security and governance model. Having funds locked in tickets proves that ticket holders have "skin in the game" and are properly incentivized. Funds will be returned to the ticket holder's wallet once the ticket has either voted or been revoked due to a missed or expired vote.

---

#### 6. Is Proof-of-Stake (PoS) susceptible to large exchanges using their customers’ DCR?

The amount of DCR a person (or exchange) possesses doesn't matter, only the number of tickets. Funds used to purchase tickets are locked until the ticket they purchased votes. This means that DCR involved in PoS are effectively nontransferable. For an exchange to use their customers’ DCR for voting, they would have to transfer them out of the wallets and lock them for up to 5 months. People would notice their balances change (DCR locked in PoS will not show as spendable) and they would not be able to withdraw any funds so the exchange would suffer a large loss of liquidity.

Furthermore, there is a hard limit of 20 tickets added per block, so no exchange could flood the pool faster than this.

Finally, there's a soft cap on the total number of tickets in the pool. Every 144 blocks (2880 tickets) the ticket price is adjusted based on the number of tickets in the pool and the rate that new tickets were added in the last window. Eventually the ticket price would be so high that even an exchange wouldn't be able to buy many tickets. And remember that even if they did that their DCR are locked so they can't buy more when the price drops again.

---

#### 7. Is Proof-of-Stake (PoS) susceptible to influence from large balance holders such as the original developers?

The pool size limits above apply here. This stops one person/group flooding the PoS pool with large numbers of their own tickets. Even if they bought up the whole pool (with huge fees) the most they would likely get is about 4000 tickets (based on previous ticket windows where the ones around 30 DCR usually go up to 100 for the next window, and the max for the one after that is often over 300). So a large balance holder could probably buy 2 windows out. A window at 30 would be 86,400 DCR, then the next at 100 would be 288,000 DCR. So it would cost 374,400 DCR to buy 5,760 tickets. With a target pool size of 40,960 tickets, 374,400 DCR would give you about 14% of all tickets.

Now the holder could wait a couple of days for the price to drop then start buying back up again. Except that most of their funds will be locked in the ones they bought earlier (although some will have voted) so their buying power for the new window is greatly reduced. But let's say they have super capital and bought all the DCR on all exchanges. So they are able to buy another two windows and replace those tickets that voted and were successful in buying all the tickets (at very high fees and/or prices). Let's say that takes them to about 25% of the tickets.

Tickets for a block are chosen with a random distribution. To force a vote to go a certain way you would need 3 out of 5 votes for a given block which is 60%. Even with that huge expenditure of capital, they are less than half way there. And a vote isn't decided on a single block so you would need 60% of 75% of blocks in the voting period.

And THEN you still need the PoW miners to confirm the votes. If they think someone is trying to game the system, they can choose to invalidate blocks.

So basically this is close to impossible, even if a single person has a HUGE percentage of DCR.

But then we come to the Voting Service Providers. VSPs, while not having access to any of their users' funds, do have the ability to change votes on tickets assigned to them. This is why it is suggested that when joining a VSP, people don't just go for the largest one. Decred is short for 'decentralized credit' so part of the spirit of PoS is ensuring that the VSPs don't get too large in relation to the others. However, even the largest at almost 20% would still only get on average one vote per block.

Decred was specifically designed to minimize impact from both large PoW mining pools and PoS VSPs as well as individuals (including developers) with large holdings.

---

#### 8. Why is the ticket pool target size 40,960?

This target was selected prior to Decred's launch to ensure that tickets would have a 99.5% chance of voting before they expire.

---

#### 9. If my ticket expires without voting, do I lose the transaction fee?

Yes - the fee paid to mine the ticket transaction is not refunded.

---

#### 10. What happens if less than 3 of the selected tickets vote on a block?

Miners do not start mining for the next block until at least 3 of the selected
tickets vote on the current block.
If a found block does not manage to get the selected votes, the block is simply
orphaned by the next block another miner finds.

For example, assume the current chain tip is at block 5,000.
The voters determined by block 5,000 have already submitted their votes, so
miners are chugging away looking for block 5,001.
Now, a miner finds a solution for block 5,001 and submits it to the network.
All of the daemons (and hence wallets) will see that 5,001 just showed up.
However, the miners do not immediately start mining off of 5,001.
Instead they continue mining off of 5,000 until 3+ votes for block 5,001 show up.
At that point they all switch and start mining off of 5,001.
If those 3+ votes never show up, another candidate block 5,001 will be found by
the other miners still working on block 5,000 who will submit their (different)
solution for block 5,001 to the network.
Since each of these new candidate blocks for 5,001 have a different hash,
different tickets are selected.

---

#### 11. Are vote choices set when a ticket is purchased, or when a ticket votes?

Voting choices can be set and changed at any time after a ticket is purchased.
It is only when the ticket is called to vote that the vote choice is recorded on
the blockchain and can no longer be changed.

Weeks or months could elapse between a ticket being purchased and it being
called to vote. A ticket could be purchased before a voting agenda even exists.
