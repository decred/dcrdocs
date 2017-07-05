# Signatures d'Algorithmes à Courbe Elliptique

---

Bien que secp256k1 soit largement considéré comme ayant un choix sécurisé des paramètres de la courbe elliptique, certaines questions concernant l'origine de la courbe restent. Par exemple, la sélection de la courbe de Koblitz,

\((y^2 + xy = x^3 + ax^2 + b \text{ and } a = a^2 \text{, } b = b^2 \text{; } a = 1 \text{ or } 2 \text{, } b != 0)\)

Se fait généralement en énumérant les champs Galois d'extension binaires \(GF(2^m)\) ou \(m\) est une priorité dans la gamme {\(0\), \(...\), higher limit} et \(x,y \dans GF(2^m)\)[^1]. Pour la sécurité 128 bit, \(m\) doit être \(\geqslant 257\) et généralement le plus petit possible possible dans cette gamme pour faciliter un calcul rapide. Dans ce cas, le choix évident pour \(m\) est \(277\text{, } a = 0\); algré l'existence de cette valeur $m$ appropriée connue par les conservateurs des paramètres de la courbe [^2] et le fait que c'était la solution la plus efficace en termes de calcul, les paramètres \(m = 283\) et \(a = 0\) ont été choisis parmi les trois options possibles:

 \((m = 277\text{, } a = 0\text{; } m = 283\text{, } a = 0\text{; } m = 283\text{, } a = 1)\).

Pour toutes les autres spécifications de la courbe Koblitz, la valeur \(m\) la plus évidente est sélectionnée. Bien que cela soit inhabituel, il n'y a pas d'attaques connues qui peuvent être appliquées en utilisant une valeur légèrement plus grande de $m$ pour le champ Galois. D'autres objections aux paramètres utilisés par secp256k1 ont également été soulevées[^3].

Un autre algorithme de signature numérique (DSA) extrêmement populaire avec 128 bits de sécurité est Ed25519[^4]. Cela utilise l'algorithme de signature EdDSA sur une courbe biraigneusement équivalente à Curve25519 et est largement utilisé aujourd'hui. Contrairement à secp256k1's ECDSA, Ed25519 utilise une signatures Schnorr plus simple qui sont probablement sécurisés dans un modèle oracle aléatoire (voir: [Signatures Schnorr](schnorr-signatures.md)).

Les signatures Schnorr ont également été proposées pour Bitcoin [^5]. Toutefois, au lieu d'utiliser un code OP exclusif aux signatures Schnorr en utilisant les paramètres de courbe pour secp256k1, Decred utilise plutôt un nouveau code OP OP_CHECKSIGALT pour vérifier un nombre illimité de nouveaux schémas de signature. Dans la mise en œuvre actuelle, les signatures SecF256k1 de Schnorr et les signatures Ed25519 sont disponibles pour compléter les signatures ECDSA secp256k1. À l'avenir, il est trivial d'ajouter de nouveaux schémas de signature dans une soft fork, tels que ceux qui sont de seécuriteé quantitque. Le fait que ces deux suites Schnorr soient disponibles permet également la génération de signatures de groupes simples occupant le même espace d'une signature normale [^6], qui pour les deux est implémentée. À l'avenir, les signatures de seuil utilisant un partage secret sans concession permettront également des signatures de seuil t-of-n occupant la même quantité d'espace[^7].

---

## <i class="fa fa-book"></i> Références 

[^1]: Pornin T. 2013. [StackExchange Cryptography: Should we trust the NIST-recommended ECC parameters?](https://decred.org/research/pornin2013.pdf)
[^2]: Solinas J. 2000. [Efficient arithmetic on Koblitz curves](https://decred.org/research/solinas2000.pdf).
[^3]: Bernstein D. and Lange T. 2014. [SafeCurves: Choosing safe curves for elliptic-curve cryptography](http://safecurves.cr.yp.to).
[^4]: Bernstein D., Duif N., Lange T., Schwabe P., Yang B. 2012. [High-speed high-security signatures](https://decred.org/research/bernstein2012.pdf).
[^5]: Osuntokun O. 2015. [OP_SCHNORRCHECKSIG: Exploring Schnorr Signatures as an alternative to ECDSA for Bitcoin](https://decred.org/research/osuntokun2015.pdf).
[^6]: Petersen T. 1992. [Distributed provers and verifiable secret sharing based on the discrete logarithm problem](https://decred.org/research/petersen1992.pdf).
[^7]: Stinson D. and Strobl R. 2001. Provably secure distributed Schnorr signatures and a (t,n) threshold scheme for implicit certificates.
