# Äänestyslipukkeet

---

#### 1. Milloin proof-of-stake-äänestäminen alkoi?

Proof-of-stake-äänestäminen alkoi[^7969] lohkossa 4,096.

---

#### 2. Lähdekoodissa TicketPoolSize on asetettu lukuun 8,192, mutta tämänhetkinen ticket poolin koko on tätä isompi. Miksi?

Tämä on tarkoituksenmukaista, ja tärkeä osa dynaamista lipukkeen hinnan mukauttamista[^8965]. `TicketPoolSize` on tavoiteltu ticket poolin koko ja se toimii melko lailla samoin kuin tavoiteltu vaikeusaste proof-of-work (PoW)-louhinnalle. Tavoitetta suurempi poolin koko aiheuttaa lipukkeen hinnan nousun, joka vuorostaan ennemmin tai myöhemmin vähentää ostettujen lipukkeiden määrää ja lopputuloksena pienentää lipukkeiden määrää poolissa lähemmäs tavoitemäärää. Jos määrä putoaa tavoitteen alle, hinta putoaa tarkoituksena rohkaista ihmisiä ostamaan lisää lipukkeita, joilla poolin koko kasvaa lähemmäs tavoitetta. 

---

#### 3. Jos olen huonotuurinen ja lipukkeeni vanhenee ennen kuin se on äänestänyt, menetänkö siirtomaksun?

Kyllä[^9806].

---

#### 4. Äänestys mainnetissä oli 'holdissa' lohkoon 4,096 asti, käyttäjien ostaessa lipukkeita. Tarkoittaako tämä että näillä lipukkeilla on reilusti korkeampi riski vanheta?

Ei[^9806], vanhenemisaika ei ala ennen kuin lipuke on louhittu mukaan lohkoon. Lipukkeet vain odottivat memory poolissa kunnes ne voitiin sisällyttää lohkoihin alkaen lohkosta 4,096.

---

#### 5. Mitä tapahtuu jos kukaan (tai alle 3) valituista äänestäjistä ei tee ssgen siirtoaan?

Äänet määritetään aina senhetkisen kärjen perusteella. Louhijat eivät aloita uuden lohkon louhimista ennen kuin vähintään 3+ valituista äänestäjistä tekevät ssgen siirtonsa. Eli, jos löydetty lohko ei onnistu saamaan valittuja ääniä[^10219], lohko yksinkertaisesti orpoutuu kun seuraava lohko löytyy.

Konkreettisemman esimerkin tähden, oletetaan että tämänhetkinen lohkokärki on lohko 5,000. Lohkon 5,000 päätetyt äänestäjät ovat jo äänestäneet, joten louhijat tahkoavat etsien lohkoa 5,001. Louhija löytää ratkaisun lohkolle 5,001 ja lähettää sen verkkoon. Kaikki daemonit (ja täten lompakot) näkevät että 5,001 on löytynyt. Mutta, louhijat eivät ala välittömästi louhimaan jatkoa lohkolle 5,001. Sen sijaan he jatkavat lohkosta 5,000 louhimista kunnes lohkolle 5,001 ilmaantuu 3+ ääntä. Jos nämä 3+ ääntä eivät koskaan ilmaannu, uusi 5,001 kandidaatti löydetään yhä lohkosta 5,000 eteenpäin työskentelevien louhijoiden toimesta. He sitten ilmoittavat verkkoon (eri) ratkaisun lohkolle 5,001. Koska molemmilla näistä uusista lohko 5,001-kandidaateista on eri hash-arvo, eri lipukkeet valitaan äänestämään.

---

#### 6. Mitä tapahtuu jos omistamani lipuke missaa äänestyksen?

Lompakkosi automaattisesti peruuttaa lipukkeen seuraavassa lohkossa sen missattua[^13912], eli saat ne takaisin heti missaamisen jälkeen kypsymättöminä varoina (eli ne eivät ole käytettävissä ennen kuin ne ovat kypsyneet 256 lohkon ajan).

Esimerkiksi:

```no-highlight
dcrctl --wallet getstakeinfo
```

Output          | Kuvaus
---             |---
`allmempooltix` | Kaikki mempoolissa olevat stake lipukkeet (odottavat että ne louhintaan lohkoon).
`ownmempooltix` | Mempoolissa olevat stake lipukkeet jotka ovat sinun (odottavat että ne louhintaan lohkoon).

---

#### 7. Mitä eroa on missatulla ja peruutetulla lipukkeella?

Missatut lipukkeet ovat lipukkeita jotka kutsuttiin äänestämään, mutta eivät tehneet niin. Missamisen jälkeen lipuke voidaan peruuttaa[^14763]. Lompakko peruuttaa kontrolloimansa missatut lipukkeet automaattisesti (olettaen että se ei ole lukittu, jolloin se voi allekirjoittaa peruutussiirron).

`rebroadcastmissed` ei tee muuta kuin pyytää network daemonia (`dcrd`) uudestaan hakemaan listan missatuista lipukkeista jotta voidaan tarkistaa tarvitseeko mitään peruuttaa. Normaalisti tähän ei ole tarvetta ellei peruutus ole esimerkiksi epäonnistunut lompakon ollessa lukittu. Toisin sanoen, jos huomaat että "revoked" ja "missed" eivät ole sama määrä, voi olla tarpeen käyttää komentoa `rebroadcastmissed`. Kuten sanottu, tähän on harvoin tarvetta sillä lompakko tekee sen automaattisesti käynnistyksen yhteydessä ja etsii missattuja lipukkeita joka lohkossa.

Jatka lukemaan [Proof-of-Work-louhinta](/mining/proof-of-work.md)

---

## <i class="fa fa-book"></i> Lähteet

[^7969]: Decred Forum, [Post 7,969](https://forum.decred.org/threads/531/#post-7969)
[^8965]: Decred Forum, [Post 8,965](https://forum.decred.org/threads/531/page-2#post-8965)
[^9806]: Decred Forum, [Post 9,806](https://forum.decred.org/threads/180/page-6#post-9806)
[^10219]: Decred Forum, [Post 10,219](https://forum.decred.org/threads/180/page-6#post-10219)
[^13912]: Decred Forum, [Post 13,912](https://forum.decred.org/threads/1271/#post-13912)
[^14763]: Decred Forum, [Post 14,763](https://forum.decred.org/threads/1335/#post-14763)
