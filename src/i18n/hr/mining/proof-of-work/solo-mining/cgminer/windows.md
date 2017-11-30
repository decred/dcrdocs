# <i class="fa fa-windows"></i> Vodič za korisnike za Windows

---

## <i class="fa fa-cloud"></i> Povežite dcrd na Decred mrežu

> Prvi korak

Imajte na umu da se sve naredbe `dcrd`, `dcrwallet`, i `dcrctl` moraju izvršiti u direktoriju u kojem su vaše Decred datoteke! Pokreni `dcrd`:

```no-highlight
C:\Decred> dcrd -u <username> -P <password>
```

Pokreni dcrračun:

```no-highlight
C:\Decred> dcrwallet -u <username> -P <password>
```

> Korak dva

Izradite novu adresu računa:

```no-highlight
C:\Decred> dcrctl -u <username> -P <password> --wallet getnewaddress
```

Kopirajte novu adresu (izlaz iz zadnje naredbe). Zatvorite / zaustavite `dcrd` i `dcrwallet` pritiskom na `ctrl+c` u svakom prozoru.

> Korak tri

Ponovo pokrenite `dcrd` pomoću naredbe:

```no-highlight
C:\Decred> dcrd --miningaddr <new address from step two or your web client wallet address>
```

---

## <i class="fa fa-download"></i> Preuzmite i izvadite cgminer

Posjetite https://github.com/decred/cgminer/releases da biste pronašli najnovije izdanje cgminera. Za 64-bitni sustav Windows preuzimanje i izdvajanje `cgminer-decred-w64_*.zip`. Za 32-bitni sustav Windows preuzimanje i izdvajanje `cgminer-decred-w32_*.zip`. Izvucite sve datoteke u novu mapu i otvorite novu mapu za pregled datoteka.

---

## <i class="fa fa-play-circle"></i> Inicijalizirajte i pokrenite cgminer 

> Prvi korak

Desnom tipkom miša kliknite `start_local.bat` i kliknite `Edit`. Promijenite korisničko ime i zaporku kako bi se podudarale s vjerodajnicama korištene u koraku 1. Spremi i zatvori start_local.bat Za referencu, ovdje je naredba u start_local.bat:

```no-highlight
C:\Decred> cgminer --blake256 -o https://127.0.0.1:9109 -u <username> -p <password> --cert "%LOCALAPPDATA%\Dcrd\rpc.cert"
```

> Korak dva

Ako se dcrd ne završi sinkronizacijom s blokadom, pričekajte da završi, a zatim prijeđite na sljedeći korak. Kada završi, prikazat će:

```no-highlight
[INF] BMGR: Processed 1 block in the last 5m34.49s
```

> Korak tri

Dvaput kliknite na `start_local.bat`. `cgminer` trebao bi se otvoriti. Izradite konfiguracijsku datoteku `cgminer` pritiskom na sljedeće tipke: `S` (Postavke), `W` (Pisanje konfiguracijske datoteke), `Enter` (Spremi konfiguracijsku datoteku kao `cgminer.conf`). Imajte na umu da će `cgminer.conf` biti smješteni u istu mapu kao cgminer. Cgminer sada može biti pokrenut jednostavnim klikom na `cgminer.exe`. Ovo zaključuje osnovni vodič za postavljanje samostalnog cgminera. Za više informacija o korištenju cgminera i detaljnim objašnjenjima o programskim funkcijama, pogledajte službeni [cgminer OBAVIJEST](https://github.com/decred/cgminer/blob/3.7/README).
