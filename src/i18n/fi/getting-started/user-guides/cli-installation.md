# CLI Asennusopas

Tämä sivu on viimeksi päivitetty versiolle 1.0.1.

---

## dcrinstall 

`dcrinstall` on suositeltu metodi Decred komentojono-työkalujen  `dcrd`, `dcrwallet`, ja `dcrctl` asentamiseksi.

`dcrinstall` is an automatic installer and upgrader for the Decred software. The newest release can be found here: [https://github.com/decred/decred-release/releases/tag/v1.1.0](https://github.com/decred/decred-release/releases/tag/v1.1.0). Binaries are provided for Windows, macOS, Linux, OpenBSD, and FreeBSD. Executing installer will install `dcrd`, `dcrwallet`, and `dcrctl`. Instructions are provided for macOS, Linux, and Windows below (assumed proficiency for *BSD users).

`dcrinstall` lataa automaattisesti valmiin, allekirjoitetun binarypaketin GitHubista, verifioi paketin allekirjoituksen, kopioi binaryt paketissa tiettyyn kansioon käyttöjärjestelmästä riippuen, tekee konfiguraatiotiedostot asetuksilla jotka sallivat kaikkien 3 sovelluksen kommunikoida keskenään, ja auttaa sinut lompakontekoprosessin läpi. Kun olet ajanut `dcrinstall`in, voit käynnistää ohjelmiston ilman tarvetta lisäasetuksille.

> macOS:

1. Lataa tarvitsemasi tiedosto:

    For 32-bit computers, download the `dcrinstall-darwin-386-v1.1.0` file. <br />
    For 64-bit computers, download the `dcrinstall-darwin-amd64-v1.1.0` file.

2. Tee dcrinstall-darwin-xxxx-vx.x.x-tiedostosta executable terminaalissasi, ja käynnistä se:

    Käytä `cd`-komentoa mennäksesi kansioon johon latasit dcrinstall-tiedoston, aja chmod u+x modella dcrinstall-tiedostolle, ja käynnistä tehty executable-tiedosto. Alla esimerkki komennoista (vaihda kansioiden ja tiedostojen nimet tarpeen mukaan):
    
    `cd ~/Downloads/` <br />
    `chmod u+x dcrinstall-darwin-amd64-v1.1.0` <br />
    `./dcrinstall-darwin-amd64-v1.1.0`
    
3. Executable binaryt  `dcrd`:lle, `dcrwallet`ille, and `dcrctl`:lle löytyvät nyt `~/decred/`-kansiosta. Ennen kuin `dcrinstall`-prosessi on valmis, lompakonteko-ruutu aukeaa. Seuraa [Lompakonteko Oppaan](/getting-started/user-guides/dcrwallet-setup.md#wallet-creation-walkthrough) ohjeita dcrwalletin asennusoppaassa tehdäksesi tämän valmiiksi.

> Linux:

1. Lataa tarvitsemasi tiedosto:

    For 32-bit computers, download the `dcrinstall-linux-386-v1.1.0` file. <br />
    For 64-bit computers, download the `dcrinstall-linux-amd64-v1.1.0` file. <br />
    For 32-bit ARM computers, download the `dcrinstall-linux-arm-v1.1.0` file. <br />
    For 64-bit ARM computers, download the `dcrinstall-linux-arm64-v1.1.0` file.

2. Tee dcrinstall-linux-xxxx-vx.x.x-tiedostosta executable terminaalissasi, ja käynnistä se:

    Käytä `cd`-komentoa mennäksesi kansioon johon latasit dcrinstall-tiedoston, aja chmod u+x modella dcrinstall-tiedostolle, ja käynnistä tehty executable-tiedosto. Alla esimerkki komennoista (vaihda kansioiden ja tiedostojen nimet tarpeen mukaan):
    
    `cd ~/Downloads/` <br />
    `chmod u+x dcrinstall-linux-amd64-v1.1.0` <br />
    `./dcrinstall-linux-amd64-v1.1.0`
    
3. Binaryt `dcrd`:lle, `dcrwallet`ille, and `dcrctl`:lle löytyvät nyt `~/decred/`-kansiosta. Ennen kuin `dcrinstall`-prosessi on valmis, lompakonteko-ruutu aukeaa. Seuraa [Lompakonteko Oppaan](/getting-started/user-guides/dcrwallet-setup.md#wallet-creation-walkthrough) ohjeita dcrwalletin asennusoppaassa tehdäksesi tämän valmiiksi.

> Windows:

1. Lataa tarvitsemasi tiedosto:

    For 32-bit computers, download the `dcrinstall-windows-386-v1.1.0.exe` file. <br />
    For 64-bit computers, download the `dcrinstall-windows-amd64-v1.1.0.exe` file. <br />

2.  Käynnistä dcrinstall executable tiedosto.

    Voit joko tuplaklikata sitä tai käynnistää sen Command Promptista.
    
3. Binaryt `dcrd`:lle, `dcrwallet`ille, and `dcrctl`:lle löytyvät nyt `%HOMEPATH%\decred\`-kansiosta (yleensä %HOMEPATH% on `C:\Users\<username>`). Ennen kuin `dcrinstall`-prosessi on valmis, lompakonteko-ruutu aukeaa. Seuraa [Lompakonteko Oppaan](/getting-started/user-guides/dcrwallet-setup.md#wallet-creation-walkthrough) ohjeita dcrwalletin asennusoppaassa tehdäksesi tämän valmiiksi.
