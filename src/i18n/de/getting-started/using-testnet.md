# Using Testnet Guide

last updated for testnet2

---

## Why Use Testnet?

The testnet is a wonderful place where you can experiment with the Decred applications without worrying that a mistake will cost you real money. It is actually recommended that people use the testnet to learn the basics of the Decred software and any new features.

Decred is currently on its 2nd Testnet, also known as testnet2. Testnets are periodically reset to help keep a manageable blockchain file size. 

---

## How to Run a Testnet Node

Running a testnet2 node is incredibly easy. You application of choice will need to download the testnet2 blockchain, and you will need to create a new wallet file for testnet2 use. Your mainnet blockchain and wallet files will remain untouched. Switching between the two is incredibly easy.

---

## Paymetheus

To launch `Paymetheus` on testnet2, simply launch the `Decred Testnet` application instead of the usual `Decred` application. You will then be walked through the wallet creation (the same steps in the [Paymetheus Setup guide](/getting-started/user-guides/paymetheus.md)). After `dcrd` finishes syncing in the background, you'll then be able to fill your `Paymetheus` wallet with testnet DCR and familiarize yourself with the software.

---

## Decrediton 

To launch `Decrediton` on testnet2, you have to launch `Decrediton` from the command line with the `--testnet` flag. Keep in mind that using the flag once will make it always start in that mode until you use the `--mainnet` flag to switch back to the mainnet blockchain.

For Linux, 

1. Open your terminal and navigate to the directory with the decrediton executable.
2. Issue the command `./decrediton --testnet`.
3. Decrediton will launch and attempt to connect to testnet2.

For macOS,

1. Open your terminal and issue the following command: `/Applications/decrediton.app/Contents/MacOS/decrediton --testnet`
2. Decrediton will launch and attempt to connect to testnet2.

Remember, if you want to switch Decrediton back to mainnet, you'll need to issue those commands with the `--mainnet` flag.

___ 

## Command-Line Suite

To launch `dcrd` and `dcrwallet` on testnet, simply add the `--testnet` flag to your launch command. Alternatively, you could put `testnet=1` in all of your config files, but it's usually much faster to use the startup flag.

On the first launch of `dcrd --testnet`, `dcrd` will begin downloading the testnet2 blockchain to the `data/testnet2` folder of `dcrd`'s home directory.

Before you're able to launch `dcrwallet` with the `--testnet` flag, you must create a separate testnet wallet using the `dcrwallet --testnet --create` command. The steps are the same as those found in the [dcrwallet Setup Guide](/getting-started/user-guides/dcrwallet-setup.md). 

To issue commands to both `dcrwallet` and `dcrd`, you must also add the `--testnet` flag to any of the `dcrctl` commands that you use. E.g. you would issue the `dcrctl --testnet --wallet getbalance` command to check your testnet balance. 

---

## Acquiring Testnet Coins

You can acquire coins through the [Decred Testnet Faucet](https://faucet.decred.org). Please return any coins to the address listed at the bottom of that page when you're done playing with the testnet.

---

