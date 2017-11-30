# <i class="fa fa-ticket"></i> Kupnja ulaznica i naknada 

---

#### 1. Postoji li način da vidite ulaznice koje je kupio lokalni račun? 

Upotrijebite sljedeću naredbu za prikaz svih vaših ulaznica[^9987]:

```no-highlight
dcrctl --wallet gettickets true
```

---

#### 2. Plaćam li naknadu za transakciju za ssgen transakciju? 

Ne, ssgen transakcije ne nameću naknadu[^10219] (za razliku od izvornih transakcija kupnje ulaznica koje se natječu za ograničeni prostor u svakom bloku). U tom su smislu učinkovite transakcije sučelja baze podataka o radu.

---

#### 3. Kako promijeniti naknadu za ulaznice? 

```no-highlight
dcrctl --wallet setticketfee <fee>
```

---

#### 4. Kako manualno kupiti ulaznice? 

```no-highlight
dcrctl --wallet purchaseticket <fromaccount> <spendlimit> <minconf>
```

Gdje:

Opcija        | Obrazloženje
---           | ---
`fromaccount` | Obično je "zadano" (osim ako ste stvorili drugačiji).
`spendlimit`  | Maksimalan broj DCR-a koji želite potrošiti na ulaznice.
`minconf`     | To se može podesiti na 0.

---

#### 5. How should I set the ticketfee? 

 `ticketfee` (ili naknada za ulaznice) određuje redoslijed u kojem ulaznice za memorijaulaganja ulaze u bazu za glasovanje. Više naknade potiču dobavljače da dokažu da rade ulaznice na čekanju reda. Ako postavite naknadu veću od prosječne cijene, vjerojatnije je da će vaše ulaznice biti uključene u sljedeći blok. Zadana txnaknada je 0,01 DCR. Čini se da je onda najbolja ideja da postavite txnaknadu tako da se nalazite ispred crte. Ali to nije uvijek dobra ideja. Zapravo, rijetko je dobra ideja jednostavna zato što je red čekanja memorijeulaganja vrlo kratak ili nula većinu vremena. Nemojte zaboraviti da će txnaknadu koristiti u vašoj DCR dobiti kao što je naplaćeno za svaku ulaznicu i ne vraća se bez obzira na to glasuje li ili ne.

Razmislite o konstantnoj cijeni od 10 DCR. Svaki blok 20 ulaznica može se preseliti u bazu za glasovanje od članova. To je vrijednost od 200 DCR. Svaki blok stvara oko 30 DCR i vraća 50DCR biračima. 3 DCR je poslan razvojnim programerima kako bi pomogao u financiranju razvoja Decreda tako da samo 27 završava u rukama rudara. To znači da je 77 DCR oslobođeno bloka kako bi se vratio na ulaznice, pod pretpostavkom da se sva povratna sredstva ponovno investiraju. To je manje od polovice onoga što blok može podnijeti. Jedini način na koji više DCR-a može ući u članak je vanjsko ulaganje (tj. kupnja iz razmjene) ili rudara koji su spremali svoje DCR-ove čekajući da se cijena ulaznica spusti.

U slučaju pada cijena ulaznica, rudar želi ući u ulog prije nego što se cijena opet promijeni. To se događa svakih 144 blokova (oko 12 sati). Nije bitno je li u prvom ili 100-om bloku. U 144 blokova prihvaćat će se 2.880 ulaznica s vrijednošću 28.800 DCR. Trenutno nije takav volumen u mreži dokaznih udjela. Postoji jedan scenarij u kojem biste možda htjeli postaviti visinu naknade. Ako se trošak uloga namjerava mijenjati za nekoliko blokova, memorijaulaganja nije prazna i želite biti sigurni da dobijete trenutnu cijenu, može vam se pomoći da postavite svoju naknadu nešto više od prosjeka kako biste bili sigurni da ćete dobiti, pogotovo ako sljedeća promjena znači da propuštate ulaznicu.

Nastavite na [PoS Samostalno Vađenje FAQ](/faq/proof-of-stake/solo-mining.md)

---

## <i class="fa fa-book"></i> Izvori 

[^9987]: Decred Forum, [Post 9,987](https://forum.decred.org/threads/582/page-2#post-9987)
[^10219]: Decred Forum, [Post 10,219](https://forum.decred.org/threads/180/page-6#post-10219)
