# **<i class="fa fa-info-circle"></i> Vue d'Ensemble**

---

Les protocoles de timestamping distribués ont d'abord été appliqués à la décentralisation d'un réseau financier dans le document novateur sur Bitcoin par Nakamoto [^1]. Le champ a connu un suivi de la recherche explosive tant des amateurs que des professionnels, en compétition pour offrir des extensions, des ajustements, des évolutions et des améliorations du protocole existant. Les mises en œuvre remarquables de nouvelles idées incluent Ethereum [^2], qui a étendu les scripts, CryptoNote [^3], qui a raffiné la vie privée, et Sidechains [^4], qui a enquêté sur les rattachement bidirectionnels avec des jetons 1:1 Bitcoin. Ces protocoles utilisent tous la preuve de travail (PdT) comme décrit à l'origine dans le White paper Bitcoin.

Une extension commune au protocole Bitcoin modifie le mécanisme de consensus pour utiliser totalement ou partiellement la preuve d'enjeu (PdE) ou l'utilisation de son intérêt (tokens) plutôt que son pouvoir de calcul pour participer au processus de l'horodatage. La première chaine de blocs avec preuve d'enjeu basée sur le protocole de Bitcoin a été implémentée en 2012 par King et Nadal [^5], et inclut à la fois PdT et PdE qui s'écartent peu à peu vers des PdE complets au fil du temps. Les critiques des systèmes purs de consensus PdE ont été abondantes [^6] [^7], avec l'opposition la plus véhémentante de là part de ceux qui travaillent avec des chaînes de blocs purement PdT. L'argument le plus répandu contre PdE pour l'horodatage distribué est «rien en jeu» ou «simulation sans frais», décrivant l'instabilité systématique résultant que les parties prenantes peuvent générer des antécédents horodatés, sans coût pour eux-mêmes.

En dépit de la controverse, il est évident que les systèmes qui ont une superposition PdE dépendent d'un système d'horodatage PdT peuvent être en mesure de parvenir à un consensus. Ceci est étudié mathématiquement par Bentov et ses collègues [^8] dans un document sur leur schéma, la preuve d'activité (PdA) et semble être une extension viable des protocoles PdT qui peuvent permettre de nouvelles propriétés intéressantes. Une conception similaire appelée MC2 a été proposée par Mackenzie en 2013 [^9]. Nous décrivons ici la construction et la mise en œuvre d'un système de consensus similaire que nous avons appelé "Decred".

Le travail de recherche de Decred est actuellement organisé autour des sous-sections suivantes:

* [Design hybride](hybrid-design.md)
* [Participation décentralisée aux enjeux](decentralized-stake-pooling.md)
* [Algorithmes de Signature Elliptic en Courbe](elliptic-curve-signature-algorithms.md)
* [Fonction BLAKE-256 Hash](blake-256-hash-function.md)
* [Extensions du Script](script-extensions.md)
* [Signature d'éléments de script et preuves de fraude](signature-script-isolation-and-fraud-proofs.md)
* [Extensions des Transaction](transaction-extensions.md)
* [Signatures Schnorr](schnorr-signatures.md)
* [Améliorations diverses](miscellaneous-improvements.md)

## **<i class="fa fa-book"></i> Réferences**

[^1]: Nakamoto S. 2008. [Bitcoin: A peer-to-peer electronic cash system](https://decred.org/research/nakamoto2008.pdf).
[^2]: Buterin V. 2014. [A Next-generation smart contract and decentralized application platform](https://decred.org/research/buterin2014.pdf).
[^3]: von Saberhagen N. 2013. [CryptoNote v2.0](https://decred.org/research/saberhagen2013.pdf).
[^4]: Back A., Corallo M., Dashjr L., Friedenbach M., Maxwell G., Miller A., Poelstra A., Timon A., Wuille P. 2014. [Enabling Bitcoin innovations with pegged sidechains](https://decred.org/research/back2014.pdf).
[^5]: King S. and Nadal S. 2012. [PPCoin: Peer-to-peer crypto-currency with proof-of-stake](https://decred.org/research/king2012.pdf).
[^6]: Bentov I., Gabizon A., Mizrahi A. 2015. [Cryptocurrencies without proof-of-work](https://decred.org/research/bentov2015.pdf).
[^7]: Poelstra A. 2015. [On stake and consensus](https://decred.org/research/poelstra2015.pdf).
[^8]: Bentov I., Lee C., Mizrahi A., Rosenfeld M. 2014. [Proof-of-activity: Extending Bitcoin's proof-of-work via proof-of-stake](https://decred.org/research/bentov2014.pdf).
[^9]: Mackenzie A. 2013. [MEMCOIN2: A hybrid proof-of-work, proof-of-stake crypto-currency](https://decred.org/research/mackenzie2013.pdf).