# **Beginner's Guide**

Last updated for v0.8.2

---

## **Welcome To Decred**

Welcome to the world of Decred! We know that getting started with any new cryptocurrency
can be difficult and we want to make the journey as easy as possible. Decred is well
documented, with everything from basic information such as, "how do I send decred", to
super technical stuff like "why did you choose a BLAKE-256 hash function, and how does
it compare to the Merkle-Damgård construction?".

So that you don't get overwhelmed by the amount of information available, we have created
this beginner's guide through the documentation. By following the links at the bottom of a few pages, you'll learn how to install, setup, and use the Decred applications; how to obtain DCR; how to vote via Proof-of-Stake; how to use the block explorer; and configure the software to use on the Testnet. 

---

## **Applications**

Below you'll find a list of currently available applications, with a chart showing their compatibility with different operating systems.

**Paymetheus**: The only Windows GUI client as of v0.8.2. <br />
**dcrd**: The node daemon, this command-line application handles block management and consensus. <br />
**dcrwallet**: The wallet daemon, this command-line application handles address and transaction management. <br />
**dcrctl**: The remote procedure call (RPC) client, this command-line application is used to control dcrd and dcrwallet via RPC commands. <br />
**Decrediton**: ALPHA cross-platform GUI client as of v0.8.2.

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

## **Installation Guides**

To get started, choose an option for installations available for your operating system below:

* [Paymetheus](/getting-started/install-guide.md#paymetheus)

* [Command Line Suite **via dcrinstall**](/getting-started/install-guide.md#dcrinstall) - NOTE: The `dcrinstall` method is the fastest and easiest way to get a command-line node and wallet running. It is recommended and the command-line path setup guides below will assume you've used this method.
* [Decrediton (ALPHA)](/getting-started/install-guide.md#decrediton)

---

**NOTE:** All of the following guides can be found in the navigation menu with the same names.

## **Paymetheus Path**

The following guides, in order, will get you started with Paymetheus:

* [Paymetheus Setup](/getting-started/user-guides/paymetheus.md)
* [Using Paymetheus](/getting-started/user-guides/using-paymetheus.md)

## **Decrediton Path**

The following guide will help you load Decrediton:

* [Decrediton Setup](/getting-started/user-guides/decrediton-setup.md)

## **Command-Line Path**

The following guides, in order, will get you started with the Command-Line Applications (`dcrd`, `dcrwallet`, `dcrctl`):

* [Command-Line Differences](/getting-started/cli-differences.md)
* [Startup Option Basics](/getting-started/startup-basics.md)
* [dcrd Setup](/getting-started/user-guides/dcrd-setup.md)
* [dcrwallet Setup](/getting-started/user-guides/dcrwallet-setup.md)
* [dcrctl Basic Usage](/getting-started/user-guides/dcrctl-basics.md)

## **General Guides**

The following guides are independent of the different applications:

* [Obtaining DCR](/getting-started/obtaining-dcr.md)
* [Using the Block Explorer](/getting-started/using-the-block-explorer.md)
* [Proof-of-Stake Guide](/mining/proof-of-stake.md)
