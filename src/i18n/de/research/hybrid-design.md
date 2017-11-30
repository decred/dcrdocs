# Hybrid Design 

---

The major contrast to the follow-the-satoshi scheme previously described[^1] is a new lottery system in which tickets must be purchased and then wait on a maturity period before they can be selected and spent. Selection of tickets for a block is performed lexicographically from a mature ticket pool based on pseudorandomness contained in the block header. Because manipulation of this pseudorandomness is difficult in a PoW system, manipulation of ticket selection is associated with a fundamental cost to the PoW miner. The selection of tickets over a time period can be described by a probability density function similar to the probability of obtaining a block in PoW at a constant hash rate over time at a constant difficulty[^2], yielding a probability distribution with a mode approximately equal to half the ticket pool size. The price to purchase a ticket is regulated by a new stake difficulty that is determined by the exponentially weighted average number of tickets purchased and the size of the mature ticket pool in prior blocks.

The validation of PoW blocks is explained by the following steps:

1. A block is mined by a PoW miner, who selects the transactions to put inside it. Stake system related transactions are inserted into the UTXO set.
2. PoS miners vote on the block by producing a vote transaction from their ticket. The vote both enables a block to be built on top of the previous block and selects whether or not the previous regular transaction tree (containing the coinbase and non-stake related transactions) is valid.
3. Another PoW miner begins building a block, inserting the PoS miners' votes. A majority of the votes cast must be included in the following block for that block to be accepted by the network. Of the vote transactions in this new block, the PoW miner checks a flag to see if the PoS miner indicated if the block's regular transaction tree was valid. These voting flags are tallied and, based on majority vote, a bit flag is set in this block to indicate if the previous block's regular transaction tree is valid.
4. A nonce is found that satisfies the network difficulty, and the block is inserted into the blockchain. If the previous block's regular transaction tree was validated, insert these transactions into the UTXO set. Go to 1.

To discourage manipulation of the included votes, a linear subsidy penalty is applied to the current block if they fail to include all the voting transactions into their block. The "soft" penalty of invalidating the previous transaction tree helps prevent the discarding of work, which is necessary to secure the system, and makes the assumption that the next block will be obtained by a miner who is disinterested in preserving the subsidy of the former block in favour of their own. Even in the case that this is not true, a malicious miner with a high hash rate will still need at least \((\text{number for majority}/2)+1\) votes in favour of their previous block's transaction tree in order to produce a block that gives them any subsidy from the previous block.

Bit flags are explicitly added to both the block header and votes so that either miner can easily vote in new hard or soft forks.

---

## <i class="fa fa-book"></i> References 

[^1]: Bentov I., Lee C., Mizrahi A., Rosenfeld M. 2014. [Proof-of-activity: Extending Bitcoin's proof-of-work via proof-of-stake](https://decred.org/research/bentov2014.pdf).
[^2]: Nakamoto S. 2008. [Bitcoin: A peer-to-peer electronic cash system](https://decred.org/research/nakamoto2008.pdf).
