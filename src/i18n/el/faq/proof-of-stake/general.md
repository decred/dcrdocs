# <i class="fa fa-ticket"></i> Συχνές Ερωτήσεις Γενικού Περιεχομένου για το PoS

---

#### 1. Τι είναι το σύστημα Proof-of-Stake του Decred;

The Proof-of-Stake (PoS) system allows holders of Decred to have a say in the governance of the currency. It aims to give users a voice alongside the miners.
In order to participate, users can purchase "tickets", which enter a lottery pool. Every block 5 tickets are chosen from the PoS ticket pool. If at least 3 of those validate the previously mined block, 
the newly mined block is added to the chain, and both PoW miners and PoS stakers are paid. If the block is not validated by the PoS stakers the PoW miners do not get paid, but the PoS stakers do. This is
 to incentivize PoW miners to mine according to the wishes of the PoS stakers.

This PoS system has several advantages that solve problems PoW-only systems might encounter. For example, because the PoS stakers have to validate the blocks the PoW miners mine, the PoW miners cannot 
decide on their own to change the rules of the network (a 51% attack). Or, when the Decred chain hardforks the old, smaller, chain will die off quickly due to not being validated by the PoS component of
the chain.

The PoS system rewards participants for their staking. Every Decred block has a PoS reward component that will be distributed to every ticket chosen to vote in that block. The system is designed in such a 
way that the average time for the ticket to be selected is 28 days. If a ticket hasn't been selected after 40960 blocks (a bit under 5 months) it will be revoked by the system. The DCR used to purchase a
 ticket is returned regardless of whether or not it votes.

Another interesting feature this PoS system allows for is the ability to vote on an agenda. Because the block validation can be considered a vote, by adding extra votebit components to the ticket the system can track and count votes over a series of blocks. These votes can be about anything.

Στο σύστημα Proof-of-Stake του Decred, οποιοσδήποτε κατέχει DCR μπορεί να συμμετάσχει, αγοράζοντας εισιτήριο.

---

#### 2. Τι είναι τα εισιτήρια;

A ticket is a token you buy to participate in the PoS system. You can buy tickets through the command line interface of dcrctl, or through a GUI like Paymetheus[^1] or Decrediton. Whenever you buy a 
ticket, you pay the current ticket price and a ticket fee using your DCR. When a ticket is purchased, it goes to a temporary "mempool". 20 tickets can be mined into each block and tickets are chosen
to be mined based on their fee per kilobyte. Since there is a limited number of tickets that can mined into blocks at a given price (2880), there may be competition to get tickets mined. In this case,
you can increase the fee you're willing to pay to get your ticket(s) mined. Once your ticket is mined it will move from the current 'allmempool' to the 'immature' ticket pool. After 256 blocks
(about 20 hours) it then will mature and go into the live ticket pool where it is eligible to be chosen to vote.

---

#### 3. Θα πρέπει να είμαι συνεχώς συνδεδεμένος με το δίκτυο για να συμμετέχω στο PoS;

