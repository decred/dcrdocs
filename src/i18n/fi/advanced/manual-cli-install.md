# Manuaalinen CLI asennus

---

The newest Binary Releases can be found here: [https://github.com/decred/decred-binaries/releases](https://github.com/decred/decred-binaries/releases). With the exception of the `.msi` and `.dmg` files, they are archives of the latest executable binaries for each release. Although most of this will be unzip and go, instructions are provided for macOS, Linux, and Windows below (assumed proficiency for *BSD users).

> macOS

1. Lataa tarvitsemasi tiedosto:

    For 32-bit computers, download the `decred-darwin-386-v1.1.0.tar.gz` file. <br />
    For 64-bit computers, download the `decred-darwin-amd64-v1.1.0.tar.gz` file.

2. Mene latauskansioon ja pura .tar.gz tiedosto:

    Finder: Tuplaklikkaa .tar.gz tiedostoa. <br />
    Terminal: käytä `tar -xvzf filename.tar.gz` - komentoa. 

    **HUOM**: jos käytät Safaria macOS Sierralla ja sinulla on 'Open "safe" files after downloading' -toiminto käytössä, .gz ja .zip-tiedostot puretaan automaattisesti lataamisen jälkeen. `tar -xvzf filename.tar.gz` -komento palauttaa virheilmoituksen:  `tar: Error opening archive: Failed to open 'filename.tar.gz'`. Käytä sen sijaan komentoa `tar -xvzf filename.tar` (poista .gz edellisestä komennosta).
    
    Both of these should extract the tar into a folder that shares the same name. (`e.g. tar -xvzf decred-darwin-amd64-v1.1.0.tar.gz` should extract to `decred-darwin-amd64-v1.1.0`). It should include `dcrctl`, `dcrd`, `dcrwallet`, `sample-dcrctl.conf`, `sample-dcrd.conf`, and `sample-dcrwallet.conf`.


> Linux

1. Lataa tarvitsemasi tiedosto:

    For 32-bit computers, download the `decred-linux-386-v1.1.0.tar.gz` file. <br />
    For 64-bit computers, download the `decred-darwin-amd64-v1.1.0.tar.gz` file. <br />
    For 32-bit ARM computers, download the `decred-linux-arm-v1.1.0.tar.gz` file. <br />
    For 64-bit ARM computers, download the `decred-linux-arm64-v1.1.0.tar.gz` file.

2. Mene latauskansioon ja pura .tar.gz tiedosto:

    Ubuntu File Browser: klikkaa .tar.gz-tiedostoa oikealla näppäimellä ja valitse "Extract Here". <br />
    Terminal: Käytä komentoa `tar -xvzf filename.tar.gz`.
    
    Both of these should extract the tar.gz into a folder that shares the same name. (`e.g. tar -xvzf decred-darwin-amd64-v1.1.0.tar.gz` should extract to `decred-darwin-amd64-v1.1.0`). It should include `dcrctl`, `dcrd`, `dcrwallet`, `sample-dcrctl.conf`, `sample-dcrd.conf`, and `sample-dcrwallet.conf`.

> Windows

Huom: Windows 7/8/10 tukee `.zip`-tiedostoja, joten on suositeltavaa käyttää  `.zip`-tiedostoa, jolloin kolmannen osapuolen ohjelmistoja ei tarvita `.tar.gz`-tiedostoa varten. Ohjeet koskevat  `.zip`-tiedostoa.

1. Lataa tarvitsemasi tiedosto:

    For 32-bit computers, download the `decred-windows-386-v1.1.0.zip` file. <br />
    For 64-bit computers, download the `decred-windows-amd64-v1.1.0.zip` file.

2. Mene latauskansioon ja pura `.zip`- tiedosto:

    File Explorer: Klikkaa .zip-tiedostoa oikealla näppäimellä, valitse "Extract All.." ja ohjelman pitäisi kysyä mitä kansiota käyttää. Oletuksena `.zip` puretaan saman nimiseen kansioon. Siihen pitäisi sisältyä `dcrctl`, `dcrd`, `dcrwallet`, `sample-dcrctl.conf`, `sample-dcrd.conf`, ja `sample-dcrwallet.conf`.

Jos päätät ladata `.tar.gz`-tiedoston, se vaatii kaksi erillistä purkua kolmannen osapuolen pakkausohjelmalla (7-zip, winRAR, etc..) ennen kun pääset käsiksi binaryihin.

---

## Minimikonfiguraatio

Jotta `dcrd`, `dcrwallet`, ja `dcrctl` voivat kommunikoida keskenään, ne pitää vähintäänkin käynnistää käyttäen samaa rpcuser/rpcpass yhdistelmää. Manuaalista konfiguraatiota varten, seuraa näitä ohjeita:

1. Jos järjestelmästä riippuvat kotikansiot, listattu [konfiguraatiotiedostot](#configuration-file-locations) -osiossa yllä puuttuvat, tee kansiot  `dcrd`:lle, `dcrwallet`:lle, and `dcrctl`:lle.
2. Using your favourite text editor, create a new file enter the text, `[Application Options]` as the first line. Save it as `dcrd.conf` in `dcrd`'s home directory.
3. Create another new file and add the text `[Application Options]` to the first line as before. Save it as `dcrwallet.conf` in `dcrwallet`'s home directory.
4. Create a third text file and save it as `dcrctl.conf` in `dcrctl`'s home directory. You don't need to add anything to this one right now.
5. Valitse mielivaltaisesti käyttäjänimi ja salasana, näitä käytetään ainoastaan eri sovellusten kommunikointiin RPC:n kautta. Helpointa on asettaa kaikkiin samat.
6. `dcrd.conf`-tiedostossa, kohdan `[Application Options]` alle, lisää seuraavat rivit:<br /><br />
        `rpcuser=<chosen-username>`<br />
        `rpcpass=<chosen-password>`<br /><br />
7. `dcrwallet.conf`-tiedostossa, kohdan `[Application Options]` alle, lisää seuraavat rivit:<br /><br />
        `username=<chosen-username>`<br />
        `password=<chosen-password>`<br /><br />
8. `dcrctl.conf` tiedostossa, lisää seuraavat rivit:<br /><br />
        `rpcuser=<chosen-username>`<br />
        `rpcpass=<chosen-password>`<br /><br />
9. Tallenna kaikki kolme konfiguraatiotiedostoa.

Please see the [sample config](https://github.com/decred/dcrd/blob/master/sampleconfig/sampleconfig.go#L8-L352) for more customisation options.