# Estensioni dello script 

---

A parte gli OP_CHECKSIGALT e OP_CHECKSIGALTVERIFY citati in precedenza, sono state apportate altre modifiche allo script di Bitcoin. Un byte di versione è stato aggiunto agli script di output per consentire una semplice forking morbida alle nuove lingue di script, come suggerito da Wuille[^1]. Tutti i codici OP relativi alla matematica e alla logica sono stati riattivati ​​e ora operano sui registri int32. Sono state inoltre implementate e riattivate diverse code di manipolazione di stringhe di byte. I restanti codici OP non utilizzati Bitcoin sono stati ripristinati per future forcelle morbide. Sono stati anche risolti alcuni errori di lunga durata nel linguaggio di script di Bitcoin[^2] [^3].

---

## <i class="fa fa-book"></i> References

[^1]: Wuille P. 2015. [Segregated witness for Bitcoin](https://prezi.com/lyghixkrguao/segregated-witness-and-deploying-it-for-bitcoin/).
[^2]: Todd P. [The difficulty of writing consensus critical code: The SIGHASH_SINGLE bug](https://decred.org/research/todd2014.pdf).
[^3]: Franco P. Understanding Bitcoin, 6.3: Multisignature (M-of-N) Transactions.
