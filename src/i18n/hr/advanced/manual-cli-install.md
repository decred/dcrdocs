# Manualna instalacija CLI-a 

---

The newest Binary Releases can be found here: [https://github.com/decred/decred-binaries/releases](https://github.com/decred/decred-binaries/releases). With the exception of the `.msi` and `.dmg` files, they are archives of the latest executable binaries for each release. Although most of this will be unzip and go, instructions are provided for macOS, Linux, and Windows below (assumed proficiency for *BSD users).

> macOS

1. Preuzmite ispravnu datoteku:

    For 32-bit computers, download the `decred-darwin-386-v1.1.0.tar.gz` file. <br />
    For 64-bit computers, download the `decred-darwin-amd64-v1.1.0.tar.gz` file.

2. Prijeđite na mjesto preuzimanja i vađenja .tar.gz datoteka:

    Finder: jednostavno dvaput kliknite na .tar.gz datoteku. <br />
    Terminal: koristite naredbu `tar -xvzf filename.tar.gz`. 

    **NAPOMENA**: Ako koristite Safari na macOS Sierra i imate omogućenu opciju 'Otvorenih" sigurnim "datoteka nakon preuzimanja", .gz i .zip datoteke automatski se neće komprimirati nakon preuzimanja. Naredba `tar -xvzf filename.tar.gz` dovodi do ove pogreške: `tar: Greška kod otvaranja arhive: Neuspješno otvaranje 'filename.tar.gz'`. Umjesto toga koristite `tar -xvzf filename.tar` (ukloni .gz iz prethodne naredbe).
    
    Both of these should extract the tar into a folder that shares the same name. (`e.g. tar -xvzf decred-darwin-amd64-v1.1.0.tar.gz` should extract to `decred-darwin-amd64-v1.1.0`). It should include `dcrctl`, `dcrd`, `dcrwallet`, `sample-dcrctl.conf`, `sample-dcrd.conf`, and `sample-dcrwallet.conf`.


> Linux

1. Preuzmite ispravnu datoteku:

    For 32-bit computers, download the `decred-linux-386-v1.1.0.tar.gz` file. <br />
    For 64-bit computers, download the `decred-darwin-amd64-v1.1.0.tar.gz` file. <br />
    For 32-bit ARM computers, download the `decred-linux-arm-v1.1.0.tar.gz` file. <br />
    For 64-bit ARM computers, download the `decred-linux-arm64-v1.1.0.tar.gz` file.

2. Prijeđite na mjesto preuzimanja i vađenja .tar.gz datoteke:

    Ubuntu preglednik datoteka: jednostavno kliknite desnom tipkom miša na .tar.gz i odaberite "Izvezi ovdje". <br />
    Terminal: koristite naredbu `tar -xvzf filename.tar.gz`. 
    
    Both of these should extract the tar.gz into a folder that shares the same name. (`e.g. tar -xvzf decred-darwin-amd64-v1.1.0.tar.gz` should extract to `decred-darwin-amd64-v1.1.0`). It should include `dcrctl`, `dcrd`, `dcrwallet`, `sample-dcrctl.conf`, `sample-dcrd.conf`, and `sample-dcrwallet.conf`.

> Windows

Napomena: Windows 7/8/10 izvorno pruža podršku za `.zip` datoteke, stoga je poželjno koristiti datoteku `.zip`, tako da aplikacije treće strane nisu potrebne za datoteku `.tar.gz`. Upute su predviđene za datoteku `.zip`.

1. Preuzmite ispravnu datoteku:

    For 32-bit computers, download the `decred-windows-386-v1.1.0.zip` file. <br />
    For 64-bit computers, download the `decred-windows-amd64-v1.1.0.zip` file.

2. Prijeđite na mjesto preuzimanja i odznačite datoteku `.zip`:

    File Explorer: Klikom s desnom tipkom miša na .zip datoteku, odaberite "Extract All .." i trebao bi se otvoriti upit za korištenje direktorija. Zadano će izvući `.zip` u mapu s istim nazivom. Potrebno je uključiti `dcrctl`, `dcrd`, `dcrwallet`, `sample-dcrctl.conf`, `sample-dcrd.conf`, i `sample-dcrwallet.conf`.

Ako odlučite preuzeti datoteku `.tar.gz`, zahtijevat će dva zasebna izvoza putem neke aplikacije treće strane (7-zip, winRAR, itd.) kako bi došli do pravih binarnih datoteka.

---

## Minimalna konfiguracija

U najmanjoj mjeri, `dcrd`, `dcrwallet`, i `dcrctl` moraju biti sposobni komunicirati jedni s drugima, trebaju biti pokrenuti s istom kombinacijom rpckorisnik/rpclozinka. Za manualnu konfiguraciju slijedite ove korake:

1. Ako ne postoje domaći direktoriji ovisni o operacijskom sustavu navedenom u odjeljku [konfiguracijske datoteke](#configuration-file-locations) nemojte izlaziti, već stvorite ih za `dcrd`, `dcrwallet`, i `dcrctl`.
2. Using your favourite text editor, create a new file enter the text, `[Application Options]` as the first line. Save it as `dcrd.conf` in `dcrd`'s home directory.
3. Create another new file and add the text `[Application Options]` to the first line as before. Save it as `dcrwallet.conf` in `dcrwallet`'s home directory.
4. Create a third text file and save it as `dcrctl.conf` in `dcrctl`'s home directory. You don't need to add anything to this one right now.
5. Odaberite proizvoljno korisničko ime i lozinku, to će se koristiti samo za svaku aplikaciju za komunikaciju putem daljinskog poziva. Najjednostavnija je konfiguracija postaviti sve jednako.
6. Unutar `dcrd.conf`, ispod `[Application Options]`, dodajte sljedeće retke:<br /><br />
        `rpcuser=<chosen-username>`<br />
        `rpcpass=<chosen-password>`<br /><br />
7. Unutar `dcrwallet.conf`, ispod `[Application Options]`, dodajte sljedeće retke:<br /><br />
        `username=<chosen-username>`<br />
        `password=<chosen-password>`<br /><br />
8. Unutar `dcrctl.conf`, dodajte sljedeće retke:<br /><br />
        `rpcuser=<chosen-username>`<br />
        `rpcpass=<chosen-password>`<br /><br />
9. Spremite sve tri konfiguracijske datoteke.

Please see the [sample config](https://github.com/decred/dcrd/blob/master/sampleconfig/sampleconfig.go#L8-L352) for more customisation options.