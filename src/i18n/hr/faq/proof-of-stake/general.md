# <i class="fa fa-ticket"></i> PoS Opći FAQ

---

#### 1. Što je sustav Decredov sustav Dokaz-o-Ulaganju? 

Sustav dokaza ulaganja (PoS) omogućava nositeljima Decreda da imaju pravo reći u upravljanju valutom. Cilj mu je dati korisnicima glas uz rudare.
Da bi sudjelovali, korisnici mogu kupiti "ulaznice", koji ulaze u lutrijski ulog. Svaki blok od 5 ulaznica odabran je iz baze ulaznica za PoS. Ako najmanje 3 od njih potvrdi prethodno vađeni blok,
novo vađeni blok dodaje se u lanac, a plaćaju se i PoW vađenje i PoS franšize. Ako blok ne potvrdi PoS franšize, PoW rudari ne dobivaju plaću, već PoS franšizu. Ovo će potaknuti PoW rudare na sporazum prema željama PoS franšiza.

Ovaj PoS sustav ima nekoliko prednosti koje mogu riješiti problemi s kojima se mogu susresti samo sustavi PoW. Na primjer, budući da PoS-ovci moraju potvrditi blokove rudara PoW vađenja, rudari PoW ne mogu sami odlučivati o promijenama pravila mreže (51% napada). Ili, kad Decredov lanac napravi stari, manji lanac, brzo će umrijeti zbog toga što ga PoS komponenta ne potvrdi lanac.

PoS sustav nagraditi će sudionike za njihova ulaganja. Svaka blokada s deseterostrukim dijelom ima PoS nagradnu komponentu koja će se distribuirati na svaku ulaznicu koja je izabrana za glasovanje u tom bloku. Sustav je dizajniran tako da je prosječno vrijeme za odabir ulaznice 28 dana. Ako ulaznica nije odabrana nakon 40960 blokova (nešto manje od 5 mjeseci), sustav će ga ukinuti. DCR se koristi za kupnju ulaznica i vraća se bez obzira na to glasuje li ili ne.

Još jedna zanimljiva značajka koju ovaj PoS sustav omogućuje jest sposobnost glasovanja na dnevnom redu. Budući da se provjera valjanosti blokova može smatrati glasovanjem, dodavanjem dodatnih glasačkih komponenti na ulaznicu sustav može pratiti i brojati glasove preko niza blokova. Ti glasovi mogu biti bilo što.

U sustavu Decredovog  Dokaza – O- Ulaganju, svatko tko ima DCR može sudjelovati kupnjom ulaznice.

---

#### 2. Što su ulaznice? 

Ulaznica je znak koji kupujete za sudjelovanje u PoS sustavu. Možete kupiti ulaznice putem sučelja naredbenog retka dcrctl, ili putem GUI poput Paymetheus[^1] ili Decrediton. Kad god kupite a
ulaznicu, plaćate trenutnu cijenu ulaznice i naknadu za ulaznicu koristeći svoj DCR. Kada se kupi ulaznica, ona ide na privremena "memorijaulaganja". U svakom se bloku mogu uložiti 20 ulaznica, a odabrane su ulaznice za vađenje na temelju njihove naknade po kilobajtu. Budući da postoji ograničen broj ulaznica koje se mogu pohraniti u blokove po određenoj cijeni (2880), može postojati konkurencija za dobivanje ulaznica vađenjem. U ovom slučaju, možete povećati naknadu koju ste spremni platiti kako biste dobili ulaznicu (e) vađenjem. Nakon što je vaša ulaznica iskopana, ona će se preseliti iz trenutnog 'cijelememorijeulaganja' na 'nezrelost' ulaznica. Nakon 256 blokova (oko 20 sati), tada će se sazrijeti i otići u ulog žive ulaznice gdje se može izabrati za glasovanje.

---

#### 3. Trebam li stalno biti povezan s mrežom kako bih sudjelovao u PoS-u? 

