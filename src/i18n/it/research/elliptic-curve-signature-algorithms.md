# Algoritmi di firma ellittica della curva 

---

Anche se secp256k1 è ampiamente considerato avere una scelta sicura dei parametri ellittici della curva, rimangono alcune domande sull'origine della curva. Ad esempio, la selezione della curva di Koblitz,

\((y^2 + xy = x^3 + ax^2 + b \text{ and } a = a^2 \text{, } b = b^2 \text{; } a = 1 \text{ or } 2 \text{, } b != 0)\)

È in genere enumerando i campi Galois di estensione binaria \(GF(2^m)\) dove \(m\) è un primo nell'intervallo {\(0\), \(...\), limite superiore} and \(x,y \in GF(2^m)\)[^1]. Per la sicurezza a 128 bit, \(m\) deve essere \(\geqslant 257\) e in genere il più piccolo possibile in questo intervallo per facilitare il calcolo veloce. In questo caso, la scelta ovvia per \(m\) is \(277\text{, } a = 0\); Nonostante l'esistenza di questo valore $m$ appropriato sia noto dai curatori dei parametri della curva[^2] e dal fatto che sia stata la soluzione più computazionalmente efficiente, i parametri \(m = 283\) and \(a = 0\) Sono stati selezionati da tre possibili opzioni:

 \((m = 277\text{, } a = 0\text{; } m = 283\text{, } a = 0\text{; } m = 283\text{, } a = 1)\).

Per tutte le altre specifiche della curva Koblitz, viene selezionato il valore più evidente \(m\) value is selected. Anche se questo è curioso, non ci sono attacchi noti che possono essere applicati utilizzando un valore leggermente più grande $ m $ per il campo Galois. Sono state altresì sollevate altre obiezioni ai parametri utilizzati da secp256k1[^3].

Un altro algoritmo di firma digitale estremamente popolare (DSA) con 128 bit di sicurezza è Ed25519[^4]. This uses the EdDSA signing algorithm over a curve birationally equivalent to Curve25519 and is widely employed today. Unlike secp256k1's ECDSA, Ed25519 uses simpler Schnorr signatures that are provably secure in a random oracle model (See: [Schnorr Signatures](schnorr-signatures.md)).

Le firme Schnorr sono state proposte anche per Bitcoin[^5]. Tuttavia, invece di utilizzare un codice OP esclusivo per le firme Schnorr che utilizzano i parametri di curva per secp256k1, Decred utilizza invece un nuovo codice OP OP_CHECKSIGALT per verificare un numero illimitato di nuovi schemi di firma. Nell'attuale implementazione, sia le firme Spnrp256k1 Schnorr e le firme Ed25519 sono disponibili per integrare le firme secp256k1 ECDSA. In futuro, è banale aggiungere nuovi schemi di firma in una forchetta morbida, come quelle che sono sicure al quantum. Avendo disponibili queste due suite Schnorr, inoltre, consente la generazione di firme di gruppo semplici che occupano lo stesso spazio di una firma normale[^6], che per entrambi viene implementata. In futuro, le firme di soglia che utilizzano la condivisione segreta di commercianti consentono anche a firme di soglia t-n-n che occupano la stessa quantità di spazio[^7].

---

## <i class="fa fa-book"></i> Riferimenti 

[^1]: Pornin T. 2013. [StackExchange Cryptography: Should we trust the NIST-recommended ECC parameters?](https://decred.org/research/pornin2013.pdf)
[^2]: Solinas J. 2000. [Efficient arithmetic on Koblitz curves](https://decred.org/research/solinas2000.pdf).
[^3]: Bernstein D. and Lange T. 2014. [SafeCurves: Choosing safe curves for elliptic-curve cryptography](http://safecurves.cr.yp.to).
[^4]: Bernstein D., Duif N., Lange T., Schwabe P., Yang B. 2012. [High-speed high-security signatures](https://decred.org/research/bernstein2012.pdf).
[^5]: Osuntokun O. 2015. [OP_SCHNORRCHECKSIG: Exploring Schnorr Signatures as an alternative to ECDSA for Bitcoin](https://decred.org/research/osuntokun2015.pdf).
[^6]: Petersen T. 1992. [Distributed provers and verifiable secret sharing based on the discrete logarithm problem](https://decred.org/research/petersen1992.pdf).
[^7]: Stinson D. and Strobl R. 2001. Probabilmente sicuro le firme Schnorr distribuite e uno schema di soglia (t, n) per certificati impliciti.
