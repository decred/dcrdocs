# Simnet 

---

## Σφαιρική Εικόνα

Κατά την ανάπτυξη των εφαρμογών του Decred ή τη δοκιμή πιθανών αλλαγών, συχνά είναι εξαιρετικά χρήσιμο να έχουμε ένα δίκτυο δοκιμών όπου τα επίπεδα δυσκολίας είναι αρκετά χαμηλά για να δημιουργήσουν blocks ανάλογα με τις ανάγκες.

Προκειμένου να διευκολυνθούν αυτά τα σενάρια, το dcrd παρέχει ένα δίκτυο προσομοίωσης (`--simnet`). Ακολουθεί μια επισκόπηση των πιο σημαντικών ιδιοτήτων που το διακρίνουν από το κύριο δίκτυο:

* Η δυσκολία ξεκινάει πολύ χαμηλά για να επιτρέψει το γρήγορο CPU mining των blocks
* Αλλαγές δικτύωσης:
    * All code related to peer discovery and IP address dissemination is disabled to help ensure the network remains private
    * Οι θύρες δικτύου των peers και του RPC είναι διαφορετικές
    * Μια μοναδική αλληλουχία byte δικτύου χρησιμοποιείται στο πρωτόκολλο μηνύματος peer-to-peer έτσι ώστε τα blocks να μην μπορούν να διασταυρωθούν κατά λάθος με το κύριο δίκτυο
* Όλες οι παράμετροι της αλυσίδας και της διεύθυνσης πληρωμής είναι μοναδικές για την αποφυγή σύγχυσης με το κύριο δίκτυο:
    * Διαφορετικό genesis block
    * Οι διευθύνσεις πληρωμής αρχίζουν με διαφορετικά προθέματα:
        * Το πρότυπο pay-to-pubkeyhash (P2PKH) ξεκινάει με το κεφαλαίο λατινικό γράμμα `S`
        * Το πρότυπο pay-to-scripthash (P2SH) ξεκινάει με το πεζό λατινικό γράμμα `s`
    * Τα εξαγόμενα ιεραρχικά προκαθορισμένα εκτεταμένα κλειδιά (BIP32) ξεκινούν με διαφορετικά προθέματα:
        * Τα δημόσια επεκταμένα κλειδιά ξεκινούν με `spub`
        * Τα ιδιωτικά επεκταμένα κλειδιά ξεκινούν με `sprv`
    * Ο τύπος νομίσματος BIP44 που χρησιμοποιείται σε διαδρομές κλειδιών HD είναι πεζά `s`

  ---

## Ξεκινώντας

Running a single `dcrd` node on simnet is simply starting `dcrd` with the `--simnet` flag.  However, in order to be really useful, you'll typically want to be able to send coins amongst addresses which implies that blocks will need to be mined and interfacing with a wallet will be needed.

In addition, since there are effectively no coins yet on the new private network, an initial series of blocks will need to be mined which pay to an address you own so there are usable coins to spend.

As previously mentioned, simnet uses unique addresses to prevent confusion with the main network.  Thus, it means that a wallet which supports the address format must be used.  For this, `dcrwallet` with the `--simnet` flag can be used.

Το παρακάτω είναι μια αναφορά εντολής για να προχωρήσετε:

**NOTE: All of these commands can be simplified by creating config files and making use of them, however the commands here use all switches on the command line to show exactly what is needed for each.**

* Εκκίνηση του dcrd στο simnet:

    `$ dcrd --simnet --rpcuser=<username> --rpcpass=<password>`

* Δημιουργήστε ένα νέο πορτοφόλι simnet:

    `$ dcrwallet --simnet --create`

* Εκκίνηση του dcrwallet στο simnet:

    `$ dcrwallet --simnet --username=<username> --password=<password>`

* Δημιουργήστε μια νέα διεύθυνση Decred για το simnet:

    `$ dcrctl --simnet --wallet --rpcuser=<username> --rpcpass=<password> getnewaddress`

* Σταματήστε την αρχική διαδικασία dcrd και επανεκκινήστε την με τη διεύθυνση mining που έχει οριστεί στην εκροή από την προηγούμενη εντολή:

    `$ dcrd --simnet --rpcuser=<username> --rpcpass=<password> --miningaddr=<S....>`

* Δώστε εντολή στο dcrd για να δημιουργήσει αρκετά αρχικά blocks για να ωριμάσει το πρώτο coinbase:

    `$ dcrctl --simnet --rpcuser=<username> --rpcpass=<password> generate 100`

* Ελέγξτε το υπόλοιπο του πορτοφολιού για να βεβαιωθείτε ότι τα κέρματα είναι διαθέσιμα:

    `$ dcrctl --simnet --wallet --rpcuser=<username> --rpcpass=<password> getbalance`
  
Αυτή την χρονική στιγμή, υπάρχει ένα πλήρως λειτουργικό ιδιωτικό simnet με νομίσματα διαθέσιμα για αποστολή σε άλλες διευθύνσεις simnet. Οποιαδήποτε στιγμή αποστέλλονται μία ή περισσότερες συναλλαγές, πρέπει να εκδοθεί ένα `generate 1` RPC για να γίνει mine ένα νέο block με τις συμπεριλαμβανομένες συναλλαγές.
