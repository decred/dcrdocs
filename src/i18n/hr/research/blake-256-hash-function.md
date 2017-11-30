# BLAKE-256 Ključna funkcija

---

SHA256, koji se koristi u Bitcoinu, ima niz tehničkih nedostataka zbog svoje konstrukcije Merkle-Damgård. Te ranjivosti dovele su do natjecanja SHA3 za novu ključnju funkciju-a koja se temelji na drugoj temeljnoj konstrukciji. Decred je odabrao BLAKE256 kao svoju ključnu funkciju, finalist za natjecanje[^1] [^2]. Ključna funkcija temelji se na HAIFA konstrukciji koja uključuje varijaciju ChaCha stream šifra od Bernstein. Ključna funkcija je poznata po svojim visokim performansama na mikro arhitekturi x86-64,  brža je za kratke poruke od SHA256[^3] iako se smatra da ima mnogo veću sigurnosnu marginu u 14 krugova.

---

## <i class="fa fa-book"></i> Preporuke 

[^1]: Aumasson J., Henzen L., Meier W., Phan R. 2010. [SHA-3 ponuda BLAKE](https://decred.org/research/aumasson2010.pdf).
[^2]: Aumasson J., Henzen L., Meier W., Phan R. 2014.  Ključna funkcija BLAKE.
[^3]: Bernstein D. and Lange T. 2013. [eBACS: ECRYPT vrednovanje kriptografskih sustava](http://bench.cr.yp.to).
