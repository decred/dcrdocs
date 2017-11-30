# Hibridni dizajn 

---

Najveći kontrast s prethodno opisanim Slijedi Satoshi Sustave[^1] je novi sustav lutrije u kojem se ulaznice moraju kupiti, a zatim čekati na razdoblje dospijeća prije nego što se mogu odabrati i potrošiti. Odabir ulaznica za blok izvršava se leksikografski iz zrelih ulaznica baziranih na pseudorandomni sadržani u zaglavlju. Budući da je manipulacija  pseudorandomnošću teško u PoW sustavu, manipulacija odabirom ulaznica povezana je s temeljnim troškovima PoW vaditelja. Odabir ulaznica tijekom vremenskog razdoblja može se opisati pomoću funkcije gustoće vjerojatnosti slične vjerojatnosti dobivanja blokova u PoW pri stalnoj brzini raspršivanja tijekom vremena pri konstantnoj poteškoćama[^2], što rezultira raspodjelom vjerojatnosti s približnim načinom Jednako polovici veličine ulaznica zaliha. Cijena za kupnju ulaznice regulirana je novim poteškoćama u dionicama, što je određeno eksponencijalnim ponderiranim prosječnim brojem kupljenih ulaznica i veličinom zrelog ulaznog fonda u prethodnim blokovima.

Provjera PoW blokova objašnjena je sljedećim koracima:

1. Blok je vađen od strane PoW vaditelja, koji odabire transakcije staviti unutar njega. Transakcije vezane uz sustave uloga ugrađuju se u skup UTXO.
2. PoS vaditelji glasaju na bloku proizvodnjom transakcije glasovanja iz svoje ulaznice. Glasovanje i omogućuje blok izgradnju na vrhu prethodnog bloka i odabire hoće li prethodno redovito stablo transakcija (koje sadrži transakcije na suvenirnici i transakcije koje nisu vezane uz kocku) važeće.
3. Još jedan PoW vaditelj počinje graditi blok, umetanjem glasova PoS vaditelja. Većina glasova mora biti uključena u sljedeći blok da taj blok bude prihvaćen od strane mreže. Od transakcija glasova u ovom novom bloku, PoW vaditelj provjerava zastavu kako bi vidio je li PoS rudar naznačio jeli redovito stablo transakcije valjano. Ove zastavice za glasanje se spajaju i na temelju većinskog glasova postavlja se malo zastava u ovom bloku kako bi se naznačilo je li redovno stablo transakcije prethodnog bloka valjana.
4. Pronađen je nonce koji zadovoljava poteškoće u mreži, a blok je umetnut u lanacblokova. Ako je redovito redovito transakcijsko stablo prethodnog bloka potvrđeno, umetnite ove transakcije u skup UTXO. Idite na 1.

Kako bi obeshrabrili manipulaciju uključenih glasova, trenutni blok primjenjuje se linearna subvencijska kazna ako ne uključe sve glasačke transakcije u svoj blok. "Lagana" kazna od poništavanja prijašnjeg stabla transakcije pomaže u sprečavanju odbacivanja posla, što je neophodno za osiguranje sustava i pretpostavlja da će sljedeći blok dobiti vaditelja, koji nije zainteresiran za očuvanje subvencije bivšeg, već će ih blokirati u korist svojih. Čak i u slučaju da to nije istina, zlonamjerni vaditelj s visokom stopom raspršenja i dalje će trebati najmanje \((\text{number for majority}/2)+1\) glasova u korist njihovog prethodnog bloka Kako bi stvorili blok koji im daje bilo kakvu subvenciju iz prethodnog bloka.

Bitne zastavice izričito su dodane i zaglavlju bloka i glasovima tako da rudar može lako glasovati u novim teškim ili laganim grananjem.

---

## <i class="fa fa-book"></i> Preporuke 

[^1]: Bentov I., Lee C., Mizrahi A., Rosenfeld M. 2014. [Dokaz-o-aktivnosti: Proširivanje Bitcoinovog dokaza o radu preko dokaznog uloga](https://decred.org/research/bentov2014.pdf).
[^2]: Nakamoto S. 2008. [Bitcoin: Elektronički gotovinski sustav peer-to-peer](https://decred.org/research/nakamoto2008.pdf).
