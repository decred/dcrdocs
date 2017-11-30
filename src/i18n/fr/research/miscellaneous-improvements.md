# Améliorations diverses

---

Comme dans Bitcoin, les subventions décroissent de façon exponentielle avec une hauteur de bloc. Cependant, l'algorithme de Decred, bien que extrêmement simple, interpole mieux cette décroissance au fil du temps afin de ne pas provoquer de choc de marché avec des chutes de subvention abruptes similaires à CryptoNote[^1]. Comme PeerCoin[^2], la difficulté PdT est calculée à partir de la moyenne pondérée exponentiellement des différences dans les temps de blocages précédents. Cependant, ce calcul est également interpolé dans des périodes de fenêtre de difficulté Bitcoin. Le bug "timewarp" dans Bitcoin est corrigé[^3], en veillant à ce que chaque différence de temps de blocage soit intégrée au calcul de la difficulté.

Il convient également de noter que de nombreuses attaques de minage bien connues, telles que l'enjeu égoïste[^4] et l'enjeu obstiné[^5], ne fonctionneront plus avantageusement dans un système où il y a une décentralisation effective de l'enjeu et aucune mineur connivence de PdT-PdE. C'est tout simplement parce qu'il est impossible de générer des extensions secrètes pour bloquer les chaînes sans l'aide des mineurs d'enjeu. La résilience aux attaques précédemment décrites, et les attaques de minage nouvellement conçues spécifiques à notre système, seront un domaine fructueux pour les recherches futures.

---

## <i class="fa fa-book"></i> Références 

[^1]: Buterin V. 2014. [A next-generation smart contract and decentralized application platform](https://decred.org/research/buterin2014.pdf).
[^2]: King S. and Nadal S. 2012. [PPCoin: Peer-to-peer crypto-currency with proof-of-stake](https://decred.org/research/king2012.pdf).
[^3]: ArtForz. 2011. [Re: Possible way to make a very profitable 50 plus-ish attack for pools?](https://decred.org/research/artforz2011.pdf)
[^4]: Eyal I. 2015. [The miner's dilemma](https://decred.org/research/eyal2015.pdf).
[^5]: Nayak K., Kumar S., Miller A., Shi E. 2015. [Stubborn mining: Generalizing selfish mining and combining with an eclipse attack](https://decred.org/research/nayak2015.pdf).
