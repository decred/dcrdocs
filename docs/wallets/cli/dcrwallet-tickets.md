# Buying Tickets With dcrwallet

Last updated for CLI release v{{ cliversion }}.

---

This guide is intended to walk through ticket buying using `dcrwallet`.

Before proceeding it is recommended to decide if you want to solo vote or use a
Voting Service Provider (VSP).
The [How to Stake](../../proof-of-stake/how-to-stake.md) page covers the pros
and cons of each approach.

**Prerequisites:**

- Use the latest [dcrinstall](cli-installation.md) to install `dcrd`, `dcrwallet,` and `dcrctl`. Additional steps will be required if another installation method was used.
- Review how the launch commands for the Command Prompt (Windows) and Bash (macOS/Linux) shells differ [here](os-differences.md).
- [Setup dcrd](dcrd-setup.md) and have it running in the background.
- [Setup dcrwallet](dcrwallet-setup.md) and have it running in the background.
- Familiarize yourself with the [basics of using dcrctl](dcrctl-basics.md).
- Familiarize yourself with the [staking process](../../proof-of-stake/overview.md) and the [ticket lifecycle](../../proof-of-stake/overview.md#ticket-lifecycle)

This guide assumes you have set up `dcrd` and `dcrwallet` using configuration files. If you used `dcrinstall`, you have configuration files already. Using configuration files is highly recommended - it makes for an easier time issuing commands to `dcrwallet` and `dcrd` through `dcrctl`. A guide for minimum configuration (saving your RPC username and RPC password) can be found [here](../../advanced/manual-cli-install.md#minimum-configuration).

---

## Step 1. Enable Voting

### Solo-voting

!!! warning
    Solo-voting with a voting wallet that doesn't stay online 24/7 may result in missed votes and forfeited stake rewards.

To solo-vote, you simply set the `enablevoting` option when starting `dcrwallet`, unlock the wallet with your private passphrase, and buy tickets. With `enablevoting` enabled and `dcrwallet` unlocked, your wallet will automatically handle voting.

To set up your `dcrwallet` for solo-staking, add the following line to your `dcrwallet.conf` config file:

```ini
enablevoting=1
```

Once `dcrwallet` is restarted with that line in `dcrwallet.conf`, your wallet will be configured for solo-voting and you can start [purchasing tickets](#step-2-purchase-tickets).

### VSP Voting

 You can find a list of VSPs [here](../../proof-of-stake/how-to-stake.md#voting-service-providers).

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

## Step 2. Purchase Tickets

Tickets can be purchased in two different ways, manual or automatic. Purchasing
manually offers more control over when tickets are purchased, how much is paid
for each ticket, and how often the purchasing wallet is unlocked.
The automated buyer offers more convenience and requires less maintenance,
however it requires the purchasing wallet to remain online constantly.

Both manual and automatic ticket purchasing require your wallet to be
[unlocked](dcrctl-basics.md#unlocking-your-wallet).

!!! tip
    To find the current ticket price, issue the `dcrctl --wallet getstakeinfo`
    command and look for the `difficulty` value.
    This is the price of each ticket in the current price window.
    You will want to adjust your `spendlimit` argument in the `purchaseticket`
    command to be greater than this `difficulty` value when purchasing tickets
    manually.

### Manual Ticket Purchase

The purchaseticket RPC command will attempt to purchase a ticket immediately
using available funds. There are two required parameters:

1. `fromaccount` - String: The account from which to purchase tickets (e.g. "default").
1. `spendlimit`  - Number: Limit on the amount to spend on ticket (e.g. 50).

More advanced parameters can be listed with the command `dcrctl --wallet help purchaseticket`.
If the purchaseticket command is successful it will output the hash of the
purchased ticket.

```sh
$ dcrctl --testnet --wallet purchaseticket default 100
[
  "69b855e0d318dc5a21ff0f2717ad149b324027a1e46ecd28d0a18ea1ca249f5b"
]
```

The ticket has now entered the mempool and begins the
[ticket lifecycle](../../proof-of-stake/overview.md#ticket-lifecycle).

For **solo voters** the process is complete. If they are using separate ticket
buying and voting wallets, the ticket buying wallet can now be closed.

**VSP users** need to keep their wallet open a few moments longer while the
newly purchased ticket is registered with the VSP and the fee is paid. A
"successfully processed" message in the dcrwallet log will indicate when the
registration is complete.

```no-highlight
[INF] WLLT: Published ticket purchase 69b855e0d318dc5a21ff0f2717ad149b324027a1e46ecd28d0a18ea1ca249f5b
[INF] VSPC: VSP requires fee 0.00010829 DCR
[INF] VSPC: successfully processed 69b855e0d318dc5a21ff0f2717ad149b324027a1e46ecd28d0a18ea1ca249f5b
```

### Automatic Ticketbuyer

`dcrwallet` includes a built-in `ticketbuyer` which can buy tickets for you automatically.
It can be enabled by adding the following line to your `dcrwallet.conf` config file:

```ini
enableticketbuyer=1
```

If you don't want `ticketbuyer` to spend all of your funds, there is one more option which allows you to specify a balance which will not be spent:

```ini
ticketbuyer.balancetomaintainabsolute=<balance>
```
