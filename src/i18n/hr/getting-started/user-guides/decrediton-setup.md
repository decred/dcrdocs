# Decrediton Vodič instalacije 

Zadnje ažuriranje za v1.0.0.

---

`Decrediton` je grafičko korisničko sučelje za `dcrwallet`. Kada se ova aplikacija pokrene, automatski će pokrenuti vlastitu instancu `dcrd` i `dcrwallet` u pozadini - neće se otvoriti ako već postoji pokrenuta instanca `dcrd`.

NAPOMENA: Ako program u bilo kojem trenutku ne reagira ili se zaglavi na zaslonu, to se obično može popraviti ponovnim pokretanjem aplikacije.

---

## Preuzmite i instaliraj 

Decrediton is released with the Binary Releases and can be found here: [https://github.com/decred/decred-binaries/releases/tag/v1.1.0](https://github.com/decred/decred-binaries/releases/tag/v1.1.0). As of v1.1.0, Decrediton is only available for Linux and macOS.

> macOS

1. Download the `decrediton-1.1.0.dmg` file.

2. Double click the `decrediton-1.1.0.dmg` file once downloaded to mount the disk image.

3. Povucite decrediton.app u vezu na mapu Applications (Aplikacije) unutar slike diska.

> Linux

1. Download the `decrediton-1.1.0.tar.gz` file.

2. Prijeđite na mjesto preuzimanja i ekstrakt .tar.gz datoteke:

    Ubuntu preglednik datoteka: jednostavno kliknite desnom tipkom miša na .tar.gz datoteku i pritisnite "Ekstrakt ovdje". <br />
    Terminal: koristite naredbu `tar -xvzf filename.tar.gz`.

    Both of these should extract the tar.gz into a folder that shares the same name. (`e.g. tar -xvzf decrediton-v1.1.0.tar.gz` should extract to `decrediton-v1.1.0`). If successful, this new folder should include a `decrediton` executable.

---

## Kritične informacije 

Tijekom procesa stvaranja računa, dobit ćete niz od 33 riječi poznate kao frazu baze podataka. Ova fraza baze podataka je u biti privatni ključ za vaš račun. Moći ćete koristiti ovu fraza baze podataka za vraćanje privatnih ključeva, povijesti transakcija i stanja pomoću bilo kojeg Decred računa na bilo kojem računalu.

To u konačnici znači da *svatko* tko zna vašu bazu podataka može ga koristiti za vraćanje vaših privatnih ključeva, povijesti transakcija i ravnoteže na Decred račun na svom računalu bez vašeg znanja. Iz tog razloga, od iznimne je važnosti da se vaša baza podataka naziva sigurno. Obradite bazu podataka na isti način na koji biste liječili fizički ključ na sigurno. Ako izgubite svoj izraz za bazu podataka, trajno ćete izgubiti pristup svojem računu i svim sredstvima unutar nje. Nitko ga ne može oporaviti, uključujući programere Decred. Preporuča se da je napišete na papir i pohranite ga negdje na siguran način. Ako se odlučite zadržati na računalu, bilo bi najbolje da ga čuvate u šifriranom dokumentu (ne zaboravite lozinku) u slučaju krađe datoteke ili računala.

**UPOZORENJE: NEMOJTE U POD NIKAKVIM OKOLNOSTIMA DATI SVOJU BAZU PODATAK ILI HEX KLJUČ NEKOME! NITI RAZVITELJIMA!**

---

## Stvaranje novog računa 

Nakon što kliknete "U redu, razumijem" na odricanje od odgovornosti, vidjet ćete dijaloški okvir "Napravite račun".

Dijaloški okvir "Napravi račun" zadano je na opciju "Nova baza podataka". Jednostavno kliknite "Postojeća baza podataka" ako već imate bazu podataka koje namjeravate koristiti i slijedite korake koji se prikazuju tamo. Ovaj vodič pretpostavlja da nemate bazu podataka i nastavit ćete koristiti opciju "Nova bazu podataka". Molimo pregledajte [Kritične informacije](#critical-information) o bazi podataka.

1. Zabilježite bazu podataka koje se prikazuje u tekstnom okviru (morat ćete ga ponovno unijeti na sljedeći zaslon).

2. Pritisnite "Nastavi"

3. Potvrdite bazu podataka i izradite privatnu zaporku računa. Ta se zaporka upotrebljava za otključavanje računa prilikom izrade transakcija.

4. Pritisnite "Stvori račun"

5. Tada biste trebali vidjeti plavi krug koji se okreće. To će se vrtjeti dok `dcrd` potpuno ne sinkronizira lanacblokova. Na računalima koja nisu imala `dcrd` učitana na njih, to bi trebalo trajati 1-2 sata s novijim hardverom (može potrajati dulje sa starijim hardverom). Možete provjeriti aplikaciju procesnog monitora za pokretnu instancu `dcrd` - ako upotrebljava značajan postotak vašeg procesora, ona se sinkronizira. Ako nije, Decredon može zahtijevati ponovno pokretanje za prelazak preko ovog zaslona.

## Otvaranje računa 

Nakon što je sinkronizacija blokiranja sinkronizirana, trebali biste vidjeti stranicu "Otvaranje računa". Ovdje ćete morati unijeti privatnu zaporku i račun će ponovno skenirati nedavne blokove za transakcije koje pripadaju vašim adresama. Pričekajte da se traka napretka popuni. Decredon bi zatim trebao učitati stranicu Pregled s prikazanom dostupnom dostupnom saldom i novijim transakcijama.

---
