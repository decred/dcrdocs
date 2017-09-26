# Signature Scriptin Eristäminen ja Huijauksen Esto

---

Jotta transaction malleability, eli mahdollisuus generoida siirto samoilla input referensseillä ja outputeilla, mutta eri siirto ID:llä, voidaan estää, input scriptit on poistettu transaction hashin laskemisesta. Tämän modifikaation alkuperät ovat kiistanalaisia, vaikkakin vaikuttaa että se on aikaisemmin sisällytetty sekä CryptoNote-kolikoihin että sidechaineihin[^1] [^2]. Sitä on nyt ehdotettu Bitcoinia varten soft forkkina joka tunnetaan nimellä "Segregated Witness"[^3]. Kuten Elements sidechain implementaatiossa, sitoumukset witness dataan on sisällytetty lohkon merkle rootiin[^2]. Lisäksi, huijauksen estot, kuten ehdotettu Bitcoinin soft fork[^3], asetetaan louhijoiden toimesta ja sitoutetaan osaksi dataa merkle treessä.

---

## <i class="fa fa-book"></i> Lähteet

[^1]: von Saberhagen N. 2013. [CryptoNote v2.0](https://decred.org/research/saberhagen2013.pdf).
[^2]: Maxwell G. 2015. [Bringing new elements to Bitcoin with sidechains](https://decred.org/research/maxwell2015.pdf).
[^3]: Wuille P. 2015. [Segregated witness for Bitcoin](https://prezi.com/lyghixkrguao/segregated-witness-and-deploying-it-for-bitcoin/).
