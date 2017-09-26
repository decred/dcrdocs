# <i class="fa fa-desktop"></i> Konfiguracija 

---

#### 1. Kako mogu vidjeti informacije o brojevima porta `dcrd`? 

Brojeve ulaza[^8929] ožete dobiti iz `-h` ili `--help` parametara proslijeđenih u `dcrd`:

```no-highlight
dcrd -h
```

Potražite sljedeću liniju:

```no-highlight
--rpclisten=  Add an interface/port to listen for RPC connections (default port: 9109, testnet: 19109)
```

Također se bilježi kada pokrenete `dcrd`:

```no-highlight
12:01:46 2016-02-08 [INF] RPCS: RPC server listening on [::1]:9109
12:01:46 2016-02-08 [INF] RPCS: RPC server listening on 127.0.0.1:9109
```

---

#### 2. Što mislite pod konfiguracijskim datotekama za `dcrd`, `dcrwallet`, i `dcrctl`? 

Svaka aplikacija (`dcrd`, `dcrwallet`, `dcrctl`) može imati svoje konfiguracijske datoteke[^9055]. Koristite `-h` i pogledajte put u zagradama opcije konfiguracijske datoteke (`-C`, `--configfile`) kako biste vidjeli zadanu stazu. Stvorite tekstualnu datoteku na putu i imenujte prema tom putu koji ste upravo pogledali.

Zatim možete upotrijebiti datoteku `dcrd` [datoteku konfiguracije uzorka](https://github.com/decred/dcrd/blob/master/sample-dcrd.conf) i `dcrwallet` [sample config file](https://github.com/decred/dcrwallet/blob/master/sample-dcrwallet.conf) da biste postavili željene opcije. Isto vrijedi i za `dcrctl`. Format je isti. Svaka opcija naredbenog retka navedena u `-h` može se odrediti u konfiguracijskim datotekama (samo upotrijebite naziv dugog opcija).

Nakon što se one izrađuju i na mjestu, ne morate sve stavke dodati u naredbeni redak cijelo vrijeme. Na primjer, možete pokrenuti `dcrctl` bez prolaska u bilo kojem parametru na naredbenom retku:

```no-highlight
dcrctl getnetworkhashps
2547036949350
```

---

#### 3. Mogu li pokrenuti mainnet i testnet servise i račune istodobno i na istom sklopu? 

Da[^9264], dodajte `--testnet` na odgovarajuća mjesta (`dcrd`, `dcrwallet`, `dcrctl`) i sve će raditi. Zato koriste različite ulaze i podatke / dnevnike!

---

#### 4. Koje su sigurnosne implikacije korištenja istih lozinke za provjeru autentičnosti RPC poslužitelja s `dcrd` i `dcrwallet`? 

Mnogo manje možete učiniti s pristupom `dcrd` nego što možete s pristupom `dcrwallet`. Važno je da RPC pristup[^11480] u `dcrwallet`, kada je račun otključan, može se koristiti za trošenje novca.

Kada su `dcrd` i `dcrwallet` oba na istom sklopu, vjerojatno to baš i nije toliko važno, ali kada pokrenete sigurnije postavke gdje je račun na zasebnom sklopu nego `dcrd`, Žele koristiti iste vjerodajnice za oboje. Imajte na umu da `dcrd` mora biti na sklopu okrenutom na Internet kako bi ostao sinkroniziran s mrežom (preuzmite lanac podataka bloka, transakcije emitiranja i sl.).

S druge strane `dcrwallet` koji sadrži sredstva za najbolju sigurnost ne bi trebao biti na sustavu koji ima pristup Internetu jer je znatno teže za krađu vaših novčića ako račun koji ih sadržava nije  na sklopu koji je dostupan putem Interneta. Očito, ako srežete svoje novčiće, trebat će vam barem jedan slučaj `dcrwallet` usmjeren na Internet. Stoga, najsigurnije postavljanje podrazumijeva da postoji jedan "hladni" `dcrwallet`  primjer koji je na sklopu koji nije dostupan Internetu, a drugu "vruću" instancu `dcrwallet` (koristeći različite sjeme staze) na koju je hladno Dcrračun instance delegati glasaju pravo putem `--ticketaddress` parametra, oba koji koriste različite vjerodajnice.

---

#### 5. Zašto se povezujem s samo 8 vanjskih vršnjaka? 

Postoji namjerno neregifivirano ograničenje od 8 vanjskih vršnjaka[^15399]. Više odlaznih vršnjaka od vas ne pomaže ni na koji način i zapravo je lošije za vas i za mrežu. Ovo je vrlo bitno testirano u Bitcoinu, uključujući btckomplet (upstream projekt Decreda). Sve što biste učinili podizajući izlazne veze je otpad vrijedne utora relativno malo javnih vršnjaka postoje (uvijek postoji mnogo veći broj "leechers" nego što je "sjeme").

S druge strane, povećanje maksimalnih veza, što zaista samo povećava broj dopuštenih ulaznih veza, pomaže mreži tako što osigurava dostupnost više mjesta za nove čvorove i SPV klijente.

---

## <i class="fa fa-book"></i> Izvori 

[^8929]: Decred Forum, [Post 8,929](https://forum.decred.org/threads/600/#post-8929)
[^9055]: Decred Forum, [Post 9,062](https://forum.decred.org/threads/472/page-12#post-9062)
[^9264]: Decred Forum, [Post 9,264](https://forum.decred.org/threads/626/#post-9264)
[^11480]: Decred Forum, [Post 11,480](https://forum.decred.org/threads/428/#post-11480)
[^15399]: Decred Forum, [Post 15,399](https://forum.decred.org/threads/1371/page-2#post-15399)
