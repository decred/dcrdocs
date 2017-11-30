# <i class="fa fa-windows"></i> *gominer* Vodič za korisnike za Windows Vađenje Zaliha 

Ovaj vodič namijenjen je za osnovno početno postavljanje gumba na odabranom vađenju zaliha koristeći konfiguracijsku datoteku, dostupne su naprednije opcije.

Zadnje ažuriranje za gominer v1.0.0.

---

### <i class="fa fa-download"></i> Preuzimanje i izdvajanje *gominer* Binarno 


>Preuzmite .zip datoteku

Posjetite [https://github.com/decred/decred-binaries/releases/tag/v1.0.0](https://github.com/decred/decred-binaries/releases/tag/v1.0.0) tda biste preuzeli Gominer Windows binarne datoteke. U odjeljku "Preuzimanja" trebali biste vidjeti sljedeće datoteke:

- `gominer-windows-amd64-cuda-v1.0.0.zip`,
- `gominer-windows-amd64-opencl-v1.0.0.zip`,
- `gominer-windows-amd64-opencladl-v1.0.0.zip`.

Za NVIDIA grafičke kartice, preuzmite datoteku `*-cuda-*.zip`. <br />
Za AMD grafičke kartice iz linija Radeon i FirePro, preuzmite datoteku `*-opencladl-*.zip`. <br />
Za ostale grafičke kartice preuzmite datoteku `*-opencl-*.zip`.

Izvadite ili kopirajte sve datoteke u novu mapu. Sjetite se naziva staze u ovu mapu ili otvorite novi prozor programa Pretraživač Datotekada biste pregledali sadržaj mape (za ostatak ovog vodiča koristit ćemo primjer `C:\decred\gominer\` as an example). The contents of this folder should be `blake256.cl`, `gominer.exe`, `LICENSE`, `README.md`, i `sample-gominer.conf`.

> Naredbeni redak napomena

Za one koji su novi, upoznajte se s nekim metodama da biste otvorili naredbeni redak u određenom direktoriju (mapi):

- U Pretraživaču Datoteka, idite na određenu mapu, upišite `cmd` u adresnu traku i pritisnite Enter.
- U Pretraživaču Datoteka krećite se do određene mape, kliknite padajući izbornik "Datoteka", idite na opciju "Otvori command prompt" i odaberite "Otvori command prompt".
- Kliknite izbornik Start ili pritisnite tipku Windows na tipkovnici, upišite `cmd`, i otvorite aplikaciju za radnu površinu "Naredbeni redak" koja bi se trebala pojaviti u rezultatima pretraživanja. Promijenite trenutni direktorij u određenu mapu pomoću naredbe `cd` npr, `e.g. cd C:\decred\gominer\`. The `dir` sama po sebi može se koristiti za pregled sadržaja trenutnog direktorija.

### Instalacija *gominer* Datoteka za konfiguraciju

> Korak 1: Odaberite zalihu za vađenje

Prije nego što započnemo ovaj korak, važno je da ste se već prijavili za račun za bazu vađenja (ako to zahtijeva odabrati zalihu za vađenje, morat ćete stvoriti radnika na web stranici zaliha). Zapišite prijavu i zaporku vašeg radnika, a sloj baze + tcp adresa: priključak za kasniju upotrebu.

Ako vam je to novo, evo nekoliko vodiča za stvaranje radnika na nekim od Decredovih zaliha vađenja (UPOZORENJE: ne zaboravite PIN koji ste postavili prilikom izrade računa - nećete ih moći povući bez istrošenog DCR-a):

- [https://dcr.maxminers.net/index.php?page=gettingstarted](https://dcr.maxminers.net/index.php?page=gettingstarted)
- [https://dcr.suprnova.cc/index.php?page=gettingstarted](https://dcr.suprnova.cc/index.php?page=gettingstarted)
- [https://www2.coinmine.pl/dcr/index.php?page=gettingstarted](https://www2.coinmine.pl/dcr/index.php?page=gettingstarted)
- [https://pool.mn/dcr/index.php?page=gettingstarted](https://pool.mn/dcr/index.php?page=gettingstarted)

> Korak 2: Provjerite uređaj ID#

Prije postavljanja konfiguracijske datoteke, važno je saznati koje uređaje, kao što je identificirao gominer, koji želite koristiti u mojem (pogotovo ako želite izbjeći vađenje s CPU-om ili IGP-om). Da biste to učinili, otvorite naredbeni redak na mjestu `gominer.exe` (`e.g. C:\decred\gominer\`), upišite `gominer.exe -l`, pritisnite Enter i popis uređaja koje možete Prikazat će se mina s njima. Snimite koje ID-ove uređaja želite upotrebljavati. Savjet: Videokartice mogu biti navedene pod imenom.

> Korak 3: Uredi konfiguracijsku datoteku

Otvorite datoteku `sample-gominer.conf`. Za svaku postavku koju namjeravamo promijeniti, jednostavno izbrišite polu-kolonu prije varijable postavljanja nakon `=` znaka.

Unutar odjeljka "Opće postavke":

- postavite `devices=` na Device ID#(s) snimljen pomoću naredbe `gominer.exe -l` u Koraku 2. Višestruki uređaji trebaju biti odvojeni zarezom, npr. `devices=2,3`.

Unutar odjeljka "Postavke rudarstva":

- postavite `pool=` na stratum+tcp adresu: ulaz vađenja zaliha po vašem izboru, npr. decredpool.org koristi `stratum+tcp://stratum.decredpool.org:3333` (UPOZORENJE: http://adresa: ulaz neće raditi s gominer - stratum+tcp *mora se koristiti*).
- postavite `pooluser=` na prijavu vašeg radnika.
- postavite `poolpass=` na zaporku vašeg radnika.

Nakon što su te promjene izvršene, Spremi kao ili Spremi + Preimenuj datoteku kao gominer.conf.

> Korak 4: Kopirajte gominer.conf u Lokalni AplikacijskiPodaci Mapa

Unutar novog Pretraživača Datoteka unesite `%localappdata%\Gominer\` into the address bar. Copy `gominer.conf` from it's original location, `e.g. C:\decred\gominer\`, into `%localappdata%\Gominer\`.

### Launch gominer.exe 

Vratite se natrag u direktorij koji sadrži `gominer.exe` i `blake256.cl`, `e.g. C:\decred\gominer\`, i pokrenite `gominer.exe`. Ako je sve ispravno učinjeno, gominer bi trebao pročitati iz konfiguracijske datoteke, povezati se s zalihom i započeti s zaključavanjem s navedenim uređajima. Počnite pregledavati poruke pomicanja, uključujući statističke podatke o vašem zaključavanju svakog uređaja i podnesene prihvaćene, odbijene, zastarjele i ukupne dionice.

Ako postoji pogreška veze, vjerojatno je `pool`, `pooluser` ili `poolpass` pogrešno konfiguriran.

Ako gominer počinje sa zaključavanjem na uređaju koji niste željeli koristiti, vjerojatno je postavka `devices` pogrešno konfigurirana.

Ako postoje oba navedena problema, vjerojatno je konfiguracijska datoteka neispravno navedena (mora biti nazvana`gominer.conf`) ili se nalazi u pogrešnom direktoriju (mora biti u `%localappdata%\Gominer\`).

### Upoznajte se sa web stranicom vaših zaliha 

Sada kada gominer zaključava sve za vas, imate vremena za provjeru web lokacije svojih zaliha. Većina zaliha ima nadzornu ploču na svojoj web stranici koju možete koristiti za pronalaženje statističkih podataka o zalihama, mreži i trenutnom krugu (proteklo vrijeme između svakog bloka koji se nalazi u zalihama). Isto tako, nakon što primite dovoljno velike isplate, možete povući svoje kovanice putem stranice Uređivanje računa postavljanjem adrese DCR plaćanja i postavljanjem pragova za automatsko isplate ili odabirom da se isplati ukupni saldo računa.

### Korisni savjeti

*Za OpenCL i OpenCL ADL verzije gominer*, gominer automatski izračunava VeličinuRada koji rezultira algoritmom rada koji se izvršava svakih 500 ms. Promjena postavki Intensity / VeličinuRada u `gominer.conf` rezultirat će poznatim problemom - algoritam će se izvršiti mnogo bržim tempom zbog smanjeneVeličineRada (to neće rezultirati stvaranjem više dionica), što će rezultirati povećanjem korištenja memorije ponekad čak 10MB / s. To na kraju dovodi do toga da vaš sustav istječe iz RAM prostora i automatski završi gominer. Najbolje je ostaviti ove postavke sami i dopustiti gomineru da izračuna svoju vlastiti VeličinuRada.
