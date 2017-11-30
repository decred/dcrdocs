# Testnet teško grananje vodič za glasanje

Ovaj se vodič posljednji put ažurirao za v1.0.1

Od izdanja v0.8.0 od 13. veljače 2017., mehanizam za glasanje za teško grananje proveden je za testiranje na Decred Testnetu. Ocjenjivanje testa procjenjuje se da počinje 25. veljače 2017. oko 1:00 CST i traje 7 dana. Ako želite sudjelovati, vodiči za Paymetheus i aplikacije za Command Line mogu se naći ovdje.

---

## Uvod

Postoji dvostupanjski postupak za glasanje kako bi se implementirale konsenzusne promjene koje bi stvarale teško grananje. Napomena: sljedeći blokovi su za Testnet, oni će se razlikovati za Mainnet.

Prvi korak je ispuniti prag nadogradnje na mreži. Nakon otpuštanja tvrdog koda, većina čvorova na mreži koji sudjeluju u PoW / PoS trebaju prvo nadograditi prije glasanja. Za dokaz o radu, najmanje 75% od 100 najnovijih blokova mora imati najnoviju blok verziju. Za dokaz o ulozi, 75% glasova unutar statičkog bloka od 2016. mora imati najnoviju verziju glasanja.

Drugi korak ovog procesa je stvarno glasanje. Prethodni blok 2016. pada negdje unutar većeg bloka od 5040 blokova i mreža mora čekati taj veći blok od 5040 do kraja. Zbog raznih duljina intervala, *može* potrajati do dodatnih 5040 blokova prije početka glasanja. Nakon toga, statički intervalni blok 5040 odvaja se dok se glasovi bacaju i ako 75% glasova vađenih unutar tog intervala signalizira "da" glas ne predložene izmjene, promjene se u potpunosti provode nakon jednog dodatnog bloka intervala (kako bi se preostala Čvorišta vrijeme potrebno za ažuriranje kako bi se izbjeglo da se odvoji od lancablokova). U nastavku je pojednostavljeni grafikon koji objašnjava svaki interval blokova u redoslijedu kronološkog prikazivanja.

Opis intervala | Vrsta intervala | Broj blokova
---------------------|-------------|---------------
Minimalno 75% blokova mora biti najnovija inačica | Rolling | 100
Minimalno 75% glasova mora biti najnovija inačica | Statički | 2016
Interval nakon zahtjeva za nadogradnjom ispunjen | Statički | Do 5040
Stvarni interval glasanja - 75% Glasova mora signalizirati "da" da prođe | Statički | 5040
Interval prije provedbe ako glasanje prođe | Statički | 5040

Ako prijedlog ne dostigne prag od 10% od glasova "ne" ili "da", dionici će moći ponovno glasovati o njemu tijekom sljedećeg vremenskog intervala, sve dok ovaj prag ne bude ispunjen ili prijedlog istekne.

Ispod su upute za sudjelovanje u demo verziji na testnetu koristeći zalihaulaganja s Paymetheus i / ili naredbenog retka aplikacije `dcrd`, `dcrwallet`, i `dcrctl`. Vodič kroz naredbeni redak koristi konfiguracijske datoteke za prijenos parametara u aplikaciju tijekom pokretanja. Alternativno, zastavice se mogu koristiti pri pokretanju aplikacije, ali neće biti pokrivene ovim nacrtom.

## Paymetheus

> Korak 1: Preuzmite i instalirajte Paymetheus

If you haven't already updated your Decred binaries to v1.1.0, visit the [Installation Guide](/getting-started/user-guides/paymetheus.md) and follow the directions for the Windows Installer.

> Korak 2: Pokrenite Decred Testnet

Iz izbornika Start otvorite `Decred Testnet`. Ovo će pokrenuti `Paymetheus`, a novi prozor naredbenog retka će se otvoriti i pokrenuti `dcrd.exe`. Ako je ovo prvi put pokrenut servis, potrebno je neko vrijeme da se sinkronizira s lancemblokova testnet mrežom.

U prozoru `Paymetheus` dobit ćete dijalog "Poveži se s dcrd". Zadržite zadane postavke i pritisnite gumb za nastavak. Sljedeći prikaz ima dva gumba "Stvaranje novog računa" i "Vrati račun iz baze podataka". Za ovaj vodič, pretpostavit ćete da nemate bazu podataka koje želite vratiti.

