# Alkuun pääsemisen perusteet

Tämä opas on viimeksi päivitetty versiolle 1.0.0

---

Tämä opas koskee komentojonosovellusten käyttäjiä. Paymetheuksen ja Decreditonin käyttäjät voivat olla välittämättä konfiguraatiotiedostoista - Paymetheus ja Decrediton molemmat pitävät huolen peruskonfiguraatiosta automaattisesti. On myös mainitsemisen arvoista että osa oppaistamme koskee konfiguraatiotiedostojen asetuksia ja toiset oppaat startup komento-flägejä.

---

## Konfiguraatiotiedostojen Sijainnit

Kaikki Decred-ohjelmistot lukevat, käynnistyksen yhteydessä, konfiguraatiotiedostosta mitä asetuksia ottaa käyttöön/pois käytöstä/asettaa ohjelmaa ladattaessa. Kaikki komentojonon käynnistysflägit `(esim. dcrwallet --testnet)` voidaan korvata asetuksilla konfiguraatiotiedostossa `(esim. dcrwallet --testnet voidaan korvata rivillä testnet=1 in dcrwallet.conf)`.

These configuration files are located within the application home directory of the application. The location of these default home directories for Windows, macOS, and Linux are listed below:

Windows:

    C:\Users\<username>\AppData\Local\Dcrwallet\
    C:\Users\<username>\AppData\Local\Dcrd\
    C:\Users\<username>\AppData\Local\Dcrctl\ 
    C:\Users\<username>\AppData\Local\Decred\Paymetheus

macOS: 

    ~/Library/Application Support/Dcrwallet/
    ~/Library/Application Support/Dcrd/
    ~/Library/Application Support/Dcrctl/
    ~/Library/Application Support/decrediton/
    
Linux: 
    
    ~/.dcrwallet/
    ~/.dcrd/
    ~/.dcrctl/
    ~/.config/decrediton

Jokaiselle näistä kansioista on sallittu oma `.conf`-tiedosto, nimetty käytettävän sovelluksen mukaan (`esim. dcrd käyttää dcrd.conf tiedostoa`). Huomaa myös että `Dcrd` ja `Dcrwallet` kansiot tehdään automaattisesti kun sovellus käynnistetään ensimmäisen kerran. `Dcrctl`-kansion joudut tekemään itse jos haluat käyttää konfiguraatiotiedostoa.

[dcrinstall](/getting-started/user-guides/cli-installation.md) asennusmetodi tekee automaattisesti myös konfiguraatiotiedostot, ja ottaa käyttöön [minimi konfiguraatioasetukset](/advanced/manual-cli-install.md#minimum-configuration) .

[Manuaalinen Asennus](/advanced/manual-cli-install.md#installation) metodi sisältää esimerkki konfiguraatio-tiedostot .zip/.tar.gz.-tiedostoissa. On suositeltavaa kopioida nämä config-tiedostot oikeisiin kansioihinsa kuten yllä kuvattu, ja nimetä ne uudelleen, poistaen 'sample-'. Nämä tiedostot sisältävät useita asetuksia huomautusten kera (ohjelma ei lue huomautuksia käynnistyessään) jolloin nämä asetukset ovat poissa käytöstä. Voit ottaa nämä asetukset käyttöön poistamalla puolipisteen ennen riviä.

---

## Käynnistyskomento-flägit

Suurimman osan asetuksista jotka voi asettaa konfiguraatiotiedostossa, voi myös asettaa parametreina sovellusta käynnistettäessa. Esimerkiksi, seuraavat järjestelmäkohtaiset komennot käynnistävät `dcrd`:n testnet-käyttöä varten, vaihtoehtona riville `testnet=1` konfiguraatiotiedostossa:

    Windows: dcrd.exe --testnet
    macOS: ./dcrd --testnet
    Linux: ./dcrd --testnet

Yllä oleva esimerkki katsoo ensiksi `dcrd` konfiguraatiotiedostoa asetuksia varten ja sen jälkeen käynnistyskomentoa ottaakseen testnet-asetuksen käyttöön.

---

## Edistynyt Käyttö

[Kirjautumistunnusten säilyttäminen config-tiedostoissa](/advanced/storing-login-details.md) <!-- This has the same information found in the above, Minimum Configuration section. Could probably delete. -->

[Täysi lista asetuksista joka sovellukselle](/advanced/program-options.md)
