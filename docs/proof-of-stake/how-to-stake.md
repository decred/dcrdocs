# ![](../img/dcr-icons/QuestionTicket.svg){ .dcr-icon } How to Stake/Vote

---

Participating in Decred’s Proof-of-Stake system requires the use of an
always-online voting wallet.
This wallet must remain online and unlocked 24/7, ready to sign vote
transactions immediately when tickets are selected to vote on a block.

Advanced users with some sysadmin skills may choose to run their own voting wallet.
This is known as [Solo voting](#solo-pos-voting).

Beginners, or those who are unable or unwilling to maintain an always-online voting
wallet can instead choose to use a [Voting Service Provider (VSP)](#voting-service-providers).

---

## ![](../img/dcr-icons/Solo.svg){ .dcr-icon } Solo PoS Voting

Solo PoS voting is only recommended for advanced users.

* Using the command line tools is required, it is not possible using Decrediton.
* You must ensure your voting wallet is online and unlocked 24/7.
* Downtime on the voting wallet can result in missed votes and lost voting rewards.
* You must feel confident in your ability to keep your voting hardware secure.

Reasons to solo vote include contributing to the decentralization of the Decred
network, retaining full control of your funds and wallet, increased privacy, and
avoiding VSP fees.

The [Buying Tickets with dcrwallet](../wallets/cli/dcrwallet-tickets.md) guide
explains how to set up a voting wallet and buy tickets using `dcrwallet`.

---

## ![](../img/dcr-icons/Servers.svg){ .dcr-icon } Voting Service Providers

Voting Service Providers (VSPs) maintain a pool of voting wallets and allow
users to add their tickets to those wallets in exchange for a small fee.

* VSPs are completely non-custodial - they never have access to any of their
  user’s funds - the user is only delegating the rights to vote their tickets to
  the VSP.
* It's easy to purchase tickets with a VSP inside of Decrediton.
* Your wallet doesn't need to stay online since the VSP's wallets are always
  online on your behalf. Not only is this convenient, but it's also more secure
  for you to keep your wallet offline when not in use.
* VSPs rarely miss votes because they're a pool of wallets, usually in multiple
  physical locations. If you chose to try solo-voting with a single wallet, and
  if your internet/power was unreliable, there's a greater risk of missing votes
  and voting rewards.

A list of VSPs and statistics is maintained on the [decred.org website](https://decred.org/vsp/).

In order to support network decentralization, it is recommended that you join a smaller VSP with fewer live tickets. As VSPs control tickets delegated to them, they could in theory vote those tickets in a way which contradicts the expressed wishes of the ticket owners. This could be easily detected, and any VSP which attempted it would likely be abandoned by the stakeholder community. However, it is good practice to limit the power of individual VSPs, to limit the potential for damage from this kind of attack.

Unlike Proof-of-Work (PoW) mining pools, VSPs do not pool work or rewards. The number of tickets a VSP has does not affect how regularly one's tickets will be called and rewards received. 

All VSPs run the same basic code, but they may differ in the amount of redundancy available.
More redundancy equals less chance of missed votes, although all VSPs will have some missed votes as many missed votes are caused by PoW miners. This is because sometimes miners will find a solution to the next block so quickly that votes haven't had time to propagate around the network.

PoS voting using a VSP can be done using Decrediton or dcrwallet.

- `Decrediton` - GUI wallet for Windows/macOS/Linux. The [Staking menu, Purchase tab](../wallets/decrediton/using-decrediton.md#staking) is used to buy tickets.
- `dcrwallet` - CLI wallet for Windows/macOS/Linux. The [Buying Tickets with dcrwallet](../wallets/cli/dcrwallet-tickets.md) guide explains how to purchase tickets via command line.
