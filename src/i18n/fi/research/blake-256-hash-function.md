# BLAKE-256 Hash Algoritmi

---

Bitcoinin käyttämällä SHA256-algoritmillä on useita teknisiä rajoituksia johtuen sen Merkle-Damgård-rakenteesta. Nämä haavoittuvuuden johtivat SHA3 kilpailuun jolla etsittiin uutta hash funktiota joka perustuisi eri perusrakenteeseen. Decred valitsi algoritmikseen BLAKE256:n, joka oli kilpailun finalisti[^1] [^2]. Tämä hash funktio perustuu HAIFA-rakenteeseen johon on sisällytetty variaatio Bernsteinin ChaCha stream cipherista. Blake on huomattava sen hyvästä performanssista  x86-64 mikroarkkitehtuurissa, se on SHA256:ta nopeampi lyhyiden viestien kanssa[^3], huolimatta sen korkeammasta turvallisuudesta 14 roundilla. 

---

## <i class="fa fa-book"></i>Lähteet

[^1]: Aumasson J., Henzen L., Meier W., Phan R. 2010. [SHA-3 proposal BLAKE](https://decred.org/research/aumasson2010.pdf).
[^2]: Aumasson J., Henzen L., Meier W., Phan R. 2014. The hash function BLAKE.
[^3]: Bernstein D. and Lange T. 2013. [eBACS: ECRYPT benchmarking of cryptographic systems](http://bench.cr.yp.to).
