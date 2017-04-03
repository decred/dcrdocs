# **Decrediton Setup Guide**

Last updated for v0.8.2.

This guide is intended to help you setup the `Decrediton` application. 

**Prerequisites:**

- Use the [Decrediton Install Guide](/getting-started/install-guide.md#decrediton) to install `Decrediton`.

---

`Decrediton` is a graphical user interface for `dcrwallet`. When this application launches, it automatically starts its own instance of `dcrd` and `dcrwallet` in the background - it will not open if there is already a running instance of `dcrd`. Please note that as of 0.8.2, this application is a alpha release - there are known bugs in the software that are being worked on. 

NOTE: At any point in the use of Decrediton, it may become unresponsive or get stuck on a loading screen. This can usually be fixed with a restart of the application.

---

## **Critical Information**

During the creation process for your wallet, you will be given a sequence of 33 words known as a seed phrase. This seed phrase is essentially the private key for your wallet. You will be able to use this seed phrase to restore your private keys, transaction history, and balances using any Decred wallet on any computer. 

This ultimately means that *anyone* who knows your seed can use it to restore your private keys, transaction history, and balances to a Decred wallet on their without your knowledge. For this reason, it is of utmost importance to keep your seed phrase safe. Treat this seed the same way you would treat a physical key to a safe. If you lose your seed phrase, you permanently lose access to your wallet and all funds within it. It cannot be recovered by anyone, including the Decred developers. It is recommended you write it down on paper and store that somewhere secure. If you decide to keep it on your computer, it would be best to keep it in an encrypted document (do not forget the password) in case the file or your computer is stolen.

**REMINDER: DO NOT, UNDER ANY CIRCUMSTANCES, GIVE YOUR SEED OR THE ASSOCIATED HEX KEY TO ANYONE! NOT EVEN THE DEVELOPERS!**

---

Every time you open `Decrediton`, you will be greeted by the following disclaimer:

    Decrediton is currently under heavy development and in an alpha-state. While we have tested the code thoroughly, we suggest using caution on Mainnet. Use at your own risk!

## **Creating a New Wallet**

After clicking "OK, I Understand" to the disclaimer, you'll see the "Create a Wallet" dialog.

The "Create a Wallet" dialog defaults to the "New Seed" option. Simply click "Existing Seed" if you already have a seed you intend to use, and follow the steps presented there. This guide assumes you do not have a seed and will continue using the "New Seed" option. Please review the [Critical Information](#critical-information) about seeds, above.

1. Record the seed that is displayed in the text box (you will need to re-enter it on the next screen).

2. Press "Continue"

3. Confirm your seed, and create a private wallet passphrase. This passphrase will be used to unlock your wallet when creating transactions.

4. Press "Create Wallet"

5. You should then see a spinning blue circle. This will spin until `dcrd` has fully synced the blockchain. On computers that haven't had `dcrd` loaded on them, this should take 1-2 hours with newer hardware (it may take multiple hours with older hardware). You can check your process monitor application for a running instance of `dcrd` - if it is using a substantial percentage of your CPU, it is syncing. If it isn't, Decrediton may require a restart to move beyond this screen.

## **Opening Wallet**

After the blockchain has been synced, you should see a "Opening Wallet" page. Here, you will need to enter your private passphrase and the wallet will rescan recent blocks for transactions that belong to your addresses. Wait for the progress bar to fill. Decrediton should then load the Overview page with your Available Balance and Recent Transactions displayed.

---

