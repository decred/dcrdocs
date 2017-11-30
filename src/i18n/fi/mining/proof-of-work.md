# Proof-of-Work (PoW)-louhinta

---

## Yleiskatsaus

Proof-of-Work-louhinta, yleisemmin PoW-louhinta, on toimintaa jossa
louhija antaa tietokoneensa resursseja verkon käyttöön rahansiirtojen
prosessointia ja lohkoketjun rakentamista varten.
Joka kerta kun uusi lohko on ratkaistu (louhijan toimesta), syntyy noin 30 uutta
Decred-kolikkoa. Nämä kolikot jaetaan seuraavasti:

Määrä | Osapuoli
---     | ---
60%   | PoW-louhijat
30%   | PoS-äänestäjät
10%   | Decredin kehitysrahasto

Saat, keskimäärin, palkkion joka on suurin piirtein verrannollinen
laitteistosi hashrateen ja verkon kokonais hashrateen kun käytät koneesi
tehoja PoW-louhintaan. Alkuun päästäksesi tarvitset tietokoneen jossa on
näytönohjainkortti. Suurin osa näytönohjaimista kelpaavat louhintaan (mukaanlukien
"mobiili" tyyppiset joita löytyy joistakin kannettavista.) Yleisesti, paremmat näytönohjaimet pystyvät
parempaan hashrateen ja siten tienaavat suurempia palkkioita.
---

## Soololouhinta vai Poolilouhinta

> <i class="fa fa-male"></i> Soololouhinta

<i class="fa fa-exclamation-triangle"></i> **Soololouhintaa ei suositella, eikä sitä käsitellä tässä dokumentissa!** Decred-verkon yhteenlaskettu hash rate on usein jopa 10,000Gh/s. Soololouhintaa tekevät käytännössä vain tahot joilla on suuria GPU-määriä joten sitä ei käsitellä tässä. 

> <i class="fa fa-users"></i> Poolilouhinta

Kun louhit poolissa, hashratesi yhdistetään poolin muiden louhijoiden hashraten kanssa etsimään yhdessä oikeaa ratkaisua lohkoon. Saat palkkion perustuen oman minerisi poolissa suorittamaan työmäärään.
Poolilouhinta jakaa osuudet perustuen löydettyihin lohkoihin joten voit tienata Decrediä tasaista tahtia, toisin kuin soolo louhinnan "kaikki tai ei mitään" ympäristössä.

---

## Hanki Decred-osoite johon voit ottaa vastaan varoja

Seuraa [dcrctl perusteet](/getting-started/user-guides/dcrctl-basics.md)-opasta ja tee osoite johon voin nostaa louhintapalkkiosi.

---

## <i class="fa fa-life-ring"></i>Liity Louhintapooliin

Näiden poolien tiedetään tukevan Decrediä:

* [<i class="fa fa-external-link-square"></i>http://decredpool.org](http://decredpool.org)
* [<i class="fa fa-external-link-square"></i> http://yiimp.ccminer.org](http://yiimp.ccminer.org)
* [<i class="fa fa-external-link-square"></i> http://coinmine.pl/dcr](http://coinmine.pl/dcr)
* [<i class="fa fa-external-link-square"></i> https://dcr.maxminers.net](https://dcr.maxminers.net)
* [<i class="fa fa-external-link-square"></i> https://dcr.suprnova.cc](https://dcr.suprnova.cc)
* [<i class="fa fa-external-link-square"></i> https://pool.mn/dcr](https://pool.mn/dcr)
* [<i class="fa fa-external-link-square"></i> https://zpool.ca](https://zpool.ca)

Louhintapoolit toimivat kaikki enemmän tai vähemmän samalla tavalla mutta saatat haluta liittyä useampaan pooliin nähdäksesi mikä niistä sopii sinulle parhaiten.

On suotavaa louhia pienemmässä poolissa jotta verkon hashratea saadaan jaettua enemmän ja louhintateho ei ole niin keskittynyttä!

---

## GPU Ajurit/Ohjelmistot

GPU-ajurit sisältävät useimmiten louhintaan tarvittavat libraryt. Jos sinulla on vaikeuksia käyttää ohjelmistoa, saatat joutua asentamaan ajurit uudelleen, ja erityisesti tarkistamaan että OpenCL (AMD) tai CUDA (NVIDIA) libraryt on valittu.

---

## <i class="fa fa-download"></i> Valitse ja Lataa Louhintaohjelma

### Virallinen Decred Louhija (gominer)

Gominer on virallinen Decredtiimin kehittämä ja tukema Decred-louhija. Se on helpoin louhija asentaa ja ottaa käyttöön joten sitä suositellaan useimmille käyttäjille. Tämän hetkinen uusin gominer versio on **<i class="fa fa-github"></i> [v1.0.0](https://github.com/decred/gominer/releases/)** ja viralliset binaryt voi ladata osoitteesta  **[https://github.com/decred/decred-binaries/releases/tag/v1.0.0](https://github.com/decred/decred-binaries/releases/tag/v1.0.0)**

Pidä huoli että valitset oikean käyttöjärjestelmän (Windows/Linux) ja oikean version GPU-tyypillesi (CUDA NVIDIA-korteille, OpenCL/OpenCLADL AMD-korteille). gominer on saatavilla vain 64-bittisille käyttöjärjestelmille. Käyttöoppaat louhinnan aloittamiseen gominerilla löydät täältä:

- [Poolilouhinta Windowsilla](/mining/proof-of-work/pool-mining/gominer/windows.md)

### Epäviralliset Louhijat

* <i class="fa fa-github"></i> [cgminer](https://github.com/kR105-zz/cgminer) - cgminer on suosittu mineri **AMD** näytönohjaimille, ja sillä on pitkä historia eri kryptovaluuttojen kanssa. Se on vaikeampi käyttää kuin decredin gominer. 

* <i class="fa fa-github"></i> [ccminer](https://github.com/tpruvot/ccminer) - ccminer on suosittu luhija **NVIDIA** näytönohjaimille, ja sillä on pitkä historia eri kryptovaluuttojen kanssa. Se on vaikeampi käyttää kuin decredin gominer. 

* <i class="fa fa-github"></i> [sgminer](https://github.com/tpruvot/sgminer) - Windowsia käyttävät **AMD** näytönohjaimen omistajat saattavat haluta ladata sgminerin.

---

## Ohjelmiston Käyttö

* Pura ja asenna ohjelmisto haluamaasi paikkaan.
* Avaa komentojono ohjelman sijaintiin.
* Seuraa poolisi ohjeita asetuksia varten.
* Käynnistä louhija.

Jatka [PoW-Louhinta FAQ](/faq/proof-of-work-mining.md)-oppaaseen
