# Simnet 

---

## Pregled 

Prilikom izrade decredovih aplikacija ili testiranja potencijalnih promjena često je iznimno korisno imati testnu mrežu gdje su razine poteškoća dovoljno niske da bi se stvarali blokovi po potrebi.

Kako bi se olakšali ti scenariji, dcrd pruža simulacijsku mrežu (`--simnet`).  Slijedi pregled najvažnijih svojstava koja ga razlikuju od glavne mreže:

* Poteškoće počinju iznimno niske kako bi se omogućio brz CPU za vađenje blokova.
* Mrežne promjene:
    * All code related to peer discovery and IP address dissemination is disabled to help ensure the network remains private
    * Jednaki sustavi (Peer) i RPC mrežni priključci su različiti
    * edinstveni slijed mrežnih bajtova koristi se u peer-to-peer protokolu poruka tako da se blokovi ne mogu slučajno preći s glavnom mrežom
* Svi parametri lanca i plaćanja adresa jedinstveni su kako bi se spriječila zbrka s glavnom mrežom:
    * Različiti porijekla blokova
    * Adresa plaćanja počinje s različitim prefiksima:
        * Standardni platiti-po-publikcijiključa (P2PKH) počinje s velikom slovom `S`
        * Standardni platiti-po-skriptiključa (P2SH) počinje s malim `s`
    * Izvezeni hijerarhijski predodređeni prošireni ključevi (BIP32) počinju s različitim prefiksima:
        * Javni prošireni ključevi počinju s `spub`
        * Privatni prošireni ključevi počinju s `sprv`
    * Vrsta kovanice BIP44 koji se upotrebljava za HD ključ piše se malim slovima `s`

  ---

## Početak rada 

Pokretanje jednog `dcrd` čvora na simnetu je jednostavno pokretanje `dcrd` sa `--simnet` zastavom. Međutim, kako biste bilo zaista korisno, obično vi želite poslati kovanice među adrese koje određuju blokove koji će se morati vaditi i povezati s računom.

Nadalje, budući da na novoj privatnoj mreži još uvijek nema novca, početnu seriju blokova trebat će se vaditi, što će se platiti na adresu koju posjedujete, tako da postoje korisni novac za potrošnju.

Kao što je već spomenuto, simnet koristi jedinstvene adrese kako bi se spriječila zbrka s glavnom mrežom. Dakle, to znači da se račun koji podržava format adrese mora koristiti. Za to se može koristiti `dcrwallet` s `--simnet` zastavom.

Sljedeće je naredba za preuzimanje:

**NAPOMENA: Sve ove naredbe mogu se pojednostaviti stvaranjem konfiguracijskih datoteka i njihovim korištenjem, ali ovdje naredbe koriste sve sklopke na naredbenom retku kako bi pokazale upravo ono što je potrebno za svaku od njih.**

* Početak dcrd na simnetu:

    `$ dcrd --simnet --rpcuser=<username> --rpcpass=<password>`

* Stvaranje novog računa simnet:

    `$ dcrwallet --simnet --create`

* Pokreni dcrračun na simnetu:

    `$ dcrwallet --simnet --username=<username> --password=<password>`

* Napravite novu adresu simnet Deklaracija:

    `$ dcrctl --simnet --wallet --rpcuser=<username> --rpcpass=<password> getnewaddress`

* Zaustavite početni proces dcrd i ponovo ga pokrenite s izvađenom adresom postavljenom na izlaz iz prethodne naredbe:

    `$ dcrd --simnet --rpcuser=<username> --rpcpass=<password> --miningaddr=<S....>`

* Uputite dcrd da stvorite dovoljno početnih blokova za prvu podlogu za sazrijevanje:

    `$ dcrctl --simnet --rpcuser=<username> --rpcpass=<password> generate 100`

* Provjerite stanje salda računa kako biste bili sigurni da su novčići dostupni:

    `$ dcrctl --simnet --wallet --rpcuser=<username> --rpcpass=<password> getbalance`
  
U ovom trenutku, postoji potpuno funkcionalna privatna simnet s kovanicama dostupnim za slanje na druge SIMnet adrese. Svaki put kada se pošalje jedna ili više transakcija, `generate 1` RPC za stvaranje novog bloka s uključenim transakcijama.
