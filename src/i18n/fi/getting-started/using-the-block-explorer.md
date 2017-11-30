# <i class="fa fa-cubes"></i>Lohkohaun käyttö

---

## <i class="fa fa-info-circle"></i> Yleiskatsaus

Decred-verkolle on tarjolla [Insight](https://github.com/bitpay/insight-ui)-pohjainen
lohkohaku. Kaikki lohkot ja siirrot Decredin lohkoketjussa
ovat tarkasteltavissa tässä lohkohakupalvelussa, osoitteessa
[`https://mainnet.decred.org`](https://mainnet.decred.org) ja
[`https://testnet.decred.org`](https://testnet.decred.org) testnet-lompakolle.
Alla lyhyt katsaus lohkohausta saatavilla oleviin tietoihin.

Valinta         | Selitys
---            | ---
`Height`       | Lohkon numero.
`Age`          | Kuinka kauan sitten kyseinen lohko lisättiin lohkoketjuun.
`Transactions` | Lohkossa olevien siirtojen määrä.
`Votes`        | Lohkossa olevien proof-of-stake -äänten määrä.
`Fresh Stake`  | Uusien lipukkeiden määrä tässä lohkossa.
`Size`         | Lohkon koko (biteissä).

Kohdassa `Latest Transactions`, näet siirtotunnuksen (txid) ja
arvon (DCR:ssä) välitettynä verkon halki.

---

## <i class="fa fa-cube"></i> Lohkot

Lohkoja voidaan etsiä hakemalla niiden lohkokorkeus-numeroa,
klikkaamalla `Height`-arvoa kotisivulla, tai hakemalla niiden
`BlockHash`-arvoa. Vanhemmilla lohkoilla on pienempi lohkonumero. Ylempi
puolikas lohkon yleiskatsauksessa näyttää tietoa tästä tietystä
lohkosta. Tämä informaatio sisältää: lohkokorkeuden, lohkon
hash-arvon, sekä useita tärkeitä verkon parametrejä, kuvattuna alla:

Valinta                   | Selitys
---                      | ---
`Number of Transactions` | Standardisiirtojen määrä (DCR:ää lähetetty käyttäjältä toiselle).
`Height`                 | Lohkoketjun korkeus jossa tämä lohko sijaitsee.
`Block Reward`           | Tässä lohkossa louhittujen DCR:ien määrä.
`Timestamp`              | Kellonaika jolloin louhija loi lohkon ja liitti sen lohkoketjuun.
`Merkle Root`            | Kaikkien tämän lohkon sisältämien siirto-hashien hash-arvo.
`Stake Root`             | Kaikkien stakeen liittyvien siirto-hashien hash-arvo tässä lohkossa. Tähän sisältyy lipukkeen ostot, äänet ja lipukkeiden peruutukset.
`VoteBits`               | (1) proof-of-stake-äänestäjät hyväksyivät lohkon. (2) proof-of-stake-äänestäjät hylkäsivät lohkon ja kaikki muut kuin stake-siirrot lohkossa mitätöitiin, kuten myös proof-of-work-louhijan ja kehitystyön palkkiot.
`Final State`            | Lipukkeiden valitsemiseen käytettävän pseudo random number generatorin lopputila.
`Voters`                 | Tässä lohkossa onnistuneesti annettujen äänien määrä. Maksimimäärä on 5.
`Fresh Stake`            | Tässä lohkossa vahvistettujen uusien lipukeostojen määrä.
`Revocations`            | Äänestämättä jättäneiden ja täten peruutettujen lipukkeiden määrä.
`PoolSize`               | Aktiivisten proof-of-stake-lipukkeiden kokonaismäärä.
`Difficulty`             | Proof-of-work-verkon vaikeusaste.
`SBits`                  | Yhden proof-of-stake-lipukkeen hinta.
`Bits`                   | Tiivistetty versio verkon vaikeustasosta lohkon louhimisen hetkellä.
`Size`                   | Lohkon koko (biteissä).
`Version`                | Lohkon versio.
`Nonce`                  | Arvo jota louhija käyttää yrittäessään löytää lohkoon ratkaisua.

## <i class="fa fa-exchange"></i> Siirrot

Tämä osio listaa kaikki siirrot jotka louhittiin tähän lohkoon.
Siirrot valitaan verkon mempoolista siirtomaksun suuruusjärjestyksessä.
Kaikki siirrot lohkon yleiskatsauksessa seuraavat tätä järjestystä:
Standardi siirrot (peer-to-peer transfer), proof-of-stake-äänet,
proof-of-stake-lipukkeiden ostot. Seuraavissa osioissa käydään läpi
kaikki erityyppiset siirrot.

---

### Standardisiirrot

Tässä Decredin standardisiirron sisältämät tiedot.

Valinta              | Selitys
---                 | ---
`Size`              | Siirron koko biteissä.
`Fee rate`          | Verkon keräämien siirtomaksujen määrä (per kB).
`Received Time`     | Aika jolloin verkko on vahvistanut siirron.
`Mined Time`        | Aika jolloin louhija lisäsi siirron lohkoon.
`Included in Block` | Lohkonumero johon siirto tallennettiin.

Huom `Received Time`, `Mined Time`, ja `Included in Block` ovat vailla arvoa kunnes louhija vahvistaa siirron ja sisällyttää sen Decred-lohkoon. Kun siirto vahvistettu ja lisätty lohkoon, se katsotaan suoritetuksi.


---

### Lipukkeiden ostot

Lipukkeen ostolle (stake submission) on nähtävissä muutamia eroavaisuuksia
tavallisesta siirrosta.

Huomaa ero detaileissa: Sana `Ticket` on nähtävissä lähettäjän
lompakon yllä vasemmalla, ja sanat  `Subsidy Commitment`
näkyvät oikealla. Tämä kyseinen käyttäjä osti stake-lipukkeen 
hintaan 8.75411638 DCR ja sai vaihtorahaa 7.15994209 DCR.
Vasemmalla `Ticket`in alla listattu osoite on se missä käyttäjän
varat joilla tämä lipuke ostettiin ovat. Ensimmäinen output oikealla 
osoite jolla on tämän lipukkeen äänestysoikes. Toinen output,
`Subsidy Commitment`, on osoite johon palkkio maksetaan. Tämä ei 
vielä näy lohkohaussa tällä hetkellä. Kolmas ja viimeinen output
on osoite johon siirron vaihtoraha lähetetään.

---

### Proof-of-stake-äänet

Huomioi identifioivat termit yksityiskohdat-osiossa: `Vote`, `Stake
Base`, `Block Commitment`, ja `Vote Bits`:

Nämä avainsanat kertovat että tämä siirto on proof-of-stake-lipukkeen 
omistajan antama ääni. Tässä esimerkissä, käyttäjä
on aikaisemmin ostanut lipukkeen hintaan 8.99472311 DCR ja
saanut 10.82959184 DCR sen jälkeen kun ääni tässä siirrossa oli annettu.
