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

```no-highlight
enablevoting=1
```

Once `dcrwallet` is restarted with that line in `dcrwallet.conf`, your wallet will be configured for solo-voting and you can start [purchasing tickets](#ticket-purchasing).

---

## VSP voting

 You can find a list of VSPs [here](../../proof-of-stake/how-to-stake.md#pos-using-a-voting-service-provider-vsp).

 Once you have decided on a VSP, delegating voting to a VSP for purchased tickets is accomplished with the following configuration options set in your dcrwallet.conf file.

- `vsp.url`
- `vsp.pubkey`

        ; ------------------------------------------------------------------------------
        ; VSP settings
        ; ------------------------------------------------------------------------------

        ; The URL of the VSP.
        ; vsp.url=https://teststakepool.decred.org

        ; The base64 encoded public key of the VSP server.  This can be found on the
        ; VSP website in the footer.
        ; vsp.pubkey=ia9Ra2Drb+OHLqRyBsJnRKBd7TUG1IvrseC6robKzGo=

Note: The process outlined below is now considered "legacy" and will be phased out at a later date. It is recommended to use the process above to purchase tickets with a VSP as of version 1.6.0 and above as it better respects privacy and requires no sign-up with the VSP.

??? info "Click to display the legacy process for utilizing a VSP"
    To allow a VSP to vote for you, you first have to sign up for a VSP. A list of them can be found [here](../../proof-of-stake/how-to-stake.md#pos-using-a-voting-service-provider-vsp). After signing up, there should be directions for creating a new P2SH address and importing your multi-sig voting script. 

    !!! warning "Warning"
        Make sure to save a copy of your multi-sig voting script; if your VSP goes down, you will need this script to vote or revoke tickets.

    A brief overview of configuring your VSP is provided here:

    1. With your wallet open, issue the `dcrctl --wallet getnewaddress` command to retrieve an address.

    1. Using that address, issue the `dcrctl --wallet validateaddress <address from step 1>` command. This should return a JSON object that will be displayed like so:

            {
              "isvalid": true,
              "address": "DsExampleAddr1For2Demo3PurposesOnly",
              "ismine": true,
              "pubkeyaddr": "DkExample0Addr1For2Demo4Purposes5Only6Do7Not8Use9Pls0",
              "pubkey": "022801337beefc0ffee1dab8d4ffa898a782466c9a1fc00ca8863de5438dc07dcc",
              "iscompressed": true,
              "account": "voting"
            }

    1. Copy the `pubkeyaddr` into the VSP's "Submit Address" form and hit the submit button. The page should redirect you to the tickets page, which will display more instructions.

    1. At the top of the tickets page, you should see a "Ticket Information" section. Copy your "Redeem Script" and use it to issue the `dcrctl --wallet importscript <Insert Redeem Script Here>` command.

    With the VSP configured and your multi-sig script imported to your wallet, you can now start [purchasing tickets](#ticket-purchasing).

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

Note: The info below is now considered "legacy" and will be phased out at a later date. It is recommended to use the process [here](#vsp-voting) to purchase tickets with a VSP as of version 1.6.0 and above as it better respects privacy and requires no sign-up with the VSP.

??? info "Click to display additional info for legacy use of purchaseticket command" 
    If purchasing tickets the legacy way, you need to include the following in your command:

    - Your `ticketaddress` is the P2SH Address found at the top of "Tickets" page of your VSP under the "Ticket Information" section.
    - Your `pooladdress` is the address for your VSP's fees are collected. This can be found in the "Ticket Instructions" section of your VSP's "Tickets" page.
    - Your `poolfees` is the percentage of the stake reward that will go to the `pooladdress` when a ticket votes. It is important to match your VSP's advertised fee.

    A quick example:

    `dcrctl --wallet purchaseticket "default" 23 1 DcExampleAddr1For2Demo3PurposesOnly 1 DsExampleAddr1For2Demo3PurposesOnly 7.5` would use DCR from your `default` account to purchase 1 ticket if the current ticket price is a max of 23 DCR. The P2SH Address received from the VSP is `DcExampleAddr1For2Demo3PurposesOnly` and their fee address is `DsExampleAddr1For2Demo3PurposesOnly`. They will collect a 7.5% fee if this ticket successfully votes. This ticket will not expire from the mempool until the ticket price changes, as only 7 arguments were specified (no `expiry`).

---

## Ticketbuyer Configuration

`dcrwallet` includes a built-in `ticketbuyer` which can buy tickets for you automatically. It can be enabled by adding the following line to your `dcrwallet.conf` config file:

```no-highlight
enableticketbuyer=1
```

You also need to specify options within your config file for your VSP as outlined [here.](#vsp-voting)

If you don't want `ticketbuyer` to spend all of your funds, there is one more option which allows you to specify a balance which will not be spent:

```no-highlight
ticketbuyer.balancetomaintainabsolute=<balance>
```

Note: The info below is now considered "legacy" and will be phased out at a later date. It is recommended to use the process [here](#vsp-voting) to purchase tickets with a VSP as of version 1.6.0 and above as it better respects privacy and requires no sign-up with the VSP.

??? info "Click to display info for legacy method of buying tickets with ticketbuyer" 
    If you are using a VSP, you should also add the following lines (all of these can be found on your VSP's    "Tickets" page):

    ```no-highlight
    ticketbuyer.votingaddress=<P2SH Address shared with VSP>
    pooladdress=<VSP's Fee Collection Address>
    poolfees=<VSP's Required Reward Fee>
    ```
