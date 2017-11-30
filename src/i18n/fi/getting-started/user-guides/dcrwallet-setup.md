# dcrwallet Asennusopas

Viimeksi päivitetty versiolla 1.0.0.

Tämän oppaan tarkoitus on auttaa sinua asentamaan `dcrwallet`-sovellus käyttäen  [startup flägejä](/getting-started/startup-basics.md#startup-command-flags). 

**Vaatimukset:**

- Käytä uusinta [dcrinstall](/getting-started/user-guides/cli-installation.md) versiota asentaaksesi `dcrwallet`. Muiden asennustapojen käyttö vaatii lisäaskelia.
- Review how the launch commands differ for the Command Prompt (Windows) and Bash (macOS/Linux) shells, and how the home directories differ [here](/getting-started/cli-differences.md).
- [Asenna dcrd](/getting-started/user-guides/dcrd-setup.md) ja käynnistä se taustalle.

---

`dcrwallet` on daemon joka pitää huolta kaikista Decred-lompakon toiminnoista yksittäiselle käyttäjälle. Se hallinnoi kaikkia tilejäsi, osoitteitasi ja siirtojasi; jäljittää kaikkien osoitteiden saldot; ja sallii stakeholdereiden osallistua Proof-of-Stake-äänestämiseen.

Jotta `dcrwallet` toimisi, `wallet.db` pitää löytyä `dcrwallet`in kansiosta. Jotta tämä tiedosto voi olla olemassa, sinun pitää tehdä uusi lompakko.  `dcrinstall` käynnistää lompakontekoprosessin automaattisesti. Jos poistat wallet.db:n tai käytit jotain toista asennusprosessia, sinun pitää manuaalisesti ajaa [manuaalinen lompakonteko-komento](#manual-wallet-creation-command). 

---

## Tärkeää Tietoa

Lompakon tekemisen yhteydessä, saat 33 sanan listan, nimeltään "seed phrase" (suomensimme sen trendikkäästi "siidi"). Tämä siidi on käytännössä privaattiavaimesi lompakkoosi. Tätä käyttäen voit palauttaa avaimesi, siirtohistoriasi ja saldosi käyttäen mitä tahansa Decred-lompakkoa millä tahansa tietokoneella.

Tämä käytännössä tarkoittaa että *kuka tahansa* joka tietää siidisi voi käyttää sitä päästäkseen käsiksi avaimiisi, historiaasi ja saldoosi omassa Decred-lompakossaan omalta koneeltaan sinun tietämättäsi. Tästä syystä on äärimmäiseen tärkeää että pidät siidisi tallessa. Kohtele sitä samalla tavalla kuin kohtelisit fyysistä avainta kassakaappiisi. Jos hukkaat seed phrasesi, menetät lopullisesti pääsyn lompakkoosi ja kaikkiin siinä oleviin varoihin. Kukaan, edes Decredin developerit eivät sitä pysty palauttamaan. On suositeltavaa että kirjoitat siidin paperille ja talletat paperin jonnekin turvalliseen paikkaan. Jos päätät säilyttää sitä tietokoneellasi, säilö se salattuun tiedostoon (älä unohda salasanaa) siltä varalta että tiedosto tai tietokoneesi varastetaan.

Jokaiseen seediin kuuluu myös 64-merkkinen seed hex. Seed hex toimii samalla tavalla kuin siidisanat - `dcrwallet` hyväksyy sen kun haluat palauttaa lompakkosi. On tärkeää pitää myös seed hexisi turvassa.

**MUISTUTUS: ÄLÄ KOSKAAN, MISSÄÄN OLOSUHTEISSA, ANNA SIIDIÄSI TAI HEX AVAINTASI KENELLEKÄÄN! EDES DEVELOPEREILLE!**

---

## Manuaalinen Lompakonteko-komento

Jos sinulla ei vielä ole `wallet.db`-tiedostoa `dcrwallet`-kansiossasi, suorita komento `dcrwallet --create` . Ohjeet tähän löydät alta.

1. Avaa uusi shell-ikkuna (Bash/Command Prompt/jne,..).
2. Mene `dcrwallet` kansioon.
3. Syötä komento `dcrwallet --create` (tutustu vaatimuksiin yllä jos et ole varma pitäisikö sinun käyttää `./dcrwallet` tai `dcrwallet.exe` edelliselle komennolle).

---

## Ohje Lompakon Tekemiseen

Tämän prosessin aikana asetat yksityisen salasanan, mahdollisesti vapaaehtoisen julkisen salasanan, ja kirjoitat ylös siidisi. Tehdäksesi tämän, seuraa vaiheita alla:

> Aseta Lompakollesi Salasanat

Jos `dcrwallet --create` -komento suoritettiin onnistuneesti, pitäisi seuraavan tekstin olla nyt näkyvissä:

```no-highlight
Enter the private passphrase for your new wallet:
```

Tämä ensimmäinen salasana, yksityinen salasana, on se jota käytät lompakon lukituksen avaamiseen kun teet rahansiirtoja tai Proof-of-Stake-äänestät. Käytä uniikkia ja vahvaa salasanaa. Tämä salasana myös suojaa lompakkotiedostossasi olevia privaattiavaimia, turvaten sen varkauksilta.

Kun olet vahvistanut salasanasi, seuraavan viestin pitäisi olla näkyvissä:

```no-highlight
Do you want to add an additional layer of encryption for public data? (n/no/y/yes) [no]:
```

Julkinen salasana on vapaaehtoinen. Sitä käytetään salaamaan julkinen data (siirrot ja osoitteet) lompakkotiedostossasi, jolloin jos se varastetaan, sinua ei voida yhdistää siirtoihisi.

> Tallenna Siidisi

Ennen kuin teet uuden siidin lompakollesi, tutustu [Tärkeää tietoa osioon](/getting-started/user-guides/dcrwallet-setup.md#critical-information).

Asetettuasi yksityisen salasanasi ja mahdollisen julkisen salasanasi, näet seuraavan viestin:

```no-highlight
Do you have an existing wallet seed you want to use? (n/no/y/yes) [no]:
```

Tässä oppaassa oletamme että sinulla ei vielä ole siidiä, joten jatka painamalla `Enter` joka vastaa promptiin oletus-vaihtoehdolla `[no]`. HUOM: Jos haluat palauttaa lompakkosi käyttämällä siidiäsi, vastaa tässä `[yes]` ja seuraa ohjeita ruudulla.

<i class="fa fa-exclamation-triangle"></i> **ÄLÄ KÄYTÄ SAMAA SIIDIÄ USEAMMASSA LOMPAKOSSA! Lue [Wallets and Seeds FAQ](/faq/wallets-and-seeds.md#3-can-i-run-multiple-wallets) tietääksesi miksi tämä on tärkeää. On suositeltavaa että aina kun mahdollista, uusi lompakko tarkoittaa myös uuden siidin tekemistä.**

Vastattuasi `[no]`, siidisi (lompakon generointi-siidi) ja sen hex tulevat näkyviin ruudulle. Lue kohta IMPORTANT joka on ruudulla heti hexin jälkeen.

On mahdotonta painottaa tarpeeksi sitä miten tärkeää on että talletat seed phrasesi turvalliseen paikkaan, eli jos tämä ei ole muistissasi, tutustu [Tärkeää tietoa](/getting-started/user-guides/dcrwallet-setup.md#critical-information) -osioon uudelleen.

Kun olet kirjoittanut ylös sekä seed phrasen että hexin, kirjoita `OK` ja paina `Enter`. HUOM: jos et kirjoittanut siidiä ylös ennen jatkamista, sinun pitäisi [aloittaa prosessi alusta](/getting-started/user-guides/dcrwallet-setup.md#create-a-new-wallet) ensin [poistettuasi lompakkotiedostosi](/advanced/deleting-your-wallet.md)

Painettuasi `Enter`, seuraavan viestin pitäisi olla näkyvissä:

```no-highlight
Creating the wallet...
The wallet has been created successfully.
```

Nyt lompakko viimeistellään. Tämä voi kestää muutaman minuutin ja hidastaa tietokonettasi.

---

## dcrwalletin Käynnistys

Käynnistääksesi `dcrwallet`in, sinun pitää ensin [tehdä lompakko](#wallet-creation-walkthrough) ja
[yhdistää dcrd Decred-verkkoon](/getting-started/user-guides/dcrd-setup.md#connect-to-the-decred-network).

> Aseta RPC Käyttäjänimi ja Salasana

Jos käytit [`dcrinstallia`](/getting-started/user-guides/cli-installation.md), conf-tiedostoihisi on jo asetettu RPC käyttäjänimi/salasana `dcrd`:lle, `dcrwallet`ille, and `dcrctl`:le.

Jos et käyttänyt `dcrinstall`ia, sinun tulee ottaa käyttöön minimiasetukset conf-tiedostoissasi. Seuraa [tätä opasta](/advanced/manual-cli-install.md#minimum-configuration) tehdäksesi tämän.

> Käynnistä dcrwallet

Kun konfiguraatiotiedostosi ovat asetettu oikein, avaa uusi shell-ikkuna Decred-kansiossasi (tai käytä edellistä ikkunaa jos juuri teit lompakkosi). Kirjoita seuraava komento (tarkista tämän oppaan vaatimukset-osio selvittääksesi oikea komento sinun käyttöjärjestelmällesi/shell-sovelluksellesi):

```no-highlight
dcrwallet
```

`dcrwallet`isi ottaa nyt yhteyttä verkkoon `dcrd`:n kautta. Se alkaa skannaamaan verkkoa aktiivisia osoitteitasi varten, joka saattaa kestää hetken hitailla tietokoneilla. Lopulta se alkaa näyttämään tämän kaltaisia rivejä: 

```no-highlight
[INF] WLLT: Connecting block 0000000000002004ea8fa74af334cb291a22832642b5be603995683534bbb97b, height 9990
```

Tämä tarkoittaa että lompakko on menestyksekkäästi yhdistetty verkkoon
daemonisi kautta.

---

Oppiaksesi `dcrd`:n ja `dcrwallet`in käytön, tutustu [dcrctl Perusteet](/getting-started/user-guides/dcrctl-basics.md) -oppaaseen. Opit kuinka avaat lompakkosi lukituksen, lähetät ja vastaanotat DCR:ää käyttäen `dcrctl`:ää, tarkistat saldosi ja tarkastelet verkon statistiikkaa.
