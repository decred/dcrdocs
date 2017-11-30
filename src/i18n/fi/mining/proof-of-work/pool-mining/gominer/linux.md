# **<i class="fa fa-linux"></i> *gominer* Linux Poolilouhinnan Käyttö-opas**

Tämän oppaan tarkoitus on auttaa alkuun gominerin kanssa perusasetuksilla halutussa poolissa konfiguraatiotiedostoa käyttäen; Edistyneempiä vaihtoehtoja on saatavilla.

Viimeksi päivitetty 28. Huhtikuuta, 2017.

---

### **<i class="fa fa-download"></i> Lataa ja pura *gominer* Binary**


>Lataa .tar.gz -tiedosto

Käy osoitteessa [https://github.com/decred/decred-binaries/releases](https://github.com/decred/decred-binaries/releases) ladataksesi uusimmat gominer Linux binaryt. Vain 64-bittiset versiot gominerista ovat saatavilla. Tämänhetkiset uusimmat julkaisut ovat:

- `gominer-linux-amd64-cuda-v1.0.0.tar.gz`,
- `gominer-linux-amd64-opencl-v1.0.0.tar.gz`,
- `gominer-linux-amd64-opencladl-v1.0.0.tar.gz`.

NVIDIA-näytönohjaimille, lataa `*-cuda-*.tar.gz`-tiedosto.<br />
AMD-näytönohjaimille Radeon ja FirePro sarjoista, lataa `*-opencladl-*.tar.gz`-tiedosto. <br />
Muille näytönohjaimille, lataa `*-opencl-*.tar.gz` -tiedosto.

Kaikille komentojonoa fanittaville, tässä suorat linkit versiolle 1.0.0:

```no-highlight
$ wget https://github.com/decred/decred-binaries/releases/download/v1.0.0_gominer/gominer-linux-amd64-cuda-v1.0.0.tar.gz
$ wget https://github.com/decred/decred-binaries/releases/download/v1.0.0_gominer/gominer-linux-amd64-opencl-v1.0.0.tar.gz
$ wget https://github.com/decred/decred-binaries/releases/download/v1.0.0_gominer/gominer-linux-amd64-opencladl-v1.0.0.tar.gz
```

>Pura .tar.gz -tiedosto

Pura tai kopioi kaikki tiedostot uuteen kansioon. Tässä oppaassa käytämme `~/decred/` -kansiota esimerkkinä. Komentojonosta:

```no-highlight
$ tar -xzf gominer-linux-amd64-cuda-v1.0.0.tar.gz -C ~/decred/
```

Kun purat tar-tiedoston, se tekee kansion nimeltä `gominer-linux-amd64-opencladl-v1.0.0`. Tämän kansion pitäisi sisältää tiedostot  `blake256.cl`, `blake256-old.cl`, `gominer`, `LICENSE`, `README.md`, ja `sample-gominer.conf`.

CUDA-versiolle, CUDA runtime library on nyt sisällytetty. Tämän version tiedostoihin sisältyvät myös `libcudart.so.8.0` ja `rungominer.sh`. Scriptiä käytetään gominerin käynnistämiseen sisällytetyn runtime libraryn kanssa helppouden vuoksi. Tarvitset tosin CUDA 8:aa tukevat ajurit näytönohjaimellesi. Vanhemmat ajurit kaatavat gominerin käynnistyksen yhteydessä.

### **Aseta *gominer* Konfiguraatiotiedosto**

> Vaihe 1: Valitse louhinta-pool

Ennen kuin aloitamme tämän vaiheen, on tärkeää että olet jo liittynyt louhintapooliin (jos valitsemasi pool niin vaatii, sinun pitää myös tehdä worker poolin websivulla). Kirjoita ylös workerisi login ja salasana, sekä poolin stratum+tcp-osoite:port myöhempää käyttöä varten.

Jos tämä ei ole sinulle tuttua, tässä muutama opas workereiden tekemiseen Decred-louhintapooleissa (VAROITUS: Älä unohda tilin tekemisen yhteydessä asettamaasi PIN-koodia - Et pysty nostamaan louhimiasi kolikoita ilman sitä):

- [https://dcr.maxminers.net/index.php?page=gettingstarted](https://dcr.maxminers.net/index.php?page=gettingstarted)
- [https://dcr.suprnova.cc/index.php?page=gettingstarted](https://dcr.suprnova.cc/index.php?page=gettingstarted)
- [https://www2.coinmine.pl/dcr/index.php?page=gettingstarted](https://www2.coinmine.pl/dcr/index.php?page=gettingstarted)
- [https://pool.mn/dcr/index.php?page=gettingstarted](https://pool.mn/dcr/index.php?page=gettingstarted)

> Vaihe 2: Verifioi Device ID#

Ennen konfiguraatiotiedoston asettamista, on tärkeää että selvität mitä gominerin tunnistamia laitteita haluat käyttää louhintaan. Tehdäksesi tämän, avaa terminal -ikkuna, ja mene sijaintiin johon yllä asensit gominerin (esim. `~/decred/gominer-linux-amd64-cuda-v1.0.0`), kirjoita `./gominer -l` tai `./rungominer.sh -l` jos käytät CUDA versiota, paina Enter ja saat listan louhintaan kelpaavista laitteista. Kirjoita ylös haluamasi laitteiden device ID. Vinkki: Näytönohjaimesi saattavat olla listattuna koodinimillään.

> Vaihe 3: Editoi Konfiguraatiotiedostoa

Avaa `sample-gominer.conf` haluamassasi tekstinkäsittelyohjelmassa. Jokaisen muutettavan asetuksen kohdalla, poista puolipiste ennen arvon asettamista `=`-merkin jälkeen.

Kohdassa "General settings":

- Kohtaan `devices=` aseta Device ID#(t) jotka selvitimme `./gominer -l` tai `./rungominer.sh -l`-komennolla vaiheessa 2. Erottele laitteet pilkulla, siis `devices=2,3`.

Kohdassa "Mining settings":

- `pool=`-asetukseksi aseta stratum+tcp address:port haluamasi poolin tiedot, esim. decredpool.org on `stratum+tcp://stratum.decredpool.org:3333` (VAROITUS: pelkkä http://address:port ei toimi gominerissa - sinun *täytyy* kayttää stratum+tcp).
- Kohtaan `pooluser=` aseta workerisi login.
- Kohtaan `poolpass=` aseta workerisi salasana.

Kun olet tehnyt nämä muutokset, tallenna tiedosto. Tee sitä kopio ja anna sille nimeksi gominer.conf gominerin config -kansiossa:

```no-highlight
$ mkdir -p ~/.gominer
$ cp sample-gominer.conf ~/.gominer/gominer.conf
```

### **Käynnistä gominer**

Mene takaisin kansioon joka sisältää tiedostot `gominer` ja `blake256.cl`, `esim. ~/decred/gominer-linux-amd64-cuda-v1.0.0/`,ja käynnistä - `./gominer` tai `./rungominer.sh`. Jos kaikki meni oikein, gominerin pitäisi lukea konfiguraatiotiedosto, ottaa yhteys pooliin, ja alkaa louhimaan määritetyillä laitteilla. Näkyviin alkaa tulla viestejä, jotka sisältävät statistiikkaa jokaisen laitteen hashratesta ja hyväksytyistä, hylätyistä ja stale osuuksista ja niiden yhteismääristä. 

Jos yhteydessä on virhe, todennäköisesti joko `pool`, `pooluser` tai `poolpass` on väärin konfiguroitu.

Jos gominer alkaa louhimaan laitteella jota et halunnut käyttää, on todennäköistä että `devices` asetus on väärin konfiguroitu.

Jos molemmat yllämainitut ongelmat ilmenevät, konfiguraatiotiedosto on todennäköisesti väärin nimetty (sen nimi pitää olla `gominer.conf`) tai se on väärässä kansiossa (sen pitää olla kansiossa `~/.gominer/`). 

### **Tutustu poolin websivuun**

Nyt kun gominerisi louhii, ehdit tutustua poolisi websivuun. Useimmilla pooleilla on sivullaan dashboard josta näet statistiikkaa poolista, verkosta ja tämänhetkisestä roundista (aika poolin löytämien lohkojen välillä). Kun olet tienannut tarpeeksi palkkioita, voit nostaa kolikkosi Edit Account-sivun kautta asettamalla DCR-maksuosoitteen ja asettamalla joko automaattisen maksukynnyksen, tai nostamalla manuaalisesti koko saldosi.

### **Hyödyllisiä Vinkkejä**

*gominerin OpenCL ja OpenCL ADL -versioille*, gominer laskee automaattisesti WorkSizen joka johtaa work algoritmin suorittamiseen 500ms välein. Intensity/WorkSize-asetusten muuttaminen `gominer.conf`-tiedostossa johtaa tunnettuun ongelmaan -  algoritmi suoritetaan paljon nopeammassa tahdissa pienemmästä WorkSizesta johtuen (tämä johtaa suurempaan määrään generoituja osuuksia). Tällöin muistin käyttö kasvaa, joskus joka 10MB/sekunti. Tämän seurauksena järjestelmältäsi loppuu RAM ennen pitkää ja gominer sulkeutuu automaattisesti. On parasta jättää nämä asetukset rauhaan ja antaa gominerin laskea WorkSize itse.
