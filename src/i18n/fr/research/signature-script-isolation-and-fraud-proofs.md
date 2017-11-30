# Signature Script Isolation et anti-fraude

---

Pour éviter la malléabilité des transactions, la possibilité de générer une transaction avec les mêmes références et sorties d'entrée et pourtant un identifiant de transaction différent, les scripts d'entrée ont étés supprimés du calcul du hash de la transaction. L'origine de cette modification a été controversée, même si elle semble avoir été mise en œuvre dans les deux part CryptoNote et les chaînes latérales dans le passé[^1] [^2]. Il est maintenant proposé pour Bitcoin comme une softfork appelée "Segregated Witness"[^3]. Comme dans la mise en œuvre des élements de chaînes latérales, les engagements relatifs aux données des témoins sont inclus dans l'arbre Merkle du bloc[^2]. En outre, les preuves de fraude, comme suggéré pour la sorftfork de Bitcoin [^3], sont définies par les mineurs et également engagées dans le cadre de l'arbre Merkle.

---

## <i class="fa fa-book"></i> Références 

[^1]: von Saberhagen N. 2013. [CryptoNote v2.0](https://decred.org/research/saberhagen2013.pdf).
[^2]: Maxwell G. 2015. [Bringing new elements to Bitcoin with sidechains](https://decred.org/research/maxwell2015.pdf).
[^3]: Wuille P. 2015. [Segregated witness for Bitcoin](https://prezi.com/lyghixkrguao/segregated-witness-and-deploying-it-for-bitcoin/).
