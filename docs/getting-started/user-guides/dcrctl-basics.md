# <img class="dcr-icon" src="/img/dcr-icons/Dcrtl.svg" /> `dcrctl` Basics

**Prerequisites:**

- Use the latest [dcrinstall](../../wallets/cli/cli-installation.md) to install the command line tools.
- [Setup dcrd](../../wallets/cli/dcrd-setup.md) and have it running in the background.
- [Setup dcrwallet](../../wallets/cli/dcrwallet-setup.md) and have it running in the background.

---

`dcrctl` is the client that controls `dcrd` and `dcrwallet` via remote procedure call (RPC). You can use `dcrctl` for many things such as checking your balance, buying tickets, creating transactions, and viewing network information.

`dcrctl` is not a daemon - it does not run permanently in the background - it calls the requested RPC method, prints the response, and then terminates immediately.

---

## Usage

To call `dcrd` RPC methods:

```bash
dcrctl <options> <rpc method> <rpc method args>
```

To call `dcrwallet` RPC methods:

```bash
dcrctl <options> --wallet <rpc method> <rpc method args>
```

To list available options:
```bash
dcrctl --help
```

To list available RPC methods:

```bash
dcrctl -l
```
---

## Unlocking Your Wallet

Some functionality of `dcrwallet` requires the wallet to be unlocked.

The command to unlock your wallet follows: 

```no-highlight
dcrctl --wallet walletpassphrase <private passphrase set during wallet creation> 0
```

Here, we are specifying for `dcrctl` to send the command to `dcrwallet` by using the `--wallet` flag. The actual command is `walletpassphrase` which accepts two parameters, your private passphrase and a time limit. Specifying `0` for a time limit unlocks `dcrwallet` without a time limit. Note, however, that this only unlocks the wallet for the current session. If you close the window the wallet is running in, or stop/restart the `dcrwallet`, you will need to unlock it again the next time you start it. 

If the command was successful, you will not get a confirmation from `dcrctl`, but if you look at your `dcrwallet` session, it will say:

```no-highlight
[INF] RPCS: The wallet has been unlocked without a time limit.
```

NOTE: Because unlocking the wallet is required for many functions of `dcrwallet`, `dcrwallet` can be started with the `--promptpass` flag or setting `promptpass=true` in `dcrwallet.conf` (discussed [here](../../advanced/storing-login-details.md)).

---

## Checking Your Balance

To send the `getbalance` command to `dcrwallet` using `dcrctl`, enter the following in your shell:

```no-highlight
dcrctl --wallet getbalance
```

This will return all of the balances for all of your accounts.

---

## Getting a New Receiving Address

To send the `getnewaddress` command to `dcrwallet` using `dcrctl`, enter the following in your shell:

```no-highlight
dcrctl --wallet getnewaddress
```

This will generate and return a new payment address. To minimize address reuse, use this command to get a new address for each transaction you wish to receive.

---

## Sending DCR

To send DCR to an address, issue the `sendtoaddress` command to `dcrwallet` using `dcrctl`. Enter the following in your shell, filling in the receiving address and amount to send:

```no-highlight
dcrctl --wallet sendtoaddress <address> <amount>
```

If successful, `dcrctl` will return a transaction hash that can be used to watch the transaction on the official [Decred Block Explorer](../using-the-block-explorer.md).

---

## Check Network Stats

There are many different commands to check different network stats. Here we will cover sending `getinfo` to `dcrd` and `getstakeinfo` to `dcrwallet`.

To get information about your local `dcrd` node, issue the `getinfo` command to `dcrd` using `dcrctl`. Enter the following in your shell:

```no-highlight
dcrctl getinfo
```

To get staking information about the Proof-of-Stake network, issue the `getstakeinfo` command to `dcrwallet` using `dcrctl`. Enter the following in your shell:

```no-highlight
dcrctl --wallet getstakeinfo
```

---

## Additional Commands

More commands can also be found on the [dcrctl RPC Commands](../dcrctl-rpc-commands.md) page.

---
