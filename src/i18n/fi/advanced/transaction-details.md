# Rahansiirrot yksityiskohtaisemmin

---

Decred-siirrot ovat DCR-siirtoja jotka kirjataan lohkoihin. Siirrot koostuvat pääasiassa inputeista ja outputeista, tosin ne sisältävät muutamia muitakin kenttiä dataa.


## Siirtoformaatti

Kenttä        | Kuvaus                                                                                    | Koko
---          | ---                                                                                            | ---
Versio      | Siirtoversio. Tämä numero kertoo miten siirto tulee tulkita  | 4 bittiä
Inputtien määrä  | Siirrossa olevien inputtien määrä koodattuna vaihtuvanpituiseksi kokonaisluvuksi                   | 1-9 bittiä
Inputit       | Sarjoitettu lista kaikista siirron inputeista                                                | Muuttuja
Outputtien määrä | Siirrossa olevien outputtien määrä koodattuna vaihtuvanpituiseksi kokonaisluvuksi                  | 1-9 bittiä
Outputit      | Sarjoitettu lista kaikista siirron outputeista                                               | Muuttuja
Lock time    | Aika jolloin siirto on käytettävissä. (yleensä nolla, jolloin sillä ei ole vaikutusta)       | 4 bittiä
Expiry       | Lohkokorkeus jossa siirto vanhenee eikä ole enää validi                       | 4 bittiä


### Inputit
Inputit käyttävät aikaisemmin tehtyjä outputteja. Transacion inputteja on kahta lajia: Witness ja non-witness.


#### Non-Witness Inputit
Non-witness siirto-input viittaa käyttämättömään outputtiin ja sarjanumeroon. Viittaus käyttämättömään outputtiin on nimeltään "outpoint". Outpointeilla on kolme kenttää:

Kenttä            | Kuvaus                                                                                                                           | Koko
---              | ---                                                                                                                                   | ---
Transaction hash | Käytetyn outputin sisältävän siirron hash-arvo                                                                     | 32 bittiä
Output index     | Käytettävän outputin luettelo                                                                                                   | 4 bittiä
Tree             | Missä treessä käytettävä output on. Tämä tarvitaan koska siirrot sijaitsevat lohkossa useammassa treessä. | 1 bitti

Outpointin lisäksi, non-witness inputit sisältävät sequence-numeron. Tällä numerolla on enemmän historiallista merkitystä kuin käytännön tarkoitusta; tosin, sen merkityksellisin käyttötarkoitus on maksujen "lukitseminen" niin että niitä ei voida lunastaa ennen tiettyä ajankohtaa.


#### Witness Inputit
Witness siirto-input sisältää tarvittavan tiedon jolla todistetaan että output voidaan käyttää. Witness inputit sisältävät neljä tietokenttää:

Kenttä            | Kuvaus
---              | ---
Arvo            | Kolikoiden määrä, jotka kulutettava output siirtää.
Lohkokorkeus     | Sen lohkon korkeus, jossa siirto jonka output käytetään, sijaitsee.
Block index      | Luettelo siirrosta jossa käytettävä output sijaitsee.
Signature script | Scripti joka täyttää käytettävän outputin scriptin vaatimukset.


### Outputit
Outputit ovat DCR-siirtoja jotka inputit voivat käyttää. Outputeissa on kolme datakenttää:

Kenttä             | Kuvaus                                                                                     | Koko
---               | ---                                                                                             | ---
Arvo             | Outputin lähettämä DCR:n määrä.                                                     | 8 bittiä
Versio           | Outputin versio. Tämä numero kertoo kuinka output tulisi tulkita. | 2 bittiä
Public key script | Scripti jonka vaatimukset outputin tulee täyttää                                           | Muuttuja

---

## Serialisointi
Yllä esitetty formaatti ei ole sama formaatti missä siirrot lähetetään ja otetaan vastaan. Kun siirtoja lähetetään tai otetaan vastaan, ne serialisoidaan muutamalla tavalla. Se miten siirto tulisi deserialisoida voidaan päätellä sen versiosta. Siirtoversiot täyttävät neljä bittiä, mutta näitä neljää bittiä käytetään usein tallentamaan kaksi eri arvoa. Ensimmäiset kaksi bittiä ovat itse version numero. Seuraavat kaksi tarkoittavat serialisointiformaattia.


### Serialisointiformaatit
Serialisoidessa, siirrolla on kaksi pääasiallista osaa: Sen "etuliite" ja sen witness data.
Siirron etuliite koostuu seuraavista:

* Inputit (ilman witness dataa)
* Outputit
* Lukitusaika
* Expiry

Siirron witness data sisältää vain sen inputit. Inputtien sisällytetyt datakentät riippuvat serialisointiformaatista. Tämä formaatti voi olla joku seuraavista:

* **0 (Full serialization)** - Siirron etuliite sijaitsee juuri ennen sen witness dataa.
* **1 (No witness)** - Siirron etuliite on ainut saatavilla oleva data.
* **2 (Only witness)** - Siirron witness data on ainut saatavilla oleva data. Jokaiselle inputille, tämä sisältää sen arvon, lohkokorkeuden, block indexin ja signature scriptin.
* **3 (Witness signing)** - Siirron witness data on ainut saatavilla oleva data, ja se on serialisoitu allekirjoitustarkoituksiin. Jokaiselle inputille, tämä sisältää vain sen signature scriptin.
* **4 (Witness signing with value)** - Siirron witness data on ainut saatavilla oleva data, ja se on serialisoitu allekirjoitustarkoituksiin. Toisin kuin Witness signing formaatti, tämä formaatti sisältää jokaisen inputin arvon ennen sen signature scriptiä.
