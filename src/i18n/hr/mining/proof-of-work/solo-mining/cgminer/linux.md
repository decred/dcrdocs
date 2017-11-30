# <i class="fa fa-linux"></i> Linux Vodič za korisnike

---

## <i class="fa fa-cloud"></i> Povežite dcrd na Decred mrežu

> Prvi korak

Imajte na umu da se sve naredbe `dcrd`, `dcrwallet`, i `dcrctl` moraju izvršiti u direktoriju u kojem su vaše Decred datoteke! Pokreni `dcrd`:

```no-highlight
~/Decred/$ ./dcrd -u <username> -P <password>
```

Pokreni dcrračun:

```no-highlight
~/Decred/$ ./dcrwallet -u <username> -P <password>
```

> Korak dva

Generirajte novu adresu račune:

```no-highlight
~/Decred/$ ./dcrctl -u <username> -P <password> --wallet getnewaddress default
```

Kopirajte novu adresu (izlaz iz zadnje naredbe). Zatvorite / zaustavite `dcrd` i `dcrwallet` pritiskom na `ctrl+c` u svakom prozoru.

> Korak tri

Ponovo pokrenite `dcrd` pomoću naredbe:

```no-highlight
~/Decred/$ ./dcrd -u <username> -P <password> --miningaddr <new address from step two or your web client wallet address>
```

> Četvrti korak

Postavljanje TLS sigurnosti kopiranjem rpc.cert u/usr/podijeli/ ca-certifikati:

```no-highlight
sudo cp /home/<username>/.dcrd/rpc.cert /usr/share/ca-certificates/dcrd.crt
```

Pomoću alata za uređivanje teksta dodajte redak "dcrd.crt" (bez navodnika) u /etc/ca-certifikati.conf:

```no-highlight
sudo gedit /etc/ca-certificates.conf
```

Ažurirajte popis CA certifikata:

```no-highlight
sudo update-ca-certificates
```

---

## <i class="fa fa-download"></i> Preuzmite i izvadite cgminer

Posjetite https://github.com/decred/cgminer/releases da biste pronašli najnovije izdanje cgminera. Za preuzimanje i izdvajanje putem Linux terminala koristite sljedeće naredbe:

```no-highlight
wget https://github.com/decred/decred-release/releases/download/v0.0.4_cgminer/cgminer-decred-linux-x86_64-20160208.tar.gz
tar -xvf cgminer-decred-linux-x86_64-20160208.tar.gz
```

---

## <i class="fa fa-play-circle"></i> Inicijalizirajte i pokrenite cgminer 

> Prvi korak

Ako se `dcrd` ne završi sinkronizacijom s blokadom, pričekajte da završi, a zatim prijeđite na sljedeći korak. Kada završi, prikazat će:

```no-highlight
[INF] BMGR: Processed 1 block in the last 5m34.49s
```

> Korak dva

U direktoriju cgminer pokrenite cgminer pomoću naredbe:

```no-highlight
~/Decred/$ ./cgminer --blake256 -o https://127.0.0.1:9109 -u <username> -p <password>
```

Izradite cgminer konfiguracijsku datoteku pritiskom na sljedeće tipke: `S` (Postavke), `W` (Piši Datoteku Konfiguracije), `Enter` (Spremi konfiguracijsku datoteku kao `cgminer.conf`). Imajte na umu da će `cgminer.conf` biti smješteni u istu mapu kao cgminer. Cgminer se sada može pokrenuti jednostavnim pokretanjem naredbe:

```no-highlight
~/Decred/$ ./cgminer
```

Ovo zaključuje osnovni vodič za postavljanje solo cgminera. Za više informacija o korištenju cgminera i detaljnim objašnjenjima o programskim funkcijama, pogledajte službeni [cgminer OBAVIJEST](https://github.com/decred/cgminer/blob/3.7/README).