Nakon što kliknete "Izradi nov račun", dočekat će vam informacije vezane uz nov račun. Zabilježite bazu podataka, stavite ga na sigurno mjesto i nikad ga ne podijelite s nikim. Također ćete ga morati ponovno unijeti nakon što pritisnete tipku NASTAVI.

Nakon što ste upisali bazu podatakae, sljedeće će se prikazati kriptiranje računa. Unesite privatnu zaporku kako objašnjavaju upute. Pritisnite KODIRANJE. Paymetheus će početi stvarati račun. Nakon što je stvorena, otvorit će se stranica pregleda vašeg računa.

> Korak 3: Registrirajte se na web mjestu zalihaulaganja

Dok čekate da se vaš čvor / račun sinkronizira, posjetite adresu [https://teststakepool.decred.org](https://teststakepool.decred.org) i registrirajte se za novi račun.

> Korak 4: Stjecanje kovanica Testnet

Zatim ćete morati kupiti kovanice Testnet kako biste kupili ulaznice Testnet. Postoji službena slavina Testnet koja se nalazi na adresi [https://faucet.decred.org](https://faucet.decred.org). Da biste dobili novu adresu iz Paymetheusa, kliknite karticu "Zahtjev za plaćanje" na navigacijskom izborniku. Klikom na gumb "STVORI ADRESU" dobit ćete adresu koja bi trebala početi s "Ts". Kopirajte i zalijepite tu adresu u slavinu i trebali biste primiti svoje novčiće.

> Korak 5: Kupnja testnet karata

Kliknite karticu "Kupnja ulaznica" unutar navigacijskog izbornika Paymetheus. Na stranici ćete vidjeti 7 polja obrasca. Sve zadane postavke mogu se koristiti za kupnju ulaznica **osim** "Postavke baze uloga". Kliknite gumb "Upravljanje bazama". Morate unijeti API ključ za svoj račun u paleti testnet mreže. Da biste to učinili, jednostavno posjetite [https://teststakepool.decred.org/settings](https://teststakepool.decred.org/settings) - vaš API Token trebao bi biti prva stavka na stranici. Unesite ga u polje API ključa unutar Paymetheus i pritisnite Spremi. Vaš 1-of-2 multi-sig skript će biti automatski stvoren i možete pritisnuti Zatvori.

Dalje, odaberite testzalihaulaganja.decred.org s padajućeg izbornika Stavka bazena i pritisnite gumb Kupnja za početak kupnje ulaznica! Napomena: poteškoća s kartama jednaka je cijeni po karti, stoga pazite da imate dovoljno novčića za testnet da biste kupili barem jedan.

> Korak 6: Postavite glasove vaših ulaznica putem zalihaulaganja

Pri korištenju udjela, svaka ulaznica koju kupite ima pravo glasa delegirati u to društvo. Prema zadanim postavkama, bazen će glasovati na bilo koji način koji odgovara vašim ulaznicama. Naravno, možda želite promijeniti način na koji glasaju vaše ulaznice.

Možete postaviti glasove vaših ulaznica putem sučelja ulaznica. Ispod je snimak zaslona stranice [https://teststakepool.decred.org/tickets](https://teststakepool.decred.org/tickets). Na dnu odjeljka "Uživo / Nezrelo" na ovoj stranici vidjet ćete postavke za glasnoću. Samo možete urediti stavke *svih* vaših ulaznica odjednom putem sučelja uloga. Dolje prikazane ulaznice postavljene su na "Da" za "Prethodni blok valjan?" I "Da" za "Povećanje veličine blokova od 1,0 MiB do 1,25MB" što je rezultiralo Glasanjebitova od 5 vrijednosti.

<img src="/img/testnet-voting_votebit-setting.jpg">

Za neke osnovne informacije o glasovima, posjetite [Objašnjenje glasova](#an-explanation-of-votebits).

## Upute za naredbene retke

> Korak 1: Preuzmite i instalirajte Decred

If you haven't already updated your Decred binaries to v1.1.0, visit the [Installation Guide](/getting-started/user-guides/cli-installation.md) and follow the directions for your operating system.

> Korak 2: Stvorite konfiguracijske datoteke

Ako ste već upoznati s `.conf` datotekama, nastavite na korak 3.

Molimo pogledajte naše [Konfiguracija Datoteka Uvod](/getting-started/startup-basics.md#configuration-files) i stvorite nove konfiguracijske datoteke ili kopirajte konfiguracijske datoteke uzorka u direktorije specificirane za vaš operativni sustav.

> Korak 3: Uredi konfiguracijske datoteke za pokretanje testne mreže




Da biste pokrenuli `dcrd`, `dcrwallet`, i `dcrctl` na testnetu, jednostavno dodajte `testnet=true` ili `testnet=1` na sve tri konfiguracijske datoteke. Ako koristite jednu od datoteka konfiguracije uzorka, jednostavno možete pronaći liniju koja glasi `;testnet=1` (prva postavka unutar odjeljka Postavke mreže) i izbrišite polu-kolonu.

To mora biti učinjeno za sve tri konfiguracijske datoteke.

> Korak 4: Stvaranje novog računa Testnet

Ako nikad prije niste pokrenuli račun Testnet, morat ćete napraviti novu verziju. Pomoću postavki `dcrwallet.conf` za testnet **(pogledajte 3. korak)**, pokrenite `dcrwallet` s oznakom `--create`.

Za one koji nisu upoznati s tim načinom, slijedite upute u nastavku:

**Windows**: <br />
1. Korištenje naredbenog retka ili Pretraživačem datoteka, pomaknite se do direktorija izvršne datoteke `dcrwallet` <br />

2. Ako koristite Pretraživač datoteka, odaberite opciju "Otvori command prompt" iz padajućeg izbornika "File" <br />

3. Unesite `dcrwallet.exe --create` naredbu

**macOS**: <br />
1. Korištenje terminala ili Pretraživača, idite u direktorij svoje izvršne datoteke `dcrwallet` <br />

2. Ako koristite Pretraživač, možete otvoriti novi terminals na mjestu mape tako da desnom tipkom miša kliknete mapu i odaberete Usluge> Novi Terminal u prozoru s padajućeg izbornika<br />

3. Unesite `./dcrwallet --create` naredbu

**Linux**: <br />
1. Koristeći sve što vam se sviđa, prijeđite u direktorij svoje izvršne datoteke `dcrwallet` <br />

2. Unesite `./dcrwallet --create` naredbu

To će vas odvesti kroz uobičajene upute za stvaranje novog računa. Slijedite upute na zaslonu. Morat ćete izraditi privatnu zaporku (kasnije ćete ga koristiti za otključavanje računa prilikom izrade transakcija). Dodatni sloj enkripcije je potpuno opcionalan. Vaša se baza podataka može koristiti za vraćanje računa na bilo kojem računalu pomoću dcrračuna. Zabilježite bazu podataka, stavite ga na sigurno mjesto i nikad ga ne podijelite s nikim. Račun će se zatvoriti nakon što se sve završi.

> Korak 5: Pokrenite dcrd na Testnetu

Pokrenite izvršnu datoteku `dcrd` s opcijom `testnet=1` ili `testnet=true` unutar konfiguracijske datoteke kako biste pokrenuli čvor na testnetu. Vaš će čvor sinkronizirati s ostatkom mreže. Sinkronizacija će potrajati neko vrijeme.

> Korak 6: Pokrenite dcrračun na Testnetu

Pokrenite izvršnu datoteku `dcrwallet` pomoću `testnet=1` ili `testnet=true`option unutar konfiguracijske datoteke kako biste pokrenuli račun na testnetu. Vaš račun će se povezati s vašim čvorom i početi sinkronizirati vaše adrese. Sinkronizacija može potrajati.

> Korak 7: Registrirajte se na web mjestu zalihaulaganja

Dok čekate da se vaš čvor / račun sinkronizira, posjetite adresu [https://teststakepool.decred.org](https://teststakepool.decred.org) i registrirajte se za novi račun. Nastavite na korak 8.

> Step 8: Wait for Testnet Node/Wallet to Sync

Odmorite se, to može potrajati neko vrijeme.

> Korak 9: Izradite adresu javnog ključa za korištenje zalihaulaganja

Prvi korak u korištenju zalihaulaganjaa je generiranje nove adrese javnih ključeva koje će se koristiti za generiranje 1-of-2 multisignature skripte. Slijedite upute na adresi [https://teststakepool.decred.org/address](https://teststakepool.decred.org/address) kako biste generirali i spremili ovu adresu. Ako ste postavili račun na mainstream mreži, to je isto.

> Korak 10: Uvozite višenamjenski skriptu P2SH iz zalihaulaganjaa

Zatim morate uvesti skriptu koja će vam omogućiti delegiranje prava glasa u bazenu. Nakon dovršetka prethodnog koraka, ova skripta mora biti dostupna na adresi [https://teststakepool.decred.org/tickets](https://teststakepool.decred.org/tickets). Ponovno slijedite upute za uvoz skripte. Ako ste postavili račun na mainstream mreži, to je isto.

> Korak 11: Stjecanje kovanica Testnet

Zatim ćete morati kupiti kovanice Testnet kako biste kupili ulaznice Testnet. Postoji službena slavina Testnet koja se nalazi na adresi [https://faucet.decred.org](https://faucet.decred.org). Unesite adresu Testnet (moguće je preuzeti pokretanjem `getnewaddress` naredbe - primjere za svaki OS u nastavku)

    Windows: dcrctl.exe --wallet getnewaddress
    macOS/Linux: ./dcrctl --wallet getnewaddress

> Korak 12: Kupite ulaznice Testnet

[https://teststakepool.decred.org/tickets](https://teststakepool.decred.org/tickets) opisuje tri opcije za kupnju ulaznica. Najbolje je da upotrebljavate ručnu kupnju tako da možete kupiti ulaznice kad god vam zatrebaju.

Izdajte naredbu `dcrctl --wallet getstakeinfo` da biste vidjeli trenutačne poteškoće. Ovo je trenutna cijena ulaznica. Prilagodite naredbu za kupnju stavki koja se prikazuje na stranici ulaznica za određene dionice kako bi se prilagodila trenutačnoj cijeni ulaznice.

> Korak 13: Pričekajte za glasanje za početak

Prvo, najmanje 75% ukupnog broja glasova u zadnjim blokovima 2016. mora biti iz čvora s najnovijim Decred softverom. Zatim se mora proći blokni interval od 5040 blokova prije početka glasanja. Provjerite [https://hardforkdemo.decred.org](https://hardforkdemo.decred.org) za najnoviji status u cijelom procesu glasanja.

> Korak 14: Postavite glasove vaših ulaznica putem zalihaulaganjaa

Pri korištenju udjela, svaka ulaznica koju kupite ima pravo glasa delegirati u to društvo. Prema zadanim postavkama, bazen će glasovati na bilo koji način koji odgovara vašim ulaznicama. Naravno, možda želite promijeniti način na koji glasaju vaše ulaznice.

Možete postaviti glasove vaših ulaznica putem sučelja ulaznica. Ispod je snimak zaslona stranice [https://teststakepool.decred.org/tickets](https://teststakepool.decred.org/tickets). Na dnu odjeljka "Uživo / Nezrelo" na ovoj stranici vidjet ćete postavke za glasnoću. Samo možete urediti stavke *svih* vaših ulaznica odjednom putem sučelja bazena. Dolje prikazane ulaznice postavljene su na "Da" za "Prethodni blok valjan?" I "Da" za "Povećanje veličine blokova od 1,0 MiB do 1,25MB" što je rezultiralo Glasanjebitovima od 5 vrijednosti.

<img src="/img/testnet-voting_votebit-setting.jpg">

## Objašnjenje glasova

Ispod je snimka zaslona svih značajnih glasačkih vrijednosti za glasovnu verziju 4:

<img alt="Graph explaining the votebit values of vote version 4." src="/img/testnet-voting_vote-version-4.jpg">

Ovaj snimak zaslona prilično je samosvjestan. Unutar sučelja bazena, ako je korisnik odabrao "Da" za povećanje veličine bloka i "Da" za prethodni blok valjan, njihov birački paket birača postavljen je na "5".

U nastavku je prikazan snimak zaslona na kojemu se može pronaći Glasanjebitovima i verzija verzije unutar stvarne transakcije castinga putem bloka istraživača na adresi [https://testnet.decred.org](https://testnet.decred.org). Ovaj glas je stavljen s Glasanjebitovima vrijednošću od 5, kao što je navedeno u drugoj transakcijskoj izlazu.

<img src="/img/testnet-voting_vote-version-and-votebits.jpg">

Jednostavno možete provjeriti svoje glasove tako što ćete kliknuti na Ticket Transaction Hash bilo koje od svojih ulaznica unutar odjeljka "Glasovane ulaznice" na adresi [https://teststakepool.decred.org/tickets](https://teststakepool.decred.org/tickets). (NAPOMENA: Vi glasaš *može* biti prikazan kao V0 [Version 0] zbog greške u kodu zalihaulaganja - to se istražuje i može se čak riješiti do trenutka objavljivanja ovog vodiča.)

## Dvorana Hard Fork Demo web stranica

U svrhu prikaza statusa nove provedbe glasanja, [https://hardforkdemo.decred.org](https://hardforkdemo.decred.org) je stvoren. Svaki korak vizualizira se grafikonima i prilično jednostavnim objašnjenjima.
