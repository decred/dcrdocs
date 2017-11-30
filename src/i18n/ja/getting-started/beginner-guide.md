# Beginner's Guide 

Last updated for v1.0.1

---

## Welcome To Decred 

Welcome to Decred! We are very glad to have you. As you may or may not already know, Decred is different. There's a lot of new things to learn to fully grasp how things work. This documentation will attempt to make things a bit easier to understand.

This beginner's guide is a path to getting the Decred software up and running. You can choose from multiple clients to get a node on the network and Decred in your wallet. Specifically, you'll learn how to install, setup, and use the Decred applications; how to obtain DCR; how to vote via Proof-of-Stake; and how to use the block explorer.

You'll need to follow an [Installation Guide](#installation-guides), and then follow the path for the application of your choice below. After your application is set-up, go through the [General Guides](#general-guides) at the bottom of this page. If you have any questions along the way, join us in our [Slack](/support-directory.md#join-us-on-slack).

**NOTE: Using Testnet is highly recommended for learning how to use the Decred software without the fear of making a mistake and losing real money. After following the guides to setup your choice of software, please visit the [Using Testnet guide](/getting-started/using-testnet.md) to learn how to launch your application onto Decred's testnet.**

---

## Applications 

Below you'll find a list of currently available applications, with a chart showing their compatibility with different operating systems.

**Paymetheus**: The only Windows GUI client as of v1.1.0. <br />
**dcrd**: The node daemon, this command-line application handles block management and consensus. <br />
**dcrwallet**: The wallet daemon, this command-line application handles address and transaction management. <br />
**dcrctl**: The remote procedure call (RPC) client, this command-line application is used to control dcrd and dcrwallet via RPC commands. <br />
**Decrediton**: Cross-platform GUI client as of v1.1.0.

|           | Paymetheus | dcrd | dcrwallet | dcrctl | Decrediton |
| ---------:|:----------:|:----:|:---------:|:------:|:-----------:|
| Windows   | X          | X    | X         | X      |             |
| macOS     |            | X    | X         | X      | X           |
| Linux     |            | X    | X         | X      | X           |
| Other UNIX|            | X    | X         | X      |             |

"Other UNIX" currently includes various *BSDs and Solaris/illumos.

Note: You might soon notice one of the many differences between Decred and other 
popular cryptocurrencies: the wallet daemon and node daemon are separate.
A lot of other coins run these functions together in a single daemon.
For those who choose to use the command line interfaces, this means you must
run `dcrd` for full node functionality, and `dcrwallet` to store your DCR,
create transactions and participate in Proof-of-Stake mining/voting.

---

## Installation Guides 

To get started, choose an option for installations available for your operating system below:

* [Paymetheus](/getting-started/user-guides/paymetheus.md)
* [Command Line Suite **via dcrinstall**](/getting-started/user-guides/cli-installation.md) - NOTE: The `dcrinstall` method is the fastest and easiest way to get a command-line node and wallet running. It is recommended and the command-line path setup guides below will assume you've used this method.
* [Decrediton (ALPHA)](/getting-started/user-guides/decrediton-setup.md)

---

**NOTE:** All of the following guides can be found in the navigation menu with the same names.

## Paymetheus Path 

The following guides, in order, will get you started with Paymetheus:

* [Paymetheus Setup](/getting-started/user-guides/paymetheus.md)
* [Using Paymetheus](/getting-started/user-guides/using-paymetheus.md)

## Decrediton Path 

The following guide will help you load Decrediton:

* [Decrediton Setup](/getting-started/user-guides/decrediton-setup.md)

## Command-Line Path 

The following guides, in order, will get you started with the Command-Line Applications (`dcrd`, `dcrwallet`, `dcrctl`):

* [Command-Line Differences](/getting-started/cli-differences.md)
* [Startup Option Basics](/getting-started/startup-basics.md)
* [dcrd Setup](/getting-started/user-guides/dcrd-setup.md)
* [dcrwallet Setup](/getting-started/user-guides/dcrwallet-setup.md)
* [dcrctl Basic Usage](/getting-started/user-guides/dcrctl-basics.md)

## General Guides 

The following guides are independent of the different applications:

* [Using Testnet](/getting-started/using-testnet.md)
* [Obtaining DCR](/getting-started/obtaining-dcr.md)
* [Using the Block Explorer](/getting-started/using-the-block-explorer.md)
* [Proof-of-Stake Guide](/mining/proof-of-stake.md)
* [Mainnet Voting Guide](/getting-started/user-guides/agenda-voting.md)
