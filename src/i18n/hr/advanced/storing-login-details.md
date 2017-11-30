# <i class="fa fa-hdd-o"></i> Pohranjivanje pojedinosti o prijavi

Svi parametri koji su navedeni u naredbenom retku tijekom pokretanja dcrda,
dcrračuna i dcrctla također se mogu čuvati u konfiguracijskim datotekama. Ovo je
dobar je način pohranjivanja vjerodajnica za prijavu tako da ih ne trebate uključiti u skripte ili ih upisati svo vrijeme u terminal.

---

## <i class="fa fa-laptop"></i> Osnovne datoteke konfiguracije 

Ako niste upoznati s osnovama konfiguracijskih datoteka, pregledajte informacije pronađene na stranici [Uvod Opcija Pokretanja](/getting-started/startup-basics.md#configuration-files) page.

---

## <i class="fa fa-terminal"></i> dcrd.conf 

Odaberite bilo koje korisničko ime i zaporku koje želite u sljedećim koracima. Ne morate ih registrirati nigdje i oni će se koristiti samo za dopuštanje `dcrwallet` i `dcrctl` da komuniciraju s `dcrd`.

> Korištenje datoteke konfiguracije uzorka

Slijedite korake u nastavku ako ste već kopirali uzorak konfiguracijskih datoteka u odgovarajuće imenike.

1. Idite do mape aplikacija `dcrd` kako je opisano u našem [Uvod Opcija Pokretanja](/getting-started/startup-basics.md#configuration-files). 
2. Otvorite `dcrd.conf` u uređivaču teksta.
3. Pronađite sljedeće retke:

    `;rpcuser=` <br />
    `;rpcpass=`

4. Poništite komentare linija uklanjanjem polu-kolone i dodajte svoje korisničko ime i zaporku u odgovarajućim redcima.

> Izrada nove datoteke konfiguracije

Slijedite niže navedene korake ako ste **niste** kopirali konfiguracijske datoteke uzorka u odgovarajuće imenike.

1. Prijeđite na mapu aplikacije `dcrd` kako je gore opisano u našim [Uvod Opcija Pokretanja](/getting-started/startup-basics.md#configuration-files).
2. Izradite novu tekstualnu datoteku.
3. Preimenujte ga `dcrd.conf`.
3. Otvorite `dcrd.conf` u uređivaču teksta.
4. Dodajte sljedeće retke:

```no-highlight
[Application Options]

rpcuser=<username>
rpcpass=<password>
```

---

## <i class="fa fa-terminal"></i> dcrračun.konf 

Postupak za `dcrwallet.conf` vrlo je sličan postupku za `dcrd.conf`. 

Imajte na umu da ako vrijednosti `username=` i `password=` u `dcrwallet.conf` ne odgovaraju vrijednostima `rpcuser=` i `rpcpass=` u  `dcrd.conf`, morat ćete postaviti `dcrdusername=` i `dcrdpassword=`  u `dcrwallet.conf` vrijednostima `rpcuser`/`rpcpass` pronađenim u `dcrd.conf` (najlakše je postaviti sva korisnička imena/zaporke jednake).

> Korištenje datoteke konfiguracije uzorka

Slijedite korake u nastavku ako ste već kopirali datoteke konfiguracije uzorka u odgovarajuće imenike.

1. Idite do mape aplikacije `dcrwallet` kako je opisano u našem [Uvod Opcija Pokretanja](/getting-started/startup-basics.md#configuration-files). 
2. Otvorite `dcrwallet.conf` u uređivaču teksta.
3. Pronađite sljedeće retke:

    `;username=` <br />
    `;password=`

4. Poništite komentare linija uklanjanjem polu-kolone i dodajte svoje korisničko ime i zaporku odgovarajućim redcima.

> Izrada nove datoteke konfiguracije

Slijedite niže navedene korake ako ste **niste** kopirali konfiguracijske datoteke uzorka u odgovarajuće imenike.

1. Idite do mape aplikacije `dcrwallet` kako je opisano u našem [Uvod Opcija Pokretanja](/getting-started/startup-basics.md#configuration-files).
2. Izradite novu tekstualnu datoteku.
3. Preimenuj ga `dcrwallet.conf`.
3. Otvorite `dcrwallet.conf` u uređivaču teksta.
4. Dodajte sljedeće retke:

```no-highlight
[Application Options]

username=<username>
password=<password>
```

Ako postavite opcionalnu javnu lozinku za račun (druga lozinka tijekom 
kreiranja računa) možete dodati i to u `dcrwallet.conf`:

```no-highlight
walletpass=<yourwalletpassword>
```

U konfiguracijskim datotekama ne možete navesti zaporku za privatni račun. To mora biti uneseno ručno pomoću `dcrctl`. 

---

## <i class="fa fa-terminal"></i> dcrctl.konf 

Ponovo je najjednostavnije postaviti iste korisnička imena/zaporke u `dcrd.conf`, `dcrwallet.conf`, i `dcrctl.conf`. Ako ste upotrijebili različite vjerodajnice za dcrračun, morat ćete ovdje odrediti jedan, a drugi na naredbenom retku prilikom izdavanja naredbi.

> Korištenje datoteke konfiguracije uzorka

Slijedite korake u nastavku ako ste već kopirali datoteke konfiguracije uzorka u odgovarajuće imenike.

1. Idite do mape aplikacije `dcrctl` kako je opisano u našem [Uvod Opcija Pokretanja](/getting-started/startup-basics.md#configuration-files). 
2. Otvorite `dcrctl.conf` u uređivaču teksta.
3. Pronađite sljedeće retke:

    `;rpcuser=` <br />
    `;rpcpass=`

4. Poništite komentare linija uklanjanjem polu-kolone i dodajte svoje korisničko ime i zaporku u odgovarajućim redcima.

> Izrada nove datoteke konfiguracije

Slijedite niže navedene korake ako ste **niste** kopirali konfiguracijske datoteke uzorka u odgovarajuće imenike.

1. Idite do mape aplikacije `dcrctl` kako je opisano u našim [Uvod Opcija Pokretanja](/getting-started/startup-basics.md#configuration-files).
2. Izradite novu tekstualnu datoteku.
3. Preimenujte ga `dcrctl.conf`.
3. Otvorite `dcrctl.conf` u uređivaču teksta.
4. Dodajte sljedeće retke:

```no-highlight
[Application Options]

rpcuser=<username>
rpcpass=<password>
```

---

## <i class="fa fa-tasks"></i> Dodatne opcije konfiguracije

Sve opcije naredbenog retka mogu se staviti u konfiguracijsku datoteku.Jednostavne datoteke konfiguracije u priloženom paketu daju dodatne opcije ili možete pokrenuti neki od programa s `-h` zastavom kako biste prikazali popis i opis svih opcija za navedenu aplikaciju.

Tu je i potpuni popis opcija za svaku aplikaciju koja se može naći [ovdje](/advanced/program-options.md).
