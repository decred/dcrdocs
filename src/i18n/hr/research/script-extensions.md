# Proširenja skripte 

---

Osim prethodno spomenutih OP_NADZORSIGALT i OP_PROVJERANADZORASIGALT, napravljene su i druge izmjene Bitcoin skriptiranja. Verzija bajtova dodana je izlaznim skriptama kako bi se omogućilo jednostavno lagano grananje novim skriptnim jezicima, što je prvo predložilo Wuille[^1].  Svi matematički i logički povezani OP kodovi ponovno su omogućeni i sada djeluju na registrima int32. Također su implementirane i ponovo omogućene različite inačice bajtnih manipulacija bajtova. Preostali neiskorišteni Bitcoin OP kodovi su ponovno postavljeni za buduće lagano grananje. Neki dugotrajni bugovi u Bitcoin skriptnom jeziku također su bili fiksni[^2] [^3].

---

## <i class="fa fa-book"></i> References

[^1]: Wuille P. 2015. [Usamljeni svjedok za Bitcoin](https://prezi.com/lyghixkrguao/segregated-witness-and-deploying-it-for-bitcoin/).
[^2]: Todd P. [Poteškoće u pisanju kriticnog kodeksa: SIGHASH_SINGLE bug](https://decred.org/research/todd2014.pdf).
[^3]: Franco P. Understanding Bitcoin, 6.3: Multisignature (M-of-N) Transactions.
