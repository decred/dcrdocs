# Συνάρτηση BLAKE-256 Hash

---

Το SHA256, που χρησιμοποιείται στο Bitcoin, παρουσιάζει μια σειρά τεχνικών ελλείψεων λόγω της κατασκευής του Merkle-Damgård. Αυτές οι τεχνικές ελλείψεις οδήγησαν στον διαγωνισμό SHA3 για μια νέα συνάρτηση hash βασισμένη σε μια διαφορετική θεμελιώδη κατασκευή. Το Decred επέλεξε το BLAKE256 ως συνάρτηση hash, μια συνάρτηση που έφτασε στον τελικό του διαγωνισμού[^1] [^2]. Η συνάρτηση hash βασίζεται σε μια κατασκευή HAIFA που ενσωματώνει μια παραλλαγή του κρυπτογράφου ροής ChaCha από τον Bernstein. Η συνάρτηση hash αυτή είναι αξιοσημείωτη λόγω της υψηλής απόδοσής της στην μικροαρχιτεκτονική x86-64, καθώς είναι ταχύτερη για σύντομα μηνύματα από την SHA256[^3] παρά το γεγονός ότι θεωρείται να έχει πολύ υψηλότερο επίπεδο ασφαλείας στους 14 γύρους.

---

## <i class="fa fa-book"></i> Αναφορές

[^1]: Aumasson J., Henzen L., Meier W., Phan R. 2010. [SHA-3 proposal BLAKE](https://decred.org/research/aumasson2010.pdf).
[^2]: Aumasson J., Henzen L., Meier W., Phan R. 2014. The hash function BLAKE.
[^3]: Bernstein D. and Lange T. 2013. [eBACS: ECRYPT benchmarking of cryptographic systems](http://bench.cr.yp.to).
