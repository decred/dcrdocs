# Scripti Laajennukset

---

Aikaisemmin mainittujen OP_CHECKSIGALT ja OP_CHECKSIGALTVERIFY lisäksi, muitakin modifikaatioita Bitcoin-scriptingiin on tehty. Output scripteihin on lisätty version byte jotta yksinkertainen soft forking uusille scriptingkielille olisi mahdollista, kuten Wuille[^1] on ehdottanut. Kaikki matematiikka ja logiikka OP-koodeihin liittyen on otettu uudelleen käyttöön ja toimii nyt int32 registereillä. Useita byte string manipulation OP-koodeja on myös lisätty ja otettu uudelleen käyttöön. Loput käyttämättömät Bitcoin OP-koodit on kierrätetty tulevaisuuden soft forkeja varten. Joitain pitkäaikaisia bugeja Bitcoinin scriptingkielessä on myös korjattu [^2] [^3].

---

## <i class="fa fa-book"></i> References

[^1]: Wuille P. 2015. [Segregated witness for Bitcoin](https://prezi.com/lyghixkrguao/segregated-witness-and-deploying-it-for-bitcoin/).
[^2]: Todd P. [The difficulty of writing consensus critical code: The SIGHASH_SINGLE bug](https://decred.org/research/todd2014.pdf).
[^3]: Franco P. Understanding Bitcoin, 6.3: Multisignature (M-of-N) Transactions.
