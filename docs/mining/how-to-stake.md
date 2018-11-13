# <img class="dcr-icon" src="/img/dcr-icons/QuestionTicket.svg" /> How to Stake/Vote

Last updated for v1.3.0

---

## How to Stake/Vote

Participating in proof-of-stake voting requires tickets to be controlled by a Decred wallet running 24/7. The wallet needs to be always online so that it can respond by signing the block when its tickets are called to vote - if the wallet is unavailable then the votes will be missed and no block reward will be received.

Running your own always-online wallet is known as **"Solo" Voting**.

**Voting Service Providers (VSPs)** (formerly "stakepools") are available for those unable to keep a personal voting wallet online. Using a VSP is completely safe, the Decred PoS protocol allows you to delegate your vote to a VSP's always-online wallet without ever giving the VSP access to your funds.

---

## <img class="dcr-icon" src="/img/dcr-icons/Solo.svg" /> Solo PoS Voting

Solo mining is currently only possible using the Decred command line tools. The [Buying Tickets with dcrwallet](../getting-started/user-guides/dcrwallet-tickets.md) guide explains how to buy tickets using the CLI wallet `dcrwallet`.

---

## <img class="dcr-icon" src="/img/dcr-icons/Pool.svg" /> PoS using a Voting Service Provider

A list of Voting Service Providers and statistics is maintained on the
[:fa-external-link-square: Decred.org website](https://decred.org/stakepools/).

Using a VSP **does not give the pool access to your funds**. All you are doing is granting voting rights to the VSP.

In order to support network decentralization, it is recommended that you join a smaller VSP with fewer live tickets. As VSPs control tickets delegated to them, they could in theory vote those tickets in a way which contradicts the expressed wishes of the ticket owners. This could be easily detected, and any VSP which attempted it would likely be abandoned by the stakeholder community. However, it is good practice to limit the power of individual VSPs, to limit the potential for damage from this kind of attack.

Unlike PoW mining pools, VSPs do not pool work or rewards. Using a VSP with many or few tickets does not affect how regularly one's tickets will be called and rewards received. 

All VSPs run the same basic code, but they may differ in the amount of redundancy available.
More redundancy equals less chance of missed votes, although all pools will have some missed votes as many missed votes are caused by PoW miners. Sometimes miners will find a solution to the next block so quickly that votes haven't had time to propagate around the network.

- `Decrediton` - GUI wallet for Windows/macOS/Linux. The [Tickets menu, Purchase tab](/getting-started/user-guides/using-decrediton.md#tickets) is used to buy tickets.
- `dcrwallet` - CLI wallet for Windows/macOS/Linux. The [Buying Tickets with dcrwallet](/getting-started/user-guides/dcrwallet-tickets.md) guide explains how to purchase tickets via command line.
