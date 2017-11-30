# Simnet

---

## Yleistä

Decred-applikaatioita kehitettäessä tai mahdollisia muutoksia testatessa, on erittäin hyödyllistä tehdä se testiverkossa, jossa vaikeustaso on riittävän alhainen että lohkoja pystyy ratkaisemaan tarpeen mukaan.

Luodakseen puitteet tälle, dcrd tarjoaa simulation networkin (`--simnet`). Seuraavassa perustiedot sen tärkeimmistä ominaisuuksista jotka erottavat sen main networkista:

* Vaikeustaso on aluksi erittäin matala jotta nopea CPU-louhinta olisi mahdollista
* Verkon muutokset:
    * All code related to peer discovery and IP address dissemination is disabled to help ensure the network remains private
    * Peer- ja RPC-verkot käyttävät eri porttia
    * Peer-to-peer viestiprotokollassa käytetään uniikkia verkon bittijärjestystä jolloin lohkot eivät voi vahingossa sekoittua pääverkon kanssa
* Kaikki ketjun ja osoitteiden parametrit ovat uniikkeja, jotta niitä ei sekoittaisi main networkiin:
    * Eri genesis lohko
    * Osoitteet alkavat eri etuliitteillä:
        * Standardi pay-to-pubkeyhash (P2PKH) alkaa isolla `S`-kirjaimella
        * Standardi pay-to-scripthash (P2SH) alkaa pienellä `s`-kirjaimella 
    * Exported hierarchical deterministic extended keyt (BIP32) alkavat eri etuliitteillä:
        * Julkiset extended keyt alkavat `spub`
        * Privaatit extended keyt alkavat `sprv`
    * HD key patheissa käytetty BIP44 kolikkotyyppi on pieni `s`

  ---

## Alkuun Pääseminen

Yksittäisen `dcrd` noden pyörittäminen simnetissä tapahtuu yksinkertaisesti käynnistämällä `dcrd` `--simnet` flägillä. Tosin, jotta se olisi oikeasti hyödyllistä, on toivottavaa että pystyt myös lähettämään kolikoita eri osoitteiden välillä, jolloin tarvitaan louhittuja lohkoja ja yhteyttä lompakkoon.

Lisäksi, koska uudessa yksityisessä verkossa ei ole vielä olemassa kolikoita, aluksi pitää louhia muutamia lohkoja, joista saat maksun omistamaasi osoitteeseen jotta saat kolikoita jotka ovat valmiit käytettäväksi.

Kuten edellä mainittu, simnet käyttää uniikkeja osoitteita välttääkseen sekoittumasta pääverkon kanssa. Täten on tarpeen käyttää lompakkoa joka tukee osoiteformaattia. `dcrwallet` käynnistettynä `--simnet`-flägillä toimii tähän tarkoitukseen.

Seuraavassa komentoja joilla pääset alkuun:

**HUOM: Nämä komennot ovat kaikki yksinkertaistettavissa tekemällä konfiguraatio-tiedostot ja käyttämällä niitä, tosin komennot tässä käyttävät kaikkia komentojono-switchejä näyttääkseen tarkasti mitä mihinkin tarvitaan.**

* Käynnistä dcrd simnetissä:

    `$ dcrd --simnet --rpcuser=<username> --rpcpass=<password>`

* Tee uusi simnet lompakko:

    `$ dcrwallet --simnet --create`

* Käynnistä dcrwallet simnetissä:

    `$ dcrwallet --simnet --username=<username> --password=<password>`

* Tee uusi simnet Decred osoite:

    `$ dcrctl --simnet --wallet --rpcuser=<username> --rpcpass=<password> getnewaddress`

* Lopeta dcrd prosessi ja käynnistä se uudelleen edellisen komennon output asetettuna louhinta-osoitteeksi:

    `$ dcrd --simnet --rpcuser=<username> --rpcpass=<password> --miningaddr=<S....>`

* Ohjeista dcrd generoimaan riittävästi lohkoja, jotta ensimmäiset kolikot kypsyvät:

    `$ dcrctl --simnet --rpcuser=<username> --rpcpass=<password> generate 100`

* Tarkista lompakon saldo varmistaaksesi että kolikot ovat käytettävissä:

    `$ dcrctl --simnet --wallet --rpcuser=<username> --rpcpass=<password> getbalance`
  
Nyt sinulla on täysin toimiva privaatti simnet käynnissä, ja kolikoita joita voit lähettää muihin simnet osoitteisiin. Milloin tahansa yksi tai useampi siirto lähetetään, tarvitaan `generate 1` RPC jotta uusi lohko, johon siirto sisältyy, louhitaan.
