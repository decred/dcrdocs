# dcrwallet Setup Guide

This guide is intended to help you setup the `dcrwallet` application using [startup flags](startup-basics.md#startup-command-flags).

**Prerequisites:**

- Use the latest [dcrinstall](cli-installation.md) to install `dcrwallet`. Additional steps will be required if another installation method was used.
- Review how the launch commands differ for the Command Prompt (Windows) and Bash (macOS/Linux) shells, and how the home directories differ [here](os-differences.md).
- [Setup dcrd](dcrd-setup.md) and have it running in the background.

---

`dcrwallet` is the daemon that handles Decred wallet functionality for a single user. It manages all of your accounts, addresses, and transactions; tracks balances across addresses; and allows stakeholders to participate in Proof-of-Stake voting.

In order to run `dcrwallet`, a `wallet.db` must exist within `dcrwallet`'s home directory. In order for that file to exist, you must create a new wallet. `dcrinstall` automatically starts the creation process. If you delete your wallet.db or used another installation process, you'll have to run the [manual wallet creation command](#manual-wallet-creation-command).

--8<-- "seed-warning.md"

---

## Manual Wallet Creation Command

If you do not already have a `wallet.db` file stored in `dcrwallet`'s home directory, you must run the `dcrwallet --create` command. Steps for this can be found below.

1. Open a new shell window (Bash/Command Prompt/etc,..).
1. Navigate to the directory of the `dcrwallet` executable.
1. Enter the command `dcrwallet --create` (review the Prerequisites above if you are unsure whether you should use `./dcrwallet` or `dcrwallet.exe` for the previous command).

---

## Wallet Creation Walkthrough

During this process, you'll set a private passphrase, optionally set a public passphrase, and record your seed. To accomplish this, follow the steps below:

1. Set Passphrases for Your Wallet

    If the `dcrwallet --create` command successfully executed, you should be greeted by the following text:

        Enter the private passphrase for your new wallet:

    This first passphrase, the private passphrase, is what you will use to unlock your wallet when creating transactions or voting with Proof-of-Stake. Please use a unique and strong password. This password also protects the private keys within your wallet file, securing it from theft.

    After you've verified your private passphrase, you should see the following prompt:

        Do you want to add an additional layer of encryption for public data? (n/no/y/yes) [no]:

    The public passphrase is optional. It is used to encrypt all of the public data (transactions and addresses) within your wallet file so if it is stolen, an adversary can't link you to your transactions.

1. Record Your Seed

    Before creating a new seed for your wallet, please review the Critical Information section above.

    After you've set your private passphrase and optional public passphrase, you'll see the following prompt:

        Do you have an existing wallet seed you want to use? (n/no/y/yes) [no]:

    This guide assumes you do not have an existing seed, so continue by hitting `Enter` which will answer the prompt with the default `[no]`. NOTE: If you wish to restore your wallet by using your seed, you would simply enter `[yes]` here and follow the instructions on screen.

    After answering `[no]`, your seed phrase (wallet generation seed) and its hex will be displayed in the window. Please read through the IMPORTANT section displayed immediately after the hex.

    It cannot be stressed enough how important it is to save your seed phrase in a secure location, so if you haven't committed this to memory, please review the Critical Information section above.

    Once you have written down the seed phrase and hex, type `OK` and press `Enter`. NOTE: if you did not write the phrase down before continuing, you should start this process over after [deleting your wallet file](../../advanced/deleting-your-wallet.md)

    After pressing `Enter`, you should see the following message:

        Creating the wallet...
        The wallet has been created successfully.

    The wallet will then be created. This might take a few minutes if you have a slow computer.

---

## Launching dcrwallet

In order to launch `dcrwallet`, you first must have [created your wallet](#wallet-creation-walkthrough) and
[connected dcrd to the Decred network](dcrd-setup.md#connect-to-the-decred-network).

1. Configure RPC Username and Password

    If you used [`dcrinstall`](cli-installation.md), your configuration files are already setup with the RPC username/password for `dcrd`, `dcrwallet`, and `dcrctl`.

    If you did not use `dcrinstall`, you will need to enable the bare minimum settings in your configuration files. Follow [this guide](../../advanced/manual-cli-install.md#minimum-configuration) to do so.

1. Start dcrwallet

    With the correctly set configuration files, open another shell window in your Decred directory (or use the last window if you have just created your wallet). Type the following command (review this guide’s Prerequisites to determine the right command for your OS/Shell application):

        dcrwallet

    Your `dcrwallet` will now connect to the network via `dcrd`. It will begin to scan the network for your active addresses which can take a few minutes on slow computers. Eventually it will start showing lines like:

        [INF] WLLT: Connecting block 0000000000002004ea8fa74af334cb291a22832642b5be603995683534bbb97b, height 9990

    This means your wallet is successfully connected to the network
    through your daemon.

---

To learn how to use `dcrd` and `dcrwallet`, visit the [dcrctl Basics](dcrctl-basics.md) guide. You'll learn how to unlock your wallet, send and receive DCR using `dcrctl`, check your balance, and check various network stats.
