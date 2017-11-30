# BLAKE-256 Fonctions Hash

---

SHA256, utilisé dans Bitcoin, présente plusieurs lacunes techniques en raison de sa construction Merkle-Damgård. Ces vulnérabilités ont conduit à la compétition SHA3 pour une nouvelle fonction de hachage basée sur une construction fondamentale différente. Decred a choisi BLAKE256 comme sa fonction hash, finaliste pour la compétition [^1] [^2]. La fonction hash est basée autour d'une construction HAIFA qui intègre une variante du code ChaCha par Bernstein. La fonction hash est remarquable pour ses performances élevées sur la microarchitecture x86-64, étant plus rapide pour les messages courts que SHA256 [^3] en dépit d'avoir une marge de sécurité beaucoup plus élevée à 14 tours.

---

## <i class="fa fa-book"></i> Références 

[^1]: Aumasson J., Henzen L., Meier W., Phan R. 2010. [SHA-3 proposal BLAKE](https://decred.org/research/aumasson2010.pdf).
[^2]: Aumasson J., Henzen L., Meier W., Phan R. 2014. The hash function BLAKE.
[^3]: Bernstein D. and Lange T. 2013. [eBACS: ECRYPT benchmarking of cryptographic systems](http://bench.cr.yp.to).
