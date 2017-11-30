# <i class="fa fa-cubes"></i> Upotreba bloka Pretraživača

---

## <i class="fa fa-info-circle"></i> Pregled 

Blok pretraživača baziran
[Uvid](https://github.com/bitpay/insight-ui) predviđen je za Decredove mreža. Svi blokovi i transakcije u blokiranom sustavu Decred vidljivi su upotrebom ovog bloka pretraživača, koji se nalazi na adresama
[`https://mainnet.decred.org`](https://mainnet.decred.org) i
[`https://testnet.decred.org`](https://testnet.decred.org) za novčanik testnet. U nastavku je kratak pregled nekih informacija o tome.

Opcija         | Obrazloženje
---            | ---
`Height`       | Blok broj.
`Age`          | Koliko je dugo blok dodao blok blokadu.
`Transactions` | Broj transakcija uključenih u blok.
`Votes`        | Broj glasova dokaza o ulozi koji su uključeni u blok.
`Fresh Stake`  | Broj novih ulaznica kupljenih u ovom bloku.
`Size`         | Veličina (u bajtovima) bloka.

U odjeljku `Latest Transactions`,  možete vidjeti ID transakcije (txid) i
vrijednost (u DCR) prenesena preko mreže.

---

## <i class="fa fa-cube"></i> Blokovi 

Blokovi se mogu pronaći pretraživanjem broja njihovog broja blokova, klikom na vrijednost `Height` s početne stranice ili iz njihove vrijednosti
`BlockHash`. Stariji blokovi imaju niže brojeva blokova. Vrh ima pola bloka pregleda pokazuje relevantne informacije o tom specifični bloku. Ove informacije uključuju: visinu blokova,
ključ bloka i nekoliko ključnih mrežnih parametara opisanih u nastavku:

Opcija                   | Obrazloženje
---                      | ---
`Number of Transactions` | Broj standardnih transakcija (DCR poslan od jednog korisnika na drugi).
`Height`                 | Visina blok-lanca u kojoj se nalazi ovaj blok.
`Block Reward`           | Količina novog DCR-a potkovana u ovom bloku.
`Timestamp`              | Vrijeme koje je ovaj blok stvorio rudar i bio je uključen u blockchain.
`Merkle Root`            | Vrijednost hash vrijednosti svih transakcija za transakcije uključena u ovaj blok.
`Stake Root`             | Vrijednost ključa svih blokova transakcija vezanih uz kocke u ovom bloku. To uključuje kupnje ulaznica, glasove i ukidanje ulaznica.
`VoteBits`               | (1) Blok je odobren od strane birača s dokaznim ulogom. (2) Blok je bio stavljen na veta od strane birača, a svi ne-kunski transakcije u bloku su poništeni, zajedno s dokazom radnog rudara i subvencijom za razvoj.
`Final State`            | Konačno stanje pseudo slučajnog generatora koji se koristi za odabir ulaznica.
`Voters`                 | Broj uspješnih glasova dokaznog uloga u ovom bloku. Maksimalna vrijednost je 5.
`Fresh Stake`            | Broj blokiranih kupnji ulaznica ovjeren u ovom bloku.
`Revocations`            | Broj ulaznica koji nisu glasovali i opozvani su.
`PoolSize`               | Ukupni broj aktivnih ulaznica za provjeru udjela.
`Difficulty`             | Poteškoće u dokazivanju radne mreže.
`SBits`                  | Cijena jedne ulaznice za dokaz o udjelu.
`Bits`                   | Kompaktna inačica mrežne poteškoće u trenutku blokiranja bloka.
`Size`                   | Veličina blokova (u bajtovima).
`Version`                | Verzija bloka.
`Nonce`                  | Vrijednost koju je rudar koristio za pronalaženje točnog rješenja za ovaj blok.

## <i class="fa fa-exchange"></i> Transakcije 

U ovom su odjeljku navedene sve transakcije koje su bile ukradene u ovu bloku. Transakcije su odabrane iz mrežnog članskog fonda po redoslijedu najviša naknada. Svim transakcijama u blok pregledu slijede ovo: standardne transakcije (prijenos ravnopravnih osoba), dokaz o ulozi glasova, kupnja ulaznica za dokaz o udjelu. Sljedeći odjeljci će se pregledati svaka vrsta transakcije.

---

### Standardne transakcije

Evo informacija uključenih u standardne deklirane transakcije.

Opcija              | Obrazloženje
---                 | ---
`Size`              | Veličina transakcije u bajtovima.
`Fee rate`          | Stopa naknada koje prikuplja mreža (po kB).
`Received Time`     | Vrijeme je mreža potvrdila transakciju.
`Mined Time`        | Vrijeme rudara uključilo je transakciju u blok.
`Included in Block` | Blok broj koji je transakcija postala dijelom.

Napomena `Received Time`, `Mined Time`, i `Included in Block` neće imati vrijednost sve dok rudar ne potvrdi transakciju i ne uključuje ga u dekretirani blok. Nakon potvrde u bloku, transakcija se smatra završenom.


---

### Kupnja ulaznica

Za kupnju ulaznica (podnošenje uloga) postoji nekoliko razlika od prikazane standardne transakcije.

Pogledajte razliku u pojedinostima: iznad slova pojavljuje se riječ `Ticket` adresa pošiljatelja računa na lijevoj strani, a riječi "subvencija" pojavljuje se s desne strane. Ovaj je korisnik kupio Ulaznice uloga za 8,75411638 DCR i primljene promjene u iznosu od 7.15994209 DCR. Adresa navedena s lijeve strane pod `Ticket` jest adresu koja sadrži sredstva koja se koriste za tu
ulaznica. Prvi izlaz s desne strane je adresa koja se zadržava prava glasa za ovu posebnu kartu. Drugi izlaz, `Subvencija" je adresa na kojoj će naknada ići. Ovo još nije prikazao istraživač blokova. Treći i konačni izlaz je adresa na kojoj će biti poslana promjena za tu transakciju.

---

### Glasovi o dokazima uloga

Imajte na umu pojmove za identifikaciju u odjeljku s pojedinostima: `Vote`, `Stake
Base`, `Block Commitment`, i `Vote Bits`:

Ove ključne riječi upućuju na to da je ova transakcija glasovna postava od nositelja ulaznice dokaza o ulogu. U ovom primjeru, korisnik je prethodno kupio ulaznicu za 8.99472311 DCR i bio je
poslao je 10,82959184 DCR nakon što se glasovalo u ovoj transakciji.
