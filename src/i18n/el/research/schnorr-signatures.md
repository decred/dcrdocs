# Υπογραφές Schnorr

---

Οι υπογραφές Schnorr έχουν προταθεί για το Bitcoin. Έχουν επίσης χρησιμοποιηθεί εκτεταμένα σε άλλα κρυπτονομίσματα, όπως τα νομίσματα Nxt και CryptoNote. Στην απλούστερη περίπτωση, ένα κρυπτοσύστημα ECDSA υπογραφής Schnorr μπορεί να περιγραφεί ως εξής:

1. \(y = xG\) where \(y\) είναι το σημείο δημόσιου κλειδιού στην καμπύλη, το \(x\) είναι η ιδιωτική κλιμάκωση, το \(G\) είναι η γεννήτρια καμπύλης.
2. \(r = kG\)  όπου το \(r\) είναι το σημείο στην καμπύλη που προκύπτει από τον πολλαπλασιασμό του \(k\), τις κλίμακας του nonce, από τη γεννήτρια.
3. \(h = H(M || r)\) όπου το \(H\) είναι μια ασφαλή συνάρτηση hash, το \(M\) είναι το μήνυμα (συνήθως ένα 32 byte hash), και το \(r\) είναι το κωδικοποιημένο σημείο που περιγράφηκε προηγουμένως. \(||\) υποδηλώνει αλληλουχία.
4. \(s = k - hx\) όπου το \(s\) είναι η κλιμάκωση που υποδηλώνεται από \(k - hx\).
5. Η υπογραφή είναι \((r,s)\), και η επαλήθευση είναι απλά \(H(M || r) == hQ + sG\).

Στα παραπάνω, οι πολλαπλασιασμοί με κεφαλαία γράμματα (π.χ., \(kG\)) είναι πολλαπλασιασμοί σημείων με μια κλίμακα και έτσι πάντοτε οδηγούν σε ένα σημείο στην καμπύλη. Η προσθήκη αυτών των σημείων οδηγεί σε ένα άλλο σημείο. Οι προσθήκες και οι πολλαπλασιασμοί των κλιμάκων μεταξύ τους είναι οι ίδιοι με τους κανονικούς πολλαπλασιασμούς που θα κάνατε με οποιοδήποτε ακέραιο αριθμό. Είναι σημαντικό να σημειώσουμε ότι ο πολλαπλασιασμός ενός σημείου με κλίμακα θεωρείται ένα μη αναστρέψιμο βήμα, επειδή ο υπολογισμός της κλίμακας από το νέο σημείο προεξοφλεί το πρόβλημα διακριτού λογαρίθμου.

From the above it is clear that \(r\) is a point on the curve, while \(s\) is a scalar. Consider the group of signers represented by \(x_{sum} = x_1 + ... + x_n\) with nonces \(k_{sum} = k_1 + ... + k_n\). The public key for the private scalar sum would be: \(y = x_{sum} G\). The signature for these sums (from all group participants) would be: \(r' = k_{sum} G s' = k_{sum} - h x_{sum}\). To generate this signature all participants would have to share their private key and nonces beforehand. We want to obviously avoid this, so instead let us have each participant create a partial signature. \(r_n = k_1 G + ... + k_n G = r'\) (the sum of the public nonce points, which the participants may freely individually publish) \(s_n = k_n - h x_n\). Substituting this into the general formulas for signatures and using point or scalar addition: \(r = r_n = r'\) (the same as above) \(s = s_1 + ... + s_n = s'\) (simple scalar addition; it must be true that \((k_1 - h x_1) + ... + (k_n - h x_n) = s_1 + ... + s_n = s')\). Doing an m-of-n signature is non-trivial. It has been suggested that a merkle tree containing all possible public key sums for \(m\) participants be used for these cases, generating a \(log(n)\) sized signature [28].

---

## <i class="fa fa-book"></i> Αναφορές 

[^1]: Wuille P. 2015. [Tree signatures: Multisig on steroids using tree signatures](https://decred.org/research/wuille2015.pdf).
