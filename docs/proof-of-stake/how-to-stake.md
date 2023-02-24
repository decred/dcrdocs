# ![](../img/dcr-icons/QuestionTicket.svg){ .dcr-icon } How to Stake/Vote

---

## How to Stake/Vote

There are two ways to stake/vote: solo staking and staking using a VSP. The former method is usually more appropriate for advanced users as it requires your wallet to be up 24/7. Running your own always-online wallet is known as **"Solo" Voting**.

**Voting Service Providers (VSPs)** (formerly "Stakepools") are available for those unable to keep a personal voting wallet online. Using a VSP is completely safe; the Decred PoS protocol allows you to delegate your vote to a VSP's always-online wallet without ever giving the VSP access to your funds.

---

## ![](../img/dcr-icons/Solo.svg){ .dcr-icon } Solo PoS Voting

Solo PoS voting is currently only possible using the Decred command line tools. The [Buying Tickets with dcrwallet](../wallets/cli/dcrwallet-tickets.md) guide explains how to buy tickets using the CLI wallet `dcrwallet`.

---

## ![](../img/dcr-icons/Servers.svg){ .dcr-icon } PoS using a Voting Service Provider (VSP)

A list of Voting Service Providers (VSPs) and statistics is maintained on the
[Decred.org website](https://decred.org/vsp/).

Using a VSP **does not give the VSP access to your funds**. All you are doing is granting voting rights to the VSP.

--8<-- "script-warning.md"

In order to support network decentralization, it is recommended that you join a smaller VSP with fewer live tickets. As VSPs control tickets delegated to them, they could in theory vote those tickets in a way which contradicts the expressed wishes of the ticket owners. This could be easily detected, and any VSP which attempted it would likely be abandoned by the stakeholder community. However, it is good practice to limit the power of individual VSPs, to limit the potential for damage from this kind of attack.

Unlike Proof-of-Work (PoW) mining pools, VSPs do not pool work or rewards. The number of tickets a VSP has does not affect how regularly one's tickets will be called and rewards received. 

All VSPs run the same basic code, but they may differ in the amount of redundancy available.
More redundancy equals less chance of missed votes, although all VSPs will have some missed votes as many missed votes are caused by PoW miners. This is because sometimes miners will find a solution to the next block so quickly that votes haven't had time to propagate around the network.

PoS voting using a VSP can be done using Decrediton or dcrwallet.

- `Decrediton` - GUI wallet for Windows/macOS/Linux. The [Tickets menu, Purchase tab](../wallets/decrediton/using-decrediton.md#tickets) is used to buy tickets.
- `dcrwallet` - CLI wallet for Windows/macOS/Linux. The [Buying Tickets with dcrwallet](../wallets/cli/dcrwallet-tickets.md) guide explains how to purchase tickets via command line.
