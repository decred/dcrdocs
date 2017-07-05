# Vodič za početnike 

Zadnje ažuriranje za v1.0.1

---

## Dobrodošli n Decred 

Dobrodošli u Decred! Vrlo nam je drago što vas imamo ovdje. Kao što možda znate ili ne znate, Decred je drugačiji. Postoji mnogo novih stvari koje treba naučiti kako bi shvatile kako stvari funkcioniraju. Ova dokumentacija će pokušati učiniti nešto lakše razumjeti.

Ovaj vodič za početnike predstavlja put do dobivanja i pokretanja programa Decred. Možete odabrati više klijenata da biste dobili čvor na mreži i Decred u računu. Naime, naučit ćete kako instalirati, postaviti i koristiti Decredove programe; Kako dobiti DCR; Kako glasovati putem dokazne uloge; I kako koristiti pretraživač blokova.

Morat ćete slijediti [Vodič za instalaciju](#installation-guides), a zatim slijedite put dolje za aplikaciju po izboru. Nakon što postavite aplikaciju, prođite kroz [Opći Vodiči](#general-guides) pri dnu ove stranice. Ako imate bilo kakvih pitanja na putu, pridružite nam se u našem [Šljaka](/support-directory.md#join-us-on-slack).

**NAPOMENA: Korištenje Testnet-a preporučljivo je za učenje korištenja Decred softvera bez straha od pogreške i gubitka stvarnog novca. Nakon što slijedite vodiče da biste postavili svoj izbor softvera, posjetite [Upotreba vodiča Testnet](/getting-started/using-testnet.md) kako biste saznali kako pokrenuti aplikaciju na Decredov testnet.**

---

## Aplikacije 

U nastavku ćete pronaći popis trenutno dostupnih aplikacija s grafikonom koja prikazuje njihovu kompatibilnost s različitim operacijskim sustavima.

**Paymetheus**: The only Windows GUI client as of v1.1.0. <br />
**dcrd**: The node daemon, this command-line application handles block management and consensus. <br />
**dcrwallet**: The wallet daemon, this command-line application handles address and transaction management. <br />
**dcrctl**: The remote procedure call (RPC) client, this command-line application is used to control dcrd and dcrwallet via RPC commands. <br />
**Decrediton**: Cross-platform GUI client as of v1.1.0.

|           | Paymetheus | dcrd | dcrwallet | dcrctl | Decrediton |
| ---------:|:----------:|:----:|:---------:|:------:|:-----------:|
| Windows   | X          | X    | X         | X      |             |
| macOS     |            | X    | X         | X      | X           |
| Linux     |            | X    | X         | X      | X           |
| Drugi UNIX|            | X    | X         | X      |             |

"Drugi UNIX" trenutno uključuje različite *BSD i Solaris / illumos.

Napomena: Uskoro ćete primijetiti jednu od brojnih razlika između Decred i 
drugih popularnih kripto-valuta: servis računa i servis čvora su odvojeni.
Puno drugih kovanica upravljaju te funkcije zajedno u jednom servisu.
Za one koji odluče koristiti sučelja naredbenog retka, to znači da morate
pokrenuti `dcrd` za punu funkcionalnost čvora i` dcrračun` kako biste pohranili DCR,
Stvoriti transakcije i sudjelovati u dokazivanju uloge/glasovanja.

---

## Vodiči za instalaciju 

Da biste započeli, odaberite opciju za instalacije dostupne za vaš operativni sustav u nastavku:

* [Paymetheus](/getting-started/user-guides/paymetheus.md)
* [Command Line Suite **via dcrinstall**](/getting-started/user-guides/cli-installation.md) - NAPOMENA: Metoda `dcrinstall` je najbrži i najjednostavniji način za dobivanje čvora naredbenog retka i Pokretanje računa. Preporučuje se i vodiči za postavljanje putanja naredbenog retka u nastavku pretpostavljaju da ste koristili ovu metodu.
* [Decrediton (ALPHA)](/getting-started/user-guides/decrediton-setup.md)

---

**NAPOMENA:** U navigacijskom izborniku s istim imenima mogu se naći svi sljedeći vodiči.

## Paymetheus Staza 

Sljedeći vodiči, kako bi, započeli ste s Paymetheusom:

* [Postavljanje Paymetheusa](/getting-started/user-guides/paymetheus.md)
* [Korištenje Paymetheusa](/getting-started/user-guides/using-paymetheus.md)

## Decrediton Staza 

Sljedeći vodič će vam pomoći da učitate Decrediton:

* [Decrediton postavljanje](/getting-started/user-guides/decrediton-setup.md)

## Staza naredbene linije 

Slijedeći vodiči će, po redu, započeti s programskim naredbama (`dcrd`, `dcrwallet`, `dcrctl`):

* [Razlike u naredbenom retku](/getting-started/cli-differences.md)
* [Osnove startup opcije](/getting-started/startup-basics.md)
* [Dcrd postavljanje](/getting-started/user-guides/dcrd-setup.md)
* [Dcrračun postavljanje](/getting-started/user-guides/dcrwallet-setup.md)
* [Dcrctl Osnovno Korištenje](/getting-started/user-guides/dcrctl-basics.md)

## Opći vodiči 

Sljedeći vodiči neovisni su o različitim aplikacijama:

* [Korištenje Testnet](/getting-started/using-testnet.md)
* [Dobivanje DCR-a](/getting-started/obtaining-dcr.md)
* [Korištenje bloka Explorer](/getting-started/using-the-block-explorer.md)
* [Vodič za provjeru udjela](/mining/proof-of-stake.md)
* [Vodič za glasanje za Mainnet](/getting-started/user-guides/agenda-voting.md)
