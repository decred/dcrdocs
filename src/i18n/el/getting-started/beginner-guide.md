# Οδηγός για Αρχάριους

Η τελευταία ενημέρωση έγινε για την έκδοση v1.0.1

---

## Καλώς Ήλθατε στο Decred

Καλώς ήλθατε στο Decred! Είμαστε πολύ ευτυχείς που είστε εδώ. Όπως ίσως ήδη γνωρίζετε, το Decred είναι διαφορετικό. Υπάρχουν πολλά νέα πράγματα που θα πρέπει να μάθετε ώστε να κατανοήσετε πλήρως το πώς λειτουργούν. Αυτή η τεκμηρίωση θα προσπαθήσει να καταστήσει τα πράγματα λίγο πιο κατανοητά.

Αυτός ο οδηγός για αρχάριους είναι ένα μονοπάτι για να ξεκινήσετε την ρύθμιση και την εκτέλεση του λογισμικού Decred. Μπορείτε να επιλέξετε μεταξύ πολλών προγραμμάτων για να αποκτήσετε έναν κόμβο στο δίκτυο και Decred στο πορτοφόλι σας. Συγκεκριμένα, θα μάθετε πώς να εγκαταστήσετε, να ρυθμίσετε και να χρησιμοποιήσετε τις εφαρμογές του Decred· πώς να αποκτήσετε DCR· πώς να ψηφίζεται μέσω του Proof-of-Stake· και πώς να χρησιμοποιήσετε τον εξερευνητή block.

