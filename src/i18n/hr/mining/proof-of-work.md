# Dokaz o radu (PoW) vađenja 

---

## Pregled  

Provođenje poslova vađenja, češće nazivano PoW vađenje, je aktivnost koju izvršava hardver i resursi vašeg računala za obradu mreže transakcije i izgradnju blokova koji čine lanacblokova u Dekredinoj mreži. Svaki put kada se stvori blok (od rudara), otprilike 30 novih kovanica Decred
su napravljene. Ove kovanice se zatim razdjeljuju kako slijedi:

Subvencija | Stranka
---     | ---
60%   | PoW Rudari
30%   | PoS birači
10%   | Potpisano subvencioniranje razvoja

U prosjeku ćete dobiti naknadu koja je otprilike proporcionalna ključnimstopama vašeg rudara i ukupnoj ključnojstopi mreže kada vaše računalo započne PoW vađenje. Da biste započeli, morate imati računalo s video kartica. Većina grafičkih kartica može se koristiti za vađenje (uključujući "mobilne"vrste pronađene u nekim prijenosnim računalima). Općenito, vrhunske grafičke kartice izvode u
više ključnestope i stoga dobivaju veće naknade.
---

## Samostalno vađenje ili vađenje zaliha  

> <i class="fa fa-male"></i> Samostalno vađenje

<i class="fa fa-exclamation-triangle"></i> **Samo se vađenje ne preporučuje i nije obuhvaćeno ovom dokumentacijom!** Decred mreža redovito vidi mrežnu brzinu od 10.000 GHz , Samo vađenje obično provode samo napredni pojedinci ili organizirane grupe s velikim brojem GPU-ova pa se ovdje ne obrađuje.

> <i class="fa fa-users"></i> zalihasto vađenje

Kada vadite zaihe, vaša se ključnastopa kombinira sa svim ostalim vadiocima koji traže ispravno rješenje za blok. Dobit ćete naknadu na temelju iznosa posla kojeg vašeg vađenja zaliha.
Razdoblje kojim se zaliha distribuira dionice na temelju pronađenih blokova tako da možete zaraditi neprekinutu količinu Decreda, a ne "sve ili ništa" samostalnim vađenjem.

---

## Dobiti Decredovu adresu za primanje sredstava 

Slijedite vodič [dcrctl osnove](/getting-started/user-guides/dcrctl-basics.md) i izradite adresu kako biste mogli povući naknadu za vađenje.

---

## <i class="fa fa-life-ring"></i> Prijavite se za vađenje zaliha

Ove rudarske zalihe poznato je da podržavaju Decred:

* [<i class="fa fa-external-link-square"></i> http://decredpool.org](http://decredpool.org)
* [<i class="fa fa-external-link-square"></i> http://yiimp.ccminer.org](http://yiimp.ccminer.org)
* [<i class="fa fa-external-link-square"></i> http://coinmine.pl/dcr](http://coinmine.pl/dcr)
* [<i class="fa fa-external-link-square"></i> https://dcr.maxminers.net](https://dcr.maxminers.net)
* [<i class="fa fa-external-link-square"></i> https://dcr.suprnova.cc](https://dcr.suprnova.cc)
* [<i class="fa fa-external-link-square"></i> https://pool.mn/dcr](https://pool.mn/dcr)
* [<i class="fa fa-external-link-square"></i> https://zpool.ca](https://zpool.ca)

Vađenje zaliha radi se više ili manje isto, ali možete se prijaviti na više zaliha i vidjeti koje vam najbolje odgovara.

Molim vas da mi se odlučite za vađenje na manjih zaliha, tako da mreža može biti raspoređena za bolju decentralizaciju rudarske moći!

---

## GPU upravljački programi/sotver  

Vozači GPU obično sadrže knjižnice potrebne za vađenje. Ako imate poteškoća s pokretanjem sotvera, možda ćete poželjeti ponovno instalirati i posebno provjeriti jesu li odabrane biblioteke OpenCL (AMD) ili CUDA (NVIDIA).

---

## <i class="fa fa-download"></i> Odabir i preuzimanje sotvera vađenja

### Službeni vaditelji Decreda (gominer)

Gominer je službeni Decred vaditelj razvijen i podržan od strane Decredovog tima. To je najlakši rudar za postavljanje i početak vađenje i tako se preporučuje za većinu korisnika. Trenutačno najnovija verzija gumba je **<i class="fa fa-github"></i> [v1.0.0](https://github.com/decred/gominer/releases/)** i Službeni se binari mogu preuzeti s web-mjesta **[https://github.com/decred/decred-binaries/releases/tag/v1.0.0](https://github.com/decred/decred-binaries/releases/tag/v1.0.0)**

Pazite da odaberete ispravan operacijski sustav (Windows/Linux) i pravu verziju za vrstu GPU-a (CUDA za NVIDIA kartice, OpenCL/OpenCLADL za AMD kartice). Gominer je dostupan samo 64-bitnim operativnim sustavima. Ovdje možete pronaći korisničke vodiče za početak pretraživanja rudnika:

- [Windows zalih-vađenje](/mining/proof-of-work/pool-mining/gominer/windows.md)

### Neslužbeni vaditelji

* <i class="fa fa-github"></i> [cgminer](https://github.com/kR105-zz/cgminer) - cgminer je popularni vaditelj za **AMD** GPU-ove koji imaju Dugu povijest korištenja u mnogim kriptovalutama. Teže je koristiti od Decredovog gominera

* <i class="fa fa-github"></i> [ccminer](https://github.com/tpruvot/ccminer) - ccminer je popularni vaditelja za **NVIDIA** GPU-ove koji imaju dugu povijest Upotrebe u mnogim različitim kriptovalutama. Teže je koristiti od Decredovog gominera.

* <i class="fa fa-github"></i> [sgminer](https://github.com/tpruvot/sgminer) - Korisnici s **AMD** grafičkom karticom s operacijskim sustavom Windows možda žele preuzeti sgminer.

---

## Pokretanje sotvera

* Dekomprimirati i instalirati sotver na mjesto po vašem izboru.
* Otvorite naredbeni redak na taj put.
* Slijedite upute za rudarske zalihe za postavljanje.
* Započnite vađenje.

Nastavite na [PoW vađenje FAQ](/faq/proof-of-work-mining.md)
