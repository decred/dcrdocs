# <i class="fa fa-male"></i> Samostalno vađenje 

---

#### 1. Trebam li snagu ključa za ulaganje? 

Ulaganje u "vađenje" ne zahtijeva nikakvu moć ključa[^9304]. Zamislite malo o interesu uloženih novčića. Zaključavate svoje kovanice na određeno vrijeme kako biste kupili kartu koja vam daje visoku vjerojatnost (> 99%) stjecanja prava glasa i primanja interesa u zamjenu za glasovanje i trošak prilika da ne budu mogli koristiti te kovanice za potencijalno do ~ 4,7 mjeseci.

Ako ste već kupili ulaznice za kockanje, te su kovanice zaključane sve dok ulaznice ne dobivaju niti istječu. Vi ste sami složni i stoga MORATE održavati svoj račun na mreži 24 sata dnevno, sve dok sve vaše ulaznice nisu osvojile (ili istekle) ili ćete propustiti nagradu jer ne možete glasati ako račun nije na mreži. Budući da su ti kovanice sada zaključane, nema načina da sada promijenite već zaražene kovanice.

S druge strane, udio u udjelu omogućuje vam da prenesete svoje pravo glasa u ulaganje, tako da je odgovoran za na mreži 24 sata dnevno i glasovanje za vas.

---

#### 2. Nije li jedan od glavnih razloga za vađenje uloga kako bi se osiguralo da uvijek postoji dovoljna količina vršnjaka na mreži?

Definitivno ne[^9311]. Vađenje uloga ne može to učiniti. račun SPV stila mogao bi lako izvršiti potrebne procese komunikacijom s drugim punim čvorovima (`dcrd` instances) na mreži. Istina je da trenutni račun zahtijeva da se `dcrd` pokrene, ali to uvijek neće biti slučaj.

Čak i ako je softver pokušao provesti to, niste mogli zaustaviti ljude da pišu pomoći i to tako da to rade preko mreže peer-to-peer, bez potrebe da pokrenu vlastitu lokalnu instancu ionako.

---

#### 3. Što se događa ako je moj račun nedostupan ili zaključan kada su mi rudari odabrali moje ulaznice? 

Ako je vaš račun izvan mreže ili zaključan[^9806] kada odaberete svoje ulaznice, izgubite na naknadi i vaša se ulaznica odmah uklanja iz ulaganja. Nema "ponavljanja".

---

#### 4. Mogu li nekako provjeriti je li moj stroj dostupan za glasanje? Drugim riječima, pokrenite rad rudara koji bi želio dobiti moj glas. 

Ne morate biti dostupni. Glasovanje je deterministično po blokovima po blokovima[^9806]. To znači da će vaš račun znati je li vaša ulaznica odabrana na temelju trenutnog bloka, a zatim se transakcija s "transakcijom glasom" (transakcija s glasovima) šalje mreži, baš kao i druge transakcije.

---

#### 5. Mogu li pokrenuti više računa s pravom glasa s istim sjemenom na više poslužitelja? 

Možete imati više računa za glasovanje samo zato što ne stvaraju nove adrese[^12697]. Problem dolazi kada imate dva računa koja stvaraju transakcije koje uključuju nove adrese jer ne znaju što drugi radi.

Ako radite vruće/hladno postavljanje, možete izraditi više vrućih računa bez glasanja bez ikakvih problema sve dok oboje znaju za adresu kojoj dajete prava glasa.

Nastavi na [Stake Pools FAQ](/faq/proof-of-stake/stake-pools.md)

---

## <i class="fa fa-book"></i> Izvori 

[^9304]: Decred Forum, [Post 9,304](https://forum.decred.org/threads/626/page-2#post-9304)
[^9311]: Decred Forum, [Post 9,311](https://forum.decred.org/threads/582/page-2#post-9311)
[^9806]: Decred Forum, [Post 9,806](https://forum.decred.org/threads/180/page-6#post-9806)
[^12697]: Decred Forum, [Post 12,697](https://forum.decred.org/threads/1127/#post-12697)
