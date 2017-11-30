# Proof-of-Stake (PoS)-louhinta

Viimeksi päivitetty v1.0.0

Tämän dokumentin tarkoitus on olla opetusmateriaali Decredin Proof-of-Stake-louhintaan (staking). Se sisältää selvityksen Proof-of-Stake-protokollan tarkoituksesta, lyhyen esittelyn stakingprosessiin, lipukkeen elinkaaren, ja aloitusohjeet lipukkeiden ostoon.

---

## Yleiskatsaus

Decredin uniikki Proof-of-Stake-protokolla palvelee useita tarkoituksia:

Tarjota stakeholdereille/käyttäjille mahdollisuus osallistua konsensus-päivityksistä päättämiseen. Toisin sanoen, stakeholderit voivat äänestää tietyistä ehdotuksista/agendoista Decred-lohkoketjussa. Agendat voivat esimerkiksi sisältää päätöksen siitä, käyttääkö dev team aikaa tietyn ominaisuuden toteuttamiseen, tai aktivoidaanko koodi joka sisältää jo toteutetun ominaisuuden, tai muuta päätöksentekoa siitä miten developement-rahastoa pitäisi käyttää. Lisätietoa äänestämisestä löytyy  [Mainnet Äänestysoppaasta](/getting-started/user-guides/agenda-voting.md).

Decredin PoS tarjoaa myös järjestelmän jolla tarkistetaan että louhijat noudattavat sääntöjä. Stakeholderit voivat äänestää lohkon mitätöimisestä jos se ei noudata verkon konsensus-sääntöjä.

---

## Staking 101 

Osallistuakseen proof-of-stake-louhintaan, stakeholderit lukitsevat tietyn määrän DCR:ää saadakseen lipukkeen. Jokainen lipuke antaa stakeholderille oikeuden äänestää kerran. Äänestyksen yhteydessä pieni palkkio sekä alkuperäinen **Ticket Price** palautetaan lipukkeen omistajalle. Lipukkeet valitaan äänestämään satunnaisesti, niin että keskimääräinen äänestysaika on 28 päivää, mutta mahdollisesti jopa 142, ja 0.5% todennäköisyydellä lipuke vanhenee ennen kuin se valitaan äänestämään (jolloin **Ticket Price** ilman palkkiota palautetaan). Jokaisen lohkon tulee sisältää 5 ääntä (louhijaa rangaistaan palkkion pienennyksellä jos lohko sisältää alle 5 ääntä). Jokainen louhittu lohko voi myös sisältää 20 uutta lipukkeenostoa. Uusi lipuke tarvitsee 256 lohkoa kypsyäkseen ennen kuin se lisätään **Ticket Pool*iin ja se voidaan kutsua äänestämään.

On syytä tutustua muutamaan tärkeään muuttujaan kun stake-louhit.

144 lohkon välein (~12 tuntia) stake-vaikeusastealgoritmi laskee uuden **lipukkeen hinnan** tarkoituksena pitää **Ticket Pool** lähellä sen tavoitekokoa, 40,960 lipuketta. Tätä 144 lohkon ikkunaa kutsutaan nimellä `StakeDiffWindowSize`.

