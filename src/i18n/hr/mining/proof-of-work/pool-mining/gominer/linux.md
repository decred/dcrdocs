# **<i class="fa fa-linux"></i> *gominer* Korisnički vodič za Linux Vađenje Zaliha**

Ovaj vodič namijenjen je za osnovno početno postavljanje gumba s odabranim vađenjem zaliha pomoću konfiguracijske datoteke; Dostupne su više naprednih opcija.

Zadnje ažuriranje 28. travnja 2017. godine.

---

### **<i class="fa fa-download"></i> Preuzmite i izvadite *gominer* Binarni**


>Preuzmite .tar.gz datoteku

Posjetite [https://github.com/decred/decred-binaries/releases](https://github.com/decred/decred-binaries/releases) da biste preuzeli najnovije gumbe Linux bina. Dostupne su samo 64-bitne verzije gumba. Najnovija izdanja su:

- `gominer-linux-amd64-cuda-v1.0.0.tar.gz`,
- `gominer-linux-amd64-opencl-v1.0.0.tar.gz`,
- `gominer-linux-amd64-opencladl-v1.0.0.tar.gz`.

Za NVIDIA grafičke kartice, preuzmite datoteku `*-cuda-*.tar.gz`. <br />
Za AMD grafičke kartice iz linija Radeon i FirePro, preuzmite datoteku `*-opencladl-*.tar.gz`. <br />
Za ostale grafičke kartice preuzmite datoteku `*-opencl-*.tar.gz`.

Za vas ljubitelje naredbene linije, ovdje su izravne veze za v1.0.0:

```no-highlight
$ wget https://github.com/decred/decred-binaries/releases/download/v1.0.0_gominer/gominer-linux-amd64-cuda-v1.0.0.tar.gz
$ wget https://github.com/decred/decred-binaries/releases/download/v1.0.0_gominer/gominer-linux-amd64-opencl-v1.0.0.tar.gz
$ wget https://github.com/decred/decred-binaries/releases/download/v1.0.0_gominer/gominer-linux-amd64-opencladl-v1.0.0.tar.gz
```

>Izvadite .tar.gz datoteku

Ekstrakt ili kopiranje svih datoteka u novi direktorij. Za ovaj vodič koristit ćemo `~/decred/` kao naš radni imenik. Iz naredbenog retka:

```no-highlight
$ tar -xzf gominer-linux-amd64-cuda-v1.0.0.tar.gz -C ~/decred/
```

Kada raspakirate tar, stvorit će se imenik pod nazivom `gominer-linux-amd64-opencladl-v1.0.0`. Sadržaj ovog direktorija treba biti `blake256.cl`, `blake256-old.cl`, `gominer`, `LICENSE`, `README.md`, i `sample-gominer.conf`.

Za CUDA verziju, CUDA knjižnica runtime sada je uključena. Datoteke u ovoj verziji također će sadržavati `libcudart.so.8.0` i `rungominer.sh`. Skripta se koristi za pokretanje gumba s uključenom bibliotekom aktivnom za vašu praktičnost. Morate imati instalirati upravljački program za grafičku karticu koja podržava CUDA 8. Stariji upravljački programi će uzrokovati da gominer pada pri otvaranju.

### **Postavite *gominer* konfiguracijsku datoteku**

> Korak 1: Odaberite bazen za vađenje

Prije nego što započnemo ovaj korak, važno je da ste se već prijavili za račun za bazu za vađenje (ako to zahtijeva odabrati zalihu za vađenje, morat ćete stvoriti radnika na web stranici zaliha). Zapišite prijavu i zaporku vašeg radnika, a sloj baze +tcp adresa: priključak za kasniju upotrebu.

Ako vam je to novo, evo nekoliko vodiča za stvaranje radnika na nekim od Decredovih vađenja zaliha (UPOZORENJE: ne zaboravite PIN koji ste postavili prilikom izrade računa - nećete ih moći povući bez istrošenog DCR-a):

- [https://dcr.maxminers.net/index.php?page=gettingstarted](https://dcr.maxminers.net/index.php?page=gettingstarted)
- [https://dcr.suprnova.cc/index.php?page=gettingstarted](https://dcr.suprnova.cc/index.php?page=gettingstarted)
- [https://www2.coinmine.pl/dcr/index.php?page=gettingstarted](https://www2.coinmine.pl/dcr/index.php?page=gettingstarted)
- [https://pool.mn/dcr/index.php?page=gettingstarted](https://pool.mn/dcr/index.php?page=gettingstarted)

> Korak 2: Provjerite uređaj ID#

Prije postavljanja konfiguracijske datoteke, važno je saznati koje uređaje, kao što je identificirao gominer, koje želite koristiti za vađenje. Da biste to učinili, otvorite prozor terminala, idite na lokaciju koju ste instalirali iznad (npr. `~/decred/gominer-linux-amd64-cuda-v1.0.0`), upišite `./gominer -l` ili `./rungominer.sh -l` ako koristite verziju CUDA, pritisnite Enter i prikazat će se popis uređaja s kojima možete ruditi. Snimite koje ID-ove uređaja želite upotrebljavati. Savjet: Videokartice mogu biti navedene pod imenom.

> Korak 3: Uredi konfiguracijsku datoteku

Otvorite datoteku `sample-gominer.conf` pomoću odabira uređivača teksta. Za svaku postavku koju namjeravamo promijeniti, jednostavno izbrišite polu-debelo crijevo prije varijable postavljanja nakon `=` znaka. 

Unutar odjeljka "Opće postavke":

- postavite `devices=` na Device ID#(s) snimljen pomoću `./gominer -l` ili `./rungominer.sh -l` naredbe u koraku 2. Višestruki uređaji trebaju biti odvojeni zarezom, npr. `devices=2,3`.

Unutar odjeljka "Postavke vađenja":

- postavite `pool=` na stratum+tcp adresu: luka rudarskog bazena po vašem izboru, npr. decredpool.org koristi `stratum+tcp://stratum.decredpool.org:3333` (UPOZORENJE: http://adresa: ulaz neće raditi s gominer - stratum+tcp *mora se koristiti*).
- postavite `pooluser=` na prijavu vašeg radnika.
- postavite `poolpass=` na zaporku vašeg radnika.

Nakon što se te promjene izvrše, spremite datoteku. Izradite kopiju i nazovite ga gominer.conf u direktoriju gominer konfiguracije:

```no-highlight
$ mkdir -p ~/.gominer
$ cp sample-gominer.conf ~/.gominer/gominer.conf
```

### **Launch gominer**

Vratite se natrag u imenik koji sadrži `gominer` i `blake256.cl`, `e.g. ~/decred/gominer-linux-amd64-cuda-v1.0.0/`, i pokrenite ga - `./gominer` ili `./rungominer.sh`. Ako je sve ispravno učinjeno, gominer bi trebao pročitati iz konfiguracijske datoteke, povezati se sa zalihom i započeti sa zaključavanjem s navedenim uređajima. Počnite pregledavati poruke pomicanja, uključujući statističke podatke o vašem ključu sa svakim uređajem i podnesene prihvaćene, odbijene, zastarjele i ukupne dionice.

Ako postoji pogreška veze, vjerojatno je `pool`, `pooluser` ili `poolpass` pogrešno konfiguriran.

Ako gominer počinje s zaključavanje na uređaju koji niste željeli koristiti, vjerojatno je postavka `devices` pogrešno konfigurirana.

Ako oba gore navedena problema postoje, vjerojatno je konfiguracijska datoteka neispravno navedena (mora biti nazvana`gominer.conf`) ili se nalazi u pogrešnom direktoriju (mora biti u `~/.gominer/`).

### **Upoznajte se sa web stranicom vaših zaliha**

Sada kada se vaš gubac odspava za vas, imate vremena za provjeru web lokacije svojih zaliha. Većina bazena ima nadzornu ploču na svojoj web stranici koju možete koristiti za pronalaženje statističkih podataka o bazenu, mreži i trenutnom krugu (proteklo vrijeme između svakog bloka koji se nalazi u bazenu). Isto tako, nakon što primite dovoljno velike isplate, možete povući svoje kovanice putem stranice Uređivanje računa postavljanjem adrese DCR plaćanja i postavljanjem pragova za automatsko isplate ili odabirom da se isplati ukupni saldo računa.

### **Korisni savjeti**

*Za OpenCL i OpenCL ADL verzije gominer*, gominer automatski izračunava VeličinuRada koji rezultira algoritmom rada koji se izvršava svakih 500 ms. Promjena postavki Intezitet / VeličineRada u `gominer.conf` rezultirat će poznatim problemom - algoritam će se izvršiti vrlo brzo zbog smanjene VeličineRada (to neće rezultirati generiranjem više dionica), što će rezultirati povećanjem korištenja Memorije ponekad čak 10MB / s. To na kraju dovodi do toga da vaš sustav istječe iz RAM prostora i automatski završi gominer. Najbolje je ostaviti ove postavke sami i dopustiti gomineru da izračuna svoju vlastitu VeličinuRada.
