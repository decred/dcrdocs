# Voting Tickets 

---

#### 1. When did proof-of-stake voting start? 

Proof-of-stake voting began[^7969] at block 4,096.

---

#### 2. In the source code TicketPoolSize is set to 8,192, but the current ticket pool size is larger than that. Why? 

It is intentional and is an integral part of the dynamic ticket price adjustment[^8965]. The `TicketPoolSize` is the target ticket pool size and it works very similar to the target difficulty for proof-of-work (PoW). The fact the current ticket pool size is larger than the target is what causes the ticket price to rise which in turn will eventually cause less tickets to be purchased and result in the number of tickets in the pool reducing back towards the target. If it falls under, the price will fall to encourage more ticket sales in order to increase the number of tickets in the pool towards the target.

---

#### 3. If I am unlucky and my ticket expires without voting, do I lose the transaction fee? 

Yes[^9806].

---

#### 4. Voting on mainnet was on 'hold' up until block 4,096, with people buying tickets. Does this mean there will be a significantly higher risk for these tickets to expire? 

No[^9806], the expiration time does not start until a ticket is actually mined into a block. The tickets were just sitting in the memory pool until they could be included in blocks starting with block 4,096.

---

#### 5. What happens if none (or less than 3) of the selected voters issue their ssgen transactions? 

Votes are always determined by the current tip. Miners do not start mining for a new block until at least 3+ of the selected voters issue their ssgen transactions. So, if a found block does not manage to get the selected votes[^10219], the block is simply orphaned by the next block another miner finds.

For a more concrete example, assume the current chain tip is at block 5,000. The voters determined by block 5,000 have already submitted their votes, so miners are chugging away looking for block 5,001. Now, a miner finds a solution for block 5,001 and submits it to the network. All of the daemons (and hence wallets) will see that 5,001 just showed up. However, the miners do not immediately start mining off of 5,001. Instead they continue mining off of 5,000 until 3+ votes for block 5,001 show up. At that point they all switch and start mining off of 5,001. If those 3+ votes never show up, another candidate block 5,001 will be found by the other miners still working on block 5,000 who will submit their (different) solution for block 5,001 to the network. Since each of these new candidate blocks for 5,001 have a different hash, different tickets are selected.

---

#### 6. What happens if a ticket I have missed a vote? 

Your wallet will automatically revoke the ticket in the block after it is missed[^13912], so you get them back just after they were missed as immature funds (that means they will not be spendable for 256 blocks when they mature).

For example:

```no-highlight
dcrctl --wallet getstakeinfo
```

Output          | Description
---             |---
`allmempooltix` | All of the stake tickets in the memory pool (waiting to be mined into a block).
`ownmempooltix` | Your stake tickets in the memory pool (waiting to be mined into a block).

---

#### 7. What is the difference between a missed and revoked ticket? 

Missed tickets are tickets that were called to vote, but did not. After a ticket has been missed, it can be revoked[^14763]. The wallet automatically revokes missed tickets it controls (assuming it is unlocked so it can sign the revocation transaction).

All `rebroadcastmissed` does is tell the wallet to ask the network daemon (`dcrd`) to give it the list of missed tickets again to double check if any need to be revoked. Typically this is not needed unless, for example, an attempt to revoke a ticket was made but failed because the wallet was locked. In other words, if you notice that revoked does not equal missed, you might need to `rebroadcastmissed`. As said though, there is rarely a need for this since the wallet automatically does it on startup and looks for missed tickets on every block.

Continue to [Proof-of-Work Mining](/mining/proof-of-work.md)

---

## <i class="fa fa-book"></i> Sources 

[^7969]: Decred Forum, [Post 7,969](https://forum.decred.org/threads/531/#post-7969)
[^8965]: Decred Forum, [Post 8,965](https://forum.decred.org/threads/531/page-2#post-8965)
[^9806]: Decred Forum, [Post 9,806](https://forum.decred.org/threads/180/page-6#post-9806)
[^10219]: Decred Forum, [Post 10,219](https://forum.decred.org/threads/180/page-6#post-10219)
[^13912]: Decred Forum, [Post 13,912](https://forum.decred.org/threads/1271/#post-13912)
[^14763]: Decred Forum, [Post 14,763](https://forum.decred.org/threads/1335/#post-14763)
