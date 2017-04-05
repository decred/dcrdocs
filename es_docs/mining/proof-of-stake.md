# ** Proof-of-Stake (PoS) Mining**

---

## ** Overview **

This document explains the process by which one purchases a ticket with DCR by
sending an SStx transaction.  If the transaction is successfully mined, it will
then go through a 256 block maturation period.  Once mature, the ticket will be
randomly selected to vote on PoW blocks as covered by the
[general mining overview](/mining/overview.md#2-proof-of-stake-pos-mining).

---

## ** Prerequisites **

- A running [dcrd](/getting-started/user-guides/dcrd-setup.md) Instance
- A running [dcrwallet](/getting-started/user-guides/dcrwallet-setup.md) Instance
- [dcrctl basics](/getting-started/user-guides/dcrctl-basics.md) such as unlocking your wallet.
- [Obtain some DCR](/getting-started/obtaining-dcr.md)

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

## **<i class="fa fa-life-ring"></i> Sign Up For a Stake Pool**

These stake pools are officially recognized:

* [<i class="fa fa-external-link-square"></i> https://dcr.stakepool.net](https://dcr.stakepool.net)
* [<i class="fa fa-external-link-square"></i> https://dcr.stakeminer.com](https://dcr.stakeminer.com)
* [<i class="fa fa-external-link-square"></i> https://pool.d3c.red](https://pool.d3c.red)
* [<i class="fa fa-external-link-square"></i> https://dcrstakes.com](https://dcrstakes.com)
* [<i class="fa fa-external-link-square"></i> https://stakepool.dcrstats.com](https://stakepool.dcrstats.com)
* [<i class="fa fa-external-link-square"></i> https://stake.decredbrasil.com](https://stake.decredbrasil.com)
* [<i class="fa fa-external-link-square"></i> https://stakepool.eu](https://stakepool.eu)
* [<i class="fa fa-external-link-square"></i> https://dcr.ubiqsmart.com](https://dcr.ubiqsmart.com)

You can find a comparison of each pool's fees and statistics by visiting the
[<i class="fa fa-external-link-square"></i> Decred website](https://decred.org)
and clicking the 'Stakepools' link within the footer.

Each pool runs the same software which will walk you through the ticket buying
process. The instructions are also below so you may view them without signing
up for a pool.

---

## **<i class="fa fa-ticket"></i> Automatic Purchasing Of Tickets**

You can set up dcrwallet to automatically purchase tickets on your behalf. We recommended you read
and understand the options available before using the feature as you may set your fees and ticket 
prices higher than desired.

All of these options can be specified on the command line or in dcrwallet.conf. Note that at
this time there is no way to change settings while dcrwallet is running. You will need to restart it to 
adjust your settings.

Parameter|Description|Default|Explanation
:----------:|:---------------------------:|:----------:|:---------------------------:
ticketbuyer.maxpricescale|Attempt to prevent the stake difficulty from going above this multiplier (>1.0) by manipulation, 0 to disable|2|If purchasing tickets at this price window would cause the next window to be higher than ```(price * multiplier)```, do not buy tickets. This may cause you not buy tickets when otherwise you could. Recommend to set to 0. This option has been deprecated and will be removed in a future version.
ticketbuyer.pricetarget|A target to try to seek setting the stake price to rather than meeting the average price, 0 to disable |0 DCR|Attempt to buy tickets in order to force the future price to '''pricetarget'''. Leave this at 0. This option has been deprecated and will be removed in a future version.
ticketbuyer.avgpricemode|The mode to use for calculating the average price if pricetarget is disabled (vwap, pool, dual) |vwap|!
ticketbuyer.avgpricevwapdelta|The number of blocks to use from the current block to calculate the VWAP |2880|!
ticketbuyer.maxfee|Maximum ticket fee per KB |0.1 DCR|Tickets are entered into the mempool in order of their fee per kilobyte. This sets the maximum fee you are willing to pay.
ticketbuyer.minfee|Minimum ticket fee per KB |0.01 DCR|The minimum fee per kilobyte you are willing to pay. This should probably be left at 0.01 unless you know what you're doing.
ticketbuyer.feesource|The fee source to use for ticket fee per KB (median or mean) |median|The fee chosen by the ticket buyer will be based off either the median (line all the fees up in order and choose the middle one) or the mean (also known as the average; add all the fees up and divide by 2). It's recommended to leave this at median as there have been instances of fee manipulation where people try to force up the average by buying one ticket with a very high fee.
ticketbuyer.maxperblock|Maximum tickets per block, with negative numbers indicating buy one ticket every 1-in-n blocks |5|Do not buy more than this number of tickets per block. A negative number means buy one ticket every n blocks. e.g. -2 would mean buy a ticket every second block.
ticketbuyer.blockstoavg|Number of blocks to average for fees calculation |11| Fees are calculated using this many previous blocks. You can usually leave this at the default.
ticketbuyer.feetargetscaling|Scaling factor for setting the ticket fee, multiplies by the average fee |1|The average fee is multipled by this number to give the fee to pay. DO NOT change this until you really know what you're doing. It could raise your fees very high. Remember, fees are non-refundable!
ticketbuyer.dontwaitfortickets|Don't wait until your last round of tickets have entered the blockchain to attempt to purchase more| |By default, the ticket buyer will not buy more tickets until all the previous ones purchased have been entered into the blockchain. You can set this to purchase more even if some are still in the mempool.
ticketbuyer.spreadticketpurchases|Spread ticket purchases evenly throughout the window| |By default all tickets are purchased at once. This setting allows tells the ticket buyer to spread out the purchase of tickets which may result in more favourable fees.
ticketbuyer.maxinmempool|The maximum number of your tickets allowed in mempool before purchasing more tickets |40|If you have this many tickets in the mempool, the ticket buyer will not buy more until some are accepted into the blockchain.
ticketbuyer.expirydelta|Number of blocks in the future before the ticket expires |16|You can set an expiry so that if your tickets are not accepted into the blockchain due to high fees, they will cancel and you can try again by raising your fees.
ticketbuyer.maxpriceabsolute|Maximum absolute price to purchase a ticket |0 DCR| If the ticket price is above this value, you will not buy more tickets. The default of 0 turns this off.
ticketbuyer.maxpricerelative|Scaling factor for setting the maximum price, multiplies by the average price |1.25|If the current window price is significantly higher than the last few windows, do not buy any tickets. E.g. With the default value of 1.25, if the average price of the last few windows is 50DCR, you won't buy any tickets if the current window is over 75DCR.
ticketbuyer.balancetomaintainabsolute|Amount of funds to keep in wallet when stake mining |0 DCR| If you balance is lower than this number, you will not buy tickets. The default of 0 will use all the funds in your account to buy tickets.
ticketbuyer.balancetomaintainrelative|Proportion of funds to leave in wallet when stake mining |0.3|Similar to the last one, except it's based on a percentage of your total funds.

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
also use the official stats page at [<i class="fa fa-external-link-square"></i> stats.decred.org](https://stats.decred.org).

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

Please see the [Using Paymetheus guide](/getting-started/user-guides/using-paymetheus.md#purchase-tickets-tab)
---

## ** Post Purchase Information **

After a successful ticket purchase, you must wait to see whether or not the
transaction is mined and included in a block.  The main reason for your ticket
not being mined is that the ticket price adjusts before it can be mined.  This
can happen due to the mempool being full of competing ticket purchase
transactions or simply bad purchase timing.  You can use the official Decred stats site at [<i class="fa fa-external-link-square"></i> stats.decred.org](https://stats.decred.org) to view when the next ticket price adjustment occurs.

Some other details to keep in mind are:

* The ticket price is not spent, although it is removed from your balance as it is not spendable. It is just a deposit. You will get it back when your ticket votes, expires, or is revoked due to not voting.
* 20 tickets are accepted into the voting pool each block. Tickets that are waiting stay in the mempool. Tickets are moved from the mempool to the voting pool in order of txfee.
* Tickets take 256 blocks (about a day) to mature. During this time the stake price you paid will not be visible in your total balance.
* You can keep track of your tickets' status by periodically running:

```no-highlight
dcrctl --wallet getstakeinfo
```

  or by inspecting the Stake Mining tab in Paymetheus.

Continue to [PoS Tickets and Fees FAQ](/faq/proof-of-stake/buying-tickets-and-fees.md)

---

## ** <i class="fa fa-book"></i> See Also **

[Proof-of-stake Commands](/advanced/program-options.md#pos-commands)

[Proof-of-stake FAQ - Buying Tickets and Fees](/faq/proof-of-stake/buying-tickets-and-fees.md)

[Proof-of-stake FAQ - Solo Mining](/faq/proof-of-stake/solo-mining.md)

[Proof-of-stake FAQ - Stake Pools](/faq/proof-of-stake/stake-pools.md)

[Proof-of-stake FAQ - Voting Tickets](/faq/proof-of-stake/voting-tickets.md)

[Proof-of-stake Mining Parameters](/advanced/program-options.md#pos-network-parameters)

[Wiki - Solo Stake Mining](https://wiki.decred.org/Solo_Stake_Mining)
