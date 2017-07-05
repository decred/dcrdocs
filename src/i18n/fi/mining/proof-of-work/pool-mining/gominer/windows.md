# <i class="fa fa-windows"></i> *gominer* Windowsin Poolilouhinnan Käyttöopas

Tämä opas on tarkoitettu gominerin perusasennukseen valitsemaasi poolia varten, konfiguraatiotiedostoa käyttäen. Edistyneempiä vaihtoehtoja on saatavilla.

Viimeisin päivitys gomineriin v1.0.0.

---

### <i class="fa fa-download"></i>Lataa ja pura *gominer* binary


>Lataa .zip-tiedosto

Mene osoitteeseen [https://github.com/decred/decred-binaries/releases/tag/v1.0.0](https://github.com/decred/decred-binaries/releases/tag/v1.0.0) ladataksesi gominer Windows binaryt. "Downloads"-osiosta löydät seuraavat tiedostot:

- `gominer-windows-amd64-cuda-v1.0.0.zip`,
- `gominer-windows-amd64-opencl-v1.0.0.zip`,
- `gominer-windows-amd64-opencladl-v1.0.0.zip`.

NVIDIA näytönohjaimille, lataa `*-cuda-*.zip`-tiedosto. <br />
AMD näytönohjaimille Radeon ja FirePro-malleista, lataa `*-opencladl-*.zip`-tiedosto. <br />
Muille näytönohjaimille lataa `*-opencl-*.zip`-tiedosto.

Pura tai kopioi kaikki tiedostot uuteen kansioon. Muista tiedostopolku tähän kansioon tai avaa uusi File Explorer ikkuna tarkastellaksesi kansion sisältöä (Tässä ohjeessa käytämme polkua `C:\decred\gominer\` esimerkkinä). Kansion pitäisi sisältää tiedostot `blake256.cl`, `gominer.exe`, `LICENSE`, `README.md`, ja `sample-gominer.conf`.

> Command Prompt Huomioita

Jos olet uusi käyttäjä, tutustu metodeihin joilla voit avata command promptin haluamassasi kansiossa:

- File Explorerissa, mene haluamaasi kansioon, kirjoita `cmd` osoiteriville, ja paina enter.
- File Explorerissa, mene haluamaasi kansioon, klikkaa "File" valikkoa, etsi valinta "Open command prompt" ja valitse "Open command prompt".
- Klikkaa start-valikkoa tai paina näppäimistösi Windows-näppäintä, kirjoita `cmd`, ja käynnistä "Command Prompt" Desktop sovellus jonka pitäisi löytyä hakutuloksista. Siirry oikeaan kansioon käyttämällä `cd`-komentoa, `esim. cd C:\decred\gominer\`. Käyttämällä komentoa `dir` voit nähdä senhetkisen kansion sisällön.

### Aseta *gominer* Konfiguraatiotiedosto

> Vaihe 1: Valitse Louhintapooli

Ennen kuin aloitamme tämän vaiheen, on tärkeää että olet jo liittynyt louhintapooliin (jos valitsemasi pool niin vaatii, sinun pitää myös tehdä worker poolin websivulla). Kirjoita ylös workerisi login ja salasana, sekä poolin stratum+tcp-osoite:port myöhempää käyttöä varten.

Jos tämä ei ole sinulle tuttua, tässä muutama opas workereiden tekemiseen Decred louhintapooleissa (VAROITUS: Älä unohda tilin tekemisen yhteydessä asettamaasi PIN-koodia - Et pysty nostamaan louhimiasi kolikoita ilman sitä):

- [https://dcr.maxminers.net/index.php?page=gettingstarted](https://dcr.maxminers.net/index.php?page=gettingstarted)
- [https://dcr.suprnova.cc/index.php?page=gettingstarted](https://dcr.suprnova.cc/index.php?page=gettingstarted)
- [https://www2.coinmine.pl/dcr/index.php?page=gettingstarted](https://www2.coinmine.pl/dcr/index.php?page=gettingstarted)
- [https://pool.mn/dcr/index.php?page=gettingstarted](https://pool.mn/dcr/index.php?page=gettingstarted)

> Vaihe 2: Verifioi Laitteesi ID#

Ennen konfiguraatiotiedoston asettamista, on tärkeää että selvität mitä gominerin tunnistamia laitteita haluat käyttää louhintaan (erityisesti jos haluat välttää louhimasta CPU:llasi tai IGP:lläsi). Tehdäksesi tämän, avaa Command Prompt `gominer.exe`n sijainnissa (`esim. C:\decred\gominer\`), kirjoita `gominer.exe -l`, paina enter, ja saat listan louhintaan kelpaavista laitteista. Kirjoita ylös haluamasi laitteiden device ID. Vinkki: Näytönohjaimesi saattavat olla listattuna koodinimillään.

> Vaihe 3: Muokkaa Konfiguraatiotiedostoa

Avaa  `sample-gominer.conf`-tiedosto. Jokaista asetusta varten, joita olemme muuttamassa, poista puolipiste ennen asetusta `=`-merkin jälkeen.

Kohdassa "General settings":

- Aseta `devices=` kohtaan ylöskirjaamasi Device ID#(t) jotka sait `gominer.exe -l` komennolla kohdassa 2. Erottele useampi laite pilkulla, esim. `devices=2,3`.

Kohdassa "Mining settings":

- Kohtaan `pool=` aseta  stratum+tcp osoite:portti jota valitsemasi pool käyttää, esim. decredpool.org käyttää  `stratum+tcp://stratum.decredpool.org:3333` (VAROITUS: http://address:port ei toimi gominerissa - sinun *pitää* käyttää stratum+tcp).
- Aseta kohtaan `pooluser=` workerisi käyttäjänimi.
- Aseta kohtaan `poolpass=` workerisi salasana.

Tehtyäsi nämä muutokset, tallenna tiedosto nimellä gominer.conf.

> Vaihe 4: Kopioi gominer.conf Local AppData-kansioon

File explorerissa, kirjoita `%localappdata%\Gominer\` osoitekenttään. Kopioi `gominer.conf` sen alkuperäisestä sijainnista, `esim. C:\decred\gominer\`, sijaintiin `%localappdata%\Gominer\`.

### Käynnistä gominer.exe

Mene takaisin kansioon joka sisältää tiedostot `gominer` ja `blake256.cl`, `esim. C:\decred\gominer\`, ja käynnistä `gominer.exe`. Jos kaikki meni oikein, gominerin pitäisi lukea konfiguraatiotiedosto, ottaa yhteys pooliin, ja alkaa louhimaan määritetyillä laitteilla. Näkyviin alkaa tulla viestejä, jotka sisältävät statistiikkaa jokaisen laitteen hashratesta ja hyväksytyistä, hylätyistä ja stale -osuuksista ja niiden yhteismääristä. 

Jos yhteydessä on virhe, todennäköisesti joko `pool`, `pooluser` tai `poolpass` on väärin konfiguroitu.

Jos gominer alkaa louhimaan laitteella jota et halunnut käyttää, on todennäköistä että `devices` asetus on väärin konfiguroitu.

Jos molemmat yllämainitut ongelmat ilmenevät, konfiguraatiotiedosto on todennäköisesti väärin nimetty (sen nimi pitää olla `gominer.conf`) tai se on väärässä kansiossa (sen pitää olla kansiossa `%localappdata%\Gominer\`)

### Tutustu Poolin Websivuun

Nyt kun gominerisi louhii, ehdit tutustua poolisi websivuun. Useimmilla pooleilla on sivullaan dashboard josta näet statistiikkaa poolista, verkosta ja tämänhetkisestä roundista (aika poolin löytämien lohkojen välillä). Kun olet tienannut tarpeeksi palkkioita, voit nostaa kolikkosi Edit Account -sivun kautta asettamalla DCR-maksuosoitteen ja asettamalla joko automaattisen maksukynnyksen, tai nostamalla manuaalisesti koko saldosi.

### Hyödyllisiä Vinkkejä

*gominerin OpenCL ja OpenCL ADL versioille*, gominer laskee automaattisesti WorkSizen joka johtaa work algoritmin suorittamiseen 500ms välein. Intensity/WorkSize-asetusten muuttaminen `gominer.conf`-tiedostossa johtaa tunnettuun ongelmaan - algoritmi suoritetaan paljon nopeammassa tahdissa pienemmästä WorkSizesta johtuen (tämä johtaa suurempaan määrään generoituja osuuksia). Tällöin muistin käyttö kasvaa, joskus joka 10MB/sekunti. Tämän seurauksena järjestelmältäsi loppuu RAM ennen pitkää ja gominer sulkeutuu automaattisesti. On parasta jättää nämä asetukset rauhaan ja antaa gominerin laskea WorkSize itse.
