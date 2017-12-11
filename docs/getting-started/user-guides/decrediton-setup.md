# Decrediton Setup Guide 

Last updated for v1.1.1.

---

`Decrediton` is a graphical user interface for `dcrwallet`. When this application launches, it automatically starts its own instance of the command line tools `dcrd` and `dcrwallet` in the background.

---

## Download and Install 

The latest version of Decrediton can be downloaded from [https://decred.org/downloads/](https://decred.org/downloads/). As of v1.1.1, Decrediton is available for Windows, macOS and Linux.

> Windows

1. Download the Windows installer `decrediton-1.1.1.exe`.

1. Double click the installer and follow the instructions. This will install and automatically start up Decrediton to download the Decred blockchain and set up your wallet.

1. The installer adds a shortcut to Decrediton on your desktop for next time you want to use it.

> macOS

1. Download the `decrediton-1.1.1.dmg` file.

1. Double click the `decrediton-1.1.1.dmg` file once downloaded to mount the disk image.

1. Drag the decrediton.app into the link to your Applications folder within the disk image.

> Linux

1. Download the `decrediton-1.1.1.tar.gz` file.

1. Navigate to download location and extract the .tar.gz file:

    Ubuntu File Browser: simply right click on the .tar.gz file and press "Extract Here". <br />
    Terminal: use the `tar -xvzf filename.tar.gz` command.

    Both of these should extract the tar.gz into a folder that shares the same name. (`e.g. tar -xvzf decrediton-v1.1.1.tar.gz` should extract to `decrediton-v1.1.1`). If successful, this new folder should include a `decrediton` executable.

---

## Critical Information 

During the creation process for your wallet, you will be given a sequence of 33 words known as a seed phrase. This seed phrase is essentially the private key for your wallet. You will be able to use this seed phrase to restore your private keys, transaction history, and balances using any Decred wallet on any computer. 

This ultimately means that *anyone* who knows your seed can use it to restore your private keys, transaction history, and balances to a Decred wallet on their computer without your knowledge. For this reason, it is of utmost importance to keep your seed phrase safe. Treat this seed the same way you would treat a physical key to a safe. If you lose your seed phrase, you permanently lose access to your wallet and all funds within it. It cannot be recovered by anyone, including the Decred developers. It is recommended you write it down on paper and store that somewhere secure. If you decide to keep it on your computer, it would be best to keep it in an encrypted document (do not forget the password) in case the file or your computer is stolen.

**REMINDER: DO NOT, UNDER ANY CIRCUMSTANCES, GIVE YOUR SEED OR THE ASSOCIATED HEX KEY TO ANYONE! NOT EVEN THE DEVELOPERS!**

---

## Opening and Setting Up Decrediton

Decrediton will display the following screen when it is opened for the first time:

![Decrediton create wallet screen](/img/decrediton/create-wallet.jpg)

To create a brand new Decred wallet, continue to read the next section. If you have used Decred before and wish to restore an existing wallet, skip this section and read [Restore Existing Wallet From Seed](/getting-started/user-guides/decrediton-setup.md#restore-existing-wallet-from-seed)

---

## Creating a New Wallet

1. The 33 word seed for your new wallet is displayed in the text box (blurred in the above image). Record the seed and store it somewhere safe. You will need to re-enter this seed on the next screen.

1. Press "Continue"

1. Confirm your seed by entering the words into the confirmation box.
![Decrediton seed entry screen](/img/decrediton/seed-entered.jpg)

1. Create a private passphrase for your wallet. This passphrase will be used to unlock your wallet when creating transactions.

1. Press "Create Wallet". You should then see a spinning Decred logo. This will spin until `dcrd` has fully synced the blockchain.
![Decrediton loading screen](/img/decrediton/loading.jpg)

1.  On computers that haven't had `dcrd` loaded before, this should take 1-2 hours with newer hardware (it may take longer with older hardware). You can check your process monitor application for a running instance of `dcrd` - if it is using a substantial percentage of your CPU, it is syncing. If it isn't, Decrediton may require a restart to move beyond this screen.

1. When the whole blockchain has been scanned, Decrediton will open the Overview page displaying your current balance and recent transactions:
![Decrediton overview screen](/img/decrediton/open-wallet.jpg)

---

## Restore Existing Wallet From Seed

1. If you already have a wallet seed you can use it by clicking on the "Existing Seed" button.

1. Enter your seed into the "Confirm Seed" text box.

1. Create a private passphrase for your wallet.

1. Press "Create Wallet". Wait for the blockchain to be scanned.

---

## Troubleshooting

*Decrediton will not start!*

![Decrediton error window](/img/decrediton/dcrd-error.jpg)

If you are seeing the error above, it may be because there is already a running instance of `dcrd` on your machine. Decrediton attempts to start its own instance of `dcrd` and `dcrwallet` in the background. Kill any running instances of `dcrd` and restart Decrediton.

*Where does Decrediton store data/write log files?*

Decrediton stores the blockchain, your wallet, log files and its own configuration files all in a single directory. A different directory is used depending on the operating system:

| OS      | Decrediton data directory                           |
| -------:|:---------------------------------------------------:|
| Windows | `C:\Users\<your-username>\AppData\Local\Decrediton` |
| macOS   | `~/Library/Application Support/decrediton`          |
| Linux   | `~/.config/decrediton`                              |
