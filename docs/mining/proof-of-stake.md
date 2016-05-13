# ** Proof-of-stake (PoS) Mining**

---

## ** Solo Mining or Pool Mining **

> <i class="fa fa-male"></i> Solo Mining

<i class="fa fa-exclamation-triangle"></i> In order to successfully participate in PoS, you need to ensure that your wallet is online 24/7. This is because your ticket may be called on to vote at any time and if your wallet is unable to respond you will lose the vote reward.  The amount of your ticket purchase will be returned to you, however, ticket purchase fees will not be returned.

> <i class="fa fa-users"></i> Pool Mining

Using a stake pool is beneficial because the servers are geographically distributed and redundant which vastly increases the odds that your vote will always be cast even in the event of a network or server outage.  However, stake pools charge a fee in order to pay for server costs.

---

## **<i class="fa fa-ticket"></i> Purchasing tickets**

To participate in PoS mining, you will first need to have followed the [Getting Started](/getting-started/overview.md) guide, [Obtain DCR](/getting-started/obtaining-dcr.md) guide, and have unlocked your wallet. 

> Sign up at a stake pool (Pool Mining)

<i class="fa fa-times"></i>** Coming Soon ** No public stake pools have launched at this time. An announcement will be made when they are available and this documentation will be updated. You may track progress on the [<i class="fa fa-comments"></i> stake pool forum thread](https://forum.decred.org/threads/rfp-6-setup-and-operate-10-stake-pools.1361/).

> Manual ticket purchasing (Overview)

First, obtain the current ticket price by visiting a site such as [dcrstats.com](https://dcrstats.com), [stats.decred.org](https://stats.decred.org), or see the difficulty field from the following dcrctl command:

```no-highlight
dcrctl --wallet getstakeinfo
{
  "poolsize": 42670,
  "difficulty": 22.07045882,
  "allmempooltix": 0,
  "ownmempooltix": 0,
  "immature": 0,
  "live": 0,
  "proportionlive": 0,
  "voted": 0,
  "totalsubsidy": 0,
  "missed": 0,
  "proportionmissed": 0,
  "revoked": 0
}
```

Now purchase your ticket(s) via dcrctl.  The syntax for the command is:

```no-highlight
dcrctl --wallet help purchaseticket
purchaseticket "fromaccount" spendlimit (minconf=1 "ticketaddress" numtickets "pooladdress" poolfees expiry "comment")

Purchase ticket using available funds.

Arguments:
1. fromaccount   (string, required)             The account to use for purchase (default="default")
2. spendlimit    (numeric, required)            Limit on the amount to spend on ticket
3. minconf       (numeric, optional, default=1) Minimum number of block confirmations required
4. ticketaddress (string, optional)             Override the ticket address to which voting rights are given
5. numtickets    (numeric, optional)            The number of tickets to purchase
6. pooladdress   (string, optional)             The address to pay stake pool fees to
7. poolfees      (numeric, optional)            The amount of fees to pay to the stake pool
8. expiry        (numeric, optional)            Height at which the purchase tickets expire
9. comment       (string, optional)             Unused

Result:
"value" (string) Hash of the resulting ticket
```

> Manual ticket purchasing example (Solo Mining)

```no-highlight
dcrctl --wallet purchaseticket "default" 23 1 "" 1 "" 0.0 1000
```

This purchases one ticket from the default account for a maximum of 23 DCR that expires at block 1000.

> Manual ticket purchasing (Pool Mining)

Every stake pool provides their own instructions which are correct for usage of that specific pool so this information will not be duplicated here.

> Automatic ticket purchasing (Solo Mining)

<i class="fa fa-exclamation-triangle"></i> **Automatic ticket purchasing is not recommended because it may incur transaction fees beyond your control!**

Automatic ticket purchasing can be enabled by adding the relevant configuration options to dcrwallet's configuration file.  See [dcrwallet.conf configuration](/advanced/storing-login-details.md#dcrwallet).

```no-highlight
; Always keep this amount of DCR in the wallet.
balancetomaintain=10
; Enable ticket purchasing and voting.
enablestakemining=1
; Prompt for a password on startup to ensure the wallet is unlocked immediately.
promptpass=1
; Maximum amount to spend on a ticket.
ticketmaxprice=10
```

> Post ticket purchase information

* The ticket price is not spent, although it is removed from your balance as it is not spendable. It is just a deposit. You will get it back when your ticket votes, expires, or is revoked due to not voting.
* 20 tickets are accepted into the voting pool each block. Tickets that are waiting stay in the mempool. Tickets are moved from the mempool to the voting pool in order of txfee.
* Tickets take 256 blocks (about a day) to mature. During this time the stake price you paid will not be visible in your total balance.
* You can keep track of your tickets' status by periodically running:
```no-highlight
dcrctl --wallet getstakeinfo
```

---

## ** <i class="fa fa-code-fork"></i> Considerations and Future Improvements **

This is in no way a definitive guide. There are user defined ticketfee and txfee variables which will help entice proof-of-work (PoW) miners to include your ticket in the ticket pool in front of lower fee purchases. Ticket purchasing has become increasingly competitive since this documentation was started.  A new ticket purchasing tool called [<i class="fa fa-github"></i> dcrticketbuyer](https://github.com/cjepson/dcrticketbuyer) is being developed to help alleviate some of the complexity of buying tickets.

---

## ** <i class="fa fa-book"></i> See also **

[Proof-of-stake Commands](/advanced/program-options.md#pos-commands)

[Proof-of-stake FAQ - Buying Tickets and Fees](/faq/proof-of-stake/buying-tickets-and-fees.md)

[Proof-of-stake FAQ - Solo Mining](/faq/proof-of-stake/solo-mining.md)

[Proof-of-stake FAQ - Stake Pools](/faq/proof-of-stake/stake-pools.md)

[Proof-of-stake FAQ - Voting Tickets](/faq/proof-of-stake/voting-tickets.md)

[Proof-of-stake Mining Parameters](/advanced/program-options.md#pos-network-parameters)

[Wiki - Solo Stake Mining](https://wiki.decred.org/Solo_Stake_Mining)
