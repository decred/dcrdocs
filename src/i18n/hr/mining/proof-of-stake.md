# Pokazivanje uloge (PoS) rudarstva 

Zadnje ažuriranje za v1.0.0

Ovaj dokument je namijenjen obrazovnom resursu za dokazivanje uloga (sastava) s Decredom. Pokrivat će svrhu Protokola o udjelu protokola, kratki uvod u proces ulaganja, životni ciklus ulaznice i započeti s kupnjom ulaznica. 

---

## Pregled 

Decredov jedinstveni protokol za provjeru uloga služi više svrha:

Dati mjerni podatak za zainteresirane strane/ potpore krajnjim korisnicima svih konsenzualnih ažuriranja. To jest, dionici su u stanju glasovati o konkretnim prijedlozima / dnevnom redu na blokovima. Dnevni redovi mogu uključivati ​​odlučivanje hoće li dev tim trošiti vrijeme na provedbu određene značajke, aktivirajući kod neke značajke već predane za implementaciju ili donose druge odluke, na primjer, kako treba potrošiti dev-subvenciju. Više informacija o glasovanju možete naći u našem [Mainnet Voting Guide](/getting-started/user-guides/agenda-voting.md).

Decredova PoS također pruža sustav provjere i ravnoteže za nesukladne rudare. Zainteresirane strane mogu glasati u bloku nevažećim ako se ne podudara s konsenzusnim pravilima mreže. 

---

## Ulaganje 101 

Da bi sudjelovali u rudarstvu, dioničari zaključavaju DCR u zamjenu za ulaznicu. Svaka ulaznica u vlasništvu daje dioniku sposobnost baciti jedan glas. Nakon glasanja, svaka ulaznica vraća malu nagradu plus izvorni **cijenu ulaznice** ulaznice. Svaka ulaznica je odabrana da glasuje nasumce, dajući prosječno vrijeme glasanja od 28 dana, ali eventualno i do 142 dana, s mogućnošću isteka roka od .5% prije nego što bude izabran za glasanje (ovaj istek natrag vraća izvornu **cijenu ulaznice** Bez nagrade). Svaki blok minirano mora sadržavati 5 glasova (rudari su kažnjeni odbitkom nagrade ako je uključeno manje od 5 glasova). Svaki blok minirano može uključivati ​​i do 20 kupnje svježih ulaznica. Nova ulaznica zahtijeva 256 blokova prije nego što se upiše u **Ticket zaliha** i može se pozvati na glasanje.

Postoji nekoliko važnih varijabli koje biste se trebali upoznati s istupanjem.

