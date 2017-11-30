# Blockchain Parameters

---

## Blockchain parameters

Parameter               | Value        | Description
---                     | ---          | ---
Initial block reward    | 31.1958      | This was the initial reward for mining a block.
Block reward multiplier | 100/101      | The block reward is multiplied by this whenever the block price changes. Basically what that means is that every reward cycle (see below) the block reward given for mining a block is reduced by approximately 1%.
Block reward change     | 6,144 blocks | The number of blocks between block reward changes. This occurs approximately every 3 weeks. Decred uses a more frequent change cycle (about 3 weeks compared to Bitcoins 4 years), but the magnitude of the change is much less (about 1% per cycle whereas Bitcoin is 50%). This is designed to reduce the shock in markets when a change occurs.
Block reward share      | 60/30/10     | The reward for a block is split between miners and the Decred development team as follows: PoW miners get 60% of the reward to reimburse them for electricity and hardware expenses. PoS miners get 6% of the reward each (30% for 5 votes) <what happens if less than 5 vote?>. This encourages people to hold their coins and invest in the Decred network. The development team receives 10% to help ensure the future of Decred by funding ongoing development.

---

## PoS network parameters

Parameter               | Value              | Description
---                     | ---                | ---
`MinimumStakeDiff`      | 2                  | The minimum price for a stake ticket.
`TicketPoolSize`        | 8,192              | This is multiplied by TicketsPerBlock to get the desired voting pool size (40,960).
`TicketsPerBlock`       | 5                  | This many tickets will be chosen to vote each block.
`TicketMaturity`        | 256                | Time in blocks (about a day) until a ticket is able to vote after being purchased.
`TicketExpiry`          | 40,960             | Tickets that haven't voted after this many blocks will be revoked (about 142 days).
`CoinbaseMaturity`      | 256                | Historic. Before this block coins could not be transferred.
`SStxChangeMaturity`    | 1                  | After voting, this many blocks must pass for stake and reward to return to PoS miners.
`TicketPoolSizeWeight`  | 4                  | Tickets will not change price up or down by more than this multiplier in one update.
`StakeDiffAlpha`        | 1                  | This is the stake difficulty EMA calculation alpha (smoothing) value. It is different from a normal EMA alpha. Closer to 1 --> smoother.
`StakeDiffWindowSize`   | 144                | The number of blocks in a window. Averaged per window, used below.
`StakeDiffWindows`      | 20                 | An exponential moving average over this many windows is used to calculate stake cost.
`MaxFreshStakePerBlock` | 20                 | This many new tickets will be added from the mempool to the voting pool each block.
`StakeEnabledHeight`    | 256 + 256          | Historic. This is the height in which the first ticket could possibly mature. Since coins were locked until block 256, no tickets could be purchased until then. After that, there was another 256 blocks before they matured.
`StakeValidationHeight` | 4,096              | Historic. Stake mining did not occur before this block.
`StakeBaseSigScript`    | []byte{0x00, 0x00} | This is the consensus stakebase signature script for all votes on the network. This isn't signed in any way, so without forcing it to be this value, miners/daemons could freely change it. Ensures the block is on the right network.