Račun mora biti na mreži 24 sata dnevno kako bi odgovorio na glas ako je odabrana jedna od vaših ulaznica. Postoje dva glavna načina za to; račun za samostalnog ulaganja koji ste postavili i držati na mreži cijelo vrijeme, ili vi možete upotrebljavati [dokaz ulaganja](/mining/proof-of-stake.md#solo-mining-or-pool-mining). Zaliha uloga u osnovi je račun na kojem možete dodijeliti prava glasa vaših ulaznica, a ulog će glasati u vaše ime za mali postotak PoS naknade.

Važno je napomenuti da samo dodjeljujete prava glasa u ulogu, a ne vaša stvarna sredstva. ulog udjela u svakom trenutku nema pristup vašim sredstvima.

---

#### 4. Koja je "cijena ulaznica"? 

Cijena ulaznica određuje algoritam koji želi zadržati veličinu uloga ulaznica, što je ukupan iznos ulaznica u ulaganju ulaznica PoS sustava oko ciljane veličine 40960 ulaznica.
Cijena ulaznice će se povećavati ili smanjivati ​​prema zahtjevu za ulaznicama i broju ulaznica koje se trenutno nalaze u ulogu.

Svaka 144 bloka algoritam prilagođava cijenu ulaznice. To se zove prozor za kupnju. Svaki blok može sadržavati 20 novootvorenih ulaznica. To znači da u svakom prozoru za kupnju ima najviše 2880 ulaznica može se dodati u bazu ulaznica za PoS sustav.

Cijena ulaznice uvijek se vraća bez obzira na to jeli vaša ulaznica glasala, propustila ili istekla.

---

#### 5. Što su naknade? 

PoS sustav koristi dvije vrste naknada, txnaknada (također poznat kao "djelna" naknada) i naknadaulaznice.
	
Txnaknada je naknada koju plaćate za obradu transakcije za kupnju ulaznice. Ta se pristojba postavlja na niski iznos (0,01 DCR / kB) i ne smije se mijenjati.
Naknadaulaznice je naknada koju plaćate ako se Vaša ulaznica dobije. Ova naknada je poticaj za PoW rudare da  se i vaša ulaznica doda u bazu ulaznica.

U slučaju da je prozor za kupnju pun, što znači da se više ulaznica kupuje nego što je dostupno za vađenje tijekom tog prozora, naknadaulaznice će se koristiti za određivanje ulaznih ulaznica. Ulaznice s najvišim ulaznicama odabiru PoW vađenje.

Naknade se izračunavaju u DCR po kilobajtu. Budući da je ulaznica samo oko 300 (solo) ili 540 (ulog) bajtova, stvarne naknade koje plaćate bit će niže od onoga što postavite kao određenu pristojbu.

I txnaknada i naknadaulaznice neće biti vraćene kada ulaznica glasa, istekne ili propusti glas.

Vraćanje sredstava natrag na račun nakon glasovanja ili ukidanja ulaznice ne ostvaruje naknadu.

---

#### 6. Što je kocka ulaganja? 

Vlasnički ulog je ekvivalent rudarskog uloga, ali za PoS sustav. Kroz opcije u vašem Decred računu, možete dati svoje pravo glasa u skupinu udjela. Ako je vaša ulaznica odabrana za glasovanje, dokaz ulaganja će ostvariti glas za vas, a vi ste nagrađeni s PoS naknadom umanjenom pristojbom za igrače u skupinama (obično 4-5%). Za razliku od vađenog uloga, PoS naknada nije podijeljena među korisnicima udjela. Puna naknada pripada vlasniku ulaznice.

Ulog udjela omogućit će vam kupnju ulaznica, ali nemate svoj račun otključan i uvijek ste na mreži. Važno je napomenuti da sredstva nikada ne napuštaju račun. Ne šaljete ništa u ulog,
Samo mu daje autoritet da glasa u vaše ime. ulog udjela ne može pristupiti vašim sredstvima.

Zaliha uloga obično će provesti višestruku zalihost pomoću mnogih računa koji se fizički distribuiraju širom svijeta. To znači da je manja vjerojatnost da se glas propusti jer je jedan račun nestao.
To također smanjuje latenciju između računa i mreže koja može smanjiti mogućnost propuštanja glasova.

---

#### 7. Što se događa s mojim sredstvima kad kupim ulaznic u? 

Sredstva korištena za kupnju ulaznica zaključana su sve dok se ne odabere glasanje ili istječe. Nisu u mogućnosti napustiti vaš račun i pojavit će se u odjeljku "zaključani blokovi" vašeg računa.
Ako je vaša ulaznica odabrana za glasanje, bit će vam vraćen ukupni iznos uplaćen za ulaznicu i dodijeljen PoS nagradu.

Jedini trošak za korištenje ovog sustava su naknade koje ste postavili. Txnaknada će se naplatiti za transakciju vaše ulaznice preko mreže. Naplaćuje se ulaznica za ulazak u hotel, a plaća se PoW vađenjem. Ako se vaša ulaznica ne iskoristi, nema naknade jer se transakcija nikad nije pojavila na mreži.

U slučaju da vaša ulaznic a nije odabrana za glasovanje nakon 40960 blokova (oko 4 mjeseca), sustav će opozvati vašu ulaznicu, a decred koji ste platili za to (umanjen za pristojbu) bit će prebačen natrag u vaš račun. 

---

#### 8. Kakve su šanse za glasanje mojih ulaznica? 

PoS sustav u Decredu koristi Poissonovu distribuciju kako bi utvrdio šanse za glasovanje u bilo kojem trenutku. S obzirom na ciljnu veličinu uloga od 40960 ulaznica, svaka ulaznica ima 50% šansu za glasovanje u roku od 28 dana i 99,5% glasova prije isteka roka. Imajte na umu da će se ove vrijednosti promijeniti s veličinom uloga.


---

#### 9. Što je glasanje o dokazu ulaganja? 

Budući da se provjera blokova provodi PoS sustav ponaša kao sustav glasanja, može se koristiti i za glasanje o drugim pitanjima.

Kada se odaberete potvrdu blokova, ulaznice glasaju o odobrenju prethodno vađenog bloka ili ne. To zahtijeva 3 od 5 odabranih ulaznica za glasanje da.

Dodavanjem novog parametra na ulaznic u koji ne ometa odobrenje miniranih blokova, sustav može pratiti količinu ulaznica korištenjem tog parametra na više blokova. Taj parametar možete postaviti u svoj račun u bilo kojem trenutku prije glasovanja.

Na primjer, možete odabrati boju vaše ulaznice da bude crvena ili plava, postavite tu opciju i sustav će računati za sljedećih 1000 blokova koliko crvenih ulaznica i koliko plavih karata ima. Možda postoje 3000 crvenih ulaznica, 1500 plavih karata i 500 koji nisu odabrali boju.

Ako zamijenite crvenu ili plavu opciju s mogućnošću da ili ne, imate sustav glasanja koji može brojati glasove tijekom vremena. Koristeći PoS sustav glasovanja, svatko tko drži DCR može glasovati o pitanjima postavljenim u dnevnom redu.

Ovaj birački sustav može se koristiti za bilo kakvo pitanje upravljanja. Za Decred, najistaknutije korištenje će biti glasovanje o teškomgrananju, što su tehničke promjene na način valute radi. Neki primjeri:

- Povećajte maksimalnu veličinu bloka.
- Promijenite algoritam PoS koji koristi za određivanje cijene ulaznica.
- Vote on major new features for the currency (e.g. lightning network, enhanced privacy).
- Promijenite PoW algoritam.
- Pretty much anything the community decides would be in the best interest of the currency.

Trenutno je u razvoju platforma za zajednicu da podnese i zagovara dnevni red glasovanja.

---

#### 10. Što je glasanje o teškomgrananju? 

Kao i sve druge kriptovalute, u nekom će trenutku možda trebati hardver.

Jedno od pitanja koja se postavljaju na dnevni red postavljena za glasovni sustav PoS-a mogla bi biti teško. Ako je takav problem postavljen, nova verzija Decredovog izvornog koda uključivat će tvrdi disk, ali jače grananje neće se aktivirati sve dok ga PoS sustav ne izglasa.

Za glasovanje na teškomgrananju za početak dva kritična uvjeta moraju biti ispunjeni:

- Prvo, 75% PoW vađenja mora nadograditi na najnoviju inačicu trenutne verzije mrežnog bloka. Ova provjera traje tijekom posljednjih 1000 blokova.
- Drugo, 75% PoS vađenja mora nadograditi na najnoviju verziju. Ova provjera traje tijekom zadnjih blokova 2016. godine.

Kada se ove provjere ispune, počinje proces glasovanja. Ulaznice se mogu postaviti dodatnim parametrima da/ ne/ apsincije. Učinite to u vašem računu prije nego što glasaju. Ulaznice označene kao suzdržanost neće se brojati u ukupnom broju glasova.

PoS sustav tada počinje bilježiti ulaznice s tim parametrima postavljenim na unaprijed određenu količinu blokova. Ako je tijekom tog razdoblja iznos "da" glasova bio 75% ili više, glasanje je prošlo. Zaključavanje u razdoblju od određenog broja blokova započet će prije nego što hardver bude aktivan tako da svatko ima priliku nadograditi i ne biti teškoggrananja s mreže.

Budući da je kod za teškogrananje već u trenutnoj verziji Decred, nema potrebe da se programeri ometaju ili većina PoW vađenja i PoS vađenje nadogradi nakon donošenja odluke. Ako glasovanje o teškomgrananju prođe, ona će se automatski provesti nakon zaključavanja u razdoblju.

Glasovanje o teškomgrananju može neuspjeti iz više razloga. Glasovanje možda neće početi uopće ako se PoW vađenje ili PoS vađenje ne nadograđuju. Nakon toga ne može se postići prag od 75% glasova.

U slučaju da glasovanje ne uspije, novi krug počinje na početku procesa. To znači da provjeravate jeste li  nadogradili PoW vađenje, ako ste nadogradili PoS vađenje, a zatim još jedan period za brojanje glasova. To će se nastaviti za određeni broj krugova, nakon čega, ako glasovanje nije prošlo, datumski dnevni red će biti podnesen.

---

#### 11. Je li PoS osjetljiv na velike razmjene koristeći svoje klijente decreda? 

Broj decrednih osoba (ili razmjene) ne znači ništa PoS-u. To je broj ulaznica koje imate. Sredstva korištena za kupnju ulaznica zaključana su sve dok se ne kupuju ulaznice. Ovo znači to
da decredovi uključeni u PoS su učinkovito nerastavljivi. Da bi razmijenili odluke svojih kupaca za glasovanje, morat ćete ih premjestiti iz računa i zaključati ih do 5 mjeseci. Narod će primijetiti  promjenu njihove ravnoteža (dekredovi zaključani u PoSu neće se pokazati potrošenim) i neće moći povući sredstva tako da razmjena pretrpi veliki gubitak likvidnosti.

Nadalje, po blokovima je dodano težak limit od 20 ulaznica pa nema razmjene koja bi mogla poplaviti ulog brže od toga.

Konačno, postoji meka kapica na ukupnom broju ulaznica u ulogu. Svakih 144 blokova (2880 ulaznica) cijena ulaznice se prilagođava na temelju broja ulaznica u ulogu i stope za novu ulaznicu
Dodani su u posljednjem prozoru. Naposljetku cijena ulaznica bila bi tako visoka da čak i razmjena ne bi mogla kupiti mnogo ulaznica. I zapamtite da čak i ako su to učinili, njihovi DCR su zaključani tako da se oni ne mogu više kupiti kada se cijena opet pada.

---

#### 12. Jeli je PoS osjetljiv na utjecaj velikih nositelja bilance kao što su izvorni razvojni programeri? 

Ovdje se primjenjuju granice veličine uloga. Time se zaustavlja jedna osoba/skupina koja poplavi PoS ulog s velikim brojem vlastitih ulaznica. Čak i ako su kupili cijeli ulog (s ogromnim naknadama) najviše što bi htjeli vjerojatno će dobiti oko 4000 ulaznica (na temelju prethodnih prozora ulaznica, gdje oni oko 30DCR obično idu do 100 za sljedeći prozor, a maksimum za onaj nakon toga je često preko 300). Tako veliki nositelj salda vjerojatno mogao bi kupiti 2 prozora. Prozor u 30 bio bi 86,400DCR, a sljedeći na 100 bio bi 288,000DCR. Dakle, košta 374,400DCR za kupnju 5760 ulaznica. Uz ciljanu veličinu uloga od 40960 ulaznica, 374400 DCR bi vam dala oko 14% svih ulaznica.

Now the holder could wait a couple of days for the price to drop then start buying back up again. Except that most of their funds will be locked in the ones they bought earlier (although some will have voted) so their buying power for the new window is greatly reduced. But let's say they have super capital and bought all the decred on all exchanges. So they are able to buy another two windows and replace those tickets that voted and were successful in buying all the tickets (at very high fees and/or prices). Let's say that takes them to about 25% of the tickets.

Ulaznice za blok odabiru se slučajnom distribucijom. Da bi se glasovalo na određeni način, trebali biste imati 3 od 5 glasova za određeni blok koji iznosi 60%. Čak i uz to ogroman trošak kapitala,
Oni su manje od pola puta tamo. I glas nije određen za jedan blok tako da bi trebalo 60% od 75% blokova u razdoblju glasovanja.

A ONDA još uvijek trebate PoW vađenje da potvrdite glasove. Ako misle da netko pokušava igrati sustav, oni mogu odabrati da izgubite blokove.

Zato je u osnovi to gotovo nemoguće, čak i ako jedna osoba ima ogroman postotak DCR-a.

But then we come to the stake pools. Stake pools, while not having access to any of their users' funds, do have the ability to change votes on tickets assigned to them. This is why it is suggested that when joining a stake pool, people don't just go for the largest one. Decred is short for 'decentralised credit' so part of the spirit of PoS is ensuring that the PoS stake pools don't get too large in relation to the others. However, even the largest at almost 20% would still only get on average one vote per block.

Dakle, Decred je posebno dizajniran kako bi se smanjio utjecaj oba velikih PoW i PoS uloga, kao i pojedinaca (uključujući programere) s velikim udjelom.

## <i class="fa fa-book"></i> Veze 

[^1]: [Paymetheus Ticket Purchasing Guide](/getting-started/user-guides/using-paymetheus.md#-purchase-tickets-tab)
