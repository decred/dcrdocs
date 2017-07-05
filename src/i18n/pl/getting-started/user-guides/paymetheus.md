# Paymetheus Setup Guide 

Paymetheus is a simple to use graphical wallet for Decred. With it, you can send and receive DCR, 
purchase tickets for [PoS voting](/mining/proof-of-stake.md), get a history of all your transactions and more.
About the only thing Paymetheus doesn't do is PoS voting.

---

## Download and Install 

The Windows Installer (`.msi` file) is located here: [https://github.com/decred/decred-binaries/releases/tag/v1.1.0](https://github.com/decred/decred-binaries/releases/tag/v1.1.0). It will install Paymetheus to your computer's Program Files folder. Installation is pretty straightforward, but instructions are provided below:

1. Download the correct file:

    For 32-bit computers, download the `decred_1.1.0-release_x86.msi` file. <br />
    For 64-bit computers, download the `decred_1.1.0-release_x64.msi` file.

2. Navigate to download location and double click the `.msi` file.

3. Follow the installation steps. Within this process you'll be prompted to accept an End-User License Agreement.

4. After setup, the features should be installed to your `..\Program Files\Decred\` folder and accessible through the Start Menu (look for `Decred` in the Program list)

---

## Start Paymetheus 
You're now ready to start using Decred! Start the 'Decred' program. You will now see the connection screen:  

![Paymetheus connection screen](../../img/Paymetheus-dcrd-login.png)  

>Two programs are actually running when you start Decred. There's 'Paymetheus' which is the graphical wallet we'll talk further about
>and 'dcrd' which is the communications daemon (pronounced DAY-mon; a program that runs in the background and that does not directly interact
> with a user) that actually talks to the Decred network. This means that you can run dcrd
>on another computer (such as an always on server) and then use Paymetheus to connect to it remotely.

We're going to use a local one that Paymetheus has already started so just press Continue.

> The first time Paymetheus starts, it will download the blockchain in the background. This can take up to an hour.

---

## Create or Restore Wallet 
You will now have the option to create a new wallet or restore a wallet from a seed. If you're reading this, you're probably new and don't 
already have a wallet so let's create a new one. If you click restore, you will be asked to enter your seed words instead of being given a new seed.
The rest of the process is the same. Click "Create a new wallet". You will see the following screen:  

![Paymetheus wallet creation screen](/img/Paymetheus-seed-window.png)  

<i class="fa fa-exclamation-triangle"></i> **STOP HERE!!! DO NOT CLICK CONTINUE! **

**This is the most important part of using Decred. In the white box your seed words are displayed. These words are the key to your wallet.  **
 **WITHOUT THESE WORDS OR THE HEX REPRESENTATION YOU WILL PERMANENTLY AND FOREVER LOSE ACCESS TO YOUR FUNDS!**  

**DO NOT GIVE THEM TO ANYONE ELSE, NOT EVEN DECRED DEVELOPERS!**

With these words, someone else can recreate your wallet on another computer and transfer all the funds out to another wallet. It is not possible to reverse a transaction in Decred, so if someone steals your Decred, there is no way to get it back.  

<i class="fa fa-exclamation-triangle"></i> **DO NOT USE THE SAME SEED IN MULTIPLE WALLETS! Visit [Wallets and Seeds FAQ](/faq/wallets-and-seeds.md#3-can-i-run-multiple-wallets) to see why this matters. It is recommended that where possible a new wallet should mean generating a new seed.** 

Decred and other digital currencies are often described as being like a bank account. However, unlike with online banking, in the Decred system there is no trusted third party who holds your money on your behalf. You and you alone control your DCR, just like with physical cash. When cash or DCR is lost, misplaced, or stolen, it is most likely gone permanently.

If you lose your wallet, you lose access to whatever you had in it and no one, not even the Decred developers can get it back. So it's very important that you take the time to read this page and WRITE DOWN the seed words in a safe place. A good idea is to write them on a piece of paper and store them somewhere secure and also store them in an ENCRYPTED file on your computer. Cloud storage like Dropbox or OneDrive is fine when precautions are taken. Since online accounts can be hacked, you should strongly encrypt your wallet file (MS Word or Libre/OpenOffice can do this) before you upload it to a cloud storage service.  

Okay, so you've secured your seed words in at least two different places. Click Continue. You are now asked to type them back in to ensure you have written them down correctly in case you need to restore your wallet later. Note you can't paste them; you will need to type them.  This is to make sure you have the words saved somewhere other than the clipboard. Do so and click Confirm.

---

## Choose a Private Wallet Passphrase 
Enter a passphrase to use whenever you create a transaction on the network. As long as your wallet is locked with this passphrase, your wallet funds are inaccessible to anyone who gains control over the wallet file. There is also the option here for a public passphrase. It is used to encrypt all of the public data (transactions and addresses) within your wallet file so if it is stolen, an adversary can’t link you to your transactions. For most people, a public passphrase is usually overkill, so you can leave it unticked.  Once you've entered your new private (and optional public) passphrase, click Encrypt.  

Your wallet will now create and synchronize to the blockchain. This can take a few minutes on slower computers. Note that the seed words you wrote down will 
work with any Decred wallet application, not just Paymetheus.

Continue to [Using Paymetheus](using-paymetheus.md)