A wallet needs to be online 24/7 to respond to a vote if one of your tickets is selected. There are two main ways to do this; a solo staking wallet which you set up and keep online all the time, or you 
can use a [stake pool](/mining/proof-of-stake.md#solo-mining-or-pool-mining). A stake pool is basically a community run wallet to which you can assign the voting rights of your tickets and the pool will
vote on your behalf for a small percentage of the PoS reward.

Είναι σημαντικό να γνωρίζετε ότι αναθέτετε μόνο το δικαιώματα ψήφου στο pool, και όχι τα χρήματα σας. Ένα stake pool δεν έχει ποτέ πρόσβαση στα χρήματα σας.

---

#### 4. Τι είναι η "τιμή του εισιτηρίου";

The price for tickets is determined by an algorithm that aims to keep the ticket pool size, which is the total amount of tickets in the PoS system ticket pool around a target size of 40960 tickets.
The ticket price will go up or down according to the demand for tickets, and the number of tickets currently in the pool.

Every 144 blocks the algorithm adjusts the ticket price. This is called a buying window. Each block can contain 20 newly bought tickets. This means that in every buying window a maximum of 2880 tickets
can be added to the PoS system ticket pool.

Η τιμή του εισιτηρίου επιστρέφεται πάντα ανεξάρτητα από το εάν το εισιτήριό σας ψηφίσει ή όχι, ή αν λήξει.

---

#### 5. Τι είναι τα τέλη;

Το σύστημα PoS κάνει χρήση δύο τελών, το txfee (γνωστό και ως 'split' τέλος) και το ticketfee
	
The txfee is a fee you pay the network for handling the transaction to buy your ticket. This fee is at default set to a low amount (0.01 DCR/kB) and should not be changed.
The ticketfee is the fee you pay if your ticket gets mined. This fee is an incentive for PoW miners to mine your ticket and add it to the ticket pool.

In case the buying window is full, meaning there are more tickets being bought than there are available to be mined during that window, the ticketfee will be used to determine which tickets get put into
the ticket pool. The tickets with the highest ticketfee will be selected by the PoW miners.

Fees are calculated in DCR per kilobyte. Since a ticket is only about 300 (solo) or 540 (pool) bytes in size, the actual fees you pay will be lower than what you set as the specific fee amount.

Τόσο το txfees όσο και το ticketfees δεν θα επιστραφούν όταν ένα εισιτήριο ψηφίσει ή όχι, ή αν λήξει.

Returning the funds back to your wallet after a ticket votes or is revoked does not generate a fee.

---

#### 6. Τι είναι το stake pool;

A stake pool is the equivalent of a mining pool, but for the PoS system. Through the options in your Decred wallet, you can give your voting rights to a stake pool. If your ticket is selected to vote,
the stake pool will cast the vote for you and you are rewarded with the PoS reward minus the stake pool fee (usually 4-5%). Unlike the mining pools, the PoS reward is not split amongst the users of the stake pool. The full reward goes to the owner of the ticket.

A stake pool will allow you to buy tickets but not have your own wallet unlocked and always online. It is important to note that your funds never leave your wallet. You are not sending anything to the pool,
just giving it authority to vote on your behalf. A stake pool cannot access your funds. 

Stake pools will usually implement multi-wallet redundancy by having many wallets physically distributed around the globe. This means there's less chance of a vote being missed because one wallet is down.
It also reduces latency between the wallet and network which can reduce the chance of a vote being missed.

---

#### 7. Τι συμβαίνει στα χρήματά μου όταν αγοράζω ένα εισιτήριο;

Funds used to purchase tickets are locked until the ticket is selected to vote or it expires. They are unable to leave your wallet and will appear in the "lockedbytickets" section of your wallet.
If your ticket is selected to vote, you will be refunded the total amount paid for the ticket and given the PoS reward.

The only cost for using this system are the fees you set. The txfee will be charged for the transaction of your ticket across the network. The ticketfee will be charged for incorporation into the
ticket pool, and is paid to the PoW miners. If your ticket does not get mined, there is no charge as the transaction never made it onto the network.

In case your ticket isn't selected to vote after 40960 blocks (about 4 months), the system will revoke your ticket and the decred you paid for it (minus fees) will be transferred back into your wallet. 

---

#### 8. Ποιες είναι οι πιθανότητες του να ψηφίσει το εισιτήριό μου;

The PoS system in Decred uses a Poisson distribution to determine the chances of a ticket voting at any given time. Given the target pool size of 40960 tickets, any one ticket has a 50% chance to vote
within 28 days and a 99.5% chance to vote before expiry. Note that these values will change with the pool size.


---

#### 9. Τι είναι η ψηφοφορία Proof-of-Stake;

Because the block validation performed by the PoS system behaves like a voting system, it can be used to vote on other issues too.

When selected to validate a block, the tickets vote on whether or not to approve the previously mined block. This requires 3 out of 5 selected tickets to vote yes.

By adding another parameter to the ticket that doesn't interfere with the approval of the mined blocks, the system can track the amount of tickets using that parameter over a number of blocks. You can set this parameter in your wallet at any time before the ticket votes. 

For example, you could choose the color of your ticket to be either red or blue, set that option, and the system will count for the next 1000 blocks how many red tickets and how many blue tickets there are. Maybe there are 3000 red tickets, 1500 blue tickets, and 500 that didn't select a colour.

If you replace the red or blue option with a yes or no option, you have a voting system that can count votes over time. By using the PoS voting system anyone who holds DCR can vote on issues set in an agenda.

This voting system can be used for any governance issue. For Decred, the most prominent use will be to vote on hardforks, which are technical changes to the way the currency works. Some examples:

- Αυξήστε το μέγιστο μέγεθος block.
- Αλλάξτε τον αλγόριθμο που χρησιμοποιεί το PoS για να καθορίσετε την τιμή του εισιτηρίου.
- Vote on major new features for the currency (e.g. lightning network, enhanced privacy).
- Αλλάξτε τον αλγόριθμο PoW.
- Pretty much anything the community decides would be in the best interest of the currency.

Επί του παρόντος, αναπτύσσεται μια πλατφόρμα για να μπορέσει η κοινότητα να υποβάλει και να υποστηρίξει μια ατζέντα ψηφοφορίας.

---

#### 10. Τι είναι η ψηφοφορία για hardfork;

Όπως και οποιοδήποτε άλλο κρυπτονόμισμα, το Decred μπορεί κάποια στιγμή να χρειαστεί hardfork.

One of the agenda issues set for the PoS voting system could be a hardfork. If such an issue is set, the new version of the Decred source code will include the hardfork in it, but the hard fork will not activate until the PoS system has voted on it.

Για να ξεκινήσει μια ψηφοφορία για hardfork, θα πρέπει να πληρούνται δύο κρίσιμες προϋποθέσεις:

- First, 75% of the PoW miners have to upgrade to the latest version of the current network block version. This check runs over the past 1000 blocks.
- Second, 75% of the PoS miners have to upgrade to the latest version. This check runs over the past 2016 blocks.

Once these checks are met, the voting process begins. Tickets can be set with an additional parameter of yes/no/abstain. You do this in your wallet before the ticket votes. Tickets marked as abstain will not be counted in the total amount of votes.

The PoS system then starts counting tickets with these parameters set over a predetermined amount of blocks. If over this interval the amount of ‘yes’ votes is 75% or more, the vote has passed. A lock in period of a set number of blocks will start before the hardfork goes live, so everyone has a chance to upgrade and not be hardforked off the network.

Because the code for the hardfork is already in the then current version of Decred there is no need for the developers to interfere or the majority of PoW miners and PoS miners to upgrade after a decision has been reached. If the vote on a hardfork passes it will be implemented automatically after the lock in period.

The hardfork vote can fail at multiple points. The vote might not start at all if the PoW miners or PoS miners do not upgrade. After that, the threshold of 75% votes might not be reached.

In case a vote fails a new round will start at the beginning of the process. This means checking whether the PoW miners have upgraded, if the PoS miners have upgraded, and then another vote counting period. This will continue for a certain amount of rounds, after which, if the vote hasn't passed, the agenda issue will be tabled.

---

#### 11. Is PoS susceptible to large exchanges using their customers’ decred? 

The number of decred a person (or exchange) has means nothing to PoS. It's the number of tickets you have. Funds used to purchase tickets are locked until the ticket they purchased votes. This means that
decred involved in PoS are effectively nontransferable. For an exchange to use their customers’ decred for voting, they would have to transfer them out of the wallets and lock them for up to 5 months. People
would notice their balances change (decred locked in PoS will not show as spendable) and they would not be able to withdraw any funds so the exchange would suffer a large loss of liquidity.

Further there is a hard limit of 20 tickets added per block so no exchange could flood the pool faster than this.

Finally, there's a soft cap on the total number of tickets in the pool. Every 144 blocks (2880 tickets) the ticket price is adjusted based on the number of tickets in the pool and the rate that new tickets
were added in the last window. Eventually the ticket price would be so high that even an exchange wouldn't be able to buy many tickets. And remember that even if they did that their DCR are locked so they
can't buy more when the price drops again.

---

#### 12. Is PoS susceptible to influence from large balance holders such as the original developers? 

The pool size limits above apply here. This stops one person/group flooding the PoS pool with large numbers of their own tickets. Even if they bought up the whole pool (with huge fees) the most they would
likely get is about 4000 tickets (based on previous ticket windows where the ones around 30DCR usually go up to 100 for the next window, and the max for the one after that is often over 300). So a large
balance holder could probably buy 2 windows out. A window at 30 would be 86,400DCR then the next at 100 would be 288,000DCR. So it would cost 374,400DCR to buy 5760 tickets. With a target pool size of 40960 tickets, 374400 DCR would give you about 14% of all tickets.

Now the holder could wait a couple of days for the price to drop then start buying back up again. Except that most of their funds will be locked in the ones they bought earlier (although some will have voted) so their buying power for the new window is greatly reduced. But let's say they have super capital and bought all the decred on all exchanges. So they are able to buy another two windows and replace those tickets that voted and were successful in buying all the tickets (at very high fees and/or prices). Let's say that takes them to about 25% of the tickets.

Tickets for a block are chosen with a random distribution. To force a vote to go a certain way you would need 3 out of 5 votes for a given block which is 60%. Even with that huge expenditure of capital,
they are less than half way there. And a vote isn't decided on a single block so you would need 60% of 75% of blocks in the voting period.

And THEN you still need the PoW miners to confirm the votes. If they think someone is trying to game the system, they can choose to invalidate blocks.

Ουσιαστικά αυτό είναι σχεδόν αδύνατο, ακόμα κι αν ένα άτομο έχει ένα τεράστιο ποσοστό από DCR.

But then we come to the stake pools. Stake pools, while not having access to any of their users' funds, do have the ability to change votes on tickets assigned to them. This is why it is suggested that when joining a stake pool, people don't just go for the largest one. Decred is short for 'decentralised credit' so part of the spirit of PoS is ensuring that the PoS stake pools don't get too large in relation to the others. However, even the largest at almost 20% would still only get on average one vote per block.

So Decred was specifically designed to minimise impact from both large PoW and PoS pools as well as individuals (including developers) with large holdings. 

## <i class="fa fa-book"></i> Σύνδεσμοι 

[^1]: [Οδηγός Αγοράς Εισιτηρίων με το Paymetheus](/getting-started/user-guides/using-paymetheus.md#-purchase-tickets-tab)
