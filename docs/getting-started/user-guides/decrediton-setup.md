# <img class="dcr-icon" src="/img/dcr-icons/Wallet.svg" /> Decrediton Setup Guide

Last updated for v1.2.1.

---

`Decrediton` is a graphical user interface for `dcrwallet`. When this application launches, it automatically starts its own instance of the command line tools `dcrd` and `dcrwallet` in the background.

!!! info "Blockchain Download"

	Without SPV enabled, Decrediton needs to download a full copy of the Decred blockchain before it can be used. This means that a large download must be completed and a large amount of storage space must be be available on the device where Decrediton is intalled. You can check the current size of all serialized blocks via [dcrdata charts](https://explorer.dcrdata.org/charts#blockchain-size). The total size of Decrediton will be bigger, since additional wallet data is stored on your device.

---

## Download and Install

The latest version of Decrediton can be downloaded from [https://decred.org/downloads/](https://decred.org/downloads/).

> Windows

1. Download the Windows installer `decrediton-v1.2.1.exe`.

1. Double click the installer and follow the instructions. This will install and automatically start up Decrediton to download the Decred blockchain and set up your wallet.

1. The installer adds a shortcut to Decrediton on your desktop for next time you want to use it.

> macOS

1. Download the `decrediton-v1.2.1.dmg` file.

1. Double click the `decrediton-v1.2.1.dmg` file once downloaded to mount the disk image.

1. Drag the decrediton.app into the link to your Applications folder within the disk image.

> Linux

1. Download the `decrediton-v1.2.1.tar.gz` file.

1. Navigate to download location and extract the .tar.gz file:

    Ubuntu File Browser: simply right click on the .tar.gz file and select "Extract Here". <br />
    Terminal: use the `tar -xvzf filename.tar.gz` command.

    Both of these should extract the tar.gz into a folder that shares the same name. (`e.g. tar -xvzf decrediton-v1.2.1.tar.gz` should extract to `decrediton-v1.2.1`). If successful, this new folder should include a `decrediton` executable.

---

## Open and Set Up Decrediton

Opening Decrediton for the first time will display the following screen:

![Decrediton startup screen](/img/decrediton/startup.png)

Select your desired language and press **Continue**. A short presentation explaining Decred blockchain, wallet, keys, staking/governance, and safety tips is shown. Please read these slides carefully if you are new to Decred.

The following screen should be displayed next.

![Decrediton blockchain download screen](/img/decrediton/chain-downloading.png)

A large progress bar on this screen shows the progress of the blockchain download. You can begin to set up your wallet before the download completes. 

!!! info "Pausing the download"

    If you close Decrediton or shutdown your PC while the download is in progress, the download will be paused and progress will not be lost. It will be resumed from the same point next time Decrediton is started.

    This means you can download the blockchain in multiple sessions if required.

As Decrediton allows you to manage multiple wallets on one PC, you must give a name to your wallet so it can be identified. Enter a name and press the **Create New Wallet** button. You will now be faced with two options: 

1. **Create a New Wallet** - Press this button if this is your first time using Decred.

1. **Restore Existing Wallet** - Press this button if you already have a wallet seed. You can skip ahead to [Restore Existing Wallet From Seed](/getting-started/user-guides/decrediton-setup.md#restore-existing-wallet-from-seed)

![Decrediton create wallet screen](/img/decrediton/create-wallet.png)

---

## Create a New Wallet

!!! danger "Critical Information"

    During the creation process for your wallet, you will be given a sequence of 33 words known as a seed phrase. This seed phrase is essentially the private key for your wallet. You will be able to use this seed phrase to restore your private keys, transaction history, and balances using any Decred wallet on any computer.

    This ultimately means that *anyone* who knows your seed can use it to restore your private keys, transaction history, and balances to a Decred wallet on their computer without your knowledge. For this reason, it is of utmost importance to keep your seed phrase safe. Treat this seed the same way you would treat a physical key to a safe. If you lose your seed phrase, you permanently lose access to your wallet and all funds within it. It cannot be recovered by anyone, including the Decred developers. It is recommended you write it down on paper and store that somewhere secure. If you decide to keep it on your computer, it would be best to keep it in an encrypted document (do not forget the password) in case the file or your computer is stolen.

    Every seed phrase is also associated with a 64 character seed hex. The seed hex functions the same way as the seed phrase - `dcrwallet` will accept it when attempting to restore your wallet. It is also important to keep your seed hex secure.

    **REMINDER: DO NOT, UNDER ANY CIRCUMSTANCES, GIVE YOUR SEED OR THE ASSOCIATED HEX KEY TO ANYONE! NOT EVEN THE DEVELOPERS!**

The 33 word seed for your new wallet is displayed on the screen (obscured in the below image). Record the seed and store it somewhere safe.

![Decrediton wallet seed screen](/img/decrediton/wallet-seed.png)

Press **Continue** and re-enter the missing words from your seed on the next screen. This is to confirm you have recorded your seed correctly.

![Decrediton seed entry screen](/img/decrediton/seed-entered.png)

Create a private passphrase for your wallet. This passphrase will be used to unlock your wallet when creating transactions.

Press **Create Wallet** and your wallet setup is complete. You will be taken back to the blockchain download progress bar. Once the download has been completed, Decrediton will open the Overview page for your new wallet and you will be able to begin sending and receiving Decred.

---

## Restore Existing Wallet From Seed

1. If you already have a wallet seed you can use it by clicking on the **Existing Seed** button.

1. Enter your seed into the **Confirm Seed** text box.

1. Create a private passphrase for your wallet.

1. Select **Create Wallet**. Wait for the blockchain to be scanned.

---

## Troubleshooting

*Decrediton will not start!*

```
dcrd closed due to an error. Check dcrd logs
and contact support if the issue persists.
```

If you encounter the above error, it could be because there is already a running instance of `dcrd` on your machine. Decrediton attempts to start its own instance of `dcrd` and `dcrwallet` in the background.

You could possibly resolve this by killing any any running `dcrd` processes prior to restarting Decrediton.

*Where does Decrediton store data/write log files?*

Decrediton stores the blockchain, your wallet, log files and its own configuration files all in a single directory. A different directory is used depending on the operating system:

| OS      | Decrediton data directory                   |
| -------:|:-------------------------------------------:|
| Windows | `%LOCALAPPDATA%\Decrediton\`                |
| macOS   | `~/Library/Application Support/Decrediton/` |
| Linux   | `~/.config/decrediton/`                     |
