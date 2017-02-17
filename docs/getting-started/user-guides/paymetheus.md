# **Paymetheus Setup Guide** #

Paymetheus is a simple to use graphical wallet for Decred. With it, you can send and receive DCR, 
purchase tickets for [PoS voting](/mining/proof-of-stake.md), get a history of all your transactions and more.
About the only thing Paymetheus doesn't do is PoS voting.

---

## **Download and Install** ##
Download and installation instructions are available [here](/getting-started/install-guide.md#windows-installer)

---

## **Start Paymetheus** ##
You're now ready to start using Decred! Start the 'Decred' program. You will now see the connection screen:  

![Paymetheus connection screen](../../img/Paymetheus-dcrd-login.png)  

>Two programs are actually running when you start Decred. There's 'Paymetheus' which is the graphical wallet we'll talk further about
>and 'dcrd' which is the communications daemon (pronounced DAY-mon; a program that runs in the background and that does not directly interact
> with a user) that actually talks to the Decred network. This means that you can run dcrd
>on another computer (such as an always on server) and then use Paymetheus to connect to it remotely.

We're going to use a local one that Paymetheus has already started so just press Continue.

> The first time Paymetheus starts, it will download the blockchain in the background. This can take up to an hour.

---

## **Create or Restore Wallet** ##
You will now have the option to create a new wallet or restore a wallet from a seed. If you're reading this, you're probably new and don't 
already have a wallet so let's create a new one. If you click restore, you will be asked to enter your seed words instead of being given a new seed.
The rest of the process is the same. Click "Create a new wallet". You will see the following screen:  

![Paymetheus wallet creation screen](/img/Paymetheus-seed-window.png)  

<i class="fa fa-exclamation-triangle"></i> **STOP HERE!!! DO NOT CLICK CONTINUE!**  

This is the most important part of using Decred. In the white box you key (or seed) words are displayed. These words are the key to your wallet.  

<i class="fa fa-exclamation-triangle"></i> **WITHOUT THESE WORDS OR THE HEX REPRESENTATION YOU WILL PERMANANTLY AND FOREVER LOSE ACCESS TO YOUR FUNDS!**  

**DO NOT GIVE THEM TO ANYONE ELSE, NOT EVEN DECRED DEVELOPERS!** With these words, someone else can recreate your wallet on another computer and transfer
all of funds out to another wallet. It is not possible to reverse a transaction in Decred, so if someone steals your Decred, there is no way to get it back.  

Decred and other digital currencies are often described as being like a bank account. This is true, but your wallet is like an actual, physical wallet.
If you lose your wallet, you lose access to whatever you had in it and no one, not even the Decred developers can get it back. So it's very important
that you take the time to read this page and WRITE DOWN the key words in a safe place. A good idea is to write them on a piece of paper and store them
somewhere secure and also store them in an ENCRYPTED file on your computer. Cloud storage like Dropbox or OneDrive is fine, but remember that other people
can access them which is why you should encrypt the file (MS Word or Libre/OpenOffice can do this).  

Okay, so you've secured your key words in at least two different places. Click Continue. You are now asked to type them back in to ensure you have written 
them down correctly in case you need to restore your wallet later. Note you can't paste them; you will need to type them. 
This is to make sure you have the words saved somewhere other than the clipboard. Do so and click Confirm.

---

## **Choose a Private Wallet Passphrase** ##
Enter a passphrase to use whenever you create a transaction on the network. There is also the option here for a public passphrase. This encrypts your wallet
data file on your computer. It just prevents someone from viewing your accounts and transactions should they get access to it. As long as the database is locked,
they cannot access your funds. For most people this step is usually overkill, so you can leave it unticked.
Once you've entered your new private (and optional public) passphrase, click Encrypt.  

Your wallet will now create and synchronize to the blockchain. This can take a few minutes on slower computers. Note that the key words you wrote down will 
work with any Decred wallet application, not just Paymetheus.

Continue to [Using Paymetheus](using-paymetheus.md)