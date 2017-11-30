# <i class="fa fa-firefox"></i> korisnički priručnik za web-klijente

---

Jednostavan web račun dostupan je korisnicima koji ne žele instalirati dodatni softver na svom računalu. Temelji se na
[Copay](https://github.com/bitpay/copay) s posebnim promjenama Decreda koje su dodane i može ih se pronaći na
[https://wallet.decred.org](https://wallet.decred.org)

Postoji nekoliko stvari koje trebate znati o web-klijentu prije nego što to upotrijebite:

* Ne možete
  [Ulog za vađenje udio](/mining/proof-of-stake.md)
  s time.
* Vaš račun čuva se u cijelosti u lokalnoj pohrani vašeg weba         
  preglednik. To znači da ako izbrišete lokalnu pohranu,  izbrisati    
  ćete vaš račun i morati ga ponovno izraditi od baznih podataka.
* Sigurnost vašeg računa u potpunosti ovisi o vašoj sigurnosti web-   
  preglednika.
* Možete staviti pin na svoj račun kako bi spriječili slanje sredstava,
  ali bilo koji drugi pristup u potpunosti ovisi o kontroli pristupa
  vašem računalo, a ne na poslužitelju ili bilo kakve pojedinosti prijave.

---

## <i class="fa fa-plus-circle"></i> Izradi račun vašeg web klienta

> Prvi korak

Idite na [https://wallet.decred.org](https://wallet.decred.org).  Biti će
vam predstavljeni `Terms and Conditions`. posebno pripazite na ovaj dio:

baš kao i račun naredbenog retka, ako izgubite svoju bazu podataka ili svoju lozinku za slanje sredstava, izgubit ćete pristup vašem računu. Tamo gdje nije ponovno postavljena lozinka, također imajte na umu da su sve transakcije na Decredu nepovratne prema programiranju. Ako slučajno šaljete sredstva na krivu adresu, morat ćete zatražiti od primatelja da ih ponovno pošalje. Programeri ne mogu preokrenuti transakcije.

Kliknite `I Agree` nakon što pročitate `Terms and Conditions`. Sada ćete vidjeti zaslon dobrodošlice. Ako je ovo prvi put daoristite Decred, kliknite `Get Started`. Ako želite vratiti prethodno korišten račun, kliknite `Import Backup`. Ovaj vodič će pretpostaviti da upravo počinjete, pa kliknite `Get Started`.

> Korak dva

Click the dropdown in the top left, then click `Add wallet`. Click
`Create New Wallet`. Give your wallet a name then click `Create New Wallet`.

A wallet will be generated for you.


> Korak tri

Vaš račun je sada izrađen i spreman za upotrebu. Međutim, prije nego što to učinite bilo što drugo, trebali biste dodati lozinku za slanje sredstava i backup za bazu podataka koje su korištene za izradu računa. Ovo je dvostruka istina za web klijenta koji ne pohranjuje stalni zapis vašeg račun. Podaci vašeg računa pohranjeni su u predmemoriji preglednika i može se izbrisati vrlo jednostavno. Ako koristite anonimni način rada, bit će izbrisano čim zatvorite preglednik. **BEZ ŠIFRE BAZE PODATAKA GUBITE SVA SREDSTVA VAŠEG RAČUNA** trebali biste izbrisati podatke računa. I sama sredstva postaju lanacblokova, međutim, bez baze podataka ne možete im pristupiti.

<i class="fa fa-exclamation-triangle"></i> **NEMOJTE KORISTITI SAMO BAZU PODATAKA VIŠESTRUKOG RAČUNA! Posjetite [FAQ za račune i baze podataka](/faq/wallets-and-seeds.md#3-can-i-run-multiple-wallets) da biste vidjeli zašto je to važno. Preporuča se da, ako je moguće, novi račun treba značiti stvaranje nove baze podataka.** 

Kliknite gumb `Preferences` desno nasuprot nazivu račune. Postoje samo tri stvari za koje će vas zanimati:

Opcija                                | Opis
---                                   | ---
`Wallet Alias`                        | Ako želite, možete preimenovati račun.
`Request Password for Spending Funds` | Budući da je vaš račun pohranjen u predmemoriju preglednika, za to nije potrebna dodatna lozinka. Postavljanjem zaporke ovdje osigurajte da samo vi možete slati sredstva ako netko drugi pristupi vašem pregledniku. Upišite lozinku i kliknite `Set`.  Napominjemo upozorenje da se zaporke ne mogu vratiti. Na računu nema značajke za ponovno postavljanje lozinke. Ako izgubite lozinku, nikada nećete moći premjestiti svoje novčiće iz računa ili ih koristiti za glasovanje o dokazu uloga.
`Backup`                              | je mjesto gdje ćete naći svoje riječi baze podataka.

> Četvrti korak

Kliknite `Backup`. Vidjet ćete ovaj zaslon:

Prije svega, pročitajte bilješku. Koristite samo jedan račun istovremeno s (Vidi: [FAQ](#)). Možete umnožiti  svoj račun na više strana, ali samo jedan od njih bi trebao biti upaljen cijeli dan. 
Kliknite `Show Wallet Seed`. Napišite to negdje na sigurno, ili ga stavite u šifrirani dokument kojemu nećete zaboraviti lozinka. Ovaj popis riječi koristi se za stvaranje autentičnog ključa za račun. Svatko tko posjeduje ovaj popis može prikupiti sredstva u računu.

> **VRLO VAŽNO**

**UPOZORENJE: NEMOJTE  POD NIKAKVIM OKOLNOSTIMA DATI SVOJU BAZU PODATAK ILI HEX KLJUČ NEKOME! NITI RAZVITELJIMA!**

Nakon što zapišete riječi (i provjerite jesu li točne, važno je da je velika slova), idite na sljedeći korak.

> Korak pet

Sada kada ste napisali svoje baze podatakanske riječi i provjerili ih, učinite to opet. Ozbiljno. Ovaj je korak kritičan. Bez ovog popisa vaš račun ne može se rekonstruirati i nitko, pa ni programer, ne može ga vratiti. Sada kada ste sigurni da je popis ispravno pohranjen, kliknite
`Delete Words`. Dvaput kliknite `Back` da biste došli do glavnog zaslona račune.

---

## <i class="fa fa-long-arrow-right"></i> Pošaljite sredstva s web-klijentom

> Prvi korak

Na glavnoj web stranici računa kliknite tipku `Send` na dnu. Bit ćete preusmjereni na ovu stranicu. Uočit ćete `Advanced Options`
već je proširen. U polje `To` stavite u Decred adrese primatelja.

> Korak dva

U `Amount`, unesite vrijednost u DCR koju biste poslali primatelju. Ako  želite li upišite opcijsku poruku u polje `Note`. Pritisnite
`Send`. Pomoću opcije `Use Unconfirmed Funds` možete koristiti sredstva koje šalju mrežni pozivi, ali još nisu potvrđeni
[Rudari za dokazivanje radova](/mining/proof-of-work.md).  Ako je ovo uključeno i navedeni iznos može biti pokriven samo korištenjem nepotvrđenih sredstava, transakcija neće nastaviti dok potrebna sredstva nisu potvrđena.

---

## <i class="fa fa-long-arrow-left"></i> Primajte sredstva s web-klijentom

> Prvi korak

Kliknite gumb `Receive` pri dnu prozora. Vidjet ćeš
Ovaj zaslon:

Dajte osobi koja vam šalje prikazanu adresu DCR (to će započeti s `Ds`) ili mogu koristiti QR kod ako su im računi ili usluga prihvaćeni. Možete koristiti istu adresu onoliko često koliko želite, ali
za privatnost se preporučuje da svaki stvara novu adresu. Nemojte se brinuti o tome da dobijete duplu adresu. Tamo su oko `2.08x10^93` mogućih adresa, pa ćemo vjerojatno prije doći do toplinske smrt svemira nego što ostanemo bez Decredovih adresa.

