# Buying Tickets With dcrwallet

Last updated for CLI release v1.1.2

This guide is intended to walk through ticket buying using `dcrwallet`. It will cover both manual ticket purchases and automatic ticket purchases for solo-voting and VSP voting configurations.

**Prerequisites:**

-   Use the latest [dcrinstall](cli-installation.md) to install `dcrd`, `dcrwallet,` and `dcrctl`. Additional steps will be required if another installation method was used.
-   Review how the launch commands for the Command Prompt (Windows) and Bash (macOS/Linux) shells differ [here](os-differences.md).
-   [Setup dcrd](dcrd-setup.md) and have it running in the background.
-   [Setup dcrwallet](dcrwallet-setup.md) and have it running in the background.
-   Familiarize yourself with the [basics of using dcrctl](dcrctl-basics.md).
-   Familiarize yourself with the [staking process](../../proof-of-stake/proof-of-stake.md) and the [ticket lifecycle](../../proof-of-stake/proof-of-stake.md#ticket-lifecycle)

This guide assumes you have set up `dcrd` and `dcrwallet` using configuration files. If you used `dcrinstall`, you have configuration files already. Using configuration files is highly recommended - it makes for an easier time issuing commands to `dcrwallet` and `dcrd` through `dcrctl`. A guide for minimum configuration (saving your RPC username and RPC password) can be found [here](../../advanced/manual-cli-install.md#minimum-configuration).

NOTE: `dcrwallet.conf` is split into two sections labeled `[Application Options]` and `[Ticket Buyer Options]`. Any setting prefixed by 'ticketbuyer.' must be placed within the lower `[Ticket Buyer Options]` section. All other settings go within `[Application Options]`.

---

## Decisions

There are a few decisions to be made before venturing into this guide. First, will you be using a Voting Service Provider (VSP) to delegate your ticket voting rights? Second, will you be purchasing tickets manually or automatically via the ticketbuyer feature?

VSP ticket purchasing allows a stakeholder to delegate voting rights to a VSP. These VSPs are online at all times (24/7) and very rarely miss a vote. They utilize multi-sig transactions so they're unable to touch any of your DCR. As a downside, most require a small percentage of your voting reward as a VSP fee. VSP delegated tickets also require a larger transaction size (~540 Bytes vs. ~300 Bytes for solo-voting tickets) for purchasing which results in a slightly higher absolute ticket fee since fees are calculated by DCR/kB.

Solo-voting requires you to have a voting wallet unlocked at all times (24/7), or else you may miss votes and lose your voting reward. You do not have to pay VSP fees and your ticket purchases are more likely to be mined with a smaller absolute fee (due to the miners selecting tickets based on DCR/kB ticket fee rates and solo tickets having a smaller TXN size).

Manual ticket purchasing vs. automated ticketbuyer purchasing is mainly up to personal preference. The normal benefits of automation apply to ticketbuyer, but many may be overwhelmed by the amount variables that can be configured. Also, ticketbuyer's fee calculation sometimes doesn't result in the most economical fee for a stakeholder. Some people also enjoy manually purchasing tickets every few days and trying to bid the most economical fee. Both methods will only purchase tickets when your wallet is unlocked.

---

## Solo-voting

REMINDER: Solo-voting with a voting wallet that doesn't stay online 24/7 may result in missed votes and forfeited stake rewards.

To solo-vote, you simply set the enablevoting option when starting `dcrwallet`, unlock the wallet with your private passphrase, and buy tickets. With enablevoting enabled and `dcrwallet` unlocked, your wallet will automatically handle voting.

To set up your `dcrwallet` for solo-staking, add the following line to your `dcrwallet.conf` config file in the `[Application Options]` section:

    enablevoting=1

Once restarted with that line in `dcrwallet.conf` your wallet will be configured for solo-voting and you can now start [purchasing tickets](#ticket-purchasing).

---

## VSP voting

To allow a VSP to vote for you, you first have to sign up for a VSP. A list of them can be found [here](../../proof-of-stake/how-to-stake.md#pos-using-a-voting-service-provider-vsp). After signing up, there should be directions for creating a new P2SH address and importing your multi-sig voting script. A brief overview is provided here:

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

3.  Copy the `pubkeyaddr` into the VSP's "Submit Address" form and hit the submit button. The page should redirect you to the tickets page, which will display more instructions.
4.  At the top of the tickets page, you should see a "Ticket Information" section. Copy your "Redeem Script" and use it to issue the `dcrctl --wallet importscript <Insert Redeem Script Here>` command.

With the VSP configured and your multi-sig script imported to your wallet, you can now start [purchasing tickets](#ticket-purchasing).

---

## Ticket Purchasing

Both manual and automatic ticket purchasing require your wallet to be unlocked via the `promptsecret | dcrctl --wallet walletpassphrase - <time limit>` command.

There are three things you might want to understand before purchasing tickets: the `purchaseticket` command, when/why a `ticketfee` is important, and the significance of `ticket price`.

##### `purchaseticket` Command

The `purchaseticket` command will be used to purchase tickets whether manual or automatic. Let's take a closer look at the command and its arguments:

```
purchaseticket "fromaccount" spendlimit (minconf=1 "ticketaddress" numtickets "pooladdress" poolfees expiry "comment")
```

1.  `fromaccount`    =  Required String: The account from which to purchase tickets (e.g. "default").
2.  `spendlimit`     =  Required Number: Limit on the amount to spend on ticket (e.g. 50).
3.  `minconf`        =  Optional Number: Minimum number of block confirmations required (e.g. 1).
4.  `ticketaddress`  =  Optional String: The ticket address to which voting rights are given
5.  `numtickets`     =  Optional Number: The number of tickets to purchase at once (e.g. 1)
6.  `pooladdress`    =  Optional String: The address to pay VSP fees to
7.  `poolfees`       =  Optional Number: The percentage of fees to pay to the VSP (e.g. 5)
8.  `expiry`         =  Optional Number: The block height where unmined tickets will expire from the mempool, returning the original DCR to your "fromaccount". If left blank, tickets will only expire in the mempool when the ticket price changes.
9.  `comment`        =  Optional String: This argument is unused and has no significance.

##### Ticket Fees

Your `ticketfee` is the DCR/kB rate you'll pay to have your ticket purchase be included in a block by a miner. You'll notice that the above `purchaseticket` command doesn't include any `ticketfee` arguments. The `ticketfee` argument can be set two ways.

1.  During startup by adding `ticketfee=<fee rate>` to the `[Application Options]` of your `dcrwallet.conf`.
2. While your wallet is running, using the `dcrctl --wallet setticketfee <fee rate>` command. This is not a permanent setting and will default to 0.0001 every time your wallet is restarted unless a ticketfee is specified in `dcrwallet.conf`.

Why are ticket fees important? Usually the default fee of 0.0001 is enough to get your tickets mined, however there are extremely rare circumstances where an increased ticket fee may be beneficial. When ticket demand outpaces supply (there are only a maximum of 2880 tickets available at each price interval) a situation is created where stakeholders can increase their ticket fees in order to get their ticket purchases mined ahead of others offering lower fees. This type of "fee wars" scenario has not occurred since the new ticket price algorithm was introduced in July 2017.

Third party sites such as <https://dcrstats.com> can be used to find the average ticket fee in the mempool.

##### Ticket Price

To get the current ticket price, issue the `dcrctl --wallet getstakeinfo` command and look for the `difficulty` value. This is the price of each ticket in the current price window. You'll want to adjust your `spendlimit` argument in the `purchaseticket` command to be greater than this `difficulty` value when purchasing tickets manually.

---

## Manual Ticket Purchase

##### Solo Tickets

To purchase tickets used for solo-staking, you only need to specify the `fromaccount` and `spendlimit` arguments while using the `purchaseticket` command. For example: `dcrctl --wallet purchaseticket "default" 50` would use DCR from your `default` account to purchase a ticket if the current ticket price was a max of 50 DCR.

If you wish to specify the `numtickets` or `expiry` arguments, you would specify a `minconf` of 1, an empty `ticketaddress` (""), an empty `pooladdress` (""), and an empty `poolfees` (0). Two examples follow:

-  `dcrctl --wallet purchaseticket "default" 50 1 "" 5` would purchase 5 tickets, as the 5th argument (`numtickets`) is set to 5.
-  `dcrctl --wallet purchaseticket "default" 50 1 "" 5 "" 0 100000` would purchase 5 tickets that would expire from the mempool if not mined by block 100,000, as the 8th argument (`expiry`) is set to 100000.

##### VSP Tickets

To purchase tickets with their voting rights delegated to a VSP, we have to use the full `purchaseticket` command.

-  Your `ticketaddress` is the P2SH Address found at the top of "Tickets" page of your VSP under the "Ticket Information" section.
-  Your `pooladdress` is the address for your VSP's fees are collected. This can be found in the "Ticket Instructions" section of your VSP's "Tickets" page.
-  Your `poolfees` is the percentage of the stake reward that will go to the `pooladdress` when a ticket votes. It is important to match your VSP's advertised fee.

A quick example:

`dcrctl --wallet purchaseticket "default" 23 1 DcExampleAddr1For2Demo3PurposesOnly 1 DsExampleAddr1For2Demo3PurposesOnly 7.5` would use DCR from your `default` account to purchase 1 ticket if the current ticket price is a max of 23 DCR. The P2SH Address received from the VSP is `DcExampleAddr1For2Demo3PurposesOnly` and their fee address is `DsExampleAddr1For2Demo3PurposesOnly`. They will collect a 7.5% fee if this ticket successfully votes. This ticket will not expire from the mempool until the ticket price changes, as only 7 arguments were specified (no `expiry`).

---

## Ticketbuyer Configuration

`dcrwallet` includes a built-in `ticketbuyer` which can buy tickets for you automatically. It can be enabled by adding the following line to your `dcrwallet.conf` config file:

```
enableticketbuyer=1
```

If you are using a VSP, you should also add the following lines (all of these can be found on your VSP's "Tickets" page):

```
ticketbuyer.votingaddress=<P2SH Address shared with VSP>
pooladdress=<VSP's Fee Collection Address>
poolfees=<VSP's Required Reward Fee>
```

If you don't want `ticketbuyer` to spend all of your funds, there is one more option which allows you to specify a balance which will not be spent:

```
ticketbuyer.balancetomaintainabsolute=<balance>
```
