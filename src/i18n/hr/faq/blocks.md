# <i class="fa fa-cubes"></i> Blokovi 

---

#### 1. Može li blok postati izoliran nakon što se potvrdio više puta? 

Samo ako je reorg dovoljno dug[^8918]. Da bi se to dogodilo, trebate više ključeva snage koji rade s druge strane grananju nego ključeva snage koji radi na trenutnom najboljem lancu.

---

#### 2. Mogu li ukloniti pretraživač blokova testnet-a s obzirom da je dostupan jedan za mainnet? 

Testnet će i dalje biti tlocrtno testiranje novih značajki, tako da ima smisla zadržati testnet blok pretraživač[^9621].

---

#### 3. Što znače poruke "[INF] CHAN: Dodavanje izoliranih blokova"?

To samo znači blok na kojem radite nema srodnike jer je dobio[^14660]. To se prilično često događa kada ponovno pokrenete `dcrd` zbog načina funkcioniranja sinkronizacije. Još uvijek sinkronizirajte do najnovijeg bloka, no daljinski vršni korisnik, koji je ispred vas, poslao je obavijest da se pojavio novi blok, jedan za koji još nemate srodnika.

Umjesto da ga ignorirate, kada budete dovoljno blizu sinkronizaciji, bitno ih je štedjeti za kasnije, tako da jednom kada počnete raditi na srodnom bloku ti novi blokovi se automatski povezuju.

---

#### 4. Trebam li ponovno skinuti blok-lanac sa svakim novim izdanjem softvera?

Nikad nećete morati ponovo preuzeti lanac[^14788] za nadogradnju, osim ako je to samo supermasivna promjena, gdje ima smisla početi ispočetka. Obično ipak trebate prebaciti sadržaj tako da samo radi.

---

#### 5. Koji je broj porijekla blokova? 

Porijeklo bloka[^16987] je visina bloka 0 (broj bloka 0). Svaki blok nakon toga povećava se za 1.

---

#### 6. Što znači "[INF] CHAN: FORK: Block 000..." znači? 

Evo primjera poruke:

```no-highlight
[INF] CHAN: FORK: Block 0000000000001aedcf1b82b087a1d05ef787550174da1012e473e8ee8c178937 (height 17879) forks the chain at height 17878/block 000000000000150f863186cab6ef5c433bcc155d2f683394f8e65cb037f80b16, but does not cause a reorganize
```

To znači da su dva rudara pronašla rješenje za blok u istovremeno i oboje su poslali svoje riješene blokove na mrežu[^17791].  Oba  jednako vrijede, ali vaš čvor vidio je drugo rješenje ([000000000000147d33cde5e9823122924fb43405418712720eb6457956d8edbb](https://mainnet.decred.org/block/000000000000147d33cde5e9823122924fb43405418712720eb6457956d8edbb)) prvo, pa iz svog čvora stajališta, novi blok ([0000000000001aedcf1b82b087a1d05ef787550174da1012e473e8ee8c178937](https://mainnet.decred.org/block/0000000000001aedcf1b82b087a1d05ef787550174da1012e473e8ee8c178937)) bio je na bočnom lancu.

Budući da je potrebno vrijeme da se blok prenese, ostali čvorovi mogu se vidjeti 0000000000001aedcf1b82b087a1d05ef787550174da1012e473e8ee8c178937 prvi, što njima znači da je druga rješenja koje je vaš čvor prvi vidio ([000000000000147d33cde5e9823122924fb43405418712720eb6457956d8edbb](https://mainnet.decred.org/block/000000000000147d33cde5e9823122924fb43405418712720eb6457956d8edbb)) bio je jedan na strani lanca.

Ovo je sasvim normalno i rješava se kad god se pronađe sljedeći blok jer će sada definirati najduži lanac i bez obzira na koje je rješenje izgrađeno, bit će izoliran.

U tom slučaju, blok #17880 ([000000000000154c6091747245e3c2620447c71b346aed09548e74b4543d0d66](https://mainnet.decred.org/block/000000000000154c6091747245e3c2620447c71b346aed09548e74b4543d0d66)) ended up building on top of 000000000000147d33cde5e9823122924fb43405418712720eb6457956d8edbb, tako da je drugo rješenje ([0000000000001aedcf1b82b087a1d05ef787550174da1012e473e8ee8c178937](https://mainnet.decred.org/block/0000000000001aedcf1b82b087a1d05ef787550174da1012e473e8ee8c178937)) bio je izoliran.

---

## <i class="fa fa-book"></i> Izvori 

[^8918]: Decred Forum, [Post 8,918](https://forum.decred.org/threads/557/#post-8918)
[^9621]: Decred Forum, [Post 9,621](https://forum.decred.org/threads/651/#post-9621)
[^14660]: Decred Forum, [Post 14,660](https://forum.decred.org/threads/1333/#post-14660)
[^14788]: Decred Forum, [Post 14,788](https://forum.decred.org/threads/1336/#post-14788)
[^16987]: Decred Forum, [Post 16,987](https://forum.decred.org/threads/1852/#post-16987)
[^17791]: Decred Forum, [Post 17,791](https://forum.decred.org/threads/2925/#post-17791)
