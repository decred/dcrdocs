# Raznovrsna poboljšanja 

---

Kao iu Bitcoinu, subvencija se eksponencijalno raspada s visinom blokova. Međutim, Decredov algoritam, iako vrlo jednostavan, bolje interpolira ovo raspadanje tijekom vremena kako ne bi došlo do tržišnog šoka sa strmim padom subvencija slično CryptoNoteu[^1]. Kao i PeerCoin[^2],  poteškoća PoW izračunava se iz eksponencijalno ponderiranog prosjeka razlika u prethodnim vremenima blokiranja. Međutim, ovaj je izračun također interpoliran u Bitcoinove vremenske prozore. "Bitka" iskrivljenog vremena u Bitcoinu ispravlja se[^3], osiguravajući da svaka razlika u vremenu bloka bude uključena u izračun težine.

Treba također napomenuti da mnogi dobro poznati vaditeljski napadi, kao što su sebično vađenje[^4] i tvrdokorno vađenje[^5], više neće funkcionirati korisno u sustavu u kojem postoji učinkovita decentralizacija vađenja i ne PoW-PoS rudara dosluhu. To je jednostavno zato što je nemoguće generirati tajne nastavke blokova bez pomoći vaditelja na dionicama. Otpornost na prethodno opisane vaditeljske napade, kao i novo osmišljeni vaditeljski napadi specifični za naš sustav, bit će plodno područje za buduća istraživanja.

---

## <i class="fa fa-book"></i> Preporuke 

[^1]: Buterin V. 2014. [Pametni ugovor nove generacije i decentralizirana aplikacijska platforma](https://decred.org/research/buterin2014.pdf).
[^2]: King S. and Nadal S. 2012. [PPCoin: Kriptopovalentni peer-to-peer s dokazom uloga](https://decred.org/research/king2012.pdf).
[^3]: ArtForz. 2011. [Re: Mogući način zaraditi vrlo profitabilan 50 plus-ish napad na zalihe?](https://decred.org/research/artforz2011.pdf)
[^4]: Eyal I. 2015. [Dvojba vaditelja](https://decred.org/research/eyal2015.pdf).
[^5]: Nayak K., Kumar S., Miller A., Shi E. 2015. [Tvrdokorno vađenje: Generaliziranje sebičnog vađenja i kombiniranje s pomakom pomračenja](https://decred.org/research/nayak2015.pdf).