Svakih 144 blokova (~12 sati), algoritam poteškoća s kockom izračunava novu **cijenu ulaznice** u pokušaju da zadrži veličinu **ulaznice** u blizini ciljane veličine bazena od 40.960 ulaznica. Ovaj blok blok od 144 naziva se `StakeDiffWindowSize`.

 **Cijena ulaznica**/**Povećanje udjela** je cijena koju morate platiti za ulaznicu tijekom jednog 144 blok-prozora.

 **Zaliha ulaznica** je ukupan broj ulaznica u Decred mreži.

 **Naknada za ulaznice** (`ticketfee`) je naknada koja se mora uključiti u kupnju karata kako bi potaknula rudare dokaznih radnika da uključe tu ulaznicu u novi blok. **Naknada za ulaznice** se obično odnosi na naknadu za DCR / kB za kupnju ulaznice. Stoga, s većom veličinom transakcije, završit ćete plaćati višu apsolutnu naknadu. Na primjer, kupovina ulaznica za samostalno uloganje iznosi oko 300 Bytes, što znači da **Naknada za ulaznica** od 0,3 DCR / kB će rezultirati potrošnjom na .1 DCR ako i samo ako se ta ulaznica uključi u blok.

Kada **ulaznica** bude relativno niska za samo jedan **Ulaznica Prozora**, obično možete očekivati ​​da će se formirati tržište naknada, pri čemu mnogi dionici pokušavaju kupiti ulaznice prije završetka prozora. Kad **Cijena ulaznice** nije na izuzetno niskoj i isplativoj cijeni, zadana **ulaznica** od 0.01 DCR / kB stopa obično je dovoljno visoka da bude uključena u blok.

Kada se ulaznica zove na glasanje, račun koji ima pravo glasa za tu ulaznicu mora biti na mreži. Ako račun nije dostupan za glasanje, ulaznica će biti označena kao `missed` i nećete dobiti nagradu za tu ulaznicu. Zaliheuloga se nude kao rješenje za one koji ne mogu imati glasovni račun na mreži 24/7.

Zalihauloga omogućuju zainteresiranim stranama da stvaraju transakcije kupnje ulaznica koje daju pravo glasa za Vaše ulaznice. Oni glasuju za vas, obično zahtijevaju malu naknadu za sudjelovanje (manje od 7%) koja pokriva troškove hostinga najmanje 3 poslužitelja potrebnih za pokretanje veze. Ova je naknada poznata kao **naknada za zalihu** i izvađena je samo iz male PoS naknade. Popis zalihauloga nalazi se u nastavku [below](#list-of-stakepools).

---

## Ulaznica Životnog Ciklusa

Kupnja ulaznice za PoS je prilično jednostavna (vidi dolje), ali što se događa s njom nakon što ga kupite?
Ulaznica na glavnoj mreži (ispitna mreža koristi različite parametre) proći će kroz nekoliko faza u svom životnom vijeku:

1. Kupite ulaznicu koristeći Paymetheus <!--, Decrediton,--> ili dcrračun račun. Ukupni trošak svake pojedine ulaznice treba biti  **Cijena ulaznice** + **Naknada ulaznica**(`ticketfee`).
2. Vaša ulaznica ulazi u `mempool`. Ovo je mjesto gdje vaša ulaznica čeka miniranost PoW rudara. U svaki blok ulaže se samo 20 svježih ulaznica.
3. Ulaznice se vade u bloku s višim **ulaznicama** transakcijama koji imaju veći prioritet. Imajte na umu da je **ulaznica** DCR po KB transakcije. Nekoliko uobičajenih veličina transakcija je 298 Bytes (kupnja samostalnih ulaznica) i 539 Bytes (kupnja ulaznica zaliha).
4. **A -** Ako vaša ulaznica bude minirana u blok, ona postaje nezrela ulaznica. Ovo stanje traje 256 blokova (oko 20 sati). Tijekom tog vremena ulaznica ne može glasati. U ovom trenutku naknada za ulaznicu nije povratna. <br /> 
**B -** Ako vaša ulaznica nije iskopana, i **ulaznica** i **ulaznica** se vraćaju na kupovni račun.
5. Nakon što sreće vašu ulaznicu (256 blokova), ulazi u **ulaznica zaliha** i ispunjava uvjete za glasanje.
6. Mogućnost glasanja za ulaznice temelji se na Poissonovoj distribuciji s prosjekom od 28 dana. Nakon 28 dana ulaznica ima 50% šanse da je već glasao.
7. S obzirom na ciljnu veličinu bazena od 40960 ulaznica, svaka ulaznica ima 99,5% šanse za glasanje u ~ 142 dana (oko 4,7 mjeseci). Ako, nakon ovog vremena, ulaznica nije glasovala, istječe. Dobivate povrat na izvornom **cijenu ulaznice**.
8. Ulaznica može propustiti svoj poziv za glasanje ako glasina za glasanje ne odgovara ili dva valjana bloka nalaze se u neposrednoj blizini. Ako se to dogodi, dobivate povrat na izvornom **cijenu ulaznice**.
9. Nakon što je ulaznica glasovala, propustila ili istekla, sredstva (cijena ulaznica i subvencija, ako je primjenjivo, umanjena za naknadu) unijet će nezrelost za još 256 blokova, nakon čega će biti pušteni. Ako je ulaznicica propuštena ili istekla, račun će poslati transakciju oduzimanja ulaznica koji zatim oslobađa zaključane ulazne ulaznice. **NAPOMENA:** Povlačenja se mogu poslati samo za odgovarajuću propuštenu ulaznicu. Ne možete opozvati ulaznicu dok ga ne propustite.

---

## Kako zaraditi 

Račun otvoren i otključan 24 sata dnevno je *preporučljiv* za složenost. Svaki gubitak vremena neprekidnog rada može rezultirati gubitkom glasova i naknda. Zaliheuloga su dostupne onima koji ne mogu zauvijek zadržati osobni račun za glasanje.

Jedini drugi uvjet za procjenu je da kupite ulaznicu. U nastavku možete pronaći vodiče za kupnju ulaznica pomoću [Paymetheus](#paymetheus) i [dcrračun](#dcrwallet).

Ako namjeravate upotrijebiti vezu, prvo se morate prijaviti za jedan. Veze sa službeno priznatim zalihama nalaze se [ovdje](#list-of-stakepools).

---

## Paymetheus 

Aplikacija Paymetheus ne može sama glasati, što znači da biračka prava moraju biti dodijeljena grupi.

Pogledajte [Vodič za ulaznicicu Kupovne ulaznice](/getting-started/user-guides/using-paymetheus.md#purchase-tickets-tab) za Paymetheus kako biste saznali kako kupiti ulaznice putem Paymetheusa i zalihauloga.

---

## dcrračun 

Vodič [Kupovina ulaznica s dcrračun](/getting-started/user-guides/dcrwallet-tickets.md) pokazat će vam kako ručno i automatski kupiti ulaznice zaliha ili za samostalno ulaganje.

---

## <i class="fa fa-life-ring"></i> Popis zalihauloga

Ove udruge su službeno priznate:

* [<i class="fa fa-external-link-square"></i> https://dcr.stakepool.net](https://dcr.stakepool.net)
* [<i class="fa fa-external-link-square"></i> https://dcr.stakeminer.com](https://dcr.stakeminer.com)
* [<i class="fa fa-external-link-square"></i> https://pool.d3c.red](https://pool.d3c.red)
* [<i class="fa fa-external-link-square"></i> https://stakepool.dcrstats.com](https://stakepool.dcrstats.com)
* [<i class="fa fa-external-link-square"></i> https://stake.decredbrasil.com](https://stake.decredbrasil.com)
* [<i class="fa fa-external-link-square"></i> https://stakepool.eu](https://stakepool.eu)
* [<i class="fa fa-external-link-square"></i> https://dcr.ubiqsmart.com](https://dcr.ubiqsmart.com)
* [<i class="fa fa-external-link-square"></i> https://ultrapool.eu](https://ultrapool.eu)

Možete pronaći usporedbu naknada i statističkih podataka za svaku bazu posjetom na stranici
[<i class="fa fa-external-link-square"></i> Decred website](https://decred.org)
I kliknite vezu "zalihauloga" u podnožju pri dnu stranice.

---

<!-- TODO: **Kupnja ulaznica s Decrediton** -->

## Dodatne informacije 

[Vodič za glasanje za Mainnet](/getting-started/user-guides/agenda-voting.md)

[naredba-o-ulogu naredbe](/advanced/program-options.md#pos-commands)

[Često postavljana pitanja - općenito](/faq/proof-of-stake/general.md)

[Česta pitanja vezana uz proviziju - Kupnja ulaznica i naknada](/faq/proof-of-stake/buying-tickets-and-fees.md)

[Često postavljana pitanja o udjelu uloga](/faq/proof-of-stake/solo-mining.md)

[Često postavljana pitanja o udjelu uložaka](/faq/proof-of-stake/stake-pools.md)

[Česta pitanja o procjeni udjela - Glasanje ulaznica](/faq/proof-of-stake/voting-tickets.md)

[Parametri potvrđivanja isticanja ulova](/advanced/program-options.md#pos-network-parameters)
