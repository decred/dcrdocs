# Signatures Schnorr

---

Schnorr signatures ont été proposées pour Bitcoin. Elles ont également été largement utilisées dans d'autres cryptocurrency, telles que les crypto Nxt et CryptoNote. Dans le cas le plus simple, un cryptosystème ECDSA de signature Schnorr peut être décrit comme suit:

1. \(y = xG\) where \(y\) Est le point de la clé publique est sur la courbe, \(x\) est le scalaire privé, \(G\) est le générateur de courbe.
2. \(r = kG\) ou \(r\) est le point sur la courbe résultant de la multiplication de \(k\), le non scalaire, par le générateur.
3. \(h = H(M || r)\) ou \(H\) est une fonction de hash sur, \(M\) est le messagee (habituellement un hash 32 octets), et \(r\) est le point encodé précédement expliqué. \(||\) denotes la concaténation.
4. \(s = k - hx\) ou \(s\) est le scalaire dénoté à partir de \(k - hx\).
5. La signature est \((r,s)\), et la vérification est simple \(H(M || r) == hQ + sG\).

Dans ce qui précède, les multiplications par une lettre majuscule (par exemple, \(kG\)) sont des multiplications ponctuelles par un scalaire, et donc entraînent toujours un point sur la courbe. L'ajout de ces points aboutit à un autre point. Les ajouts et les multiplications de scalaires entre eux sont les memes que la multiplication régulière que vous feriez avec n'importe quel nombre entier. Il est important de noter que la multiplication d'un point par un scalaire est considéré comme une étape irréversible, car le calcul du scalaire du nouveau point de défaut pour la discretion du logarithme.

Dans ce qui précède, il est clair que\(r\) est un point sur la courbe, tandis que \(s\) est un scalaire. Considérons le groupe de signataires représenté par \(x_{sum} = x_1 + ... + x_n\) avec nonces \(k_{sum} = k_1 + ... + k_n\). La clé publique pour la somme scalaire privée serait: \(y = x_{sum} G\). La signature pour ces sommes (de tout les participant du groupe) serait: \(r' = k_{sum} G s' = k_{sum} - h x_{sum}\). Pour générer cette signature, tous les participants devraient partager leur clé privée et leur points au préalable. Nous voulons évidemment éviter cela, alors nous demandons à chaque participant de créer une signature partielle. \(r_n = k_1 G + ... + k_n G = r'\) (La somme des points publics autres que les participants peuvent publier individuellement) \(s_n = k_n - h x_n\). En remplaçant ceci en formules générales pour les signatures et en utilisant l'addition ponctuelle ou scalaire: \(r = r_n = r'\) (là même ci-dessus) \(s = s_1 + ... + s_n = s'\) (simple addition scalaire; Il doit être vrai que \((k_1 - h x_1) + ... + (k_n - h x_n) = s_1 + ... + s_n = s')\). Faire une signature m-of-n n'est pas trivial. Il a été suggéré qu'un arbre de merkle contenant toutes les sommes possibles de la clé publique pour \(m\) participants soit utilisé pour ces cas, générant \(log(n)\) signature de taille [28].

---

## <i class="fa fa-book"></i> Références

[^1]: Wuille P. 2015. [Tree signatures: Multisig on steroids using tree signatures](https://decred.org/research/wuille2015.pdf).
