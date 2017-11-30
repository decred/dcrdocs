# Glasovne ulaznice 

---

#### 1. Kada je započelo glasovanje o dokazivanju uloga? 

Započelo je glasovanje o kockanju[^7969] na bloku 4.096.

---

#### 2. U izvornom kodu VeličinaUlazniceUloga postavljen je na 8.192, ali trenutna veličina baze ulaznica je veća od toga. Zašto?

To je namjerno i sastavni je dio dinamičke prilagodbe cijena ulaznica[^8965]. `TicketPoolSize` je veličina ciljane ulaznice i djeluje vrlo slično ciljanoj težini za dokaz o radu (PoW). Činjenica da je trenutna veličina ulaznica veća od cilja uzrokuje povećanje cijene ulaznica, što će za posljedicu imati i manje ulaznica za kupnju i rezultirati brojem ulaznica u bazenu koji se smanjuju prema cilju. Ako padne, cijena će pasti kako bi potaknula više prodaje ulaznica kako bi se povećala broj ulaznica u ulaganju prema cilju.

---

#### 3. Ako sam nesretan i vaša ulaznica istječe bez glasovanja, gubim li onda naknadu za transakciju? 

Da[^9806].

---

#### 4. Glasanje na mainnetu bilo je na "čekanju" do bloka 4.096, s ljudima koji su kupovali ulaznice. Znači li to da će biti bitno veći rizik za istjecanje tih karata?

Ne[^9806], vrijeme isteka ne započinje sve dok se ulaznica ne ugasi u blok. Ulaznice su samo sjedile u bazenu s memorijom dok nisu bile uključene u blokove počevši od bloka 4.096.

---

#### 5. Što će se dogoditi ako nijedna (ili manje od 3) odabranih birača ne ispoštuje svoje obaveze? 

Glasove uvijek određuje trenutni savjet. Rudari ne započinju vađenjem za novi blok sve dok najmanje 3 od odabranih birača ne ispuštaju svoje transakcije. Dakle, ako pronađeni blok ne uspije dobiti odabrane glasove[^10219], blok je jednostavno ostao bez siromaštva od sljedećeg bloka kojeg je pronašao drugi rudar.

Za konkretniji primjer, pretpostavimo da je trenutačni vrh lanca na bloku 5.000. Birači određeni blokom 5.000 već su podnijeli svoje glasove, tako da se rudari bacaju u potrazi za blokom 5.001. Sada rudnik pronađe rješenje za blok 5 001 i šalje ga na mrežu. Svi demoni (i stoga novčanici) vidjet će da se samo 5.001 pojavila. Međutim, rudari odmah ne započinju s miniranjem od 5.001. Umjesto toga nastavljaju s miniranjem od 5.000 dok se ne pojave 3+ glasova za blok 5.001. U tom trenutku svi se prebacuju i započinju miniranje od 5.001. Ako se ti 3+ glasova nikada ne pojave, drugi će blokovi kandidata pronaći 5,001, a ostali rudari koji još uvijek rade na bloku 5000, koji će na mrežu poslati svoje (drugačije) rješenje za blok 5,001. Budući da svaki od tih novih blokova kandidata za 5,001 ima drugačiji raspršivač, odabiru se različite ulaznice.

---

#### 6. Što se događa ako je ulaznica propustila glas? 

Vaš račun automatski će opozvati ulaznicu u bloku nakon što je propustila[^13912], tako da ih vratite odmah nakon što su propustili kao nezrela sredstva (to znači da neće biti potrošeno za 256 blokova kada sazrijevaju).

Na primjer:

```no-highlight
dcrctl --wallet getstakeinfo
```

Izlaz          | Opis
---             |---
`allmempooltix` | Sve uloge ulaznica u memorijskom ulaganju (čekaju da se vade u blok).
`ownmempooltix` | Vaši ulaznice za uloge u bazu s memorijom (čekaju da se vade u blok).

---

#### 7. Koja je razlika između propuštenih i opozvanih ulaznica? 

Propuštene ulaznice su ulaznice s kojima se može glasati, ali nije se glasalo. Nakon što je ulaznica propuštena, može se opozvati[^14763]. Račun automatski uklanja propuštene ulaznice koje kontrolira (pod pretpostavkom da je otključana tako da može potpisati transakciju opoziva).

Sve `rebroadcastmissed` kaže da račun traži mrežu servisa (`dcrd`) kako bi mu ponudio popis propuštenih ulaznica kako bi ponovno provjerio treba li biti opozvan. Obično to nije potrebno osim ako je, primjerice, pokušaj opoziva ulaznice napravljen, ali nije uspio jer je račun zaključan. Drugim riječima, ako primijetite da opoziv nije jednako propušten, možda ćete morati `rebroadcastmissed`. Kao što je rečeno ipak, rijetko je to potrebno, jer račun automatski to pokreće i traži propuštene ulaznice na svakom bloku.

Nastavite na [Provođenje radnog vađenja](/mining/proof-of-work.md)

---

## <i class="fa fa-book"></i> Izvori 

[^7969]: Decred Forum, [Post 7,969](https://forum.decred.org/threads/531/#post-7969)
[^8965]: Decred Forum, [Post 8,965](https://forum.decred.org/threads/531/page-2#post-8965)
[^9806]: Decred Forum, [Post 9,806](https://forum.decred.org/threads/180/page-6#post-9806)
[^10219]: Decred Forum, [Post 10,219](https://forum.decred.org/threads/180/page-6#post-10219)
[^13912]: Decred Forum, [Post 13,912](https://forum.decred.org/threads/1271/#post-13912)
[^14763]: Decred Forum, [Post 14,763](https://forum.decred.org/threads/1335/#post-14763)
