# **<i class="fa fa-info-circle"></i> Overview**

Decred has two methods of transaction verification proof-of-work (PoW) and
proof-of-stake (PoS).

---

## **1. <i class="fa fa-fire"></i> [Proof-of-work (PoW) Mining](proof-of-work.md)**

Proof-of-work mining, more commonly referred to as PoW mining, is the activity
of committing your computer’s hardware and resources to process network
transactions and build the blocks that make up the blockchain in the Decred
network. Each time a block is created (by a miner), about 30 new Decred coins
are made. These coins are then split up as follows:

Subsidy | Party
---     | ---
`60%`   | PoW Miners
`30%`   | PoS Voters
`10%`   | Decred development subsidy

You will, on average, receive a reward that is roughly proportional to the
hashrate of your miner and the overall hashrate of the network when you commit
your computer to PoW mining. To get started, you must have a computer with a
video card. Most video cards can be used for mining (including the "mobile"
types found in some laptops). In general, higher end video cards perform at
higher hashrates and therefore receive higher rewards.

---

## **2. <i class="fa fa-ticket"></i> [Proof-of-stake (PoS) Mining](proof-of-stake.md)**

Proof of Stake mining is the second method of block verification in Decred. It
is computationally cheap but it requires you to already have some DCR in your
wallet. In the Decred network, PoW miners solve blocks then turn those blocks
over to PoS miners to vote on them. When a block is completed, 5 tickets are
chosen at random from the stake pool to vote on the block. If at least 3 votes
are ‘Yes' then the block is validated, included in the block chain and both
PoW and PoS miners are paid. If the vote fails, the block is discarded and the
transactions return to be included in another block. The PoW miners are not
paid, however the PoS miners are.

This is to incentivize PoW miners to mine according to the wishes of PoS
miners. For example, if the rules of the network change in the future any
PoW miners who don't follow them will not be paid. It also helps stop large
mining pools getting too much influence over the network. In
cryptocurrencies that don't use PoS, the large groups of PoW miners who
effectively control the network can collude to block transactions, stop network
changes or even force faked transactions (although this would take a huge
amount of resources). Collusion between PoW and PoS miners is not possible as
tickets are not chosen until the time of the vote. Collusion between PoS miners
is likewise remote as the ticket pool is kept at around 40,960 active tickets
at any time. The chance of three tickets belonging to the same individual or
group being chosen for the same block is very small. Even if this did happen
every transaction is validated at least twice so the chance of anyone
manipulating the blockchain is effectively zero.
