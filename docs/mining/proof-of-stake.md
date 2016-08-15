# ** Proof-of-stake (PoS) Mining**

---

## ** Overview **

This document explains the process by which one purchases a ticket with DCR by
sending an SStx transaction.  If the transaction is successfully mined, it will
then go through a 256 block maturation period.  Once mature, the ticket will be
randomly selected to vote on PoW blocks as covered by the
[general mining overview](/mining/overview.md#2-proof-of-stake-pos-mining).

---

## ** Prerequisites **

To take part in PoS mining, you will first need to have followed the
[Getting Started](/getting-started/overview.md) guide and completed the
"connect your wallet to the network" step
([<i class="fa fa-windows"></i> Windows](/getting-started/user-guides/windows.md#connect-your-wallet-to-the-decred-network)
[<i class="fa fa-apple"></i> OSX](/getting-started/user-guides/osx.md#connect-your-wallet-to-the-decred-network) 
[<i class="fa fa-linux"></i> Linux](/getting-started/user-guides/osx.md#connect-your-wallet-to-the-decred-network))
including unlocking your wallet.

You will also need to [Obtain DCR](/getting-started/obtaining-dcr.md) if you have not done so already.

---

## ** Solo Mining or Pool Mining **

> <i class="fa fa-male"></i> Solo Mining

<i class="fa fa-exclamation-triangle"></i> **In order to successfully
take part in PoS, you need to make sure that your wallet is online 24/7. This
is because your ticket may be called on to vote at any time and if your wallet
is unable to respond you will lose the vote reward.  The amount of your ticket
purchase will be returned minus transaction fees.**

> <i class="fa fa-users"></i> Pool Mining

Using a stake pool is beneficial because the servers are geographically
distributed and redundant which vastly increases the odds that your vote
will always be cast even if a network or server outage occurs.
The stake pools charge a fee to pay for server costs and system
administration labor.

---

## **<i class="fa fa-life-ring"></i> Sign up for a stake pool**

These stake pools are officially recognized:

* [<i class="fa fa-external-link-square"></i> https://dcr.stakepool.net](https://dcr.stakepool.net)
* [<i class="fa fa-external-link-square"></i> https://decredstakepool.com](https://decredstakepool.com)
* [<i class="fa fa-external-link-square"></i> https://dcr.stakeminer.com](https://dcr.stakeminer.com)
* [<i class="fa fa-external-link-square"></i> http://pool.d3c.red](http://pool.d3c.red)
* [<i class="fa fa-external-link-square"></i> https://dcrstakes.com](https://dcrstakes.com)
* [<i class="fa fa-external-link-square"></i> https://stakepool.dcrstats.com](https://stakepool.dcrstats.com)
* [<i class="fa fa-external-link-square"></i> https://stake.decredbrasil.com](https://stake.decredbrasil.com)
* [<i class="fa fa-external-link-square"></i> http://stakepool.eu](http://stakepool.eu)
* [<i class="fa fa-external-link-square"></i> http://dcrstakepool.getjumbucks.com](http://dcrstakepool.getjumbucks.com)

You can find a comparison of each pool's fees and statistics by visiting the
[<i class="fa fa-external-link-square"></i> Decred website](https://decred.org)
and clicking the 'Find a stake pool' link at the top right.

Each pool runs the same software which will walk you through the ticket buying
process. The instructions are also below so you may view them without signing
up for a pool.

---

## **<i class="fa fa-ticket"></i> Automatic Purchasing Of Tickets**

[<i class="fa fa-github"></i> dcrticketbuyer](https://github.com/decred/dcrticketbuyer)
is a highly configurable utility for purchasing tickets.  The GitHub project
page
[<i class="fa fa-external-link-square"></i>https://github.com/decred/dcrticketbuyer](https://github.com/decred/dcrticketbuyer)
provides an overiew of the options and how to run it.

<i class="fa fa-exclamation-triangle"></i> ** It is highly recommended
to try dcrticketbuyer on testnet to make sure it's correctly configured and
behaves as expected before attempting to use it on mainnet. Once tickets are
purchased, the funds can be locked for months without any way to retrieve
them. **

> dcrticketbuyer (Solo Mining)

The bare minimum configuration is to provide the RPC access credentials for
dcrd and dcrwallet.  In this configuration, dcrticketbuyer will use all
available funds to purchase tickets at an average price that is calculated
by examining historic prices.

```no-highlight
dcrduser=<dcrd RPC Username>
dcrdpass=<dcrd RPC Password>
dcrwuser=<dcrwallet RPC Username>
dcrwpass=<dcrwallet RPC Password>
```

> dcrticketbuyer (Pool Mining)

Purchasing tickets and delegating the voting rights to a stake pool requires
the following stake pool-specific configuration options.  The values to use
may be found in the instructions portion of the Tickets page that is present
on any of the official stake pools.

```no-highlight
pooladdress=DsExamplePaymentAddr
poolfees=7.5
ticketaddress=DcExampleTicketAddr
```

> dcrwallet

<i class="fa fa-thumbs-down"></i> **This method of using dcrwallet to
purchase tickets automatically has been deprecated and is not recommended.**

<i class="fa fa-exclamation-triangle"></i> **Automatic ticket purchasing built-in to dcrwallet can incur transaction fees beyond your control!**

Automatic ticket purchasing can be enabled by adding the relevant configuration options to dcrwallet's configuration file.
See [dcrwallet.conf configuration](/advanced/storing-login-details.md#dcrwallet).

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

---

## **<i class="fa fa-ticket"></i> Manual Purchasing Of Tickets**

> Obtaining Ticket Price and Block Height

First, get the current ticket price from the **difficulty** field from **getstakeinfo**:

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

It is also helpful to get the **height** field from **getbestblock** so you may
use the ticket expiration functionality:

```no-highlight
dcrctl --wallet getblockheight
{
  "hash": "0000000000000d14cab9056131a0461778a7f8cd1066cb343307882bd730f2a9",
  "height": 35472
}
```

Getting this information directly is the most reliable and accurate but you may
also use websites such
as [<i class="fa fa-external-link-square"></i> stats.decred.org](https://stats.decred.org)
or [<i class="fa fa-external-link-square"></i> dcrstats.com](https://dcrstats.com).

> Purchaseticket Syntax

Now purchase your ticket(s) via dcrctl.  The full syntax for the command is:

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

> Manual Ticket Purchasing Example (Solo)

```no-highlight
dcrctl --wallet purchaseticket "default" 23 1 "" 1 "" 0.0 35482
```

This purchases one ticket from the default account for a maximum of 23 DCR that
expires at block 35482.

The command will return a ticket hash / transaction id if successful.

> dcrwallet Manual Ticket Purchasing Example (Pool)

The ticket purchasing part for a pool is much the same but there are some more
steps involved to allow both you and the pool to vote by creating a
multisignature script and P2SH address.

Once you sign up for a stake pool, you will be redirected to an address
submission page.

To join the pool, provide a public key address which can be used to generate a
1-of-2 multisignature script. The multisignature script will be generated by
the pool and returned to you along with a P2SH address to give voting rights to.
The P2SH address starts with **Dc** on mainnet.

It is recommended to generate a new account when joining a stake pool.  This is
because accounts are hardened so in the case of a total stake pool
failure/shutdown, it would be safe to give the private key to another stake pool
as long as that account only does voting and nothing else.

```no-highlight
dcrctl --wallet createnewaccount voting
```

To generate a public key address, create a new wallet address with **getnewaddress &lt;account&gt;**.
Then, call **validateaddress &lt;yourAddress&gt;** and retrieve the address listed in the
**pubkeyaddr** field of the response. It is prefixed with **Dk** on mainnet.

The following is an example for mainnet:

```no-highlight
dcrctl --wallet getnewaddress voting
DsExampleAddr1For2Demo3PurposesOnly
dcrctl --wallet validateaddress DsExampleAddr1For2Demo3PurposesOnly
{
  "isvalid": true,
  "address": "DsExampleAddr1For2Demo3PurposesOnly",
  "ismine": true,
  "pubkeyaddr": "DkExample0Addr1For2Demo4Purposes5Only6Do7Not8Use9Pls0",
  "pubkey": "022801337beefc0ffee1dab8d4ffa898a782466c9a1fc00ca8863de5438dc07dcc",
  "iscompressed": true,
  "account": "voting"
}
```

Copy and paste the **pubkeyaddr** into the stake pool's submit address form
and click the submit button.  Your multisig script and P2SH address will be
generated and you will be redirected to the tickets page.

Now simply follow the directions on the tickets page. First, import the
multisig script locally into your wallet using dcrctl for safe keeping,
so you can recover your funds and vote in the unlikely event of a pool
failure:

```no-highlight
dcrctl --wallet importscript <ReallyLongScriptDisplayedOnPoolPage>
```

Now **purchaseticket** with the stake pool-specific fields set:

```no-highlight
dcrctl --wallet purchaseticket "default" 23 1 DcExampleAddr1For2Demo3PurposesOnly 1 DsExampleAddr1For2Demo3PurposesOnly 7.5 35482
```

This purchases one ticket which is delegated to the P2SH address from the default
account for a maximum of 23 DCR that expires at block 35482 and pays a 7.5% fee
to the pool's payment address.

> Paymetheus Manual Ticket Purchasing Example (Pool)

<i class="fa fa-exclamation-triangle"></i> **The following example shows ticket purchasing on testnet and addresses will be encoded differently than on mainnet.**

Stake pools are also usable with Paymetheus by using its manual ticket
purchasing features.

To join the pool, provide a public key address which can be used to generate a
1-of-2 multisignature script. The multisignature script will be generated by
the pool and returned to you along with a P2SH address to give voting rights to.
The P2SH address starts with **Dc** on mainnet.

It is recommended to generate a new account when joining a stake pool.  This is
because accounts are hardened so in the case of a total stake pool
failure/shutdown, it would be safe to give the private key to another stake pool
as long as that account only does voting and nothing else.

![Creating voting account](../../img/Paymetheus-create-voting-account.png)

To generate a public key address, use the "Request Payment" view to generate a
new address for the voting account.  The pubkey address (below the shorter P2PKH
address) will be given to the pool.

![Generate pubkey address](../../img/Paymetheus-generate-pubkey-address.png)

<i class="fa fa-exclamation-triangle"></i> **On mainnet, the public key address will begin with the letters Dk.**

Copy and paste the public key address into the stake pool's submit address form
and click the submit button.  Your multisig script and P2SH address will be
generated and you will be redirected to the tickets page.

Next, import the pool's 1-of-2 multisignature script.  This allows the funds to
be recovered in case of pool failure.

![Importing a script](../../img/Paymetheus-import-script.png)

Finally, tickets can be purchased.  Select the "Using a pool?" checkbox and copy
the values from the pool.  When all fields are set and if there is enough input
value is available, the purchase button will become enabled and tickets may be
purchased.

![Purchasing tickets](../../img/Paymetheus-ticket-purchasing.png)

<i class="fa fa-exclamation-triangle"></i> **On mainnet, the ticket address will begin with the letters Dc and the pool address will begin with the letters Ds.**

---

## ** Post Purchase Information **

After a successful ticket purchase, you must wait to see whether or not the
transaction is mined and included in a block.  The main reason for your ticket
not being mined is that the ticket price adjusts before it can be mined.  This
can happen due to the mempool being full of competing ticket purchase
transactions or simply bad purchase timing.  You may use a site such as
[<i class="fa fa-external-link-square"></i> dcrstats.com](https://dcrstats.com)
to view when the next ticket price adjustment occurs.

Some other details to keep in mind are:

* The ticket price is not spent, although it is removed from your balance as it is not spendable. It is just a deposit. You will get it back when your ticket votes, expires, or is revoked due to not voting.
* 20 tickets are accepted into the voting pool each block. Tickets that are waiting stay in the mempool. Tickets are moved from the mempool to the voting pool in order of txfee.
* Tickets take 256 blocks (about a day) to mature. During this time the stake price you paid will not be visible in your total balance.
* You can keep track of your tickets' status by periodically running:

  ```no-highlight
  dcrctl --wallet getstakeinfo
  ```

  or by inspecting the Stake Mining tab in Paymetheus.

---

## ** <i class="fa fa-book"></i> See also **

[Proof-of-stake Commands](/advanced/program-options.md#pos-commands)

[Proof-of-stake FAQ - Buying Tickets and Fees](/faq/proof-of-stake/buying-tickets-and-fees.md)

[Proof-of-stake FAQ - Solo Mining](/faq/proof-of-stake/solo-mining.md)

[Proof-of-stake FAQ - Stake Pools](/faq/proof-of-stake/stake-pools.md)

[Proof-of-stake FAQ - Voting Tickets](/faq/proof-of-stake/voting-tickets.md)

[Proof-of-stake Mining Parameters](/advanced/program-options.md#pos-network-parameters)

[Wiki - Solo Stake Mining](https://wiki.decred.org/Solo_Stake_Mining)
