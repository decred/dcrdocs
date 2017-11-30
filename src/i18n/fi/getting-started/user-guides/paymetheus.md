# Paymetheuksen Asennusopas

Paymetheus on helppokäyttöinen lompakko Decredille. Sen avulla voit lähettää ja vastaanottaa  Decrediä,
ostaa lipukkeita [PoS-äänestämiseen](/mining/proof-of-stake.md), nähdä tilitapahtumahistoriasi ja muuta. 
Ainoa asia jota Paymetheus ei tee on PoS-äänestäminen.

---

## Lataus ja Asennus

The Windows Installer (`.msi` file) is located here: [https://github.com/decred/decred-binaries/releases/tag/v1.1.0](https://github.com/decred/decred-binaries/releases/tag/v1.1.0). It will install Paymetheus to your computer's Program Files folder. Installation is pretty straightforward, but instructions are provided below:

1. Lataa oikea tiedosto:

    For 32-bit computers, download the `decred_1.1.0-release_x86.msi` file. <br />
    For 64-bit computers, download the `decred_1.1.0-release_x64.msi` file.

2. Avaa latauskansiosi ja tuplaklikkaa `.msi` tiedostoa.

3. Seuraa asennusohjeita. Tämän prosessin aikana sinua pyydetään hyväksymään Käyttöehdot.

4. Asennuksen jälkeen ohjelma pitäisi löytyä `..\Program Files\Decred\` kansiostasi ja olla avattavissa Aloitusvalikosta (voit etsiä `Decred`:iä ohjelmistolistalta)

---

## Käynnistä Paymetheus
Olet nyt valmis aloittamaan Decredin käyttämisen! Käynnistä 'Decred'-ohjelma. Näet tällaisen yhteysruudun:

![Paymetheus connection screen](../../img/Paymetheus-dcrd-login.png) 

>Kun käynnistät Decredin, kaksi eri toimintoa käynnistyy. 'Paymetheus' on visuaalinen lompakko, josta kerromme myöhemmin lisää
>ja 'dcrd' joka on kommunikaatio-daemon (lausutaan DEI-mon; se on taustalla pyörivät ohjelma jota et näe ruudullasi 
>ja jota et voi klikkailla) joka kommunikoi ainoastaan Decred-verkon kanssa. Tämä tarkoittaa että voit käynnistää dcrd:n 
>toisella koneella (kuten aina päällä olevalla serverillä) ja käyttää Paymetheusta etänä.

Käytämme nyt paikallista Paymetheuksen jo käynnistämää lompakkoa, joten klikkaa suoraan Continue.

> Kun Paymetheus käynnistyy ensimmäistä kertaa, se lataa koko lohkoketjun itselleen. Tämä voi kestää jopa tunnin.

---

## Luo tai Palauta Lompakko
Sinulle annetaan vaihtoehto joko luoda uusi lompakko tai palauttaa olemassa oleva lompakko siidillä. Jos luet tätä, olet ehkä uusi käyttäjä eikä 
sinulla luultavasti ole lompakkoa joten luodaanpa uusi. Jos valitset palautusvaihtoehdon, sinulta kysytään lompakkosi siidiä sen sijaan että saisit uuden siidin. 
Loppu molemmissa prosesseissa on samanlaisia, klikkaa "Create a new wallet". Näet seuraavanlaisen ruudun:

![Paymetheus wallet creation screen](/img/Paymetheus-seed-window.png)

<i class="fa fa-exclamation-triangle"></i> **PYSÄHDY TÄSSÄ!!! ÄLÄ KLIKKAA JATKA! **

**Tämä on Decredin käytön tärkein kohta. Valkoisessa laatikossa ovat siidisi sanat. Nämä sanat ovat yhtä kuin pääsy lompakkoosi. **
 **ILMAN NÄITÄ SANOJA TAI SALASANAASI VOIT MENETTÄÄ PÄÄSYN RAHOIHISI PYSYVÄSTI!**

**ÄLÄ ANNA SALASANAASI KENELLEKÄÄN, EI EDES DECREDIN KEHITTÄJILLE!**

Näillä sanoilla joku muu voi tehdä luvattoman kopion lompakostasi ja siirtää rahasi muualle. Decredissä ei ole mahdollista peruuttaa siirtoja joten jos joku varastaa Decredisi, et voi saada niitä takaisin.

<i class="fa fa-exclamation-triangle"></i> **ÄLÄ KÄYTÄ SAMAA SIIDIÄ USEASSA ERI LOMPAKOSSA! Käy sivulla [Lompakot ja Siidit FAQ](/faq/wallets-and-seeds.md#3-can-i-run-multiple-wallets) lukemassa miksi. Suosittelemme, että jokaista uutta lompakkoa varten luodaan myös uusi siidi. **

Decred, kuten muutkin kryptovaluutat, rinnastetaan usein pankkitilin omistamiseen. Tärkeä ero on kuitenkin se, että Decredissä ei ole ketään luotettua kolmatta osapuolta joka pitää rahojasi tallessa puolestasi. Sinä, ja vain sinä, olet vastuussa Decredeistäsi aivan kuten käteisen rahan kanssa. Jos sinulta varastetaan käteistä taikka Decrediä tai hukkaat ne, rahat ovat pysyvästi kadonneet.

Jos kadotat lompakkosi, menetät pääsyn kaikkiin siellä olleisiin rahoihin eikä kukaan, ei edes Decredin kehittäjät, voi palauttaa niitä sinulle. Siksi on erityisen tärkeää että luet tämän sivun huolellisesti ja KIRJOITAT siidisi ylös turvalliseen paikkaan. Hyvä idea on kirjoittaa se paperille ja säilöä paperi jossain varmassa tallessa sekä tallentaa siidi SALASANALLA TURVATTUUN tiedostoon koneellesi. Pilvipalvelut kuten Dropbox tai OneDrive toimivat jos noudatat äärimmäistä varovaisuutta. Koska pilvipalvelut voidaan hakkeroida, tiedoston salaaminen on todella tärkeää (MS Word tai Libre/OpenOffice toimii tähän) ennen kuin lataat sen pilveen. 

Nyt olet toivon mukaan kirjoittanut siidisi talteen vähintään kahteen eri paikkaan. Klikkaa Continue. Sinua pyydetään nyt kirjoittamaan sanat uudelleen varmistamaan että ne ovat oikein ja oikeassa järjestyksessä jotta lompakkosi palauttaminen myöhemmin on mahdollista. Huomioi että et voi kopioida ja liittää sanoja, sinun on kirjoitettava ne itse. Tällä varmistetaan etteivät ne ole tallessa vain välimuistissa. Kirjoita siidisi kaikki sanat järjestyksessä ja klikkaa Confirm.

---

## Valitse Lompakollesi Salasana
Kirjoita salasana jota haluat käyttää lähettäessäsi rahaa verkon kautta. Tällä salasanalla estät ulkopuolisia siirtämästä rahojasi minnekkään vaikka he saisivat lompakkotiedostosi käsiinsä. Sinulle annetaan myös vaihtoehto luoda julkinen salasana jolla salataan kaikki lompakkosi julkinen data (siirrot ja osoiteet), jolloin muut eivät voi yhdistää tätä dataa sinuun. Suurin osa ihmisistä ei kaipaa julkisen rahaliikenteensä salaamista, joten voit myös jättää tämän kohdan valitsematta. Kun olet valinnut turvallisen salasanan lompakollesi (ja mahdollisesti julkisen salasanan siirroillesi), klikkaa Encrypt.

Nyt lompakkosi luodaan ja synkronoidaan lohkoketjuun. Hitaammalla tietokoneella tämä voi kestää useamman minuutin. Huomaa että ylös kirjoittamasi 
siidisanat toimivat missä tahansa Decred-lompakko-ohjelmassa, eivät pelkästään Paymetheuksessa.

Jatka sivulle [Paymetheuksen Käyttäminen](using-paymetheus.md)
