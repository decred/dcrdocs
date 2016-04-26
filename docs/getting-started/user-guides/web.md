# <i class="fa fa-firefox"></i> **Web Client User Guide**

---

There are a couple of things you need to know about the web client before you use it:

* You cannot [proof-of-stake mine](../../mining/overview.md#2-proof-of-stake-mining) with it.
* Your wallet is identified by your seed key words, but there is no other authentication at this time. This means that anyone with access to your computer will be able to access your funds in the wallet. However, you can set a password for sending funds.

---

## **<i class="fa fa-plus-circle"></i> Create your web client wallet**

> Step One

Go to [https://wallet.decred.org](https://wallet.decred.org). You will be presented with the `Terms and Conditions` screen. Pay extra attention to the following:

Just like the command-line wallet, if you lose your seed words or your password for sending funds you will lose access to your wallet. There is no password reset. Also note that all transactions on Decred are irreversible by design. If you accidentally send funds to the wrong address, you will need to ask the recipient to send them back. The developers are unable to reverse transactions. Click `I Agree` once you have read them. You will now see the welcome screen. If this is the first time you have used Decred, click `Get Started`. If you want to restore a previously used wallet, click `Import Backup`. This guide will assume you are just starting out so click `Get Started`.

> Step Two

A wallet will be generated for you and you will see this screen:

Note that under `Personal Wallet` on the left it says `Testnet`. This wallet will only work on the test Decred network which is not very useful to us. Click the dropdown in the top left, then click `Add wallet`. Click `Create New Wallet`. Give your wallet a name then click `Create New Wallet`.

> Step Three

Your wallet is now created and ready to use. However, before you do anything else, you should add a password for sending funds and backup the seed words that were used to create your wallet. This is doubly true for the web client which does not store a permanent record. Your wallet data is stored in the browser cache and can be deleted quite easily. If you are running in incognito mode, it will be deleted as soon as you close the browser. **WITHOUT THESE KEY WORDS YOU LOSE ACCESS TO ALL FUNDS IN YOUR WALLET** should the wallet data be deleted. The funds themselves still exist in the blockchain, however, without the key you cannot access them.

Click the `Preferences` button on the right opposite your wallet name. There are really only three things you will be interested in here:

Option                                | Description
---                                   | ---
`Wallet Alias`                        | You can rename the wallet if you wish.
`Request Password for Spending Funds` | Since your wallet is saved in the browser cache, there is no extra password required to access it. By setting a password here, you ensure that only you can send funds if someone else accesses your browser. Type a password in and click `Set`. Note the alert that says passwords cannot be recovered. There is no password reset feature on the wallet. If you lose the password, you will never be able to move your coins out of the wallet or use them for proof-of-stake voting.
`Backup`                              | This is where you will find your seed key words.

> Step Four

Click `Backup`. You will see this screen:

First of all, read the note. Only use ONE wallet at a time with a given seed (See: [FAQ](#)). You can have multiple wallets installed on different machines, but only one of them should be running at any given time. Click `Show Wallet Seed`. Write this down somewhere safe, or put it in an encrypted document to which you will not forget the password. This list of words is used to generate the authentication key for your wallet. Anyone who possesses this list can access the funds in your wallet.

> **VERY IMPORTANT**

**DO NOT, UNDER ANY CIRCUMSTANCES, GIVE YOUR KEY WORDS TO ANYONE! NOT EVEN THE DEVELOPERS!**

Once you have written the words down (and have triple-checked that they are correct; capitalization is important), go to the next step.

> Step Five

Now that you have written down your key words and checked them, do it again. Seriously. This step is critical. Without this list your wallet cannot be reconstructed and no one, not even the developers, can restore it. Now that you are sure the list is stored correctly, click `Delete Words`. Click `Back` twice to get to the main wallet screen.

---

## **<i class="fa fa-long-arrow-right"></i> Send funds with the web client**

> Step One

On the main web wallet page, click the `Send` button at the bottom. You will be taken to this page. Note the `Advanced Options` section has already been expanded. In the `To` field, put in the Decred address of the recipient.

> Step Two

In `Amount`, enter the value in DCR to send to the recipient. If you wish you can type an optional message in the `Note` field. Press `Send`. The `Use Unconfirmed Funds` option lets you use funds that the network knows are being sent to you but have not yet been confirmed by [proof-of-work miners](../../mining/overview.md#1-proof-of-work-mining). If this is turned on and the amount specified can only be covered by using unconfirmed funds, the transaction will not proceed until the required funds have been confirmed.

---

## **<i class="fa fa-long-arrow-left"></i> Receive funds with the web client**

> Step One

Click the `Receive` button at the bottom of the window. You will see this screen:

Give the person sending you DCR the address displayed (it will start with `Ds`) or they can use the QR code if their wallet or service accepts them. You can use the same address as often as you want, but for privacy it is recommended that you generate a new address each time. Do not worry about being given a duplicate address. There are around `2.08x10^93` possible addresses, so we will probably reach the heat death of the universe before we run of Decred addresses.

> **WARNING**

The above address is for demonstration purposes only, but is a real address. The wallet it is linked to is temporary and the key has already been deleted. If you try sending DCR to this address it will work and no one will ever be able to access them again.

**DO NOT ATTEMPT TO SEND DCR TO THIS ADDRESS**.