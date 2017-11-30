# <i class="fa fa-cubes"></i> Lohkot

---

#### 1. Voiko lohko orpoutua useamman vahvistuksen jälkeen?

Ainoastaan jos tapahtuu pitkä uudelleenorganisointi[^8918].  Että näin voisi käydä, forkin toisella puolella olevan laskentatehon on oltava suurempi kuin nykyisen parhaan ketjun laskentateho.

---

#### 2. Voiko testnetin lohkohaun poistaa kun mainnetin lohkohaku on saatavilla?

Testnet on jatkossakin testialusta uusille ominaisuuksille, joten on järkevää pitää myös testnetin lohkohaku[^9621]  saatavilla.

---

#### 3. Mitä "[INF] CHAN: Adding orphan block" viestit tarkoittavat?

Se tarkoittaa vain, että sinulla ei ole parentia vastaanottamallesi lohkolle[^14660]. Tämä tapahtuu lähes aina kun `dcrd`  uudelleenkäynnistetään johtuen tavasta miten synkronointi toimii. Olet synkkaamassa tuoreimpaan lohkoon saakka, mutta käyttäjä jonka ketju on sinua edellä, lähetti tiedon uudesta lohkosta, jolle sinulla ei ole vielä parentia.

Sen sijaan että tämä jätettäisiin huomioimatta, lohko pidetään tallessa, joten kun synkronointisi on lähempänä valmista ja olet ladannut parent-lohkot, nämä uudemmat lohkot sopivat yhteen automaattisesti.

---

#### 4. Tarvitseeko minun ladata lohkoketju uudestaan jokaisen uuden ohjelmistopäivityksen jälkeen?

Tarvetta ketjun uudelleenlataamiselle ei päivityksen yhteydessä ole juuri koskaan[^14788] , ellei kyseessä ole massiivinen muutos jonka yhteydessä on järkevää aloittaa alusta. Useimmat päivitykset siirtävät kaiken mukanaan jolloin kaikki toimii normaalisti. 

---

#### 5. Mikä on genesis-lohkon numero?

Genesis lohko[^16987]  on lohko numero 0. Jokainen lohko tämän jälkeen aina yhden numeron suurempi

---

#### 6. Mitä tarkoittaa viesti: "[INF] CHAN: FORK: Block 000..." ?

Esimerkkiviesti:

```no-highlight
[INF] CHAN: FORK: Block 0000000000001aedcf1b82b087a1d05ef787550174da1012e473e8ee8c178937 (height 17879) forks the chain at height 17878/block 000000000000150f863186cab6ef5c433bcc155d2f683394f8e65cb037f80b16, but does not cause a reorganize
```

Tämä tarkoittaa että kaksi louhijaa löysi ratkaisun lohkolle samanaikaisesti, ja molemmat lähettivät ratkaisemansa lohkon verkkoon[^17791]. Molemmat ovat yhtä lailla valideja, mutta sinun nodesi huomasi toisen ratkaisun   ([000000000000147d33cde5e9823122924fb43405418712720eb6457956d8edbb](https://mainnet.decred.org/block/000000000000147d33cde5e9823122924fb43405418712720eb6457956d8edbb)) ensin, jolloin tämän noden näkökulmasta uusi lohko ([0000000000001aedcf1b82b087a1d05ef787550174da1012e473e8ee8c178937](https://mainnet.decred.org/block/0000000000001aedcf1b82b087a1d05ef787550174da1012e473e8ee8c178937)) on eri ketjussa.

Koska uudella lohkolla kestää hetken päätyä koko verkon tietoon, toiset nodet ovat saattaneet nähdä ratkaisun 0000000000001aedcf1b82b087a1d05ef787550174da1012e473e8ee8c178937 ensin, jolloin heidän näkökulmastaan ratkaisu jonka sinun nodesi näki ensin ([000000000000147d33cde5e9823122924fb43405418712720eb6457956d8edbb] (https://mainnet.decred.org/block/000000000000147d33cde5e9823122924fb43405418712720eb6457956d8edbb)) on eri ketjussa.

Tämä on normaali tilanne joka ratkeaa itsestään heti kun seuraava lohko on löydetty. Tämä määrittää pisimmän ketjun ja kumpi tahansa ratkaisu, joka jää ilman jatkoa, muuttuu orvoksi.

Tässä tapauksessa, lohko #17880 ([000000000000154c6091747245e3c2620447c71b346aed09548e74b4543d0d66](https://mainnet.decred.org/block/000000000000154c6091747245e3c2620447c71b346aed09548e74b4543d0d66)) päätyi jatkoksi ratkaisulle 000000000000147d33cde5e9823122924fb43405418712720eb6457956d8edbb, jolloin toinen ratkaisu ([0000000000001aedcf1b82b087a1d05ef787550174da1012e473e8ee8c178937](https://mainnet.decred.org/block/0000000000001aedcf1b82b087a1d05ef787550174da1012e473e8ee8c178937)) jäi orvoksi.

---

## <i class="fa fa-book"></i>Lähteet 

[^8918]: Decred Forum, [Post 8,918](https://forum.decred.org/threads/557/#post-8918)
[^9621]: Decred Forum, [Post 9,621](https://forum.decred.org/threads/651/#post-9621)
[^14660]: Decred Forum, [Post 14,660](https://forum.decred.org/threads/1333/#post-14660)
[^14788]: Decred Forum, [Post 14,788](https://forum.decred.org/threads/1336/#post-14788)
[^16987]: Decred Forum, [Post 16,987](https://forum.decred.org/threads/1852/#post-16987)
[^17791]: Decred Forum, [Post 17,791](https://forum.decred.org/threads/2925/#post-17791)
