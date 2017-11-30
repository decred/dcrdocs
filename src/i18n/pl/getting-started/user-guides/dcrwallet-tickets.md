# Buying Tickets With dcrwallet

Last updated for v1.0.0

This guide is intended to walk through ticket buying using `dcrwallet`. It will cover both manual ticket purchases and automatic ticket purchases for solo-voting and stakepool-voting configurations.

**Prerequisites:**

-   Use the latest [dcrinstall](/getting-started/user-guides/cli-installation.md) to install `dcrd`, `dcrwallet,` and `dcrctl`. Additional steps will be required if another installation method was used.
-   Review how the launch commands for the Command Prompt (Windows) and Bash (macOS/Linux) shells differ [here](/getting-started/cli-differences.md).
-   [Setup dcrd](/getting-started/user-guides/dcrd-setup.md) and have it running in the background.
-   [Setup dcrwallet](/getting-started/user-guides/dcrwallet-setup.md) and have it running in the background.
-   Familiarize yourself with the [basics of using dcrctl](/getting-started/user-guides/dcrctl-basics.md).
-   Familiarize yourself with the [staking process](/mining/proof-of-stake.md#staking-101) and the [ticket lifecycle](/mining/proof-of-stake.md#ticket-lifecycle)

This guide assumes you have set up `dcrd` and `dcrwallet` using configuration files. If you used `dcrinstall`, you have configuration files already. Using configuration files is highly recommended - it makes for an easier time issuing commands to `dcrwallet` and `dcrd` through `dcrctl`. A guide for minimum configuration (saving your RPC username and RPC password) can be found [here](/advanced/manual-cli-install.md#minimum-configuration).

NOTE: `dcrwallet.conf` is split into two sections labeled `[Application Options]` and `[Ticket Buyer Options]`. Any setting prefixed by 'ticketbuyer.' must be placed within the lower `[Ticket Buyer Options]` section. All other settings go within `[Application Options]`.

---

## Decisions

There are a few decisions to be made before venturing into this guide. First, will you be using a stakepool to delegate your ticket voting rights? Second, will you be purchasing tickets manually or automatically via the ticketbuyer feature?

Stakepool ticket purchasing allows a stakeholder to delegate voting rights to a stakepool. These stakepools are online at all times (24/7) and very rarely miss a vote. They utilize multi-sig transactions so they're unable to touch any of your DCR. As a downside, most require a small percentage of your voting reward as a pool fee. Stakepool delegated tickets also require a larger transaction size (~540 Bytes vs. ~300 Bytes for solo-voting tickets) for purchasing which results in a slightly higher absolute ticket fee since fees are calculated by DCR/kB.

Solo-voting requires you to have a voting wallet unlocked at all times (24/7), or else you may miss votes and lose your voting reward. You do not have to pay pool fees and your ticket purchases are more likely to be mined with a smaller absolute fee (due to the miners selecting tickets based on DCR/kB ticket fee rates and solo tickets having a smaller TXN size).

Manual ticket purchasing vs. automated ticketbuyer purchasing is mainly up to personal preference. The normal benefits of automation apply to ticketbuyer, but many may be overwhelmed by the amount variables that can be configured. Also, ticketbuyer's fee calculation sometimes doesn't result in the most economical fee for a stakeholder. Some people also enjoy manually purchasing tickets every few days and trying to bid the most economical fee. Both methods will only purchase tickets when your wallet is unlocked.

---

## Solo-voting

REMINDER: Solo-voting with a voting wallet that doesn't stay online 24/7 may result in missed votes and forfeited stake rewards.

To solo-vote, you simply set the enablevoting option when starting `dcrwallet`, unlock the wallet with your private passphrase, and buy tickets. With enablevoting enabled and `dcrwallet` unlocked, your wallet will automatically handle voting.

To set up your `dcrwallet` for solo-staking, add the following line to your `dcrwallet.conf` config file in the `[Application Options]` section:

    enablevoting=1

Once restarted with that line in `dcrwallet.conf` your wallet will be configured for solo-voting and you can now start [purchasing tickets](#ticket-purchasing).

---

## Stakepool-voting

To allow a stakepool to vote for you, you first have to sign up for a stakepool. A list of them can be found [here](/mining/proof-of-stake.md#list-of-stakepools). After signing up, there should be directions for creating a new P2SH address and importing your multi-sig voting script. A brief overview is provided here:

1.  With your wallet open, issue the `dcrctl --wallet getnewaddress` command to retrieve an address.
2.  Using that address, issue the `dcrctl --wallet validateaddress <address from step 1>` command. This should return a JSON object that will be displayed like so:

```
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

3.  Copy the `pubkeyaddr` into the stakepool's "Submit Address" form and hit the submit button. The page should redirect you to the tickets page, which will display more instructions.
4.  At the top of the tickets page, you should see a "Ticket Information" section. Copy your "Redeem Script" and use it to issue the `dcrctl --wallet importscript <Insert Redeem Script Here>` command.

With the stakepool configured and your multi-sig script imported to your wallet, you can now start [purchasing tickets](#ticket-purchasing).

---

## Ticket Purchasing

Both manual and automatic ticket purchasing require your wallet to be unlocked via the `dcrctl --wallet walletpassphrase <private passphrase> <time limit>` command.

There are three things you might want to understand before purchasing tickets: the `purchaseticket` command, when/why a `ticketfee` is important, and the significance of `ticket price`.

> purchaseticket Command

The `purchaseticket` command will be used to purchase tickets whether manual or automatic. Let's take a closer look at the command and its arguments:

```
purchaseticket "fromaccount" spendlimit (minconf=1 "ticketaddress" numtickets "pooladdress" poolfees expiry "comment")
```

1.  `fromaccount`    =  Required String: The account from which to purchase tickets (e.g. "default").
2.  `spendlimit`     =  Required Number: Limit on the amount to spend on ticket (e.g. 50).
3.  `minconf`        =  Optional Number: Minimum number of block confirmations required (e.g. 1).
4.  `ticketaddress`  =  Optional String: The ticket address to which voting rights are given
5.  `numtickets`     =  Optional Number: The number of tickets to purchase at once (e.g. 1)
6.  `pooladdress`    =  Optional String: The address to pay stake pool fees to
7.  `poolfees`       =  Optional Number: The percentage of fees to pay to the stake pool (e.g. 5)
8.  `expiry`         =  Optional Number: The block height where unmined tickets will expire from the mempool, returning the original DCR to your "fromaccount". If left blank, tickets will only expire in the mempool when the ticket price changes.
9.  `comment`        =  Optional String: This argument is unused and has no significance.

> Ticket Fees

Your `ticketfee` is the DCR/kB rate you'll pay to have your ticket purchase be included in a block by a miner. You'll notice that the above `purchaseticket` command doesn't include any `ticketfee` arguments. The `ticketfee` argument can be set two ways.

1.  During startup by adding `ticketfee=<fee rate>` to the `[Application Options]` of your `dcrwallet.conf`.
2.  While your wallet is running, using the `dcrctl --wallet setticketfee <fee rate>` command. This is not a permanent setting and will default to 0.01 every time your wallet is restarted unless a ticketfee is specified in `dcrwallet.conf`.

Why are ticketfees important? Usually the default fee of 0.01 is enough to get your tickets mined. The exception is during a fee war event. When the ticket price falls very low, demand outpaces supply (there are only a maximum of 2880 tickets available at each price interval). This creates a fee war, with stakeholders competing to get their tickets mined before the price changes.

With these two things in mind, let's continue to the two methods for purchasing tickets.

> Ticket Price

To get the current ticket price, issue the `dcrctl --wallet getstakeinfo` command and look for the `difficulty` value. This is the price of each ticket in the current price window. You'll want to adjust your `spendlimit` argument in the `purchaseticket` command to be greater than this `difficulty` value when purchasing tickets manually.

---

### Manual Ticket Purchase

Before manually purchasing tickets, it is recommended to check for a ticketfee war and adjust your ticketfee before purchase by issuing the `dcrctl --wallet setticketfee <fee rate>` command. Third party sites such as [https://dcrstats.com](https://dcrstats.com) and [https://posmaster.info](http://posmaster.info) can be used to find the average ticketfee in the mempool, although you may oftentimes be able to purchase a ticket with a ticketfee lower than the average.

> Solo Tickets

To purchase tickets used for solo-staking, you only need to specify the `fromaccount` and `spendlimit` arguments while using the `purchaseticket` command. For example: `dcrctl --wallet purchaseticket "default" 50` would use DCR from your `default` account to purchase a ticket if the current ticket price was a max of 50 DCR.

If you wish to specify the `numtickets` or `expiry` arguments, you would specify a `minconf` of 1, an empty `ticketaddress` (""), an empty `pooladdress` (""), and an empty `poolfees` (0). Two example follow:

-  `dcrctl --wallet purchaseticket "default" 50 1 "" 5` would purchase 5 tickets, as the 5th argument (`numtickets`) is set to 5.
-  `dcrctl --wallet purchaseticket "default" 50 1 "" 5 "" 0 100000` would purchase 5 tickets that would expire from the mempool if not mined by block 100,000, as the 8th argument (`expiry`) is set to 100000.

Be sure to check for a fee war event and adjust your ticketfee before purchase by issuing the `dcrctl --wallet setticketfee <fee rate>` command.

> Pool Tickets

To purchase tickets with their voting rights delegated to a stakepool, we have to use the full `purchaseticket` command.

-  Your `ticketaddress` is the P2SH Address found at the top of "Tickets" page of your stakepool under the "Ticket Information" section.
-  Your `pooladdress` is the address for your stakepool's fees are collected. This can be found in the "Ticket Instructions" section of your stakepool's "Tickets" page.
-  Your `poolfees` is the percentage of the stake reward that will go to the `pooladdress` when a ticket votes. It is important to match your pool's advertised fee.

A quick example:

`dcrctl --wallet purchaseticket "default" 23 1 DcExampleAddr1For2Demo3PurposesOnly 1 DsExampleAddr1For2Demo3PurposesOnly 7.5` would use DCR from your `default` account to purchase 1 ticket if the current ticket price is a max of 23 DCR. The P2SH Address received from the stakepool is `DcExampleAddr1For2Demo3PurposesOnly` and their fee address is `DsExampleAddr1For2Demo3PurposesOnly`. They will collect a 7.5% fee if this ticket successfully votes. This ticket will not expire from the mempool until the ticket price changes, as only 7 arguments were specified (no `expiry`).

---

#### Ticketbuyer Configuration

To set up your `dcrwallet` to enable its built-in `ticketbuyer` feature, add the following line to your `dcrwallet.conf` config file in the `[Application Options]` section:

    enableticketbuyer=1

If you are using a stakepool, you should also add the following lines (all of these can be found on your stakepool's "Tickets" page):

    ticketaddress=<P2SH Address shared with Stakepool>
    pooladdress=<Stakepool's Fee Collection Address>
    poolfees=<Stakepool's Required Reward Fee>

With this configuration `ticketbuyer` will start running with it's default settings. You may want to modify the `ticketbuyer` configuration to tweak its behaviour - the full set of configuration options and their default values can be found in the chart [below](#full-ticketbuyer-options).

With `ticketbuyer` running and your wallet unlocked, you can watch your `dcrwallet` console to see whether or not tickets are being purchased. It will even display an explanation if tickets weren't purchased.

---

## Full Ticketbuyer Options

We recommended you read
and understand the options available before using the feature as you may set your fees and ticket
prices higher than desired.

All of these options can be specified on the command line or in dcrwallet.conf in the `[Ticket Buyer Options]` section. Note that at
this time there is no way to change settings while dcrwallet is running: you will need to restart it to
adjust your settings.

Parameter|Description|Default|Explanation
:----------:|:---------------------------:|:----------:|:---------------------------:
ticketbuyer.avgpricemode|The mode to use for calculating the average price if pricetarget is disabled (vwap, pool, dual) |vwap|!
ticketbuyer.avgpricevwapdelta|The number of blocks to use from the current block to calculate the VWAP |2880|!
ticketbuyer.maxfee|Maximum ticket fee per KB |0.1 DCR|Tickets are entered into the mempool in order of their fee per kilobyte. This sets the maximum fee you are willing to pay.
ticketbuyer.minfee|Minimum ticket fee per KB |0.01 DCR|The minimum fee per kilobyte you are willing to pay. This should probably be left at 0.01 unless you know what you're doing.
ticketbuyer.feesource|The fee source to use for ticket fee per KB (median or mean) |median|The fee chosen by the ticket buyer will be based off either the median (line all the fees up in order and choose the middle one) or the mean (also known as the average; add all the fees up and divide by 2). It's recommended to leave this at median as there have been instances of fee manipulation where people try to force up the average by buying one ticket with a very high fee.
ticketbuyer.maxperblock|Maximum tickets per block, with negative numbers indicating buy one ticket every 1-in-n blocks |5|Do not buy more than this number of tickets per block. A negative number means buy one ticket every n blocks. e.g. -2 would mean buy a ticket every second block.
ticketbuyer.blockstoavg|Number of blocks to average for fees calculation |11| Fees are calculated using this many previous blocks. You can usually leave this at the default.
ticketbuyer.feetargetscaling|Scaling factor for setting the ticket fee, multiplies by the average fee |1|The average fee is multiplied by this number to give the fee to pay. DO NOT change this until you really know what you're doing. It could raise your fees very high. Remember, fees are non-refundable!
ticketbuyer.dontwaitfortickets|Don't wait until your last round of tickets have entered the blockchain to attempt to purchase more| |By default, the ticket buyer will not buy more tickets until all the previous ones purchased have been entered into the blockchain. You can set this to purchase more even if some are still in the mempool.
ticketbuyer.nospreadticketpurchases|Do not spread ticket purchases evenly throughout the window| | By default `ticketbuyer` spreads out the purchase of tickets which may result in more favourable fees. This setting tells `ticketbuyer` to purchase all tickets at once.
ticketbuyer.maxinmempool|The maximum number of your tickets allowed in mempool before purchasing more tickets |40|If you have this many tickets in the mempool, the ticket buyer will not buy more until some are accepted into the blockchain.
ticketbuyer.expirydelta|Number of blocks in the future before the ticket expires |16|You can set an expiry so that if your tickets are not accepted into the blockchain due to high fees, they will cancel and you can try again by raising your fees.
ticketbuyer.maxpriceabsolute|Maximum absolute price to purchase a ticket |0 DCR| If the ticket price is above this value, you will not buy more tickets. The default of 0 turns this off.
ticketbuyer.maxpricerelative|Scaling factor for setting the maximum price, multiplies by the average price |1.25|If the current window price is significantly higher than the last few windows, do not buy any tickets. E.g. With the default value of 1.25, if the average price of the last few windows is 50DCR, you won't buy any tickets if the current window is over 75DCR.
ticketbuyer.balancetomaintainabsolute|Amount of funds to keep in wallet when stake mining |0 DCR| If your balance is lower than this number, you will not buy tickets. The default of 0 will use all the funds in your account to buy tickets.
ticketbuyer.balancetomaintainrelative|Proportion of funds to leave in wallet when stake mining |0.3|Similar to the last one, except it's based on a percentage of your total funds.

---
