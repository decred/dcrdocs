# Απομόνωση Σεναρίου Υπογραφών και Αποδείξεις Απάτης

---

Για να αποφευχθεί η ελατότητα συναλλαγής, η δυνατότητα δημιουργίας μιας συναλλαγής με τις ίδιες αναφορές εισόδου και εξόδου και ταυτόχρονα ένα διαφορετικό αναγνωριστικό συναλλαγής, τα scripts εισόδου έχουν αφαιρεθεί από τον υπολογισμό του hash συναλλαγής. Η προέλευση αυτής της τροποποίησης υπήρξε αμφιλεγόμενη, αν και έχει εφαρμοστεί στα νομίσματα CryptoNote και στις πλευρικές αλυσίδες στο παρελθόν[^1] [^2]. Τώρα προτείνεται για το Bitcoin ως ένα soft fork που αναφέρεται ως "Segregated Witness"[^3]. Όπως και στην υλοποίηση των πλευρικών αλυσίδων Elements, οι δεσμεύσεις για τα δεδομένα των μαρτύρων περιλαμβάνονται στο δένδρο merkle του μπλοκ[^2]. Επιπλέον, οι αποδείξεις απάτης, όπως προτείνεται για το soft fork[^3] του Bitcoin, καθορίζονται από τους ανθρακωρύχους και δεσμεύονται ως μέρος των δεδομένων στο δέντρο merkle.

---

## <i class="fa fa-book"></i> Αναφορές

[^1]: von Saberhagen N. 2013. [CryptoNote v2.0](https://decred.org/research/saberhagen2013.pdf).
[^2]: Maxwell G. 2015. [Bringing new elements to Bitcoin with sidechains](https://decred.org/research/maxwell2015.pdf).
[^3]: Wuille P. 2015. [Segregated witness for Bitcoin](https://prezi.com/lyghixkrguao/segregated-witness-and-deploying-it-for-bitcoin/).
