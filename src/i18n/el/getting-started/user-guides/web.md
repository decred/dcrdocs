# <i class="fa fa-firefox"></i> Οδηγός Χρήστη για το Πρόγραμμα Ιστού

---

A simple web wallet is available for users who do not want to install
additional software on their computer.  It is based on
[Copay](https://github.com/bitpay/copay) with Decred specific changes
added and can be found at
[https://wallet.decred.org](https://wallet.decred.org)

There are a couple of things you need to know about the web client
before you use it:

* Δεν μπορείτε
  [εξόρυξη κλειδωμένων νομισμάτων](/mining/proof-of-stake.md)
  με αυτό.
* Your wallet is kept entirely in the local storage of your web
  browser.  This means that if you delete your local storage, you will
  delete your wallet and must recreate it from the seed.
* The security of your wallet depends entirely on the security of your
  πρόγραμμα πλοήγησης ιστού.
* You can put a pin on your wallet to prevent sending funds but any
  other access is dependent entirely on the access controls on your
  computer, not on the server or any login details.

---

## <i class="fa fa-plus-circle"></i> Δημιουργήστε το πορτοφόλι προγράμματος ιστού

> Βήμα Ένα

Μεταβείτε στη διεύθυνση [https://wallet.decred.org](https://wallet.decred.org). Θα
εμφανιστεί η οθόνη `Όροι και Προϋποθέσεις`. Δώστε ιδιαίτερη
προσοχή στα ακόλουθα:

Just like the command-line wallet, if you lose your seed words or your
password for sending funds you will lose access to your wallet. There
is no password reset. Also note that all transactions on Decred are
irreversible by design. If you accidentally send funds to the wrong
address, you will need to ask the recipient to send them back. The
developers are unable to reverse transactions.

Click `I Agree` once you have read the `Terms and Conditions`. You
will now see the welcome screen. If this is the first time you
have used Decred, click `Get Started`. If you want to restore a
previously used wallet, click `Import Backup`. This guide will
assume you are just starting out so click `Get Started`.

> Βήμα Δύο

Click the dropdown in the top left, then click `Add wallet`. Click
`Create New Wallet`. Give your wallet a name then click `Create New Wallet`.

A wallet will be generated for you.


> Βήμα Τρία

Your wallet is now created and ready to use. However, before you do
anything else, you should add a password for sending funds and backup
the seed words that were used to create your wallet. This is doubly
true for the web client which does not store a permanent record of
your wallet. Your wallet data is stored in the browser cache and
can be deleted quite easily. If you are running in incognito mode,
it will be deleted as soon as you close the browser. **WITHOUT THIS
SEED PHRASE YOU LOSE ACCESS TO ALL FUNDS IN YOUR WALLET** should
the wallet data be deleted. The funds themselves still exist in
the blockchain, however, without the seed you cannot access them.

<i class="fa fa-exclamation-triangle"></i> **DO NOT USE THE SAME SEED IN MULTIPLE WALLETS! Visit [Wallets and Seeds FAQ](/faq/wallets-and-seeds.md#3-can-i-run-multiple-wallets) to see why this matters. It is recommended that where possible a new wallet should mean generating a new seed.** 

Click the `Preferences` button on the right opposite your wallet name. There are really only three things you will be interested in here:

Επιλογή                                | Περιγραφή
---                                   | ---
`Ψευδώνυμο Πορτοφολιού`                        | Αν το επιθυμείτε, μπορείτε να μετονομάσετε το πορτοφόλι.
`Αίτηση του Κωδικού Πρόσβασης για την Δαπάνη Χρημάτων` | Since your wallet is saved in the browser cache, there is no extra password required to access it. By setting a password here, you ensure that only you can send funds if someone else accesses your browser. Type a password in and click `Set`. Note the alert that says passwords cannot be recovered. There is no password reset feature on the wallet. If you lose the password, you will never be able to move your coins out of the wallet or use them for proof-of-stake voting.
`Αντίγραφο Ασφαλείας`                              | Εδώ θα βρείτε τις λέξεις κλειδιά σας.

> Βήμα Τέσσερα

Κάντε κλικ στο κουμπί `Δημιουργία Αντιγράφου Ασφαλείας`. Θα δείτε την παρακάτω οθόνη:

First of all, read the note. Only use ONE wallet at a time with a
given seed (See: [FAQ](#)). You can have multiple wallets installed on
different machines, but only one of them should be running at any
given time. Click `Show Wallet Seed`. Write this down somewhere safe,
or put it in an encrypted document to which you will not forget the
password. This list of words is used to generate the authentication
key for your wallet. Anyone who possesses this list can access the
funds in your wallet.

> **ΠΟΛΥ ΣΗΜΑΝΤΙΚΟ**

**ΜΗΝ ΔΩΣΕΤΕ , ΣΕ ΚΑΜΙΑ ΠΕΡΙΠΤΩΣΗ, ΤΙΣ ΛΕΞΕΙΣ ΚΛΕΙΔΙΑ ΣΑΣ ΣΕ ΚΑΝΕΝΑΝ! ΟΥΤΕ ΚΑΝ ΣΤΟΥΣ ΠΡΟΓΡΑΜΜΑΤΙΣΤΕΣ!**

Once you have written the words down (and have triple-checked that they are correct; capitalization is important), go to the next step.

> Βήμα Πέντε

Now that you have written down your seed words and checked them, do it
again. Seriously. This step is critical. Without this list your wallet
cannot be reconstructed and no one, not even the developers, can
restore it. Now that you are sure the list is stored correctly, click
`Delete Words`. Click `Back` twice to get to the main wallet screen.

---

## <i class="fa fa-long-arrow-right"></i> Στείλτε χρήματα με το πρόγραμμα ιστού

> Βήμα Ένα

On the main web wallet page, click the `Send` button at the
bottom. You will be taken to this page. Note the `Advanced Options`
section has already been expanded. In the `To` field, put in the
Decred address of the recipient.

> Βήμα Δύο

In `Amount`, enter the value in DCR to send to the recipient. If you
wish you can type an optional message in the `Note` field. Press
`Send`. The `Use Unconfirmed Funds` option lets you use funds that the
network knows are being sent to you but have not yet been confirmed by
[proof-of-work miners](/mining/proof-of-work.md). If
this is turned on and the amount specified can only be covered by
using unconfirmed funds, the transaction will not proceed until the
required funds have been confirmed.

---

## <i class="fa fa-long-arrow-left"></i> Λάβετε χρήματα με το πρόγραμμα ιστού

> Βήμα Ένα

Click the `Receive` button at the bottom of the window. You will see
this screen:

Give the person sending you DCR the address displayed (it will start
with `Ds`) or they can use the QR code if their wallet or service
accepts them. You can use the same address as often as you want, but
for privacy it is recommended that you generate a new address each
time. Do not worry about being given a duplicate address. There are
around `2.08x10^93` possible addresses, so we will probably reach the
heat death of the universe before we run out of Decred addresses.

