# dcrctl Basics 

Last updated for v1.0.0.

This guide is intended to help you learn the basic commands of the `dcrctl` application using a [minimal configuration file](/advanced/manual-cli-install.md#minimum-configuration). 

**Prerequisites:**

- Use the latest [dcrinstall](/getting-started/user-guides/cli-installation.md) to install `dcrctl`. Additional steps will be required if another installation method was used.
- Review how the launch commands for the Command Prompt (Windows) and Bash (macOS/Linux) shells differ [here](/getting-started/cli-differences.md).
- [Setup dcrd](/getting-started/user-guides/dcrd-setup.md) and have it running in the background.
- [Setup dcrwallet](/getting-started/user-guides/dcrwallet-setup.md) and have it running in the background.

---

`dcrctl` is the client that controls `dcrd` and `dcrwallet` via remote procedure call (RPC). You can use `dcrctl` for many things such as checking your balance, buying tickets, creating transactions, and viewing network information.

**REMINDER:** This guide uses OS-agnostic examples for commands. Review the prerequisites to determine if you should be using `./dcrctl` or `dcrctl.exe` instead of `dcrctl`.

---

> Configure RPC Username and Password

Commands sent to either `dcrd` or `dcrwallet` will require RPC username/passwords to be setup in the configuration files.

If you used [`dcrinstall`](/getting-started/user-guides/cli-installation.md), your configuration files are already setup with the RPC username/password for `dcrd`, `dcrwallet`, and `dcrctl`.

If you did not use `dcrinstall`, you will need to enable the bare minimum settings in your configuration files. Follow [this guide](/advanced/manual-cli-install.md#minimum-configuration) to do so.

---

## dcrctl Commands

You will need to run dcrctl commands in a separate shell window (Command Prompt/Bash).

To issue commands to `dcrwallet`, you will need to use `dcrctl --wallet <command>`.

To issue commands to `dcrd`, you will need to use `dcrctl <command>`.

To see a full list of commands that `dcrctl` can send to `dcrd` and `dcrwallet`, issue the following command in your shell:

```no-highlight
dcrctl -l
```

This will return a very long list of commands, separated by application. The commands on the top section are for `dcrd` and the commands on the bottom section are for `dcrwallet`. You can find out more about an individual command by typing the following for `dcrwallet` commands:

```no-highlight
dcrctl help --wallet <command>
```

or the following for `dcrd` commands:

```no-highlight
dcrctl help <command>
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

NOTE: Because unlocking the wallet is required for many functions of `dcrwallet`, `dcrwallet` can be started with the `--promptpass` flag or setting `promptpass=true` in `dcrwallet.conf` (discussed [here](/advanced/storing-login-details.md#dcrwalletconf)).

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

If successful, `dcrctl` will return a transaction hash that can be used to watch the transaction on the official [Decred Block Explorer](/getting-started/using-the-block-explorer.md).

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

More commands can also be found on the [Program Options](/advanced/program-options.md) page.

---
