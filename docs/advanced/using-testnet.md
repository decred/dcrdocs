# Using Testnet

Last updated for testnet3

---

## Why Use Testnet?

The testnet is a wonderful place where you can experiment with the Decred applications without worrying that a mistake will cost you real money. It is actually recommended that people use the testnet to learn the basics of the Decred software and any new features.

Decred is currently on its 3rd Testnet, also known as testnet3. Testnets are periodically reset to help keep a manageable blockchain file size.

---

## How to Run a Testnet Node

Running a testnet3 node is incredibly easy. Your application of choice will need to download the testnet3 blockchain, and you will need to create a new wallet file for testnet3 use. Your mainnet blockchain and wallet files will remain untouched. Switching between the two is incredibly easy.

---

## Decrediton

You can switch Decrediton between mainnet and testnet in the Settings tab by using the dropdown box labelled "Network".

---

## Command-Line Suite

To launch `dcrd` and `dcrwallet` on testnet, simply add the `--testnet` flag to your launch command. Alternatively, you could put `testnet=1` in all of your config files, but it's usually much faster to use the startup flag.

On the first launch of `dcrd --testnet`, `dcrd` will begin downloading the testnet3 blockchain to the `data/testnet3` folder of `dcrd`'s home directory.

Before you're able to launch `dcrwallet` with the `--testnet` flag, you must create a separate testnet wallet using the `dcrwallet --testnet --create` command. The steps are the same as those found in the [dcrwallet Setup Guide](../wallets/cli/dcrwallet-setup.md).

To issue commands to both `dcrwallet` and `dcrd`, you must also add the `--testnet` flag to any of the `dcrctl` commands that you use. E.g. you would issue the `dcrctl --testnet --wallet getbalance` command to check your testnet balance.

---

## Acquiring Testnet Coins

You can acquire coins through the [Decred Testnet Faucet](https://faucet.decred.org). Please return any coins to the address listed at the bottom of that page when you're done playing with the testnet.
