# Decrediton Asennusopas

Päivitetty viimeksi versiolle 1.0.0.

---

`Decrediton` on graafinen käyttöliittymä  `dcrwallet`:ille. Kun tämä sovellus käynnistyy, se käynnistää automaattisesti oman prosessin `dcrd`:lle ja `dcrwallet`:lle taustalla - se ei käynnisty jos `dcrd`-prosessi on jo käynnissä.

HUOM: Jos ohjelma kaatuu tai jää jumiin käynnistysruutuun, tämän pystyy useimmiten korjaamaan käynnistämällä sen uudelleen.

---

## Lataaminen ja Asennus

Decrediton is released with the Binary Releases and can be found here: [https://github.com/decred/decred-binaries/releases/tag/v1.1.0](https://github.com/decred/decred-binaries/releases/tag/v1.1.0). As of v1.1.0, Decrediton is only available for Linux and macOS.

> macOS

1. Download the `decrediton-1.1.0.dmg` file.

2. Double click the `decrediton-1.1.0.dmg` file once downloaded to mount the disk image.

3. Vedä decrediton.app applikaatiokansio linkkiin disk imagessa.

> Linux

1. Download the `decrediton-1.1.0.tar.gz` file.

2. Mene latauksen sijaintiin ja pura .tar.gz-tiedosto:

    Ubuntu File Browser: klikkaa .tar.gz-tiedostoa oikealla näppäimellä ja valitse "Extract Here". <br />
    Terminal: Käytä `tar -xvzf filename.tar.gz` komentoa

    Both of these should extract the tar.gz into a folder that shares the same name. (`e.g. tar -xvzf decrediton-v1.1.0.tar.gz` should extract to `decrediton-v1.1.0`). If successful, this new folder should include a `decrediton` executable.

---

## Tärkeää Tietoa

Lompakontekoprosessin aikana, saat 33 sanan yhdistelmän, nimeltään seed phrase. Tämä seed phrase on käytännössä lompakkosi privaattiavain. Tätä siidiä käyttämällä voit palauttaa privaattiavaimesi, siirtohistoriasi ja saldosi missä tahansa Decred-lompakossa millä tahansa tietokoneella.

Tämä käytännössä tarkoittaa että *kuka tahansa* joka tietää siidisi voi käyttää sitä päästäkseen käsiksi avaimiisi, historiaasi ja saldoosi omassa Decred-lompakossaan omalta koneeltaan sinun tietämättäsi. Tästä syystä on äärimmäiseen tärkeää että pidät siidisi tallessa. Kohtele sitä samalla tavalla kuin kohtelisit fyysistä avainta kassakaappiisi. Jos hukkaat seed phrasesi, menetät lopullisesti pääsyn lompakkoosi ja kaikkiin siinä oleviin varoihin. Kukaan, edes Decredin developerit eivät sitä pysty palauttamaan. On suositeltavaa että kirjoitat siidin paperille ja talletat paperin jonnekin turvalliseen paikkaan. Jos päätät säilyttää sitä tietokoneellasi, säilö se salattuun tiedostoon (älä unohda salasanaa) siltä varalta että tiedosto tai tietokoneesi varastetaan.

**MUISTUTUS: ÄLÄ IKINÄ, MISSÄÄN OLOSUHTEISSA, ANNA SIIDIÄSI TAI SIIHEN LIITTYVÄÄ HEX KEY:TÄ KENELLEKÄÄN! EDES DEVELOPEREILLE!**

---

## Uuden Lompakon Luominen

Klikattuasi "OK, I Understand" disclaimeriin, näet "Create a Wallet" dialogin. 

"Create a Wallet" dialogi antaa oletuksena "New Seed" valinnan. Klikkaa "Existing Seed" jos sinulla on jo siidi jota aiot käyttää, ja seuraa ohjeita. Tässä oppaassa oletamme että sinulla ei ole siidiä ja jatkamme käyttäen "New Seed"-valintaa. Lue [Tärkeää tietoa](#critical-information) siideistä yllä.

1. Kirjoita ylös siidi joka on nähtävissä tekstilaatikossa (joudut syöttämään sen uudelleen seuraavassa ruudussa).

2. Paina "Continue"

3. Vahvista siidisi, ja tee yksityinen salasana lompakollesi. Tätä salasanaa käytetään lompakkosi lukituksen avaamiseen siirtoja tehdessä.

4. Paina "Create Wallet" 

5. Nyt sinun pitäisi nähdä pyörivä sininen ympyrä. Se jatkaa pyörimistään kunnes `dcrd` on kokonaisuudessaan synkronoinut lohkoketjun. Tietokoneissa joissa ei ole ennen käytetty `dcrd`:ää, tämä kestää 1-2 tuntia uudemmalla laitteistolla (se voi kestää kauemmin vanhalla koneella). Voit tarkastaa resurssinhallinnasta että `dcrd` on käynnissä ja käyttää huomattavia määriä CPU-tehoa, tällöin se synkronoi. Jos näin ei ole, saatat joutua käynnistämään Decreditonin uudelleen päästäksesi eteenpäin tästä ruudusta.

## Lompakon Avaaminen

Kun lohkoketju on synkronoitu, sinun pitäisi nähdä "Opening Wallet"-sivu. Täällä sinun tulee syöttää privaatti salasanasi ja lompakko uudelleenskannaa viimeaikaiset lohkot etsien siirtoja jotka kuuluvat lompakkoosi. Odota että edistysmittari täyttyy. Decreditonin pitäisi tämän jälkeen ladata yleiskatsaus-sivu jossa ovat näkyvissä käytettävissä oleva saldosi sekä viimeaikaiset siirrot.

---
