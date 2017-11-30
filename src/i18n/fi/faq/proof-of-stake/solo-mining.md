# <i class="fa fa-male"></i>Soololouhinta

---

#### 1. Tarvitsenko laskentatehoa louhintaan?

Stake "louhinta" ei tarvitse lainkaan laskentatehoa[^9304]. Sitä voi ajatella ikään kuin korkona sijoitetuille kolikoilla. Lukitset kolikkosi tietyksi aikaa ostaaksesi lipukkeen joka antaa sinulle korkean todennäköisyyden (>99%) äänestysoikeuteen ja koron tienaamiseen vastineeksi äänestämisestä ja kolikoiden lukitsemisesta mahdollisesti jopa ~4.7 kuukauden ajaksi.

Jos olet jo ostanut stake-lipukkeita, niihin käytetyt kolikot pysyvät lukittuna kunnes lipukkeesi joko voittaa tai vanhenee. Kun stake-louhit soolona, sinun TÄYTYY pitää lompakkosi online 24/7 kunnes kaikki lipukkeesi ovat voittaneet (tai vanhentuneet) tai menetät palkkion, sillä et pysty äänestämään jos lompakkosi ei ole online. Koska kolikot on lukittu, ei ole olemassa keinoa muuttaa tätä steikattujen kolikoiden osalta enää jälkikäteen. 

Stake pool sen sijaan sallii sinun delegoida äänestyksen poolille, joka on tällöin vastuussa pysymisestä online 24/7 ja puolestasi äänestämisestä.

---

#### 2. Eikö stake louhinnan pääasiallinen tarkoitus ole varmistaa että verkossa on aina riittävä määrä peerejä online?

Ei[^9311]. Stake-louhinta ei pysty sitä vahtimaan. SPV-tyylinen lompakko voi helposti suorittaa tarvittavan steikkaamisen kommunikoimalla muiden full nodejen kanssa (`dcrd` instancet) verkossa. Tämän hetkinen lompakko vaatii että `dcrd` on käynnissä, mutta asia ei tule aina olemaan näin.

Vaikka ohjelmisto yrittäisi valvoa tätä, on mahdotonta estää ihmisiä kirjoittamasta työkaluja tehdäkseen sen peer-to-peer verkossa pitämättä omaa paikallista prosessia auki.

---

#### 3. Mitä tapahtuu jos lompakkooni ei saa yhteyttä tai se on lukittu louhijoiden valitessa lipukkeeni?

Jos lompakkosi on offline tai lukittu[^9806] kun lipukkeesi valitaan, menetät mahdollisuuden palkkioon ja lipukkeesi poistetaan poolista välittömästi. Tätä ei voi jälkikäteen muuttaa.

---

#### 4. Onko olemassa tapaa testata että koneeni on tavoitettavissa äänestystä varten? Eli siis ajaa toiminnot mitä louhija kaipaa saadakseen ääneni.

Sinun ei tarvitse olla tavoitettavissa. Äänestäminen on determinististä lohko-kohtaisesti[^9806]. Tämä tarkoittaa että lompakkosi tietää jos lipukkeesi tuli valituksi tämänhetkisen lohkon perusteella ja sitten "vote transaction" (ssgen siirto) lähetetään verkkoon, aivan kuten muutkin siirrot.

---

#### 5. Voinko pitää käynnissä useampaa vain-äänestys lompakkoa samalla siidillä usealla serverillä?

Voit käyttää useampaa vain-äänestys lompakkoa sillä ne eivät tee uusia osoitteita[^12697]. Ongelma syntyy kun sinulla on kaksi lompakkoa tekemässä siirtoja joihin sisältyy uusia osoitteita sillä ne eivät tiedä mitä toinen on tekemässä.

Jos setuppisi on hot/cold, voit tehdä useita hot walleteja pelkkään äänestämiseen ilman ongelmia, kunhan ne ovat tietoisia osoitteesta jolle annat äänioikeuden.

Jatka lukemaan [Stake-poolit FAQ](/faq/proof-of-stake/stake-pools.md)

---

## <i class="fa fa-book"></i> Lähteet

[^9304]: Decred Forum, [Post 9,304](https://forum.decred.org/threads/626/page-2#post-9304)
[^9311]: Decred Forum, [Post 9,311](https://forum.decred.org/threads/582/page-2#post-9311)
[^9806]: Decred Forum, [Post 9,806](https://forum.decred.org/threads/180/page-6#post-9806)
[^12697]: Decred Forum, [Post 12,697](https://forum.decred.org/threads/1127/#post-12697)
