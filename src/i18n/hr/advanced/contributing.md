# Decred iznošenje zahtjeva i doprinosa 

---

Svi kodovi Decreda zadržavaju se na GitHubu. Ovaj dokument pruža neke osnovne informacije o tome kako postupamo s doprinosima kodova i nekim osnovnim informacijama o tome kako pridonijeti. Djelomično se temelji na sličnom dokumentu iz [btcsuite](https://github.com/btcsuite).

---

## Početna priprema 

Dobar je prvi korak pročitati [Dokumentaciju Vodič Doprinos Kodova](https://github.com/decred/dcrd/blob/master/docs/code_contribution_guidelines.md) da biste dobro razumjeli strategiju koja se koristila za projekt. Taj dokument prvenstveno je usmjeren na Izlaznim baznim kodovima, ali to je ipak dobar početak.

Slijedeći primjeri će biti podijeljeni u dva odjeljka, jedan za Izlazne projekte (dcrd, dcrwallet, gominer, itd.), a drugi za projekte koji ne koriste Izlaze (decrediton, Paymetheus, dcrdocs, itd.). U svakom slučaju, svakako provjerite README.md svakog projekta ako vam je potrebna pomoć pri postavljanju određenog projekta.

---

## Opći Model 

Ovim procesom nastojimo omogućiti jednostavan doprinos uz zadržavanje visoke razine kvalitete kodova i čiste povijesti. Članovi Decred tima moraju slijediti iste postupke kao i vanjski suradnici.

Naš model za knjiženja koda u strukturalnom obliku je sljedeći. Ako bilo što od ovoga nema smisla, ne brinite, to će biti detaljnije objašnjeno u sljedećim odjeljcima.

1. Pronađite problem na kojem želite raditi. Ako nema nekoga koji opisuje vaš problem, otvorite jednu s onim što ćete učiniti.
1. Napravite promjene koda unutar grane.
1. Unesite te promjene na svoj vlastito grananje unosa GitHuba.
1. Kada je vaš kôd spreman za pregled ili kada samo želite unesti iz drugih aplikacija, otvorite Zahtjev za Iznošenje (PR) kod glavnog unosa s GitHub web stranice.
1. Dodajte komentar na PR koji govori o problemu koji popravljate. Stavite tekst Zatvoreno # ili Popravci # i u nastavku broj problema na istoj liniji. To će omogućiti GitHubu da automatski poveže PR s problemom i zatvori problem kada je PR zatvoren.
1. Možete zatražiti određenog recenzenta s GitHub web stranice ili možete zatražiti od nekoga da ga pregleda na irc/slacku.
1. Sve kôdove morate se pregledati i dobiti barem jedno odobrenje prije prijave. Samo članovi tima mogu dati službeno odobrenje, ali se potiču komentari drugih korisnika.
1. Ako su zatražene izmjene, unesite te promjene i pošaljite ih u svoju lokalnu podružnicu.
1. Unesite te izmjene na istu granu koju ste uknjižili. Oni će se pojaviti na PR-u na taj način, a recenzent će ih moći usporediti s prethodnom verzijom.
1. Once your code is approved, it can be merged into master.  To keep history clean, we only allow non-fast-forward merges (that means we want a linear history).  Most PRs also must be squashed to a single commit (although if there is reason to have it as multiple commits that can be considered on a case by case basis).
1. Ako je vaš PR jedan jedan uradak (ili može biti automatiziran pomoću GitHub-a) i može se spojiti s glavnim, recenzent će spojiti vaš PR. Ako je vaša grana bila previše udaljena, od vas će se možda tražiti da odbijete svoj uradak. Kada je gotovo i unešeno, recenzent će spojiti vaše uratke.

---

## Izlaz 

Za projekte koji upotrebljavaju Izlaz, možete pratiti ovaj postupak. Kao primjer poslužit će dcrd. Time se pretpostavlja da već imate go1.6 ili noviji instaliran i radni `$GOPATH`.

### Jednokratna instalacija
- Razgranajte dcrd na GitHub
- Pokrenite sljedeće naredbe da biste nabavili dcrd, sve ovisnosti i instalirajte ga:

```bash
$ mkdir -p $GOPATH/src/github.com/decred/
$ git clone https://github.com/decred/dcrd $GOPATH/src/github.com/decred/dcrd
$ cd $GOPATH/src/github.com/decred/dcrd
$ go dep ensure
$ go install . ./cmd/...
```

- Dodajte daljinsko sredstvo za upravljanje za grananjem:

```bash
$ git remote add <yourname> https://github.com/<yourname>/dcrd.git
```

## Ostali projekti 

Za projekte koji nisu napisani u Izlazu, početno podešavanje ovisit će o projektu. Ovdje ću koristiti dcrdocs kao primjer, ali osnovni koraci su isti za bilo koji od projekata. Posebno postavljanje može se pogledati u projektu README.md (na primjer, kako instalirati mkdocs za rad na dcrdocs ili elektron za decrediton).

### Jednokratna instalacija
- Razgranajte dcrdocs na GitHubu
- Pokrenite sljedeće naredbe da biste nabavili dcrd, sve ovisnosti i instalirajte ih:

```bash
$ mkdir -p code/decred
$ cd code/decred
$ git clone https://github.com/decred/dcrdocs
$ cd dcrdocs
```

- Dodajte daljinsko sredstvo za vaše grananje:

```bash
$ git remote add <yourname> https://github.com/<yourname>/dcrdocs.git
```

## Stvarenje novih značajki za iznošenje zahtjeva 
- Pronađite ili stvorite problem na unosu GitHuba (izvorni, a ne vaše grananje) za značajku na kojoj želite raditi.
- Provjerite novu značajku grane kako biste potaknuli promjene koje ćete napraviti:

```bash
$ git checkout -b <feature_branch>
```
- Make whatever changes are necessary for the feature and commit them
- Push your feature branch to your fork:

```bash
$ git push <yourname> <feature_branch>
```
- S vašim pretraživačam, otvorite https://github.com/decred/dcrd
- Stvorite iznošenje zahtjeva s GitHub UI. Možete zatražiti recenziju na internet stranici GitHub ili možete pitati nekog na irc/slack.

## Postavljanje novih osnova na postojeće iznošenje zahtjeva 

Poneka će se od vas tražiti da ponovno postavite osnove i dodate iznošenje zahtjeva zadnjoj glavnoj grani.

- Provjeriti jeli je glavna grana ažurirana:

```bash
$ git checkout master
$ git pull
```
- Provjerite postojeće značajke grane i stvorite nove osnove s interaktivnom zastavom:

```bash
$ git checkout <feature_branch>
$ git rebase -i master
```
- Follow the directions presented to specify 's' meaning squash for the additional commits (the first commit must remain 'p' or 'pick').
- Napišite jednu poruku o uratku u uređivač koji ste postavili za pokrivanje svih uključenih uradaka.
- Spremite i zatvorite urednik, a sredstvo bi trebalo generirati jedinstveni uradak sa navedenom porukom i sa svim uratcima koje ste dodali. Možete provjeriti uratke pomoću naredbe ```git show```.
- Prisilite spajanje grane vašem grananju:

```bash
$ git push -f <yourname> <feature_branch>
```

## Ostala  Razmatranja 

Postoji još nekoliko stvari koje treba razmotriti prilikom iznošenja zahtjeva. U slučaju izlaznog koda već postoji značajna pokrivenost testovima. Ako dodajete kôd, trebali biste dodati i testove. Ako popravljate nešto, morate se pobrinuti da ne prekršite postojeće testove. Za izlazni kôd, postoji skripta ```goclean.sh``` u svakom unosu pokreću se testovi i sve statičke provjere koje imamo. Nikakav kôd će biti prihvaćen bez prolaska svih testova. U slučaju čvora.js koda (decrediton), svi kodovi moraju se zapisati. To možete provjeriti pomoću naredbe ```npm run lint```.

Konačno, svaki unos ima LICENCU. Vaš novi kod mora biti pod istom LICENCOM kao i postojeći kôd i mora se dodijeliti autorsko pravo na 'Decred Developers'. U većini slučajeva to je vrlo liberalna licenca za ISC, ali nekoliko unosa su različiti. Provjerite da je unos siguran.

Ako imate bilo kakvih pitanja za doprinos, slobodno pitajte na irc/slack ili GitHub. Članovi Decred tima (i vjerojatno i članovi zajednice) će vam rado pomoći.
