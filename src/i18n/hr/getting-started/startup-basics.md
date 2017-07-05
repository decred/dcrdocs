# Osnove pokretanja

Ovaj se vodič posljednji put ažurirao za v1.0.0

---

Ovaj vodič odnosi se na korisnike aplikacije naredbenog retka. Paymetheus i Decredovi korisnici mogu sigurno ignorirati korištenje konfiguracijskih datoteka - Paymetheus i Decrediton oboje obrađuju automatski osnovnu konfiguraciju. Važno je napomenuti i da neki od naših vodiča prikazuju postavke konfiguracijske datoteke, a ostali vodiči prikazuju zastave za pokretanje. 

---

## Lokacije konfiguracijskih datoteka

Svi Decred programi, kada su pokrenuti, čitaju iz konfiguracijske datoteke kako bi odredili koje postavke treba omogućiti / onemogućiti / postaviti tijekom početnog punjenja. Svi zapisi za pokretanje naredbene linije `(e.g. dcrwallet --testnet)` mogu se zamijeniti postavkama u odgovarajućoj konfiguracijskoj datoteci `(e.g. dcrwallet --testnet could be replaced by testnet=1 in dcrwallet.conf)`.

These configuration files are located within the application home directory of the application. The location of these default home directories for Windows, macOS, and Linux are listed below:

Windows:

    C:\Users\<username>\AppData\Local\Dcrwallet\
    C:\Users\<username>\AppData\Local\Dcrd\
    C:\Users\<username>\AppData\Local\Dcrctl\ 
    C:\Users\<username>\AppData\Local\Decred\Paymetheus

macOS: 

    ~/Library/Application Support/Dcrwallet/
    ~/Library/Application Support/Dcrd/
    ~/Library/Application Support/Dcrctl/
    ~/Library/Application Support/decrediton/
    
Linux: 
    
    ~/.dcrwallet/
    ~/.dcrd/
    ~/.dcrctl/
    ~/.config/decrediton

Svaka od tih mapa ima dopuštenu vlastitu datoteku `.conf`, nazvanu po pojedinačnoj aplikaciji (`e.g. dcrd uses dcrd.conf`). Imajte na umu da se početni direktori `Dcrd` i `Dcrwallet` automatski stvaraju kada se svaka aplikacija prvi put pokrene. Morat ćete ručno stvoriti `Dcrctl` kućni imenik kako biste koristili konfiguracijsku datoteku.

Metoda instalacije [dcrinstalacijal](/getting-started/user-guides/cli-installation.md) automatski stvara konfiguracijske datoteke s [minimalnim postavkama konfiguracije](/advanced/manual-cli-install.md#minimum-configuration) Već omogućeno.

Metoda [Manualna instalacija](/advanced/manual-cli-install.md#installation) uključuje uzorak datoteka konfiguracije unutar .zip/.tar.gz. Preporuča se kopirati ove konfiguracijske datoteke u gore opisani odgovarajući direktorij i preimenovati ih da biste uklonili "uzorak". Ove datoteke imaju mnogo postavki komentiranih (komentari ne čitaju program tijekom trajanja) pa su sve te postavke učinkovito onemogućene. Te predefinirane postavke možete omogućiti jednostavnim brisanjem polu-kolone prije linije.

---

## Zapisnici za pokretanje

Većina postavki koje možete postaviti putem konfiguracijske datoteke također se mogu proslijediti aplikaciji kao parametri tijekom pokretanja. Na primjer, sljedeće naredbe specifične za operacijski sustav otvorile bi `dcrd` za korištenje Testnet, alternativu korištenju `testnet=1` u konfiguracijskoj datoteci:

    Windows: dcrd.exe --testnet
    macOS: ./dcrd --testnet
    Linux: ./dcrd --testnet

Gornji primjer prvo bi pogledao na `dcrd` konfiguracijsku datoteku za postavke, a zatim pogled na izvršnu naredbu za omogućavanje postavke testnet.

---

## Napredna upotreba

[Pohranjivanje pojedinosti prijave u konfiguracijskim datotekama](/advanced/storing-login-details.md) <!--  To su iste informacije koje su pronađene u gornjem odjeljku Minimalna konfiguracija. Vjerojatno bi mogao izbrisati. -->

[Pun popis opcija za svaku aplikaciju](/advanced/program-options.md)
