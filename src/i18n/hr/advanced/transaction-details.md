# Detalji transakcije 

---

Decredove transakcije su prijenosi DCR-a koji postoje unutar blokova. Transakcije se prvenstveno sastoje od ulaza i izlaza, iako imaju i nekoliko drugih područja podataka. 


## Format transakcije

Polje        | Opis                                                                                    | Veličina
---          | ---                                                                                            | ---
Verzija      | Transakcijska inačica. Taj se broj koristi za označavanje načina transakcije tumačenja  | 4 bajta
Broj unosa  | Broj ulaza u transakciji kodiranim kao cijeli broj promjenjive duljine                   | 1-9 bajta
Ulazi       | Serijska lista svih unosa transakcija                                                | Promjenjiva
Izlazni broj | Broj izlaza u transakciji kodiran kao cijeli broj promjenjive dužine                  | 1-9 bajta
Izlazi      | Serijska lista svih izlaznih transakcija                                               | Promjenjiva
Vrijeme zaključavanja    | Vrijeme kada se transakcija može potrošiti. (obično nula, u kojem slučaju nema učinka)       | 4 bajta
Vrijeme istekla       | Visina blokova na kojoj transakcija istječe i više nije valjana                       | 4 bajta


### Unosi
Ulazi troše prethodno izrađene rezultate. Postoje dvije vrste ulaznih transakcija: sa svjedokom i bez-svjedoka.


#### Unosi bez svjedoka
Unos transakcije bez svjedoka je referenca na neispunjeni izlaz i slijed brojeva. Referenca na nepotpun izlaz naziva se "vanjska točka". Vanjske točke imaju tri polja:

Polje            | Opis                                                                                                                           | Veličina
---              | ---                                                                                                                                   | ---
Transakcijski ključ | Ključ transakcije koja sadrži izlaz koji se troši                                                                     | 32 bajta
Izlazni indeks     | Indeks izlaza koji se troši                                                                                                   | 4 bajta
Stablo             | Stablo u kojem je potrošen izlaz. To je potrebno jer postoji više od jednog stabla za pronalaženje transakcija u bloku. | 1 bajt

Pored vanjske točke, ulazi koji su bez svjedoka sadrže redni broj. Taj broj ima više povijesnog značaja od relevantne upotrebe; dapače, njihova najrelevantnija svrha je omogućiti "zaključavanje" plaćanja tako da ih se ne može otkupiti do određenog vremena.


#### Unosi sa svjedocima
Unos transakcija sa svjedocima sadrži podatke potrebne za dokazivanje izlaza izlaza. Ulazi svjedoka sadrže četiri polja podataka:

Polje            | Opis
---              | ---
Vrijednost            | Količina kovanica kojima se izlaz troši na transfere.
Visina blokova     | Locirana visina bloka koja sadrži transakciju u kojoj se troši izlaz.
Registar blokova      | Lociran registar transakcija u kojemu se troši izlaz.
Potpis skripte | Skripta koja zadovoljava zahtjeve skripte u izlazu koji se troši.


### Izlazi
Izlazi su prijenosi DCR-a koji se mogu trošiti ulazima. Izlazi uvijek imaju tri polja podataka:

Polje             | Opis                                                                                     | Veličina
---               | ---                                                                                             | ---
Vrijednost             | Količina DCR-a koju šalje izlaz.                                                     | 8 bajta
Verzija           | Verzija izlaza. Taj se broj koristi za označavanje načina na koji se izlaz treba tumačiti. | 2 bajta
Skripta javnog ključa | Skripta koja mora biti zadovoljena za potrošnju                                           | Promjenjiva

---

## Serijalizacija 
Gore prikazani format nije oblik kojima su transakcije poslane i primane. Prilikom slanja ili primanja transakcija, one se mogu serijski ispostavljati na nekoliko načina. Način na koji bi transakcija trebala biti deserjializirana može se odrediti iz njezine verzije. Verzije transakcija zauzimaju četiri bajta, no ta se četiri bajta zapravo koriste za pohranjivanje dvije zasebne vrijednosti. Prva dva bajta verzije transakcije označavaju njegov stvarni broj verzije. Druge dva bajta označavaju oblik serijalizacije.


### Oblici Serijalizacije
Pri serijalizaciji postoje dva glavna dijela transakcije: njegov "prefiks" i podaci svjedoka.
Prefiksa transakcija sastoji se od:

* Ulaza (bez ikakvih podataka o svjedocima)
* Izlaza
* Zaključanog vremena
* Isteka

Podaci svjedoka o transakciji uključuju samo njegove ulaze. Uključene podatkovne polja svojih ulaza ovise o specifičnom formatu serijalizacije. Taj format može biti bilo koji od sljedećih:

* **0 (Puna serijalizacija)** - Prefiks transakcije nalazi se neposredno prije podataka o svjedočenju.
* **1 (Bez svjedoka)** - Prefiks transakcije je jedini podatak prisutan.
* **2 (Samo svjedok)** - Podaci o svjedočenju transakcije jedini su podaci. Za svaki ulaz, to uključuje njegovu vrijednost, visinu blokova, indeks blokova i skriptu potpisa.
* **3 (Potpisivanje svjedoka)** - Podaci o svjedočenju transakcije jedini su podaci prisutni i serijski za svrhe potpisivanja. Za svaki ulaz, to uključuje samo njegov potpis pisma.
* **4 (Potpisivanje svjedoka s vrijednošću)** - Podaci o svjedočenju transakcije jedini su podaci prisutni i serijski za svrhe potpisivanja. Za razliku od oblika potpisa svjedoka, ovaj format uključuje vrijednost svakog unosa prije skripte potpisa.
