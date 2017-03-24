# **dcrwallet Setup Guide**

Last updated for v0.8.2.

This guide is intended to help you setup the `dcrwallet` application using [startup flags](/getting-started/startup-basics.md#startup-command-flags). 

**Prerequisites:**

- Use either the latest [dcrinstall](/getting-started/install-guide.md#dcrinstall) or [Binary Release archive](/getting-started/install-guide.md#binary-releases) archive to install `dcrwallet`.
- Review how the launch commands for the Command Prompt (Windows) and Bash (OSX/Linux) shells differ [here](/getting-started/cli-differences.md).
- [Setup dcrd](/getting-started/user-guides/dcrd-setup.md) and have it running in the background.

---

`dcrwallet` is the daemon that handles Decred wallet functionality for a single user. It manages all of your accounts, addresses, and transactions; tracks balances across addresses; and allows stakeholders to participate in Proof-of-Stake voting.

---

## **Critical Information**

During the creation process for your wallet, you will be given a sequence of 33 words known as a seed phrase. This seed phrase is essentially the private key for your wallet. You will be able to use this seed phrase to restore your private keys, transaction history, and balances using any Decred wallet on any computer. 

This ultimately means that *anyone* who knows your seed can use it to restore your private keys, transaction history, and balances to a Decred wallet on their computer. For this reason, it is of utmost importance to keep your seed phrase safe. Treat this seed the same way you would treat a physical key to a safe. If you lose your seed phrase, you permanently lose access to your wallet and all funds within it. It cannot be recovered by anyone, including the Decred developers. It is recommended you write it down on paper and store that somewhere secure. If you decide to keep it on your computer, it would be best to keep it in an encrypted document (do not forget the password) in case the file or your computer is stolen.

Every seed phrase is also associated with a 64 character seed hex. The seed hex functions the same way as the seed phrase - `dcrwallet` will accept it when attempting to restore your wallet. It is also important to keep your seed hex secure.

**REMINDER: DO NOT, UNDER ANY CIRCUMSTANCES, GIVE YOUR SEED OR THE ASSOCIATED HEX KEY TO ANYONE! NOT EVEN THE DEVELOPERS!**

---

## **Create a New Wallet**

To create a new wallet, you must run the `dcrwallet --create` command, set a private passphrase, optionally set a public passphrase, and record your seed. To accomplish this, follow the steps below.

> Run the Wallet Creation Command

1. With the `dcrd` daemon running (as noted in the Prerequisites), open a new shell window (Bash/Command Prompt/etc,..).
2. Navigate to the directory of the `dcrwallet` executable
3. Enter the command `dcrwallet --create` (review the Prerequisites above if you are unsure whether you to use `./dcrwallet` or `dcrwallet.exe` for the previous command). 

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

The previous passphrase is optional. It is used to encrypt all of the public data (transactions and addresses) within your wallet file so if it is stolen, an adversary can't link you to your transactions. 

> Record Your Seed

Before creating a new seed for your wallet, please review the [Critical Information section](/getting-started/user-guides/dcrwallet-setup.md#critical-information).

After you've set your private passphrase and optional public passphrase, you'll see the following prompt:

```no-highlight
Do you have an existing wallet seed you want to use? (n/no/y/yes) [no]:
```

This guide assumes you do not have an existing seed, so continue by hitting `Enter` which will answer the prompt with the default `[no]`. NOTE: If you wish to restore your wallet by using your seed, you would simple enter `[yes]` here and follow the instructions on screen.

After answering `[no]`, your seed phrase (wallet generation seed) and its hex will be displayed in the window. Please read through the IMPORTANT section displayed immediately after the Hex.

It cannot be stressed enough how important it is to save your seed phrase in a secure location, so if you haven't committed this to memory, please review the [Critical Information section](/getting-started/user-guides/dcrwallet-setup.md#critical-information) again.

Once you have written down the seed phrase and hex type `OK` and press `Enter`. NOTE: if you did not write the phrase down before continuing, you should [start this process over](/getting-started/user-guides/dcrwallet-setup.md#create-a-new-wallet) after [deleting your wallet file](/advanced/deleting-your-wallet.md)

After pressing `Enter`, you should see the following message:

```no-highlight
Creating the wallet...
The wallet has been created successfully.
```

The wallet will then be created. This might take a few minutes if you have a slow computer.

## **Connect dcrwallet to dcrd**

Now that you have [created your wallet](#create-a-new-wallet) and
[connected dcrd to the Decred network](/getting-started/user-guides/dcrd-setup.md#connect-to-the-decred-network),
you need to link `dcrwallet` to the network using `dcrd` so it can send and receive coins and participate in mining.

> Start dcrwallet with Wallet and dcrd Usernames and Passwords

Open another shell window in your Decred directory (or use the last window if you have just created your wallet). Type the following command, filling in your own info inside square brackets:

```no-highlight
dcrwallet -u [wallet username] -P [wallet password] --dcrdusername=[rpcuser] --dcrdpassword=[rpcpass]
```

* The **wallet username** you have not yet used, so just make one up. It is only used to allow `dcrctl` to connect to `dcrwallet` when issuing wallet commands.
* The **wallet password** you have also not yet used, so just make one up. It is only used to allow `dcrctl` to connect to `dcrwallet` when issuing wallet commands. Note the capital P, this flag is case sensitive.
* Third and fourth are the `rpcuser` and `rpcpass` you used when setting up the `dcrd` daemon in the [dcrd Setup](/getting-started/user-guides/dcrd-setup.md#connect-to-the-decred-network) guide.
* Alternatively, if you use the same username/password combination for both dcrd and dcrwallet you can skip `--dcrdusername` and `--dcrdpassword` and just use `-u` and `-P`.

Your `dcrwallet` will now connect to the network via `dcrd`. It will begin to scan the network for your active addresses which can take a few minutes on slow computers. Eventually it will start showing lines like:

```no-highlight
[INF] WLLT: Connecting block 0000000000002004ea8fa74af334cb291a22832642b5be603995683534bbb97b, height 9990
```

This means your wallet is successfully connected to the network
through your daemon.

---

To learn how to use `dcrd` and  `dcrwallet`, visit the [dcrctl Basics](/getting-started/user-guides/dcrctl-basics.md) guide. You'll learn how to unlock your wallet, send and receive DCR using `dcrctl`, check your balance, and check various network stats.
