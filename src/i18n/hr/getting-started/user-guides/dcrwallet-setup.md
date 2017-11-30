# dcrračun Vodič instalacije 

Zadnje ažuriranje za v1.0.0.

Ovaj vam vodič namjerava pomoći da postavite aplikaciju `dcrračun` koristeći [pocetak zastava](/getting-started/startup-basics.md#startup-command-flags). 

**Preduvjeti:**

- Koristite najnovije [dcrinstalacija](/getting-started/user-guides/cli-installation.md) kako biste instalirali `dcrwallet`. Dodatni koraci bit će potrebni ako se koristi druga metoda instalacije.
- Review how the launch commands differ for the Command Prompt (Windows) and Bash (macOS/Linux) shells, and how the home directories differ [here](/getting-started/cli-differences.md).
- [instalacija dcrd](/getting-started/user-guides/dcrd-setup.md) i pokrenuti ga u pozadini.

---

`dcrwallet` je servis koji obrađuje Decred račun funkcionalnost za jednog korisnika. Upravlja svim vašim računima, adresama i transakcijama; Prati ravnotežu preko adresa; I dopušta dionicima sudjelovanje u glasovanju o prijedlogu.

Da bi se prikazao `dcrwallet`,`wallet.db` mora postojati unutar direktorija `dcrwallet`. Da bi ta datoteka postojala, morate stvoriti novu račun. `dcrinstall` automatski pokreće postupak stvaranja. Ako izbrišete račun.db ili upotrijebite drugi postupak instalacije, morat ćete pokrenuti [manualnu naredbu za izradu računa](#manual-wallet-creation-command).

---

## Kritične informacije 

Tijekom procesa stvaranja računa, dobit ćete niz od 33 riječi poznate kao frazu baze podataka. Ova fraza baze podataka je u biti privatni ključ za vaš račun. Moći ćete koristiti ovu fraza baze podataka za vraćanje privatnih ključeva, povijesti transakcija i stanja pomoću bilo kojeg Decred računa na bilo kojem računalu.

To u konačnici znači da *svatko* tko zna vašu bazu podataka može ju koristiti za vraćanje vaših privatnih ključeva, povijesti transakcija i ravnoteže na Decred račun na svom računalu bez vašeg znanja. Iz tog razloga, od iznimne je važnosti da se vaša bazu podataka naziva sigurno. Obradite ovu bazu podataka na isti način na koji biste liječili fizički ključ na sigurno. Ako izgubite svoj izraz za bazu podataka, trajno ćete izgubiti pristup svojem računu i svim sredstvima unutar nje. Nitko ga ne može oporaviti, uključujući programere Decreda. Preporuča se da je napišete na papir i pohranite ga negdje na siguran način. Ako se odlučite zadržati na računalu, bilo bi najbolje da ga čuvate u šifriranom dokumentu (ne zaboravite lozinku) u slučaju krađe datoteke ili računala.

Svaka faza baze podataka je također povezana s hex bazu podataka od 64 znaka. Hex baza podataka  funkcionira na isti način kao i baza podataka fraza - `dcrwallet` će ga prihvatiti prilikom pokušaja vraćanja računa. Također je važno čuvati svoje bazu podataka hex.

**UPOZORENJE: NEMOJTE U POD KOJIM OKOLNOSTIMA DATI SVOJU BAZU PODATAKA ILI HEX KLJUČ NEKOME! NITI RAZVIJATELJU!**

---

## Manualna naredba za kreiranje računa 

Ako već nemate `wallet.db` datoteku pohranjenu u kućnom imeniku `dcrwallet`, morate pokrenuti `dcrwallet --create` naredbu. Koraci za to mogu se naći u nastavku.

1. Otvorite novi prozor ljuske (bash/naredbeni redak/etc, ..).
2. Prijeđite na direktorij `dcrwallet` izvršne datoteke.
3. Unesite naredbu `dcrwallet --create` (pregledajte prethodne preduvjete ako niste sigurni želite li koristiti `./dcrwallet` ili `dcrwallet.exe` za prethodnu naredbu). 

---

## Hodanjekroz stvaranja računa 

Tijekom tog postupka postavit ćete privatnu zaporku, po želji postaviti javnu zaporku i zabilježiti bazu podataka. Da biste to postigli, slijedite korake u nastavku:

> Postavite šifre za vaš račun

Ako je `dcrwallet --create` naredba uspješno izvršena, trebali biste biti pozdravljeni sljedećim tekstom:

```no-highlight
Enter the private passphrase for your new wallet:
```

Ova prva lozinka, privatna zaporka, jest ono što ćete koristiti za otključavanje računa prilikom izrade transakcija ili glasanja s Dokazom o  ulogu. Upotrijebite jedinstvenu i jaku zaporku. Ova lozinka također štiti privatne ključeve u datoteci račune, osiguravajući je od krađe.

Nakon što potvrdite privatnu zaporku, trebali biste vidjeti sljedeći upit:

```no-highlight
Do you want to add an additional layer of encryption for public data? (n/no/y/yes) [no]:
```

Javna zaporka nije obavezna. Koristi se za šifriranje svih javnih podataka (transakcija i adresa) u datoteci računa pa ako je ukraden, protivnik vas ne može povezati s vašim transakcijama. 

> Snimite svoj bazu podataka

Prije stvaranja novog baze podataka za račun, pregledajte odjeljak [Kritične Informacije](/getting-started/user-guides/dcrwallet-setup.md#critical-information).

Nakon što postavite privatnu zaporku i dodatnu javnu zaporku, vidjet ćete sljedeći upit:

```no-highlight
Do you have an existing wallet seed you want to use? (n/no/y/yes) [no]:
```

Ovaj vodič pretpostavlja da nemate postojeće bazu podataka pa nastavite tako da pritisnete tipku `Enter` koja će odgovoriti na upit s zadanim `[no]`. NAPOMENA: Ako želite vratiti račun pomoću baze podataka, jednostavno unesite `[yes]` i slijedite upute na zaslonu.

<i class="fa fa-exclamation-triangle"></i> **NEMOJTE KORISTITI SAMO BAZU PODATAKA U VIŠESTRUKIM RAČUNIMA! Posjetite [FAQ za račune i bazu podataka](/faq/wallets-and-seeds.md#3-can-i-run-multiple-wallets) da biste vidjeli zašto je to važno. Preporuča se da, ako je moguće, novim računom označite stvaranje nove baze podataka.** 

Nakon odgovaranja na `[no]`, u prozoru će se prikazati vaša baza podataka  (stvorena nova baza podataka računa) i njen hex. Pročitajte VAŽAN dio koji se prikazuje neposredno nakon Hex-a.

Ne može se dovoljno naglasiti koliko je važno spasiti vašu frazU baze podataka na sigurnom mjestu, pa ako to niste učinili u sjećanju, molimo pregledajte odjeljak [Kritične Informacije](/getting-started/user-guides/dcrwallet-setup.md#critical-information) ponovno.

Nakon što zapišete bazu podataka frazu i hex, upišite `OK` i pritisnite `Enter`. NAPOMENA: ako niste napisali fraze prije nastavka, trebali biste [započeti taj postupak](/getting-started/user-guides/dcrwallet-setup.md#create-a-new-wallet) after [deleting your wallet file](/advanced/deleting-your-wallet.md)

Nakon pritiska tipke `Enter`, trebali biste vidjeti sljedeću poruku:

```no-highlight
Creating the wallet...
The wallet has been created successfully.
```

račun će biti stvoren. To može potrajati nekoliko minuta ako imate spor računalo.

---

## Pokretanje dcrračuna 

Da biste pokrenuli `dcrwallet`, prvo morate imati [izradili račun](#wallet-creation-walkthrough) i
[connected dcrd to the Decred network](/getting-started/user-guides/dcrd-setup.md#connect-to-the-decred-network).

> Konfigurirajte RPC korisničko ime i lozinku

Ako ste upotrijebili [`dcrinstall`](/getting-started/user-guides/cli-installation.md), vaše konfiguracijske datoteke već su postavljene pomoću RPC korisničkog imena / lozinke za `dcrd`, `dcrwallet`, i `dcrctl`.

Ako niste koristili `dcrinstall`, morat ćete omogućiti goleme minimalne postavke u konfiguracijskim datotekama. Slijedite [ovaj vodič](/advanced/manual-cli-install.md#minimum-configuration) kako biste to učinili.

> Pokrenite dcrračun 

S pravilno postavljenim konfiguracijskim datotekama otvorite drugi prozor s omotačem u odjeljku Decred (ili upotrijebite posljednji prozor ako ste upravo stvorili račun). Upišite sljedeću naredbu (pregledajte preduvjete za ovaj vodič da biste odredili odgovarajuću naredbu za vaš OS / Shell program):

```no-highlight
dcrwallet
```

Vaš `dcrwallet` se sada povezuje s mrežom preko `dcrd`. Počet će skenirati mrežu za vaše aktivne adrese, što može potrajati nekoliko minuta na sporim računalima. Na kraju će početi prikazivati ​​linije kao što su:

```no-highlight
[INF] WLLT: Connecting block 0000000000002004ea8fa74af334cb291a22832642b5be603995683534bbb97b, height 9990
```

To znači da je račun uspješno povezan s mrežom
Preko svog servisa.

---

TDa biste saznali kako koristiti `dcrd` i  `dcrwallet`, posjetite vodič [dcrctl osnove](/getting-started/user-guides/dcrctl-basics.md). Naučit ćete kako otključati račun, slati i primati DCR pomoću `dcrctl`, provjeriti ravnotežu i provjeriti razne mrežne statistike.
