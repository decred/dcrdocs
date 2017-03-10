# **dcrctl Basics**

Last updated for v0.8.2.

This guide is intended to help you learn the basic commands of the `dcrctl` application using [startup flags](/getting-started/startup-basics.md#startup-command-flags). 

**Prerequisites:**

- Use either the latest [dcrinstall](/getting-started/install-guide.md#dcrinstall) or [Binary Release archive](/getting-started/install-guide.md#binary-releases) archive to install `dcrctl`.
- Review how the launch commands for the Command Prompt (Windows) and Bash (OSX/Linux) shells differ [here](/getting-started/cli-differences.md).
- [Setup dcrd](/getting-started/user-guides/dcrd-setup.md) and have it running in the background.
- [Setup dcrwallet](/getting-started/user-guides/dcrwallet-setup.md) and have it running in the background.

---

`dcrctl` is the client that controls `dcrd` and `dcrwallet` via RPC commands. You will use `dcrctl` for many things such as checking your balance, buying tickets, creating transactions, and viewing network information.

**REMINDER:** This guide uses OS-agnostic examples for commands. Review the prerequisites to determine if you should be using `./dcrctl` or `dcrctl.exe` instead of `dcrctl`.

---

## Issuing dcrctl Commands

You will need to run dcrctl commands in a separate shell window (Command Prompt/Bash). Commands sent to either `dcrd` or `dcrwallet` will require the username/passwords set during [dcrd Setup](/getting-started/user-guides/dcrd-setup.md) and [dcrwallet Setup](/getting-started/user-guides/dcrwallet-setup.md).

To issue commands to `dcrwallet`, you will need to use `dcrctl -u [wallet username] -P [wallet password] --wallet [command]`.

To issue commands to `dcrd`, you will need to use `dcrctl -u [rpcuser] -P [rpcpass] [command]`.

These passwords can also be stored in a configuration file using this [Storing Login Details](/advanced/storing-login-details/) guide. If stored within configuration files, they do not need to be specified while issuing a `dcrctl` command.

## Unlocking Your Wallet

Some functionality of `dcrwallet` requires the wallet to be unlocked.

The command to unlock your wallet follows: 

```no-highlight
dcrctl -u [wallet username] -P [wallet password] --wallet walletpassphrase [private passphrase set during wallet creation] 0
```

Here, we are specifying for `dcrctl` to send the command to `dcrwallet` by using the `--wallet` flag. The `-u` and `-P` flags are specifying the username and password needed to send commands to `dcrwallet`. The actual command is `walletpassphrase` which accepts two parameters, your private passphrase and a time limit. Specifying `0` for a time limit unlocks `dcrwallet` without a time limit. Note, however, that this only unlocks the wallet for the current session. If you close the window the wallet is running in, or stop/restart the `dcrwallet`, you will need to unlock it again the next time you start it. 

If the command was successful, you will not get a confirmation from `dcrctl`, but if you look at your `dcrwallet` session, it will say:

```no-highlight
[INF] RPCS: The wallet has been unlocked without a time limit.
```

NOTE: Because unlocking the wallet is required for many functions of `dcrwallet`, `dcrwallet` can be started with the `--promptpass` flag or setting `promptpass=true` in `dcrwallet.conf` (discussed [here](/advanced/storing-login-details.md#dcrwalletconf)).

## Checking Your Balance

To send the `getbalance` command to `dcrwallet` using `dcrctl`, enter the following in your shell:

```no-highlight
dcrctl -u [wallet username] -P [wallet password] --wallet getbalance
```

This will return all of the balances for all of your accounts.

## Getting a New Receiving Address

To send the `getnewbalance` command to `dcrwallet` using `dcrctl`, enter the following in your shell:

```no-highlight
dcrctl -u [wallet username] -P [wallet password] --wallet getnewaddress
```

This will generate and return a new payment address. If you wish to minimize address reuse, use this command to get a new address for each transaction you wish to recieve.

## Sending DCR

To send DCR to an address, issue the `sendtoaddress` command to `dcrwallet` using `dcrctl`. Enter the following in your shell, filling in the receiving address and amount to send:

```no-highlight
dcrctl -u [wallet username] -P [wallet password] --wallet sendtoaddress [address] [amount]
```

If successful, `dcrctl` will return a transaction hash that can be used to watch the transaction on the official [Decred Block Explorer](/getting-started/using-the-block-explorer.md).

## Check Network Stats

There are many different commands to check different network stats. Here we will cover sending `getinfo` to `dcrd` and `getstakeinfo` to `dcrwallet`.

To get information about your local `dcrd` node, issue the `getinfo` command to `dcrd` using `dcrctl`. Enter the following in your shell:

```no-highlight
dcrctl -u [rpcuser] -P [rpcpass] getinfo
```

To get staking information about the Proof-of-Stake network, issue the `getstakeinfo` command to `dcrwallet` using `dcrctl`. Enter the following in your shell:

```no-highlight
dcrctl -u [wallet username] -P [wallet password] --wallet getstakeinfo
```

## dcrctl Commands and Help

To see a full list of commands that `dcrctl` can send to `dcrd` and `dcrwallet`, issue the following command in your shell:

```no-highlight
dcrctl -l
```

This will return a very long list of commands, separated by application. The commands on the top section are for `dcrd` and the commands on the bottom section are for `dcrwallet`. You can find out more about an individual command by typing the following for `dcrwallet` commands:

```no-highlight
dcrctl help --wallet [command]
```

or the following for `dcrd` commands:

```no-highlight
dcrctl help [command]
```

More commands can also be found on the [Program Options](/advanced/program-options.md) page.

---