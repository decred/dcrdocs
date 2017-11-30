# Paymetheusa Vodič za instalaciju 

Paymetheus je jednostavan za korištenje grafičkog računa za Decred. Uz to, možete slati i primati DCR,
Kupiti ulaznice za [PoS glasanje](/mining/proof-of-stake.md), dobiti povijest svih transakcija i još mnogo toga.
O jedinu stvar koju Paymetheus ne čini jest PoS glasanje.

---

## Preuzmite i instaliraj 

The Windows Installer (`.msi` file) is located here: [https://github.com/decred/decred-binaries/releases/tag/v1.1.0](https://github.com/decred/decred-binaries/releases/tag/v1.1.0). It will install Paymetheus to your computer's Program Files folder. Installation is pretty straightforward, but instructions are provided below:

1. Preuzmite ispravnu datoteku:

    For 32-bit computers, download the `decred_1.1.0-release_x86.msi` file. <br />
    For 64-bit computers, download the `decred_1.1.0-release_x64.msi` file.

2. Prijeđite na mjesto preuzimanja i dvokliknite datoteku `.msi`.

3. Slijedite korake instalacije. U tom se procesu od vas traži da prihvatite Ugovor o licenci krajnjeg korisnika.

4. Nakon postavljanja, značajke trebaju biti instalirane na mapu `..\Program Files\Decred\` i dostupne su putem izbornika Start (potražite `Decred` na popisu programa)

---

## Započnite Paymetheus 
Sada ste spremni početi koristiti Decred! Pokrenite program 'Decred'. Prikazat će se zaslon veze:  

![Priključak za priključak Paymetheus](../../img/Paymetheus-dcrd-login.png)  

> Dva su programa u tijeku kada pokrenete Decred. Postoji 'Paymetheus' koji je grafički račun o kojem ćemo dalje govoriti
>I 'dcrd' koji je komunikacijski servis (izgovara DAY-mon; program koji se izvodi u pozadini i koji ne izravno djeluje
> S korisnikom) koji zapravo razgovara s Decredovom mrežom. To znači da možete pokrenuti dcrd
>Na drugom računalu (kao što je uvijek na poslužitelju), a zatim upotrijebite Paymetheus da biste mu se daljinski povezali.

Upotrijebit ćemo lokalnu aplikaciju koju je Paymetheus već započeo pa samo pritisnite Nastavi.

> Po prvi put počinje Paymetheus, on će preuzeti lanacblokova u pozadini. To može potrajati do sat vremena.

---

## Napravite ili vratite račun 
Sada ćete imati mogućnost stvaranja novog računa ili vraćanja računa iz baze podataka. Ako ovo čitate, vjerojatno ste novi i nemate račun pa ćemo stvoriti novu. Ako kliknete opciju vraćanja, od vas će se tražiti da unesete svoje riječi baze podataka umjesto da dobijete novo bazu podataka.
Ostatak procesa je isti. Kliknite "Stvaranje novog računa". Vidjet ćete sljedeći zaslon:  

![Paymetheus stvaranje računa](/img/Paymetheus-seed-window.png)  

<i class="fa fa-exclamation-triangle"></i> **STANITE OVDJE!!! NIJE KLIKNI NASTAVAK! **

**Ovo je najvažniji dio korištenja Decreda. U bijeloj kutiji prikazuju se baza podataka. Ove su riječi ključ vašeg računa.  **
 **BEZ OSTALIH RIJEČI ILI PUBLIKACIJOM HEXA NEĆE BITI POKRIVANI I ZAUVIJEK ĆETE IZGUBITI PRISTUP SVIM FONDOVIMA!**  

**NEMOJTE IH DATI NIKOME, NITI NE DECREDOVIM RAZVITELJIMA!**

S tim riječima netko drugi može stvoriti vaš račun na drugom računalu i prenijeti sva sredstva na drugi račun. Nije moguće preokrenuti transakciju u Decredu, tako da ako netko ukrade vaš Decred, nema načina da ga vratite.  

<i class="fa fa-exclamation-triangle"></i> **NEMOJTE KORISTITI SAMO BAZU PODATAKA U VIŠESTRUKOM RAČUNU! Posjetite [FAQ za račune i baze podataka](/faq/wallets-and-seeds.md#3-can-i-run-multiple-wallets) da biste vidjeli zašto je to važno. Preporuča se da, ako je moguće, na novom računu označite stvaranje nove baze podataka.** 

Određene i druge digitalne valute često se opisuju kao kao bankovni račun. Međutim, za razliku od online bankarstva, u sustavu Decred nema pouzdane treće strane koja drži vaš novac u vaše ime. Vi i vi sami kontrolirajte svoj DCR, baš kao i kod fizičke gotovine. Kada se gotovina ili DCR izgube, pogrešno stave ili se ukrade, najvjerojatnije će trajno otići.

Ako izgubite račun, izgubite pristup onome što ste imali u njemu, a nitko, čak ni Decredov programeri ne mogu ga vratiti. Zato je vrlo važno da odvojite vrijeme da pročitate ovu stranicu i upišete bazu podataka na sigurnom mjestu. Dobra je ideja da ih zapišete na komad papira i pohranite ih negdje sigurno i pohranite ih u datoteku ENCRYPTED na računalu. Pohrana oblaka poput Dropboxa ili OneDrivea je u redu kada se poduzmu mjere opreza. Budući da se online računi mogu hakirati, trebali biste snažno šifrirati datoteku račune (MS Word ili Libre / OpenOffice mogu to učiniti) prije nego što ga prenesete na uslugu pohrane u oblaku.

U redu, tako da ste osigurali svoje sjemenske riječi na najmanje dva različita mjesta. Kliknite Nastavi. Od vas se sada traži da ih ponovno upišete kako biste bili sigurni da ste ih ispravno zapisali ako kasnije trebate vratiti račun. Imajte na umu da ih ne možete zalijepiti; Morat ćete ih upisati. Ovo je kako biste bili sigurni da ste riječi spremljene negdje drugdje osim međuspremnika. Učinite to i kliknite Potvrdi.

---

## Izaberite šifru privatnog računa 
Unesite zaporku za upotrebu kad god stvorite transakciju na mreži. Sve dok je vaš račun zaključan s ovom zaporkom, sredstva računa nisu dostupna svima koji steknu kontrolu nad datotekom račune. Tu je i opcija za javnu zaporku. Koristi se za šifriranje svih javnih podataka (transakcija i adresa) u datoteci računa pa ako je ukraden, protivnik vas ne može povezati s vašim transakcijama. Za većinu ljudi javna zaporka obično je previše, pa možete ostaviti neoznačenom. Nakon unosa nove privatne (i opcionalne) javne zaporke, kliknite Šifriranje.  

Vaš račun sada stvara i sinkronizira s lancemblokova. To može potrajati nekoliko minuta na sporijim računalima. Imajte na umu da će sjeme riječi koje ste zapisali htjeti
Raditi s bilo kojom Decredovom aplikacijom računa, a ne samo Paymetheusom.

Nastavite na [Using Paymetheus](using-paymetheus.md)
