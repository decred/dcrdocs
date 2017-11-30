# Dcrctl Osnove 

Zadnje ažuriranje za v1.0.0.

Ovaj vam vodič namjerava pomoći da naučite osnovne naredbe aplikacije `dcrctl` pomoću [minimalne konfiguracijske datoteke](/advanced/manual-cli-install.md#minimum-configuration). 

**Preduvjeti:**

- Koristite najnovije [dcrinstalacija](/getting-started/user-guides/cli-installation.md) za instaliranje `dcrctl`. Dodatni koraci bit će potrebni ako se koristi druga metoda instalacije.
- Review how the launch commands for the Command Prompt (Windows) and Bash (macOS/Linux) shells differ [here](/getting-started/cli-differences.md).
- [instalacija dcrd](/getting-started/user-guides/dcrd-setup.md) i pokrenuti ga u pozadini.
- [Postavljanje dcrračun](/getting-started/user-guides/dcrwallet-setup.md) i pokrenuti ga u pozadini.

---

`dcrctl` je klijent koji kontrolira `dcrd` i `dcrwallet` putem daljinskog postupka (RPC). Možete upotrijebiti `dcrctl` za mnoge stvari kao što je provjera ravnoteže, kupnja ulaznica, stvaranje transakcija i pregled informacija o mreži.

**UPOZORENJE:** Ovaj vodič koristi OS-agnostike primjere za naredbe. Pregledajte preduvjete kako biste utvrdili trebate li koristiti `./dcrctl` ili `dcrctl.exe` umjesto `dcrctl`.

---

> Konfigurirajte RPC korisničko ime i lozinku

Naredbe koje se šalju na `dcrd` ili `dcrwallet` zahtijevaju da se u konfiguracijskim datotekama postavljaju korisničko ime/lozinke RPC.

Ako ste upotrijebili [`dcrinstall`](/getting-started/user-guides/cli-installation.md), vaše konfiguracijske datoteke već su postavljene pomoću RPC korisničkog imena / lozinke za `dcrd`, `dcrwallet`, i `dcrctl`.

Ako niste koristili `dcrinstall`, morat ćete omogućiti goleme minimalne postavke u konfiguracijskim datotekama. Slijedite [ovaj vodič](/advanced/manual-cli-install.md#minimum-configuration) kako biste to učinili.

---

## dcrctl Naredbe

Morat ćete pokrenuti naredbe dcrctl u zasebnom prozoru omotoča (Command Prompt / Bash).

Da biste izdali naredbe `dcrwallet`, morat ćete upotrijebiti `dcrctl --wallet <command>`.

Da biste izdali naredbe `dcrd`, morat ćete upotrijebiti `dcrctl <command>`.

Da biste vidjeli potpuni popis naredbi koje `dcrctl` može poslati `dcrd` i `dcrwallet`, izdajte sljedeću naredbu u svojoj ljusci:

```no-highlight
dcrctl -l
```

Ovo će vratiti vrlo dug popis naredbi, odvojenih od aplikacije. Naredbe na gornjem dijelu su za `dcrd` i naredbe na dnu su za `dcrwallet`. Više o pojedinačnoj naredbi možete saznati tako da upišete sljedeće za naredbe `dcrwallet`:

```no-highlight
dcrctl help --wallet <command>
```

Ili sljedeće za `dcrd` naredbe:

```no-highlight
dcrctl help <command>
```

---

## Otključavanje računa

Neke funkcije `dcrwallet` zahtijevaju da se račun otključa.

Naredba za otključavanje računa slijedi: 

```no-highlight
dcrctl --wallet walletpassphrase <private passphrase set during wallet creation> 0
```

Ovdje navodimo da `dcrctl` šalje naredbu `dcrwallet` pomoću zastavice `--wallet`. Stvarna naredba je `walletpassphrase` koja prihvaća dva parametra, vašu privatnu zaporku i vremensko ograničenje. Određivanje `0` za vremensko ograničenje otključava `dcrwallet` bez vremenskog ograničenja. Napominjemo, međutim, da ovo samo otključava računu za trenutačnu sesiju. Ako zatvorite prozor koji pokreće račun ili zaustavlja / ponovno pokreće `dcrwallet`, morat ćete ga ponovno otključati sljedeći put kad ga pokrenete.

Ako je naredba bila uspješna, nećete dobiti potvrdu od `dcrctl`, ali ako pogledate sesiju `dcrwallet`, reći će:

```no-highlight
[INF] RPCS: The wallet has been unlocked without a time limit.
```

NAPOMENA: Budući da je otključavanje račune potrebno za mnoge funkcije `dcrwallet`, `dcrwallet` se može pokrenuti pomoću `--promptpass` `promptpass=true` ili `dcrwallet.conf` (discussed [here](/advanced/storing-login-details.md#dcrwalletconf)).

---

## Provjera stanja

Za slanje `getbalance` naredbe `dcrwallet` pomoću `dcrctl`, unesite sljedeće u omotač:

```no-highlight
dcrctl --wallet getbalance
```

To će vratiti sve saldo svih vaših računa.

---

## Dobivanje nove adrese primanja

Za slanje `getnewaddress` naredbe `dcrwallet` pomoću `dcrctl`, unesite sljedeće u vaš omotač:

```no-highlight
dcrctl --wallet getnewaddress
```

To će generirati i vratiti novu adresu za plaćanje. Da biste smanjili ponovnu upotrebu adrese, koristite ovu naredbu da biste dobili novu adresu za svaku transakciju koju želite primiti.

---

## Slanje DCR-a

Da biste poslali DCR na adresu, izdajte `sendtoaddress` naredbu `dcrwallet` pomoću `dcrctl`. Unesite sljedeće u svoj omotač, ispunite adresu primatelja i iznos za slanje:

```no-highlight
dcrctl --wallet sendtoaddress <address> <amount>
```

Ako je uspjelo, `dcrctl` će vratiti transakciju koja se može koristiti za gledanje transakcije na službenom [Decred Block Pretraživač](/getting-started/using-the-block-explorer.md).

---

## Provjerite mrežne statistike

Postoji mnogo različitih naredbi za provjeru različitih mrežnih statistika. Ovdje ćemo pokriti slanje `getinfo` u `dcrd` i `getstakeinfo` u `dcrwallet`.

Da biste dobili informacije o lokalnom `dcrd` čvoru, izdajte `getinfo` naredbu `dcrd` pomoću `dcrctl`. Unesite sljedeće u omotač:

```no-highlight
dcrctl getinfo
```

Da biste dobili informacije o mreži za provjeru udjela, izdajte `getstakeinfo` naredbu `dcrwallet` pomoću `dcrctl`. Unesite sljedeće u omotač:

```no-highlight
dcrctl --wallet getstakeinfo
```

---

## Dodatni naredbe

Više naredbi možete pronaći i na stranici [Program Options](/advanced/program-options.md) page.

---
