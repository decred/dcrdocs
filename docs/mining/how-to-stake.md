# <img class="dcr-icon" src="/img/dcr-icons/QuestionTicket.svg" /> How to Stake

Last updated for v1.1.3

---

## How to Stake

Staking in Decred is two part process:

- Buy ticket with DCR (locks up DCR until the ticket is called upon)
- Vote the ticket once called upon and collect the staking reward. (returns original DCR)

Buying tickets must happen from a device you control with your wallet's private keys present. This step can happen at your leisure. There is no time pressure to buy tickets.

Voting when called upon, the essential part of participating in proof-of-stake consensus, requires a Decred wallet to be running 24/7. This can be done either by you or outsourced to a pool for a small fee. The wallet needs to be always online so that it can be called to vote - if the wallet is unavailable then the votes will be missed and no block reward will be received.

Running your own always-online wallet is known as "Solo" staking/mining.

Stakepools are available for those unable to keep a personal voting wallet online. Using a stakepool is completely safe, the Decred PoS protocol allows you to delegate your vote to a stakepool's always-online wallet without ever giving the stakepool access to your funds.

---

## <img class="dcr-icon" src="/img/dcr-icons/Solo.svg" /> Solo PoS

Solo mining is currently only possible using the Decred command line tools. The [Buying Tickets with dcrwallet](/getting-started/user-guides/dcrwallet-tickets.md) guide explains how to buy tickets using the CLI wallet `dcrwallet`.

---

## <img class="dcr-icon" src="/img/dcr-icons/Pool.svg" /> PoS using a Stakepool

You can find the list of all official stakepools and statistics by visiting the
[<i class="fa fa-external-link-square"></i> Decred website](https://decred.org/stakepools/).

Using a stakepool DOES NOT give the pool access to your funds. All you are doing is granting voting rights to the pool.

In order to support network decentralization, it is recommended that you join a smaller pool with fewer live tickets.

All stakepools run the same basic code, but they may differ in the amount of redundancy available.
More redundancy equals less chance of missed votes, although all pools will have missed votes as many missed votes are caused by PoW miners.
Sometimes they will find a solution to the blocks so quickly that votes haven't had time to propagate around the network.

There are currently two wallets which support stakepool voting:

- `Decrediton` - GUI wallet for Windows/macOS/Linux. The [Purchase Tickets tab](/getting-started/user-guides/using-decrediton.md#tickets) is used to buy tickets.
- `dcrwallet` - CLI wallet for Windows/macOS/Linux. The [Buying Tickets with dcrwallet](/getting-started/user-guides/dcrwallet-tickets.md) guide explains how to purchase tickets via command line.
