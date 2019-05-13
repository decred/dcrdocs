# <img class="dcr-icon" src="/img/dcr-icons/BuyTicket.svg" /> Buying Tickets and Fees

---

#### 1. Is there a way to see tickets purchased by a local wallet? 

Use the following command to show all of your tickets[^9987]:

```no-highlight
dcrctl --wallet gettickets true
```

---

#### 2. Do I pay a transaction fee for the ssgen transaction? 

No, ssgen transactions do not impose a fee[^10219] (unlike the original ticket purchase transactions which are competing for limited space in each block). They are effectively like proof-of-work coinbase transactions in this regard.

---

#### 3. How do I change the ticket fee? 

```no-highlight
dcrctl --wallet setticketfee <fee>
```

---

#### 4. How do I manually buy tickets? 

```no-highlight
dcrctl --wallet purchaseticket <fromaccount> <spendlimit> <minconf>
```

Where:

Option        | Explanation
---           | ---
`fromaccount` | Usually "default" (unless you have created a different one).
`spendlimit`  | Maximum number of DCR you want to spend on tickets.
`minconf`     | This can be set to 0.

---

#### 5. How should I set the ticketfee? 

The `ticketfee` (or ticket fee) determines the order in which mempool tickets enter the voting pool. Higher fees encourage proof-of-work miners to put your tickets at the front of the queue. If you set the fee higher than the average your tickets are more likely to be included in the next block. The default txfee is 0.0001 DCR. It would seem then that the best idea is to set your txfee high so you are at the front of the line. But that is not always a good idea. In fact, it is rarely a good idea simply because the mempool queue is very short or zero most of the time. Do not forget that the txfee will eat into your DCR profit as it is charged on every ticket and is non-refundable whether or not it votes.

Consider a constant ticket price of 10 DCR. Every block 20 tickets can move into the voting pool from the mempool. That is a value of 200 DCR. Every block generates about 30 DCR and returns 50DCR to the voters. 3 DCR is sent to the Decred Treasury to help fund the project so only 27 ends up in the hands of miners. This means that 77 DCR is freed up each block to go back into tickets, assuming that all returns are reinvested. That is less than half of what the block can handle. The only way more DCR can enter the mempool is by external investment (i.e., buying from an exchange) or from miners who have been saving their DCR waiting for the ticket price to drop.

In the case of a ticket price drop, a miner is looking to get into the pool before the price changes again. This happens every 144 blocks (about 12 hours). It does not matter if it is in the first block or the 100th. In 144 blocks 2,880 tickets will be accepted with a value of 28,800 DCR. There is not that sort of volume in the proof-of-stake network at this time. There is one scenario in which you might want to set your fee higher. If the stake cost is about to change in a few blocks, the mempool is not empty and you want to make sure you get the current price, it can help to set your fee a little higher than average to ensure you get in, especially if the next change will mean you miss a ticket.

Continue to [PoS Solo Mining FAQ](solo-voting.md)

---

## <img class="dcr-icon" src="/img/dcr-icons/Sources.svg" /> Sources 

[^9987]: Decred Forum, [Post 9,987](https://forum.decred.org/threads/582/page-2#post-9987)
[^10219]: Decred Forum, [Post 10,219](https://forum.decred.org/threads/180/page-6#post-10219)
