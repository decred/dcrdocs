# CLI Vodič za instalaciju  

Ova je stranica posljednja ažurirana za v1.0.1.

---

## dcrinstall 

`dcrinstall` je preporučena metoda za instalaciju Decred alata za sučelje naredbenog retka `dcrd`, `dcrwallet`, i `dcrctl`.

`dcrinstall` is an automatic installer and upgrader for the Decred software. The newest release can be found here: [https://github.com/decred/decred-release/releases/tag/v1.1.0](https://github.com/decred/decred-release/releases/tag/v1.1.0). Binaries are provided for Windows, macOS, Linux, OpenBSD, and FreeBSD. Executing installer will install `dcrd`, `dcrwallet`, and `dcrctl`. Instructions are provided for macOS, Linux, and Windows below (assumed proficiency for *BSD users).

`dcrinstall` će automatski preuzeti unaprijed sastavljen, potpisani binarni paket koji se nalazi na GitHubu, potvrditi potpis ovog paketa, kopirati pakete unutar paketa u određenu mapu ovisnu o operacijskom sustavu, stvoriti konfiguracijske datoteke s postavkama kako bi 3 aplikacije mogli komunicirati s Međusobno i pokrenite postupak izrade novčanika. Nakon što prođete kroz `dcrinstall`, moći ćete pokrenuti softver bez dodatne konfiguracije.

> macOS:

1. Preuzmite ispravnu datoteku:

    For 32-bit computers, download the `dcrinstall-darwin-386-v1.1.0` file. <br />
    For 64-bit computers, download the `dcrinstall-darwin-amd64-v1.1.0` file.

2. Izvršite dcrinstall-darwin-xxxx-vx.x.x izvršnu datoteku unutar svog terminala i pokrenite ga:

   Dođite do direktorija u kojem je preuzeta dcrinstall datoteka pomoću `cd` naredbe, pokrenite chmod s u+x na dcrinstall datoteci i pokrenite izvršnu datoteku koja je stvorena. Ispod je primjer naredbi (po potrebi promijenite direktorije ili naziv datoteke):
    
   `cd ~/Downloads/` <br />
    `chmod u+x dcrinstall-darwin-amd64-v1.1.0` <br />
    `./dcrinstall-darwin-amd64-v1.1.0`
    
3. Executable binaries za `dcrd`, `dcrwallet`, i `dcrctl` sada se mogu naći u `~/decred/` direktoriju. Prije dovršetka postupka `dcrinstall` bit ćete preusmjereni na prompt stvaranja lisnice. Da biste dovršili, slijedite korake u vodiču [Walkthrough Creation Wallet](/getting-started/user-guides/dcrwallet-setup.md#wallet-creation-walkthrough) u vodiču za postavljanje dcrwalleta.

> Linux:

1. Preuzmite ispravnu datoteku:

    For 32-bit computers, download the `dcrinstall-linux-386-v1.1.0` file. <br />
    For 64-bit computers, download the `dcrinstall-linux-amd64-v1.1.0` file. <br />
    For 32-bit ARM computers, download the `dcrinstall-linux-arm-v1.1.0` file. <br />
    For 64-bit ARM computers, download the `dcrinstall-linux-arm64-v1.1.0` file.

2. Izvršite dcrinstall-linux-xxxx-vx.x.x izvršnu datoteku unutar svog terminala i pokrenite ga:

    Dođite do direktorija u kojem je preuzeta dcrinstall datoteka pomoću `cd` naredbe, pokrenite chmod s u+x na dcrinstall datoteci i pokrenite izvršnu datoteku koja je stvorena. Ispod je primjer naredbi (po potrebi promijenite direktorije ili naziv datoteke):
    
    `cd ~/Downloads/` <br />
    `chmod u+x dcrinstall-linux-amd64-v1.1.0` <br />
    `./dcrinstall-linux-amd64-v1.1.0`
    
3. Binarni znakovi za `dcrd`, `dcrwallet`, i `dcrctl`  sada se mogu naći u `~/decred/` direktoriju. Prije dovršetka postupka `dcrinstall` bit ćete preusmjereni na prompt stvaranja lisnice. Da biste dovršili, slijedite korake u vodiču [Walkthrough Creation Wallet](/getting-started/user-guides/dcrwallet-setup.md#wallet-creation-walkthrough) u vodiču za postavljanje dcrwalleta.

> Windows:

1. Preuzmite ispravnu datoteku:

    For 32-bit computers, download the `dcrinstall-windows-386-v1.1.0.exe` file. <br />
    For 64-bit computers, download the `dcrinstall-windows-amd64-v1.1.0.exe` file. <br />

2.  Pokrenite dcrinstall izvršnu datoteku.

    Možete dvostruko kliknuti ili pokrenuti iz naredbenog retka. 
    
3. Binarni znakovi za `dcrd`, `dcrwallet`, i `dcrctl` sada se mogu naći u direktoriju `%HOMEPATH%\decred\` (obično %HOMEPATH% je `C:\Users\<username>`). Prije dovršetka postupka `dcrinstall` bit ćete preusmjereni na prompt stvaranja lisnice. Da biste dovršili, slijedite korake u vodiču [Walkthrough Creation Wallet](/getting-started/user-guides/dcrwallet-setup.md#wallet-creation-walkthrough) u vodiču za postavljanje dcrwalleta.
