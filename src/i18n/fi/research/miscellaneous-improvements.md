# Sekalaiset Parannukset

---

Kuten Bitcoinin, myös uusien syntyvien Decredien määrä vähenee exponentiaalisesti lohkokorkeuden kasvaessa. Mutta Decredin algoritmi, vaikkakin yksinkertainen, jakaa tämän vähennyksen tasaisemmin pitkälle ajalle, eikä siten aikaansaa suurta marketshokkia suurella kertapudotuksella kuten CryptoNote[^1]. Kuten PeerCoin[^2], PoW-vaikeusaste lasketaan exponentiaalisesti painotetusta lohkoaikojen keskiarvosta. Tämä kalkulaatio tehdään tiettyin väliajoin, kuten Bitcoinissakin. Bitcoinin "timewarp"-bugi korjataan[^3] varmistamalla että jokainen eroavaisuus lohkoajassa on mukana vaikeustasoa laskettaessa.

Huomioitavaa on myös että monet hyvin tunnetut louhintahyökkäykset, kuten selfish mining[^4]  ja stubborn mining[^5], eivät tarjoa etua järjestelmssä, jossa stake-louhinta on tehokkaasti hajautettu ja PoW-PoS-louhintakolluusiota ei ole. Tämä johtuu siitä että on mahdotonta generoida salaisia laajennuksia lohkoketjuihin ilman stake-louhijoiden apua. Kyky vastustaa aikaisemmin kuvattuja louhintahyökkäyksiä, sekä uudenlaisia, meidän järjestelmällemme ominaisia hyökkäyksiä, on hyvä tutkimusalue tulevaisuudessa.

---

## <i class="fa fa-book"></i> Lähteet

[^1]: Buterin V. 2014. [A next-generation smart contract and decentralized application platform](https://decred.org/research/buterin2014.pdf).
[^2]: King S. and Nadal S. 2012. [PPCoin: Peer-to-peer crypto-currency with proof-of-stake](https://decred.org/research/king2012.pdf).
[^3]: ArtForz. 2011. [Re: Possible way to make a very profitable 50 plus-ish attack for pools?](https://decred.org/research/artforz2011.pdf)
[^4]: Eyal I. 2015. [The miner's dilemma](https://decred.org/research/eyal2015.pdf).
[^5]: Nayak K., Kumar S., Miller A., Shi E. 2015. [Stubborn mining: Generalizing selfish mining and combining with an eclipse attack](https://decred.org/research/nayak2015.pdf).
