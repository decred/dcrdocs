# <i class="fa fa-ticket"></i> Lipukkeiden osto ja maksut

---

#### 1. Ovatko ostetut lipukkeet nähtävissä paikallisessa lompakossa?

Käytä seuraavaa komentoa nähdäksesi kaikki lipukkeesi[^9987]:

```no-highlight
dcrctl --wallet gettickets true
```

---

#### 2. Joudunko maksamaan siirtomaksun ssgen siirroista?

Et, ssgen siirroista ei makseta siirtomaksua[^10219] (toisin kuin alkuperäisistä lipukeostoista, jotka kilpailevat rajallisesta tilasta jokaisessa lohkossa). Ne ovat käytännössä kuin proof-of-work coinbase-siirtoja tässä mielessä.

---

#### 3. Miten muutan ticketfeetä?

```no-highlight
dcrctl --wallet setticketfee <fee>
```

---

#### 4. Miten ostan lipukkeita manuaalisesti?

```no-highlight
dcrctl --wallet purchaseticket <fromaccount><spendlimit><minconf>
```

Missä:

Asetus        | Selitys
---           | ---
`fromaccount` | Yleensä "default" (paitsi jos olet tehnyt toisen tilin)
`spendlimit`  | Maksimimäärä Decrediä jonka haluat käyttää lipukkeisiin.
`minconf`     | Tämä voidaan asettaa 0:aan.

---

#### 5. Miten asetan ticketfeen?

`ticketfee` (tai ticket fee) määrittelee missä järjestyksessä lipukkeet menevät voting pooliin. Korkeammat maksut kannustavat Proof-of-Work louhijoita asettamaan lipukkeesi etusijalle. Jos asetat maksun keskimääräistä korkeammaksi, lipukkeillasi on suurempi mahdollisuus päästä mukaan seuraavaan lohkoon. Oletus txfee on 0.01 DCR. Näin ollen voi tuntua hyvältä idealta asettaa txfee korkeaksi, jotta pääsisit jonon eteen. Mutta tämä ei aina ole hyvä idea. Tosiassa se on harvemmin järkevää, koska mempool-jono on hyvin lyhyt tai kokonaan olematon suuren osan ajasta. Muista että txfee syö osan DCR voitoistasi, sillä se peritään joka lipukkeesta ja sitä ei palauteta, riippumatta siitä äänestääkö lipukkeesi.

Ajatellaan että lipukkeen hinta olisi aina 10 DCR. Joka lohkossa 20 lipuketta voi siirtyä mempoolista voting pooliin. Tämä on yhteisarvoltaan 200 DCR. Jokaisessa lohkossa syntyy noin 30 DCR ja 50 DCR palautuu äänestäjille. 3 DCR lähetetään developereille Decredin kehitystyötä varten joten vain 27 päätyy louhijoiden käsiin. Tämä tarkoittaa että 77 DCR vapautuu joka lohkossa, ja voi päätyä takaisin lipukkeisiin olettaen että se kaikki investoidaan uudelleen. Tämä on alle puolet siitä mitä lohko pystyy käsittelemään. Ainut tapa miten suurempi määrä DCR:ää voi päätyä mempooliin, on ulkopuolelta tuleva sijoitus (esim. kauppapaikasta ostaminen) tai louhijoilta jotka ovat säästäneet DCR:nsä odottaen lipukkeen hinnan laskevan.

Lipukkeen hinnan laskiessa, louhija yrittää päästä sisään pooliin ennen kuin hinta muuttuu uudestaan. Tämä tapahtuu 144 lohkon välein (n. 12 tuntia). Sillä tapahtuuko tämä ensimmäisessä tai 100:ssa lohkossa, ei ole merkitystä. 2,880 lipuketta hyväksytään yhteisarvoltaan 28,800 DCR. Tällä hetkelle proof-of-stake-verkossa ei ole näin isoa volyymia. On yksi skenaario jossa mahdollisesti on hyödyksi asettaa siirtomaksu korkeammaksi. Jos hinta on muuttumassa parin lohkon sisään, mempool ei ole tyhjä ja haluat varmistaa että pääset mukaan tämän hetkisellä hinnalla, voi olla hyödyllistä asettaa maksu hieman keskiarvoa korkeammaksi varmistaaksesi että ehdit mukaan, etenkin jos seuraava muutos tarkoittaa että missaat lipukkeen.

Jatka [PoS-soololouhinta FAQ](/faq/proof-of-stake/solo-mining.md)

---

## <i class="fa fa-book"></i> Lähteet

[^9987]: Decred Forum, [Post 9,987](https://forum.decred.org/threads/582/page-2#post-9987)
[^10219]: Decred Forum, [Post 10,219](https://forum.decred.org/threads/180/page-6#post-10219)
