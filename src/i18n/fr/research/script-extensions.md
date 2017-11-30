# Extensions de script

---

Outre les OP_CHECKSIGALT et OP_CHECKSIGALTVERIFY précédemment mentionnés, d'autres modifications apportées aux scripts Bitcoin ont été réalisées. Un octet de version a été ajouté aux scripts de sortie pour permettre une softfork aux nouveaux langages de script, comme l'a suggéré en premier Wuille [^1]. Tous les codes OP liés aux mathématiques et à la logique ont été réactivés et fonctionnent maintenant sur les registres int32. Plusieurs codes OP de manipulation de chaîne d'octets ont également été mis en œuvre et réactivés. Les codes restants de Bitcoin OP non utilisés ont été réutilisés pour les futures softfork. Certains bugs de longue date dans le langage de script Bitcoin ont également été corrigés[^2] [^3].

---

## <i class="fa fa-book"></i> References

[^1]: Wuille P. 2015. [Segregated witness for Bitcoin](https://prezi.com/lyghixkrguao/segregated-witness-and-deploying-it-for-bitcoin/).
[^2]: Todd P. [The difficulty of writing consensus critical code: The SIGHASH_SINGLE bug](https://decred.org/research/todd2014.pdf).
[^3]: Franco P. Understanding Bitcoin, 6.3: Multisignature (M-of-N) Transactions.
