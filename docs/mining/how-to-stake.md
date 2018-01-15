# <img class="dcr-icon" src="/img/dcr-icons/QuestionTicket.svg" /> How to Stake

Last updated for v1.1.0

---

## How to Stake

Participating in proof-of-stake requires a Decred wallet to be running 24/7. The wallet needs to be always online so that it can be called to vote - if the wallet is unavailable then the votes will be missed and no block reward will be received.

Running your own always-online wallet is known as "Solo" staking/mining.

Stakepools are available for those unable to keep a personal voting wallet online. Using a Stakepool is completely safe, the Decred PoS protocol allows you to delegate your vote to a stakepool's always-online wallet without ever giving the Stakepool access to your funds.

---

## <img class="dcr-icon" src="/img/dcr-icons/Solo.svg" /> Solo PoS

Solo mining is currently only possible using the Decred command line tools. The [Buying Tickets with dcrwallet](/getting-started/user-guides/dcrwallet-tickets.md) guide explains how to buy tickets using the CLI wallet `dcrwallet`.

---

## <img class="dcr-icon" src="/img/dcr-icons/Pool.svg" /> PoS using a Stakepool

Official stake pools are listed here:

* [<i class="fa fa-external-link-square"></i> https://dcr.stakepool.net](https://dcr.stakepool.net)
* [<i class="fa fa-external-link-square"></i> https://dcr.stakeminer.com](https://dcr.stakeminer.com)
* [<i class="fa fa-external-link-square"></i> https://pool.d3c.red](https://pool.d3c.red)
* [<i class="fa fa-external-link-square"></i> https://stakepool.dcrstats.com](https://stakepool.dcrstats.com)
* [<i class="fa fa-external-link-square"></i> https://stake.decredbrasil.com](https://stake.decredbrasil.com)
* [<i class="fa fa-external-link-square"></i> https://stakepool.eu](https://stakepool.eu)
* [<i class="fa fa-external-link-square"></i> https://dcr.ubiqsmart.com](https://dcr.ubiqsmart.com)
* [<i class="fa fa-external-link-square"></i> https://ultrapool.eu](https://ultrapool.eu)

You can find a comparison of each pool's fees and statistics by visiting the
[<i class="fa fa-external-link-square"></i> Decred website](https://decred.org)
and clicking the 'Stakepools' link within the footer at the bottom of the page.
 
Using a Stakepool DOES NOT give the pool access to your funds. All you are doing is granting voting rights to the pool.

All stake pools run the same basic code, but they may differ in the amount of redundancy available.
More redundancy equals less chance of missed votes (although all pools will have missed votes
as many missed votes are caused by PoW miners (sometimes they will find a solution to the blocks
so quickly that votes haven't had time to propagate around the network). In order to support network decentralization
it is recommended that you join a smaller pool with fewer live tickets.

There are currently three wallets which support Stakepool voting:

- `Decrediton` - cross-platform GUI wallet for Windows/macOS/Linux. The [Purchase Tickets tab](/getting-started/user-guides/using-decrediton.md#tickets) is used to buy tickets.

- `Paymetheus` - GUI wallet for Windows only. Visit the [Purchase Tickets tab guide](/getting-started/user-guides/using-paymetheus.md#purchase-tickets-tab) to learn how to buy tickets using Paymetheus.

- `dcrwallet` - CLI wallet for Windows/macOS/Linux. The [Buying Tickets with dcrwallet](/getting-started/user-guides/dcrwallet-tickets.md) guide explains how to purchase tickets via command line.
