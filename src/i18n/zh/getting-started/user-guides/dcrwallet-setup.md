# dcrwallet Setup Guide 

Last updated for v1.0.0.

This guide is intended to help you setup the `dcrwallet` application using [startup flags](/getting-started/startup-basics.md#startup-command-flags). 

**Prerequisites:**

- Use the latest [dcrinstall](/getting-started/user-guides/cli-installation.md) to install `dcrwallet`. Additional steps will be required if another installation method was used.
- Review how the launch commands differ for the Command Prompt (Windows) and Bash (macOS/Linux) shells, and how the home directories differ [here](/getting-started/cli-differences.md).
- [Setup dcrd](/getting-started/user-guides/dcrd-setup.md) and have it running in the background.

---

`dcrwallet` is the daemon that handles Decred wallet functionality for a single user. It manages all of your accounts, addresses, and transactions; tracks balances across addresses; and allows stakeholders to participate in Proof-of-Stake voting.

In order to run `dcrwallet`, a `wallet.db` must exist within `dcrwallet`'s home directory. In order for that file to exist, you must create a new wallet. `dcrinstall` automatically starts the creation process. If you delete your wallet.db or used another installation process, you'll have to run the [manual wallet creation command](#manual-wallet-creation-command).

---

## Critical Information 

During the creation process for your wallet, you will be given a sequence of 33 words known as a seed phrase. This seed phrase is essentially the private key for your wallet. You will be able to use this seed phrase to restore your private keys, transaction history, and balances using any Decred wallet on any computer. 

This ultimately means that *anyone* who knows your seed can use it to restore your private keys, transaction history, and balances to a Decred wallet on their computer without your knowledge. For this reason, it is of utmost importance to keep your seed phrase safe. Treat this seed the same way you would treat a physical key to a safe. If you lose your seed phrase, you permanently lose access to your wallet and all funds within it. It cannot be recovered by anyone, including the Decred developers. It is recommended you write it down on paper and store that somewhere secure. If you decide to keep it on your computer, it would be best to keep it in an encrypted document (do not forget the password) in case the file or your computer is stolen.

Every seed phrase is also associated with a 64 character seed hex. The seed hex functions the same way as the seed phrase - `dcrwallet` will accept it when attempting to restore your wallet. It is also important to keep your seed hex secure.

**REMINDER: DO NOT, UNDER ANY CIRCUMSTANCES, GIVE YOUR SEED OR THE ASSOCIATED HEX KEY TO ANYONE! NOT EVEN THE DEVELOPERS!**

---

## Manual Wallet Creation Command 

If you do not already have a `wallet.db` file stored in `dcrwallet`'s home directory, you must run the `dcrwallet --create` command. Steps for this can be found below. 

1. Open a new shell window (Bash/Command Prompt/etc,..).
2. Navigate to the directory of the `dcrwallet` executable.
3. Enter the command `dcrwallet --create` (review the Prerequisites above if you are unsure whether you should use `./dcrwallet` or `dcrwallet.exe` for the previous command). 

---

## Wallet Creation Walkthrough 

During this process, you'll set a private passphrase, optionally set a public passphrase, and record your seed. To accomplish this, follow the steps below:

> Set Passphrases for Your Wallet

If the `dcrwallet --create` command successfully executed, you should be greeted by the following text:

```no-highlight
Enter the private passphrase for your new wallet:
```

This first passphrase, the private passphrase, is what you will use to unlock your wallet when creating transactions or voting with Proof-of-Stake. Please use a unique and strong password. This password also protects the private keys within your wallet file, securing it from theft.

After you've verified your private passphrase, you should see the following prompt:

```no-highlight
Do you want to add an additional layer of encryption for public data? (n/no/y/yes) [no]:
```

The public passphrase is optional. It is used to encrypt all of the public data (transactions and addresses) within your wallet file so if it is stolen, an adversary can't link you to your transactions. 

> Record Your Seed

Before creating a new seed for your wallet, please review the [Critical Information section](/getting-started/user-guides/dcrwallet-setup.md#critical-information).

After you've set your private passphrase and optional public passphrase, you'll see the following prompt:

```no-highlight
Do you have an existing wallet seed you want to use? (n/no/y/yes) [no]:
```

This guide assumes you do not have an existing seed, so continue by hitting `Enter` which will answer the prompt with the default `[no]`. NOTE: If you wish to restore your wallet by using your seed, you would simply enter `[yes]` here and follow the instructions on screen.

<i class="fa fa-exclamation-triangle"></i> **DO NOT USE THE SAME SEED IN MULTIPLE WALLETS! Visit [Wallets and Seeds FAQ](/faq/wallets-and-seeds.md#3-can-i-run-multiple-wallets) to see why this matters. It is recommended that where possible a new wallet should mean generating a new seed.** 

After answering `[no]`, your seed phrase (wallet generation seed) and its hex will be displayed in the window. Please read through the IMPORTANT section displayed immediately after the Hex.

It cannot be stressed enough how important it is to save your seed phrase in a secure location, so if you haven't committed this to memory, please review the [Critical Information section](/getting-started/user-guides/dcrwallet-setup.md#critical-information) again.

Once you have written down the seed phrase and hex, type `OK` and press `Enter`. NOTE: if you did not write the phrase down before continuing, you should [start this process over](/getting-started/user-guides/dcrwallet-setup.md#create-a-new-wallet) after [deleting your wallet file](/advanced/deleting-your-wallet.md)

After pressing `Enter`, you should see the following message:

```no-highlight
Creating the wallet...
The wallet has been created successfully.
```

The wallet will then be created. This might take a few minutes if you have a slow computer.

---

## Launching dcrwallet 

In order to launch `dcrwallet`, you first must have [created your wallet](#wallet-creation-walkthrough) and
[connected dcrd to the Decred network](/getting-started/user-guides/dcrd-setup.md#connect-to-the-decred-network).

> Configure RPC Username and Password

If you used [`dcrinstall`](/getting-started/user-guides/cli-installation.md), your configuration files are already setup with the RPC username/password for `dcrd`, `dcrwallet`, and `dcrctl`.

If you did not use `dcrinstall`, you will need to enable the bare minimum settings in your configuration files. Follow [this guide](/advanced/manual-cli-install.md#minimum-configuration) to do so.

> Start dcrwallet 

With the correctly set configuration files, open another shell window in your Decred directory (or use the last window if you have just created your wallet). Type the following command (review this guide’s Prerequisites to determine the right command for your OS/Shell application):

```no-highlight
dcrwallet
```

Your `dcrwallet` will now connect to the network via `dcrd`. It will begin to scan the network for your active addresses which can take a few minutes on slow computers. Eventually it will start showing lines like:

```no-highlight
[INF] WLLT: Connecting block 0000000000002004ea8fa74af334cb291a22832642b5be603995683534bbb97b, height 9990
```

This means your wallet is successfully connected to the network
through your daemon.

---

To learn how to use `dcrd` and  `dcrwallet`, visit the [dcrctl Basics](/getting-started/user-guides/dcrctl-basics.md) guide. You'll learn how to unlock your wallet, send and receive DCR using `dcrctl`, check your balance, and check various network stats.
