# Επεκτάσεις Σεναρίου (Script)

---

Εκτός από τα προαναφερθέντα OP_CHECKSIGALT και OP_CHECKSIGALTVERIFY, έγιναν και άλλες τροποποιήσεις στην σεναριογραφία (scripting) του Bitcoin. Έχει προστεθεί ένα byte έκδοσης στα σενάρια εξόδου για να επιτραπεί το απλό soft forking σε νέες γλώσσες σεναριογραφίας, όπως αρχικά προτάθηκε από τον Wuille[^1].  Όλοι οι κωδικοί OP που σχετίζονται με μαθηματικά και λογική έχουν ενεργοποιηθεί εκ νέου και τώρα λειτουργούν σε καταχωρητές int32. Διάφοροι κωδικοί OP κώδικα χειρισμού byte string έχουν επίσης εφαρμοστεί και ενεργοποιηθεί εκ νέου. Οι υπόλοιποι κώδικες Bitcoin OP που δεν χρησιμοποιήθηκαν έχουν αναπροσαρμοστεί για μελλοντικά soft fork. Μερικά μακροχρόνια σφάλματα στη γλώσσα σεναρίων Bitcoin έχουν επίσης διορθωθεί[^2] [^3].

---

## <i class="fa fa-book"></i> References

[^1]: Wuille P. 2015. [Segregated witness for Bitcoin](https://prezi.com/lyghixkrguao/segregated-witness-and-deploying-it-for-bitcoin/).
[^2]: Todd P. [The difficulty of writing consensus critical code: The SIGHASH_SINGLE bug](https://decred.org/research/todd2014.pdf).
[^3]: Franco P. Understanding Bitcoin, 6.3: Multisignature (M-of-N) Transactions.
