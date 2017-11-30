# <i class="fa fa-life-ring"></i> Zaliha uloga  

---

#### 1. Postoje li druge pogodnosti za skupinu udjela, osim ako ne trebate pokrenuti cijeli čvor i držati vaš račun otključan? Na primjer, hoće li imati bolje izglede za pobjedu ili nešto slično? 

Zaliha uloga obično će provesti višestruku zalihost pomoću mnogih računa koji se fizički distribuiraju širom svijeta. To znači da ima manje izgleda
za glasovanje propušteno jer je jedan račun spušten. To također smanjuje latenciju između računa i mreže koja može smanjiti mogućnost propuštanja glasova.

---

#### 2. Jeli je poduzetnik podijelio naknadu svim sudionicima (% na temelju iznosa ulaznica koje ste poslali u ulog)? 

Tehnički je moguće stvoriti ulog koji podržava proporcionalno razdvajanje naknade[^9262], no aktualna implementacija dionice `dcrstakepool` ne omogućuje to. Jednostavno se glasuje u vaše ime. To čini tako što bi ulaznica imala pravo glasa za P2SH skriptu od 1 do 2. uloga potpisuje glas privatnim ključem u trenutku odabira ulaznice. Budući da je riječ o pisanju s više potpisom od 1 do 2, to znači da ako vas ulog nije iz bilo kojeg razloga glasovao (iznimno je vjerojatno da će mreža mainnet imati višestruku redundantnost i automatsko prekidanje), ako je moguće glasajte u svoje ime jer imate drugi privatni ključ i stoga bi mogao pružiti valjani potpis i zadovoljiti zahtjeve od 1 do 2.

Isto tako, važno je napomenuti da originalna kupnja ulaznica sadrži obvezu da odete na adresu za naknadu za koju imate samo privatni ključ. Pravila konsenzusa o glasovanju o udjelu provode opredjeljenje pa je nemoguće da ulog ukrade sredstva.

Da bi podijelili naknade, ulog bi morao biti primatelj svih nagrada, a zatim se vjerovati da pravilno podijelili naknade među svim sudionicima u skladu s njihovom proporcionalnošću. Očekuje se da će takva shema biti razvijena s razumijevanjem da je manje sigurna od pristupa koji trenutačni dizajn uloga koristi.

---

#### 3. Moram li voditi svoj račun za kupnju ulaznica, ali hoće li glasovati ispravno bez mene, ako ga isključim, a ulog umjesto mene glasuje? 

Da[^9274], to je točno. Potrebno je samo pokrenuti račun da biste potrošili svoje novčiće za kupnju ulaznic e koja vam prenosi vaša prava na ulog, a koja će glasati u vaše ime. Adresa naknade je konsenzusna obveza kupnje ulaznica za jednu od vaših adresa za koje imate samo privatni ključ.

---

#### 4. Postoje li kakvi problemi koji mogu nastati iz udruženog udjela koji ima previše ljudi. Na primjer, sila koja blokira iznutra ili izvana? 

To je svakako moguće[^9311], ali jedna od stvari koju bi svi ulogi trebali podržavati jest dopustiti svakom korisniku da odabere svoje pojedinačne preferencije glasanja. Na taj način, kad god dođe do njihove ulaznice i ulog glasuje u njihovo ime, glasovat će prema njihovim željama.

---

#### 5. Jesu li bitovi glasanja postavljeni prilikom kupnje ulaznice ili kada je vaša ulaznica nazvana za glasovanje? Mijenja li se ovo kada se nalazi u nekom poduzeću? 

Birači glasova postavljeni su kada zaista glasate[^13607] (što zaista ima smisla samo zato što ste možda kupili ulaznicu tjednima ili mjesecima prije nego što i određeni program glasovanja postoji).

Poduzeće može djelovati, međutim, želi jer ima puno mjesta za fleksibilnost zbog načina na koji je dizajnirana shema kupnje ulaznica. To znači da, općenito, ljudi bi trebali izbjegavati korištenje zaliha uloga koji ne dopuštaju im kontrolu nad kako žele glasovati o ne-ulog specifičnih pitanja.

---

#### 6. Koje su zaštitne mjere kako bi se zaustavilo nestanak vlasnika uloga s sredstvima u ulogu?

Trenutačni dizajn uloga je takav da ulog NE može ukrasti sredstva[^14593]. Vi samo prenosite glasačka prava (i zapravo je multisig 1-od-2, što znači da ili vi ili oni koji mogu glasati). Kupnja ulaznica sadrži konsenzusno obvezujuću predanost za konačnu adresu subvencije, tako da jednostavno nema načina da ulog ukrade sredstva.

Najgore što će se dogoditi ako vlasnik uloga nestane je glasanje koje će propustiti, što dovodi do povlačenja ulaznice što zauzvrat uzrokuje da se originalni novac vratio originalnom vlasniku novčića (minus početnu naknadu za transakciju naravno). Međutim, kako je prethodno spomenuto, budući da je ulaznica 1-of-2 multisig, svaki korisnik može pokrenuti svoj račun kako bi glasovao ako vlasnik uloga nestane.

---

#### 7. Gdje mogu vidjeti primjer ulaznic ice uloga za kockanje na bloku istraživača? 

Zalihe uloga uključuju "Dc" adrese budući da ulog udjela koristi adrese za plaćanje do skripte[^17515]. Na primjer, pogledajte txid: [c0abc0ec63a8de15550f067e2b6fde28f0432fb91b938574b282daa69f914103](https://mainnet.decred.org/tx/c0abc0ec63a8de15550f067e2b6fde28f0432fb91b938574b282daa69f914103).

Nastavi na [Često postavljana pitanja o glasovanju za PoS](/faq/proof-of-stake/voting-tickets.md)

---

## <i class="fa fa-book"></i> Izvori 

[^9262]: Decred Forum, [Post 9,262](https://forum.decred.org/threads/626/#post-9262)
[^9274]: Decred Forum, [Post 9,274](https://forum.decred.org/threads/626/#post-9274)
[^9311]: Decred Forum, [Post 9,311](https://forum.decred.org/threads/582/page-2#post-9311)
[^13607]: Decred Forum, [Post 13,607](https://forum.decred.org/threads/1236/#post-13607)
[^14593]: Decred Forum, [Post 14,593](https://forum.decred.org/threads/1321/#post-14593)
[^17515]: Decred Forum, [Post 17,515](https://forum.decred.org/threads/1289/#post-17515)
