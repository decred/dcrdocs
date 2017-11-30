# <i class="fa fa-linux"></i> Linux korisnički priručnik

---

## <i class="fa fa-download"></i> Preuzmite i izvadite cgminer

Posjetite https://github.com/decred/cgminer/releases da biste pronašli najnovije izdanje cgminera. Da biste preuzeli i ekstrahirali datoteke putem terminala, pokrenite sljedeće naredbe. Imajte na umu da ovaj primjer preuzima cgminer v0.0.4.

```no-highlight
~/Decred/$ wget "https://github.com/decred/decred-release/releases/download/v0.0.4_cgminer/cgminer-decred-linux-x86_64-20160208.tar.gz"
~/Decred/$ tar -xvf cgminer*
```

Premjesti u novi direktorij cgminer:

```
~/Decred/$ cd cgminer*
```

## <i class="fa fa-play-circle"></i> Inicijalizirajte i pokrenite cgminer 

> Prvi korak

U prozoru terminala upišite sljedeće da biste popisali svoj hardver koji je moguće rudariti:

```no-highlight
~/Decred/$ ./cgminer -n
```

Oznake videozapisa trebale bi biti navedene bilo pomoću GPU kodnog imena ili naziva upravljačkog programa. Posljednja linija izlaza trebala bi prikazati broj kompatibilnih GPU-ova s ​​kojima možete vaditi.

> Korak dva (neobavezno)

Da biste usporedili svoj sustav i saznali koliko su vaše GPU sposobne, upotrijebite naredbu:

```no-highlight
~/Decred/$ ./cgminer --blake256 --benchmark
```

> Korak tri

Registrirajte se na jednom od internetskih stranica zaliha i postavite novog vaditelja za svako računalo za vađenje. Uputite se na web stranicu bazena po vašem izboru, ako je potrebno. U završnom prozoru iz prvog koraka unesite sljedeću naredbu za pokretanje cgminera (zanemari kvadratiće zagrade):

```no-highlight
~/Decred/$ ./cgminer --blake256 -o <pool url>:<port number> -u <web login>.<worker name> -p <worker password>
```

Primjer:

```no-highlight
~/Decred/$ ./cgminer --blake256 -o http://dcr.maxminers.net:7727 -u DecredMiner.miner1 -p 7@!x5L1
```

> Četvrti korak

Cgminer bi trebao sada pokrenuti. Izradite cgminer konfiguracijsku datoteku pritiskom na sljedeće tipke: `S` (Postavke), `W` (Write Config File), `Enter` (Spremi konfiguracijsku datoteku kao `cgminer.conf`). Imajte na umu da će `cgminer.conf` biti postavljen u isti direktorij kao `cgminer`. Da biste dodali druge bazene u konfiguracijsku datoteku, otvorite `cgminer.conf` s Gedit (GUI) / Pico (CLI) ili sličnim uređivačem teksta. Višestruki se bazeni mogu dodati slijedeći ovu sintaksu u odjeljku "zalihe" konfiguracijske datoteke (zabilježite zarez između svakog pojedinačnog unosa zaliha):

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

Spremite `cgminer.conf` i zatvorite `cgminer`. Ponovno pokrenite cgminer pomoću naredbe:

```no-highlight
~/Decred/$ ./cgminer
```

Ovo zaključuje osnovni vodič za postavljanje zaliha cgminer. Za više informacija o korištenju cgminera i detaljnim objašnjenjima o programskim funkcijama, pogledajte službeni[cgminer README](https://github.com/decred/cgminer/blob/3.7/README).
