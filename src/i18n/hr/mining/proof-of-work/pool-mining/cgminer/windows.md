# <i class="fa fa-windows"></i> vodič za korisnike za Windows

---

## <i class="fa fa-download"></i> Preuzmite i izvadite cgminer

Posjetite https://github.com/decred/cgminer/releases da biste pronašli najnovije izdanje cgminera. Za 64-bitni sustav Windows preuzimanje i izdvajanje `cgminer-decred-w64_*.zip`. Za 32-bitni sustav Windows preuzimanje i izdvajanje `cgminer-decred-w32_*.zip`. Izvucite sve datoteke u novu mapu i otvorite novu mapu za pregled datoteka.

## <i class="fa fa-play-circle"></i> Inicijalizirajte i pokrenite cgminer 

> Prvi korak

Otvorite prozor naredbenog retka upisivanjem `cmd` u adresnu traku pri vrhu istražitelja datoteka koji ima nove datoteke cgminer i pritiskom na tipku `Enter`. U prozoru naredbenog retka upišite sljedeće da biste naveli svoj hardver koji je moguće vaditi:

```no-highlight
C:\Decred> cgminer -n
```

Oznake videozapisa trebale bi biti navedene bilo pomoću GPU kodnog imena ili naziva upravljačkog programa. Posljednja linija izlaza trebala bi prikazati broj kompatibilnih GPU-ova s ​​kojima možete vaditi.

> Korak dva (neobavezno)

Da biste usporedili svoj sustav i saznali hashrate na kojem se može izvršiti, upotrijebite naredbu:

```no-highlight
C:\Decred> cgminer --blake256 --benchmark
```

> Korak tri

Registrirajte se na jednom od internetskih stranica zaliha i postavite novog rudara za svako rudarsko računalo. Uputite se na web stranicu zaliha po vašem izboru, ako je potrebno. U prozoru naredbenog retka iz prvog koraka unesite sljedeću naredbu za pokretanje cgminera (zanemarite kvadratne zagrade):

```no-highlight
C:\Decred> cgminer --blake256 -o <pool url>:<port number> -u <web login>.<worker name> -p <worker password>
```

Primjer:

```no-highlight
C:\Decred> cgminer --blake256 -o http://dcr.maxminers.net:7727 -u DecredMiner.miner1 -p 7@!x5L1
```

> Četvrti korak

Cgminer bi trebao sada pokrenuti. Izradite cgminer konfiguracijsku datoteku pritiskom na sljedeće tipke: `S` (Postavke), `W` (Write Config File), `Enter` (Spremi konfiguracijsku datoteku kao `cgminer.conf`). Imajte na umu da se `cgminer.conf` nalazi u istom direktoriju kao `cgminer.exe` Da biste dodali druge bazene u konfiguracijsku datoteku, otvorite `cgminer.conf` s Notepadom ili sličnim uređivačem teksta. Koristite sljedeću sintaksu kako biste unijeli izmjene u odjeljku "zalihe" konfiguracijske datoteke (zabilježite zarez između svakog pojedinačnog unosa zaliha):

```no-highlight
"pools" : [
   {
      "url" : "http://dcr.maxminers.net:7727",
      "user" : "Login.Worker",
      "pass" : "password"
   },
   {
      "url" : "http://dcr.suprnova.cc:9110",
      "user" : "Login.Worker",
      "pass" : "password"
   }
]
```

> Korak pet

Spremite `cgminer.conf` i zatvorite `cgminer.exe`. Dvaput kliknite na program cgminer i pokrenut će i učitati novo stvorenu konfiguracijsku datoteku. Ovo zaključuje osnovni vodič za postavljanje zaliha cgminer. Za više informacija o korištenju cgminera i detaljnim objašnjenjima o programskim funkcijama pogledajte [cgminer OBAVIJEST](https://github.com/decred/cgminer/blob/3.7/README).
