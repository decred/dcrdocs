# Buying Tickets With dcrwallet

Last updated for CLI release v{{ cliversion }}.

This guide is intended to walk through ticket buying using `dcrwallet`. It will cover both manual ticket purchases and automatic ticket purchases for solo-voting and VSP voting configurations.

**Prerequisites:**

- Use the latest [dcrinstall](cli-installation.md) to install `dcrd`, `dcrwallet,` and `dcrctl`. Additional steps will be required if another installation method was used.
- Review how the launch commands for the Command Prompt (Windows) and Bash (macOS/Linux) shells differ [here](os-differences.md).
- [Setup dcrd](dcrd-setup.md) and have it running in the background.
- [Setup dcrwallet](dcrwallet-setup.md) and have it running in the background.
- Familiarize yourself with the [basics of using dcrctl](dcrctl-basics.md).
- Familiarize yourself with the [staking process](../../proof-of-stake/overview.md) and the [ticket lifecycle](../../proof-of-stake/overview.md#ticket-lifecycle)

This guide assumes you have set up `dcrd` and `dcrwallet` using configuration files. If you used `dcrinstall`, you have configuration files already. Using configuration files is highly recommended - it makes for an easier time issuing commands to `dcrwallet` and `dcrd` through `dcrctl`. A guide for minimum configuration (saving your RPC username and RPC password) can be found [here](../../advanced/manual-cli-install.md#minimum-configuration).

---

## Decisions

There are a few decisions to be made before venturing into this guide. First, will you be using a Voting Service Provider (VSP) to delegate your ticket voting rights? Second, will you be purchasing tickets manually or automatically via the ticketbuyer feature?

VSP ticket purchasing allows a stakeholder to delegate voting rights to a VSP. VSPs are online at all times (24/7) and very rarely miss a vote. In exchange for this service, VSPs typically require an upfront fee.

Solo-voting requires you to have a voting wallet unlocked at all times (24/7), or else you may miss votes and lose your voting reward. You do not have to pay VSP fees.

Manual ticket purchasing vs. automated ticketbuyer purchasing is mainly up to personal preference. Purchasing manually offers the user more control over when tickets are purchased, how much is paid for each ticket, and how often the purchasing wallet is unlocked. The automated buyer offers more convenience and requires less maintenance, however it requires the purchasing wallet to remain online and unlocked constantly.

---

## Solo-voting

REMINDER: Solo-voting with a voting wallet that doesn't stay online 24/7 may result in missed votes and forfeited stake rewards.

To solo-vote, you simply set the `enablevoting` option when starting `dcrwallet`, unlock the wallet with your private passphrase, and buy tickets. With `enablevoting` enabled and `dcrwallet` unlocked, your wallet will automatically handle voting.

To set up your `dcrwallet` for solo-staking, add the following line to your `dcrwallet.conf` config file:

```ini
enablevoting=1
```

Once `dcrwallet` is restarted with that line in `dcrwallet.conf`, your wallet will be configured for solo-voting and you can start [purchasing tickets](#ticket-purchasing).

---

## VSP voting

 You can find a list of VSPs [here](../../proof-of-stake/how-to-stake.md#pos-using-a-voting-service-provider-vsp).

 Once you have decided on a VSP, delegating voting to a VSP for purchased tickets is accomplished with the following configuration options set in your dcrwallet.conf file.

- `vsp.url`
- `vsp.pubkey`

```ini
; ------------------------------------------------------------------------------
; VSP settings
; ------------------------------------------------------------------------------

; The URL of the VSP.
vsp.url=https://teststakepool.decred.org

; The base64 encoded public key of the VSP server.  This can be found on the
; VSP website in the footer.
vsp.pubkey=ia9Ra2Drb+OHLqRyBsJnRKBd7TUG1IvrseC6robKzGo=
```

---

## Ticket Purchasing

Both manual and automatic ticket purchasing require your wallet to be unlocked via the `promptsecret | dcrctl --wallet walletpassphrase - <time limit>` command.

There are three things you might want to understand before purchasing tickets: the `purchaseticket` command, when/why a `ticketfee` is important, and the significance of `ticket price`.

##### `purchaseticket` Command

The `purchaseticket` command will be used to purchase tickets whether manual or automatic. Let's take a closer look at the command and its arguments:

```no-highlight
purchaseticket "fromaccount" spendlimit (minconf=1 "ticketaddress" numtickets "pooladdress" poolfees expiry "comment" ticketfee)
```

1. `fromaccount`    =  Required String: The account from which to purchase tickets (e.g. "default").
1. `spendlimit`     =  Required Number: Limit on the amount to spend on ticket (e.g. 50).
1. `minconf`        =  Optional Number: Minimum number of block confirmations required (e.g. 1).
1. `ticketaddress`  =  Optional String: The ticket address to which voting rights are given
1. `numtickets`     =  Optional Number: The number of tickets to purchase at once (e.g. 1)
1. `pooladdress`    =  Optional String: The address to pay VSP fees to
1. `poolfees`       =  Optional Number: The percentage of fees to pay to the VSP (e.g. 5)
1. `expiry`         =  Optional Number: The block height where unmined tickets will expire from the mempool, returning the original DCR to your "fromaccount". If left blank, tickets will only expire in the mempool when the ticket price changes.
1. `comment`        =  Optional String: This argument is unused and has no significance.
1. `ticketfee`      =  Optional Number: The DCR/kB rate you will pay to have your ticket purchase be included in a block.

##### Ticket Fees

Your `ticketfee` is the DCR/kB rate you will pay to have your ticket purchase be included in a block by a miner. You will notice that the `ticketfee` argument of the above `purchaseticket` is optional. The `ticketfee` argument can be set using two other methods.

1. During startup by adding `ticketfee=<fee rate>` to your `dcrwallet.conf`.
1. While your wallet is running, using the `dcrctl --wallet setticketfee <fee rate>` command. This is not a permanent setting and will default to 0.0001 every time your wallet is restarted unless a ticketfee is specified in `dcrwallet.conf`.

Why are ticket fees important? Usually the default fee of 0.0001 is enough to get your tickets mined, however there are extremely rare circumstances where an increased ticket fee may be beneficial. When ticket demand outpaces supply (there are only a maximum of 2880 tickets available at each price interval) a situation is created where stakeholders can increase their ticket fees in order to get their ticket purchases mined ahead of others offering lower fees. This type of "fee wars" scenario has not occurred since the new ticket price algorithm was introduced in July 2017.

The [block explorer](https://dcrdata.decred.org/mempool) can be used to find the average ticket fee in the mempool.

##### Ticket Price

To get the current ticket price, issue the `dcrctl --wallet getstakeinfo` command and look for the `difficulty` value. This is the price of each ticket in the current price window. You will want to adjust your `spendlimit` argument in the `purchaseticket` command to be greater than this `difficulty` value when purchasing tickets manually.

---

## Manual Ticket Purchase

##### Solo Tickets

To purchase tickets used for solo-staking, you only need to specify the `fromaccount` and `spendlimit` arguments while using the `purchaseticket` command. For example: `dcrctl --wallet purchaseticket "default" 50` would use DCR from your `default` account to purchase a ticket if the current ticket price was a max of 50 DCR.

If you wish to specify the `numtickets` or `expiry` arguments, you would specify a `minconf` of 1, an empty `ticketaddress` (""), an empty `pooladdress` (""), and an empty `poolfees` (0). Two examples follow:

- `dcrctl --wallet purchaseticket "default" 50 1 "" 5` would purchase 5 tickets, as the 5th argument (`numtickets`) is set to 5.
- `dcrctl --wallet purchaseticket "default" 50 1 "" 5 "" 0 100000` would purchase 5 tickets that would expire from the mempool if not mined by block 100,000, as the 8th argument (`expiry`) is set to 100000.

##### VSP Tickets

To purchase tickets with their voting rights delegated to a VSP, we use the `purchaseticket` command.

Note: For v1.6.0, if you have set the [VSP options](#vsp-voting) within your dcrwallet.conf file, you need only pass the name of the account you intend to spend from, and the spend limit which specifies the highest ticket price you are willing to pay: 

`dcrctl --wallet purchaseticket "default" 160`

---

## Ticketbuyer Configuration

`dcrwallet` includes a built-in `ticketbuyer` which can buy tickets for you automatically. It can be enabled by adding the following line to your `dcrwallet.conf` config file:

```ini
enableticketbuyer=1
```

You also need to specify options within your config file for your VSP as outlined [here.](#vsp-voting)

If you don't want `ticketbuyer` to spend all of your funds, there is one more option which allows you to specify a balance which will not be spent:

```ini
ticketbuyer.balancetomaintainabsolute=<balance>
```