**Ticket Price**/**Stake Difficulty** on hinta jonka maksat lipukkeesta yhden 144 lohkon ikkunan aikana.

**Ticket Pool** on Decred-verkossa olevien lipukkeiden yhteenlaskettu määrä.

**Ticket Fee** (`ticketfee`) on siirtomaksu joka pitää sisällyttää lipukkeen ostoon jotta Proof-of-Work-louhijoilla on kannustin sisällyttää kyseinen lipuke uuteen lohkoon. **Ticket Fee** viittaa tavallisesti DCR/kB -kurssiin lipukkeen ostosiirrosta. Näin ollen, mitä isompi siirron koko, sitä isomman maksun päädyt maksamaan. Esimerkiksi, soolo-stake-lipukeostot ovat noin 300 bittiä, joka tarkoittaa että 0.3DCR/kB suuruinen **Ticket Fee** johtaa 0.1 DCR suuruiseen maksuun jos, ja vain jos, kyseinen lipuke sisällytetään lohkoon.

Kun **Ticket Price** putoaa verraten alas yhden **Ticket Window**n ajaksi, on odotettavissa että syntyy fee market, kun useat stakeholderit yrittävät ostaa lipukkeita ennen kuin ikkuna päättyy. Jos **Ticket Price** ei ole äärimmäisen matalassa ja voitollisessa hinnassa, 0.01 DCR/kB oletus **Ticket Fee** on yleensä riittävän suuri jotta lipuke lisätään lohkoon.

Kun lipuke kutsutaan äänestämään, lompakon jolla on lipukkeen äänestysoikeus pitää olla online. Jos lompakko ei ole online äänestääkseen, lipuke merkataan `missatuksi` ja et saa palkkiota kyseisestä lipukkeesta. Stakepoolit ovat hyvä ratkaisu niille jotka eivät voi pitää äänestyslompakkoaan online 24/7.

Stakepoolit sallivat käyttäjien tehdä lipuukkeenostosiirtoja jotka antavat lipukkeesi äänioikeuden poolille. Pool äänestää puolestasi, yleensä ottaen pienen maksun osallistumisesta (alle 7%) jolla katetaan hosting-maksut vähintään 3 poolin pyörittämiseen tarvittavasta serveristä. Tämä maksu tunnetaan nimellä **Pool Fee** ja otetaan vain pienestä PoS-palkkiosta. Lista stakepooleista löytyy [alta](#list-of-stakepools).

---

## Lipukkeen elinkaari

Lipukkeen ostaminen PoS:ia varten on melko yksinkertaista (lue alla) mutta mitä tapahtuu oston jälkeen?
Main net -lipuke (testnet käyttää eri parametrejä) käy läpi useita vaiheita elinkaarensa aikana:

1. Voit ostaa lipukkeita Paymetheus <!--, Decrediton,--> tai dcrwallet -lompakoilla. Jokaisen yksittäisen lipukesiirron kokonaishinnan tulisi olla **Lipukkeen Hinta** + **Lipuke-maksu**(`ticketfee`).
2. Lipukkeesi menee `mempool`iin. Siellä se odottaa että se louhitaan PoW-louhijoiden toimesta. Vain 20 uutta lipuketta louhitaan jokaiseen uuteen lohkoon.
3. Lipukkeet louhitaan lohkoon siten että korkeamman **Ticket Fee**n sisältävät siirrot saavat korkeamman prioriteetin. Huomioi että **Ticket Fee** on DCR per KB. Tavallisia siirron kokoja ovat 298 bittiä (soololipukkeen osto) ja 539 (lipukkeen osto poolin kautta).
4. **A -** Jos lipukkeesi louhitaan lohkoon, siitä tulee kypsymätön lipuke. Tämä tila kestää 256 lohkon ajan (n. 20 tuntia). Tänä aikana lipuke ei voi äänestää. Tässä kohtaa, lipukemaksua ei voida palauttaa. <br />
**B -** Jos lipukettasi ei louhita, sekä **Lipukkeen Hinta** että **Lipukemaksu** palautetaan oston tehneelle tilille.
5. Kun lipukkeesi kypsyy (256 Lohkoa), se lisätään **Ticket Pool**iin ja voi tämän jälkeen äänestää.
6. Lipukkeen todennäköisyys päästä äänestämään perustuu Poissonin jakaumaan 28 päivän keskiarvolla. 28 päivän jälkeen lipuke on äänestänyt 50% todennäköisyydellä.
7. Koska voting poolin tavoitekoko on 40960 lipuketta, jokaisella lipukkeella on 99.5% todennäköisyys päästä äänestämään ~142 päivän (noin 4.7 kuukautta) aikana. Jos tämän ajan jälkeen lipuke ei ole äänestänyt, se vanhenee. Alkuperäinen **Ticket Price** palautetaan sinulle.
8. Lipuke saattaa missata kutsun äänestämään jos äänestyslompakkosi ei vastaa tai kaksi validia lohkoa löydetään peräjälkeen. Jos näin käy, alkuperäinen **Ticket Price** palautetaan sinulle.
9. Kun lipuke on äänestänyt, missannut tai vanhentunut, varat (lipukkeen hinta ja mahdollinen palkkio, miinus siirtomaksu) saavat immature statuksen 256 lohkon ajaksi, jonka jälkeen ne ovat käytettävissä. Jos lipuke on missannut tai vanhentunut, lipukkeen peruutussiirron tekee lompakko joka siten vapauttaa lukitut ticket outputit. **HUOM:** Peruutuksen voi tehdä vain vastaavalle missatulle lipukkeelle. Lipuketta ei voi peruuttaa ennen kuin se on missannut.

---

## Kuinka Stake-louhia

Stake-louhintaa varten on *erittäin suositeltavaa* pitää lompakkoa päällä ja lukitusta avattuna 24/7. Vähäisempi uptime saattaa johtaa äänestyksen missaamiseen ja palkkion menettämiseen. Niille jotka eivät voi pitää lompakkoaan online 24/7 on tarjolla stakepooleja.

Ainut vaatimus stake-louhintaan on että ostat lipukkeen. Alta löydät oppaat lipukkeiden ostoon [Paymetheukselle](#paymetheus) ja [dcrwalletille](#dcrwallet).

Jos aiot käyttää stakepoolia, sinun pitää ensin liittyä sellaiseen. Linkkejä virallisesti tunnettuihin stakepooleihin löydät [täältä](#list-of-stakepools).

---

## Paymetheus

Paymetheus-applikaatio ei itsessään pysty äänestämään, mikä tarkoittaa että äänioikeus pitää antaa stakepoolille.

Tutustu [Lipukkeiden Osto-opas](/getting-started/user-guides/using-paymetheus.md#purchase-tickets-tab)-oppaaseen Paymetheukselle selvittääksesi kuinka ostat lipukkeita stakepoolia ja Paymetheusta käyttäen.

---

## dcrlompakko

[Lipukkeiden ostaminen dcrwalletilla](/getting-started/user-guides/dcrwallet-tickets.md)-opas näyttää kuinka ostat lipukkeita manuaalisesti tai automaattisesti pool- tai soolo-stakea varten.

---

## <i class="fa fa-life-ring"></i> Lista Stakepooleista

Nämä stakepoolit ovat virallisesti tunnettuja:

* [<i class="fa fa-external-link-square"></i>https://dcr.stakepool.net ](https://dcr.stakepool.net)
* [<i class="fa fa-external-link-square"></i> https://dcr.stakeminer.com](https://dcr.stakeminer.com)
* [<i class="fa fa-external-link-square"></i> https://pool.d3c.red](https://pool.d3c.red)
* [<i class="fa fa-external-link-square"></i> https://stakepool.dcrstats.com](https://stakepool.dcrstats.com)
* [<i class="fa fa-external-link-square"></i> https://stake.decredbrasil.com](https://stake.decredbrasil.com)
* [<i class="fa fa-external-link-square"></i> https://stakepool.eu](https://stakepool.eu)
* [<i class="fa fa-external-link-square"></i> https://dcr.ubiqsmart.com](https://dcr.ubiqsmart.com)
* [<i class="fa fa-external-link-square"></i> https://ultrapool.eu](https://ultrapool.eu)

Löydät vertailun poolien maksuista ja statistiikasta
[<i class="fa fa-external-link-square"></i> Decredin websivuilta](https://decred.org)
klikkaamalla 'Stakepools'-linkkiä sivun alareunassa.

---

<!-- TODO: **Purchasing Tickets with Decrediton** -->

## Lisätietoa

[Mainnet Äänestysopas](/getting-started/user-guides/agenda-voting.md)

[Proof-of-Stake Komennot](/advanced/program-options.md#pos-commands)

[Proof-of-Stake FAQ - Yleiset](/faq/proof-of-stake/general.md)

[Proof-of-Stake FAQ - Lipukkeiden Ostaminen ja Maksut](/faq/proof-of-stake/buying-tickets-and-fees.md)

[Proof-of-Stake FAQ - Soololouhinta](/faq/proof-of-stake/solo-mining.md)

[Proof-of-Stake FAQ - Stakepoolit](/faq/proof-of-stake/stake-pools.md)

[Proof-of-Stake FAQ - Äänetyslipukkeet](/faq/proof-of-stake/voting-tickets.md)

[Proof-of-Stake-louhinnan Parametrit](/advanced/program-options.md#pos-network-parameters)
