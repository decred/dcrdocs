# <img class="dcr-icon" src="/img/dcr-icons/Wallet.svg" /> Decrediton Setup Guide

Last updated for Decrediton v1.3.1.

---

`Decrediton` is a graphical user interface for `dcrwallet`. When this application launches, it automatically starts its own instance of the command line tools `dcrd` and `dcrwallet` in the background.

!!! info "Blockchain Download"

    Without [SPV](../../wallets/spv.md) enabled, Decrediton needs to download a full copy of the Decred blockchain before it can be used. This means that a large download must be completed and a large amount of storage space must be be available on the device where Decrediton is installed. You can check the current size of all serialized blocks via [dcrdata charts](https://explorer.dcrdata.org/charts#blockchain-size). The total size of Decrediton will be bigger, since additional wallet data is stored on your device.

---

## Download and Install

The latest version of Decrediton can be downloaded from <https://decred.org/downloads>.

??? info "Windows instructions (click to expand)"

    1. Download the Windows installer `decrediton-v{{ decreditonversion.windows }}.exe`.

    1. Double click the installer and follow the instructions.

    1. The installer adds a shortcut to Decrediton on your desktop.

??? info "macOS instructions (click to expand)"

    1. Download the `decrediton-v{{ decreditonversion.mac }}.dmg` file.

    1. Double click the `decrediton-v{{ decreditonversion.mac }}.dmg` file to mount the disk image.

    1. Drag the `decrediton.app` file into the link to your Applications folder within the disk image.

??? info "Linux instructions (click to expand)"

    1. Download the `decrediton-v{{ decreditonversion.mac }}.tar.gz` file.

    1. Navigate to the download location and extract `decrediton-v{{ decreditonversion.mac }}.tar.gz`.

    1. The extracted files include an executable named `decrediton`.

---

## Open and Set Up Decrediton

Opening Decrediton for the first time will display the following screen:

![Decrediton startup screen](/img/decrediton/startup.png)

Select your desired language and press **Continue**. You will then be offered various privacy options which allow you to restrict which external services Decrediton will contact. The "Standard" option is recommended for most users, as this will enable all of the features in Decrediton and provide the best user experience.

![Decrediton privacy options](/img/decrediton/privacy-options.png)

After making your choice, a short presentation explaining Decred blockchain, wallet, keys, staking/governance, and safety tips is shown. Please read these slides carefully if you are new to Decred.

The following screen should be displayed next.

![Decrediton blockchain download screen](/img/decrediton/chain-downloading.png)

A large progress bar on this screen shows the progress of the blockchain download. 

!!! info "Pausing the download"

    If you close Decrediton or shutdown your PC while the download is in progress, the download will be paused and progress will not be lost. It will be resumed from the same point next time Decrediton is started.

    This means you can download the blockchain in multiple sessions if required.

You can begin to set up your wallet before the download completes. You have to options:

1. [Create a New Wallet](#create-a-new-wallet) - Press this button if this is your first time using Decred.

1. [Restore Existing Wallet](#restore-existing-wallet) - Press this button if you already have a wallet seed you would like to use.

---

## Create a New Wallet

As Decrediton allows you to manage multiple wallets on one PC, you must give a name to your wallet so it can be identified. Enter a name and press the **Continue** button.

!!! danger "Critical Information"

    During the creation process for your wallet, you will be given a sequence of 33 words known as a seed phrase. This seed phrase is essentially the private key for your wallet. You will be able to use this seed phrase to restore your private keys, transaction history, and balances using any Decred wallet on any computer.

    This ultimately means that *anyone* who knows your seed can use it to restore your private keys, transaction history, and balances to a Decred wallet on their computer without your knowledge. For this reason, it is of utmost importance to keep your seed phrase safe. Treat this seed the same way you would treat a physical key to a safe. If you lose your seed phrase, you permanently lose access to your wallet and all funds within it. It cannot be recovered by anyone, including the Decred developers. It is recommended you write it down on paper and store that somewhere secure. If you decide to keep it on your computer, it would be best to keep it in an encrypted document (do not forget the password) in case the file or your computer is stolen.

    Every seed phrase is also associated with a 64 character seed hex. The seed hex functions the same way as the seed phrase - `dcrwallet` will accept it when attempting to restore your wallet. It is also important to keep your seed hex secure.

    **REMINDER: DO NOT, UNDER ANY CIRCUMSTANCES, GIVE YOUR SEED OR THE ASSOCIATED HEX KEY TO ANYONE! NOT EVEN THE DEVELOPERS!**

The 33 word seed for your new wallet is displayed on the screen (obscured in the below image). Record the seed and store it somewhere safe.

![Decrediton wallet seed screen](/img/decrediton/wallet-seed.png)

Press **Continue** and re-enter the missing words from your seed on the next screen. This is to confirm you have recorded your seed correctly.

![Decrediton seed entry screen](/img/decrediton/seed-entered.png)

Create a passphrase for your wallet. This passphrase will be used to unlock your wallet when creating transactions.

Press **Create Wallet** and your wallet setup is complete. You will be taken back to the blockchain download progress bar. Once the download has been completed, Decrediton will open the Overview page for your new wallet and you will be able to begin sending and receiving Decred.

---

## Restore Existing Wallet

1. As Decrediton allows you to manage multiple wallets on one PC, you must give a name to your wallet so it can be identified. 

1. Advanced users can use the "Watch only" option and enter a public key to configure a watch only wallet.

1. Enter your seed into the **Confirm Seed** text box.

1. Create a private passphrase for your wallet.

1. Select **Create Wallet**. Wait for the blockchain to be downloaded.

1. You will be prompted to enter the stakepool API key associated with this wallet. This can be left blank if you don't have one.

1. The blockchain will now be scanned for any transactions belonging to this wallet.