Θα χρειαστεί να ακολουθήσετε έναν [Οδηγό Εγκατάστασης](#installation-guides), και στη συνέχεια να ακολουθήστε τη διαδρομή για την εφαρμογή της επιλογής σας παρακάτω. Εφόσον ρυθμίσετε την εφαρμογή σας, μεταβείτε στο [Γενικοί Οδηγοί](#general-guides) στο κάτω μέρος αυτής της σελίδας. Εάν έχετε οποιεσδήποτε ερωτήσεις κατά την διάρκεια, συμμετέχετε στο [Slack](/support-directory.md#join-us-on-slack) μας.

**ΣΗΜΕΙΩΣΗ: Η χρήση του Testnet συστήνεται ανεπιφύλακτα για να μάθετε πώς να χρησιμοποιείτε το λογισμικό του Decred χωρίς τον φόβο να κάνετε λάθος και να χάσετε πραγματικά χρήματα. Αφού ακολουθήσετε τους οδηγούς για να ρυθμίσετε το λογισμικό της επιλογής σας, επισκεφτείτε τον [Οδηγό Χρήσης του Testnet](/getting-started/using-testnet.md) για να μάθετε πώς να εκκινήσετε την εφαρμογή σας στο testnet του Decred.**

---

## Εφαρμογές

Παρακάτω θα βρείτε μια λίστα με τις διαθέσιμες εφαρμογές, με ένα γράφημα που δείχνει τη συμβατότητά τους σε διαφορετικά λειτουργικά συστήματα.

**Paymetheus**: The only Windows GUI client as of v1.1.0. <br />
**dcrd**: The node daemon, this command-line application handles block management and consensus. <br />
**dcrwallet**: The wallet daemon, this command-line application handles address and transaction management. <br />
**dcrctl**: The remote procedure call (RPC) client, this command-line application is used to control dcrd and dcrwallet via RPC commands. <br />
**Decrediton**: Cross-platform GUI client as of v1.1.0.

|           | Paymetheus | dcrd | dcrwallet | dcrctl | Decrediton |
| ---------:|:----------:|:----:|:---------:|:------:|:-----------:|
| Windows   | X          | X    | X         | X      |             |
| macOS     |            | X    | X         | X      | X           |
| Linux     |            | X    | X         | X      | X           |
| Άλλα UNIX|            | X    | X         | X      |             |

Επί του παρόντος το "Άλλα UNIX" περιλαμβάνει διάφορα *BSDs και Solaris/illumos.

Σημείωση: Ενδέχεται σύντομα να παρατηρήσετε μία από τις πολλές διαφορές μεταξύ του Decred και άλλων
δημοφιλών κρυπτονομισμάτων: ο daemon κόμβου και ο daemon πορτοφολιού είναι ξεχωριστοί.
Πολλά από τα άλλα κρυπτονομίσματα εκτελούν αυτές τις λειτουργίες μαζί σε έναν μόνο daemon.
Για όσους επιλέγουν να χρησιμοποιήσουν τις διεπαφές γραμμής εντολών, σημαίνει ότι πρέπει
να εκτελέσετε το `dcrd` για την πλήρη λειτουργικότητα κόμβου και το `dcrwallet` για να αποθηκεύσετε τα DCR σας,
να δημιουργήσετε συναλλαγές και να συμμετάσχετε στο Proof-of-Stake mining/ψηφοφορία.

---

## Οδηγοί Εγκατάστασης

Για να ξεκινήσετε, παρακάτω επιλέξτε ενα από τα προγράμματα εγκατάστασης που είναι διαθέσιμα για το λειτουργικό σας σύστημα:

* [Paymetheus](/getting-started/user-guides/paymetheus.md)
* [Σουίτα Γραμμής Εντολών **μέσω του dcrinstall**](/getting-started/user-guides/cli-installation.md) - ΣΗΜΕΙΩΣΗ: Η μέθοδος `dcrinstall` είναι η γρηγορότερη και ευκολότερη για να αποκτήσετε έναν κόμβο γραμμής εντολών και να τρέξετε το πορτοφόλι σας. Είναι η συνιστώμενη μέθοδος, έτσι και οι οδηγοί ρύθμισης της διαδρομής της γραμμής εντολών παρακάτω υποθέτουν ότι χρησιμοποιείτε αυτήν τη μέθοδο.
* [Decrediton (ALPHA)](/getting-started/user-guides/decrediton-setup.md)

---

**ΣΗΜΕΙΩΣΗ** Τους παρακάτω οδηγούς θα τους βρείτε και στο μενού πλοήγησης με τις ίδιες ονομασίες.

## Διαδρομή του Paymetheus

Οι παρακάτω οδηγοί, με τη σειρά που έχουν, θα σας βοηθήσουν να ξεκινήσετε με το Paymetheus:

* [Ρύθμιση του Paymetheus](/getting-started/user-guides/paymetheus.md)
* [Χρησιμοποιώντας το Paymetheus](/getting-started/user-guides/using-paymetheus.md)

## Διαδρομή του Decrediton

Ο παρακάτω οδηγός θα σας βοηθήσει να φορτώσετε το Decrediton:

* [Ρύθμιση του Decrediton](/getting-started/user-guides/decrediton-setup.md)

## Διαδρομή Γραμμής Εντολών

Οι παρακάτω οδηγοί, με τη σειρά που έχουν, θα σας βοηθήσουν να ξεκινήσετε με τις Εφαρμογές Γραμμής Εντολών (`dcrd`, `dcrwallet`, `dcrctl`):

* [Διαφορές Γραμμής Εντολών](/getting-started/cli-differences.md)
* [Βασικές Επιλογές Εκκίνησης](/getting-started/startup-basics.md)
* [Ρύθμιση του dcrd](/getting-started/user-guides/dcrd-setup.md)
* [Ρύθμιση του dcrwallet](/getting-started/user-guides/dcrwallet-setup.md)
* [Βασική Χρήση του dcrctl](/getting-started/user-guides/dcrctl-basics.md)

## Γενικές Οδηγίες

Οι παρακάτω οδηγοί είναι ανεξάρτητοι από τις διάφορες εφαρμογές:

* [Χρησιμοποιώντας το Testnet](/getting-started/using-testnet.md)
* [Αποκτώντας DCR](/getting-started/obtaining-dcr.md)
* [Χρησιμοποιώντας τον Block Explorer](/getting-started/using-the-block-explorer.md)
* [Οδηγός Proof-of-Stake](/mining/proof-of-stake.md)
* [Οδηγός Ψηφοφορίας Mainnet](/getting-started/user-guides/agenda-voting.md)
