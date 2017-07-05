# Επαλήθευση Εκτελέσιμων Αρχείων

---

Οι επίσημες
[εκδόσεις του Decred](https://github.com/decred/decred-release) έχουν
υπογεγραμμένα hashes τα οποία θα πρέπει να ελέγξετε για να επιβεβαιώσετε ότι είναι τα ίδια
εκτελέσιμα αρχεία που δημοσίευσαν οι προγραμματιστές. Αυτή η σελίδα παρέχει οδηγίες
γι'αυτό.

Για να επαληθεύσετε τα εκτελέσιμα αρχεία ή άλλα υπογεγραμμένα αρχεία από το Έργο
Decred, υπάρχουν κάποια κομμάτια λογισμικού που απαιτούνται:

* SHA256 - Μόλις κατεβάσετε το (τα) αρχείο (αρχεία) σας, πρέπει να το (τα) ελέγξετε
  SHA256 hashes, άρα για να το κάνετε αυτό μπορεί να χρειαστεί να κατεβάσετε ένα εργαλείο,
  Ανάλογα με το λειτουργικό σας σύστημα.
* GnuPG ή PGP - Απαιτείται για την εισαγωγή και επαλήθευση των δημόσιων κλειδιών
  υπογραφές. Τα παρακάτω παραδείγματα χρησιμοποιούν το GnuPG. 

The following instructions should work as is on Linux/UNIX/macOS.
Windows users will have to install sha256 and gnupg themselves and use
the windows cmd terminal to do this.  The steps to verify the binaries
are as follows:

> Βήμα Ένα

Κάντε λήψη του μανιφέστου του αρχείου, της υπογραφής για το μανιφέστο αρχείου, και
το zip/tarball για το λειτουργικό σας σύστημα από [εδώ](https://github.com/decred/decred-binaries). Αποκτήστε την τιμή SHA256 για το
zip/tarball του λειτουργικού σας συστήματος και ελέγξτε ότι αντιστοιχεί στην τιμή του
μανιφέστου αρχείου, π.χ. για 64-bit Linux:

```no-highlight
$ sha256sum linux-amd64-20160127-02.tar.gz
8ffaa268a329890ebf0f96b3cd1bc9f69359e431edbb95d89cec5a605108574b linux-amd64-20160127-02.tar.gz
```

> Βήμα Δύο

Συγκρίνετε την τιμή που πήρατε από το Βήμα Ένα με την τιμή για το μανιφέστο
του αρχείου.

> Βήμα Τρία

Εισαγάγετε το Decred Release Signing Key στο GnuPG. Αυτό θα χρειαστεί
να το κάνετε μόνο μια φορά και μπορείτε να το παραλείψετε στις μεταγενέστερες εκδόσεις
στον ίδιο υπολογιστή.

```no-highlight
$ gpg --keyserver pgp.mit.edu --recv-keys 0x518A031D
gpg: requesting key 518A031D from hkp server pgp.mit.edu
gpg: /home/user/.gnupg/trustdb.gpg: trustdb created
gpg: key 7608AF04: public key "Decred Release <release@decred.org>" imported
gpg: Total number processed: 1
gpg: imported: 1 (RSA: 1)
```

> Βήμα Τέσσερα

Επαληθεύστε ότι η υπογραφή για το μανιφέστου του αρχείου είναι έγκυρη και δημιουργήθηκε από το
Decred Release Signing Key:

```no-highlight
$ gpg --verify manifest-20160127-02.txt.asc
gpg: assuming signed data in `manifest-20160127-02.txt'
gpg: Signature made Wed 27 Jan 2016 08:56:59 PM UTC using RSA key ID 518A031D
gpg: Good signature from "Decred Release <release@decred.org>"
gpg: WARNING: This key is not certified with a trusted signature!
gpg: There is no indication that the signature belongs to the owner.
Primary key fingerprint: FD13 B683 5E24 8FAF 4BD1 838D 6DF6 34AA 7608 AF04
Subkey fingerprint: F516 ADB7 A069 852C 7C28 A02D 6D89 7EDF 518A 031D
```

Το zip ή το tarball με τα εκτελέσιμα αρχεία για την πλατφόρμα σας έχει πλέον επαληθευτεί και
μπορείτε να είστε βέβαιοι ότι δημιουργήθηκαν από το Έργο Decred.
