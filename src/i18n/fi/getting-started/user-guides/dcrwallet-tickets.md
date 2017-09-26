# Buying Tickets With dcrwallet

Viimeksi päivitetty versiolle 1.0.0

Tämän oppaan tarkoitus on käydä läpi lipukkeenosto `dcrwallet`ia käyttäen. Se kattaa sekä manuaaliset lipukkeenostot sekä automaattiset ostot soolo-äänestämistä stakepool-äänestämistä varten.

**Vaatimukset:**

-   Käytä uusinta [dcrinstall](/getting-started/user-guides/cli-installation.md) versiota asentaaksesi `dcrd`:n, `dcrwallet,`in and `dcrctl`:n. Jos käytät jotain toista metodia, tarvitaan lisäaskelia.
-   Review how the launch commands for the Command Prompt (Windows) and Bash (macOS/Linux) shells differ [here](/getting-started/cli-differences.md).
-   [Asenna dcrd](/getting-started/user-guides/dcrd-setup.md) ja käynnistä se taustalle.
-   [Asenna dcrwallet](/getting-started/user-guides/dcrwallet-setup.md) ja käynnistä se taustalle.
-   Tutustu [dcrctl:n perusteisiin](/getting-started/user-guides/dcrctl-basics.md).
-   Tutustu [staking prosessiin](/mining/proof-of-stake.md#staking-101) ja [lipukkeen elinkaareen](/mining/proof-of-stake.md#ticket-lifecycle)

This guide assumes you have set up `dcrd` and `dcrwallet` using configuration files. If you used `dcrinstall`, you have configuration files already. Using configuration files is highly recommended - it makes for an easier time issuing commands to `dcrwallet` and `dcrd` through `dcrctl`. A guide for minimum configuration (saving your RPC username and RPC password) can be found [here](/advanced/manual-cli-install.md#minimum-configuration).

NOTE: `dcrwallet.conf` is split into two sections labeled `[Application Options]` and `[Ticket Buyer Options]`. Any setting prefixed by 'ticketbuyer.' must be placed within the lower `[Ticket Buyer Options]` section. All other settings go within `[Application Options]`.

---

## Decisions

Ennen kuin etenemme oppaaseen, on tarpeen tehdä pari päätöstä. Ensiksi, aiotko käyttää stakepoolia delegoidaksesi äänioikeutesi? Toiseksi, aiotko ostaa lipukkeita manuaalisesti vai automaattisesti ticketbuyer-ominaisuutta käyttäen?

Stakepool lipukkeenosto sallii stakeholderin delegoida äänioikeuden stakepoolille. Nämä stakepoolit ovat online kaiken aikaa (24/7) ja missaavat äänestyksen hyvin harvoin. Ne käyttävät multisig-siirtoja joten ne eivät pysty koskemaan omistamiisi DCR:iin. Miinuksena, suurin osa ottaa pienen prosentin äänestyspalkkiostasi pool-maksuna. Stakepoolille delegoidut lipukkeet myös vaativat suuremman siirron koon (~540 Bittiä vs. ~300 Bittiä jonka soololipuke vaatii) joka johtaa hieman suurempaan lipukemaksuun sillä maksut lasketaan DCR/kB.

Soolo-äänestämistä varten sinulla tulee olla äänestyslompakko avattuna kaiken aikaa (24/7), tai saatat missata äänestyksiä ja menettää äänestyspalkkioita. Sinun ei tarvitse maksaa poolin maksuja ja ostosi todennäköisemmin louhitaan pienellä kokonaismaksulla (koska louhijat valitsevat lipukkeita perustuen DCR/kB maksun suuruuteen ja soololipukkeiden TXN koko on pienempi). 

Manuaalinen lipukkeenosto vs. automaattinen ticketbuyer-osto on enimmäkseen mieltymyksestä kiinni. Ticketbuyerin käytöstä saa tavalliset automaation hyödyt, mutta monet saattavat häkeltyä konfiguroitavissa olevien muuttujien määrästä. Ticketbuyerin maksun koon laskenta ei myöskään välttämättä aina johda taloudellisesti parhaaseen maksuun stakeholderin kannalta. Jotkut ihmiset myös tykkäävät lipukkeiden ostamisesta manuaalisesti muutaman päivän välein yrittäen tarjota taloudellisesti järkevimmän siirtomaksun. Molemmat metodit ostavat lipukkeita vain lompakon lukituksen ollessa avattuna.

---

## Solo-voting

MUISTUTUS: Soolo-äänestäminen lompakolla joka ei pysy online 24/7 saattaa johtaa missattuihin äänestyksiin ja menetettyihin stake-palkkioihin.

Äänestääkesi soolona, asetat vain enablevoting asetuksen kun käynnistät `dcrwallet`in, avaat lompakon lukituksen privaatilla salasanallasi, ja ostat lipukkeita. Kun enablevoting on käytössä ja `dcrwallet` ei ole lukittuna, lompakkosi hoitaa äänestämisen automaattisesti.

Asettaaksesi `dcrwallet` solo-steikkausta varten, lisää seuraava rivi `dcrwallet.conf`-tiedostoosi kohtaan `[Application Options]`:

    enablevoting=1

Kun käynnistät lompakon uudelleen tuo rivi lisättynä `dcrwallet.conf`-tiedostoosi, lompakkosi on nyt konfiguroitu soolo-äänestystä varten ja voit alkaa [ostamaan lipukkeita](#ticket-purchasing).

---

## Stakepool-voting

Jotta stakepool voi äänestää puolestasi, sinun tulee ensin liittyä sellaiseen. Lista stakepooleista on löydettävissä [täältä](/mining/proof-of-stake.md#list-of-stakepools). Kun olet liittynyt, sinun pitäisi saada ohjeet uuden P2SH-osoitteen tekemiseen ja multi-sig voting scriptin lisäämiseen. Tässä nopea yleiskatsaus:

1.  Lompakon lukitus avattuna, nouda osoite komennolla `dcrctl --wallet getnewaddress`.
2.  Tätä osoitetta käyttäen, syötä komento `dcrctl --wallet validateaddress <address from step 1>` . Tämän pitäisi palauttaa JSON objekti joka näyttää tältä:

```
{
  "isvalid": true,
  "address": "DsExampleAddr1For2Demo3PurposesOnly",
  "ismine": true,
  "pubkeyaddr": "DkExample0Addr1For2Demo4Purposes5Only6Do7Not8Use9Pls0",
  "pubkey": "022801337beefc0ffee1dab8d4ffa898a782466c9a1fc00ca8863de5438dc07dcc",
  "iscompressed": true,
  "account": "voting"
}
```

3.  Kopioi `pubkeyaddr` stakepoolin "Submit Address" lomakkeeseen ja klikkaa submit-näppäintä. Sivun pitäisi nyt uudelleenohjata sinut lipuke-sivulle, josta löydät lisäohjeita.
4.  Lipukkeet-sivun ylälaidassa pitäisi olla nähtävissä "Ticket Information"-osio. Kopio "Redeem Script"isi ja käytä sitä syöttääksesi `dcrctl --wallet importscript <Insert Redeem Script Here>` -komennon.

Kun stakepool on konfiguroitu ja multi-sig script importattu lompakkoosi, voit nyt alkaa [ostamaan lipukkeita](#ticket-purchasing).

---

## Ticket Purchasing

Sekä automaattiset että manuaaliset lipukkeenostot vaativat että lompakkosi lukitus on avattu `dcrctl --wallet walletpassphrase <private passphrase> <time limit>`-komennolla.

Kolme asiaa joihin on hyvä olla ymmärrys ennen lipukkeiden ostamista: `purchaseticket` komento, million/miksi `ticketfee` on tärkeä, ja `ticket price`n merkitys.

> purchaseticket Komento

Komentoa `purchaseticket` käytetään lipukkeiden ostoon, joko manuaalisesti tai automaattisesti. Tarkastellaan komentoa ja sen argumentteja lähemmin:

```
purchaseticket "fromaccount" spendlimit (minconf=1 "ticketaddress" numtickets "pooladdress" poolfees expiry "comment")
```

1.  `fromaccount` = Vaadittu arvo: Tili jolta lipukkeita ostetaan (esim. "default").
2.  `spendlimit` = Vaadittu numero: Rajoitus millä summalla lipukkeita voidaan ostaa (esim. 50).
3.  `minconf` = Vapaaehtoinen numero: Vaadittujen vahvistusten lukumäärä (esim. 1).
4.  `ticketaddress` = Vapaaehtoinen Arvo: Osoite jolle äänioikeus annetaan
5.  `numtickets` = Vapaaehtoinen numero: Kerralla ostettavien lipukkeiden määrä (esim. 1)
6.  `pooladdress` = vapaaehtoinen arvo: Osoite johon stakepoolmaksut maksetaan
7.  `poolfees` = Vapaaehtoinen numero: Prosentti joka maksuista maksetaan stakepoolille (esim. 5)
8.  `expiry` = Vapaaehtoinen Numero: Lohkokorkeus jossa louhimattomat lipukkeet vanhenevat mempoolista, palauttaen alkuperäiset DCR:t "fromaccount"illesi. Jos jätät tämän tyhjäksi, lipukkeet vanhenevat mempoolista vain kun lipukkeen hinta muuttuu.
9.  `comment`        =  Optional String: This argument is unused and has no significance.

> Lipukemaksut

Lipukemaksu eli `ticketfee` on DCR/kB määrä jonka maksat jotta lipukeostosi lisätään lohkoon louhijoiden toimesta. Huomaa että yllä oleva `purchaseticket`-komento ei sisällä määriteltyä `ticketfee`tä. `ticketfee` voidaan asettaa kahdella eri tavalla.

1.  Käynnistyksen aikana lisäämällä `ticketfee=<fee rate>` kohtaan `[Application Options]` `dcrwallet.conf`-tiedostossasi.
2.  Lompakon ollessa käynnissä, käyttämällä komentoa `dcrctl --wallet setticketfee <fee rate>`. Tämä ei ole pysyvä asetus ja muuttuu takaisin 0.01 oletukseen joka kerta kun lompakko käynnistetään uudelleen ellei ticketfee ole spesifioitu `dcrwallet.conf`-tiedostossa.

Miksi ticketfee on tärkeä? Yleensä oletus 0.01 on riittävä jotta lipukkeesi louhitaan. Poikkeus tähän on mahdollinen "fee war event". Kun lipukkeen hinta putoaa erittäin alhaiseksi, kysyntä ylittää tarjonnan (jokaisen hinta-intervallin aikana vain 2880 lipuketta on saatavilla). Tämä saa aikaiseksi tarjouskilpailun siirtomaksuista, kun stakeholerit kilpailevat saadakseen lipukkeensa louhituksi ennen kuin hinta muuttuu.

Nämä kaksi asiaa muistissa, jatketaan kahteen eri lipukkeenostometodiin.

> Lipukkeen Hinta

Hakeaksesi tämänhetkisen lipukkeen hinnan, syötä komento `dcrctl --wallet getstakeinfo` ja etsi `difficulty` arvo. Tämä on lipukkeen hinta tämänhetkisessä hinta-ikkunassa. Ostaessasi lipukkeista manuaalisesti saatat haluta muokata `spendlimit`  argumenttiasi `purchaseticket`-komennossa hieman korkeammaksi kuin tämä `difficulty`-arvo.

---

### Manual Ticket Purchase

Before manually purchasing tickets, it is recommended to check for a ticketfee war and adjust your ticketfee before purchase by issuing the `dcrctl --wallet setticketfee <fee rate>` command. Third party sites such as [https://dcrstats.com](https://dcrstats.com) and [https://posmaster.info](http://posmaster.info) can be used to find the average ticketfee in the mempool, although you may oftentimes be able to purchase a ticket with a ticketfee lower than the average.

> Soolo-lipukkeet

Ostaaksesi lipukkeita soolo-stakea varten, sinun tarvitsee vain spesifioida `fromaccount` ja `spendlimit` -asetukset `purchaseticket`-komentoa käyttäessäsi. Esimerkiksi:  `dcrctl --wallet purchaseticket "default" 50` käyttää DCR:ää `default`-tililtäsi ostaakseen lipukkeen jos tämänhetkinen lipukkeen hinta on enintään 50 DCR.

Jos haluat spesifioida `numtickets` tai `expiry`-argumentit, sinun tulisi spesifioida `minconf` 1:een, tyhjä `ticketaddress` (""), tyhjä `pooladdress` (""), ja tyhjä `poolfees` (0). Kaksi esimerkkiä alla:

-  `dcrctl --wallet purchaseticket "default" 50 1 "" 5` ostaisi 5 lipuketta, koska viides asetus (`numtickets`) on 5.
-  `dcrctl --wallet purchaseticket "default" 50 1 "" 5 "" 0 100000` ostaisi 5 lipuketta jotka vanheutuisivat mempoolista jos niitä ei ole louhittu lohkoon 100,000 mennessä, koska kahdeksas asetus (`expiry`) on 100000.

Muista tarkistaa ettei fee war event ole meneillään ja säädä ticketfeetäsi ennen ostoa syöttämällä komento  `dcrctl --wallet setticketfee <fee rate>` 

> Pool-lipukkeet

Ostaaksemme lipukkeita joiden äänioikeus on delegoitu stakepoolille, meidän tarvitsee käyttää täyttä `purchaseticket` komentoa.

-  `ticketaddress` on P2SH osoite jonka löydät stakepoolisi "Tickets"-sivulta kohdan "Ticket Information" alta.
-  `pooladdress` on osoite johon stakepoolin maksut kerätään. Tämän löydät poolisi "Tickets"-sivulta kohdasta "Ticket Instructions". 
-  Your `poolfees` is the percentage of the stake reward that will go to the `pooladdress` when a ticket votes. It is important to match your pool's advertised fee.

A quick example:

`dcrctl --wallet purchaseticket "default" 23 1 DcExampleAddr1For2Demo3PurposesOnly 1 DsExampleAddr1For2Demo3PurposesOnly 7.5` käyttäisi DCR:ää `default` tililtäsi ostaakseen 1 lipukkeen jos tämänhetkinen lipukkeen hinta on max 23 DCR. Stakepoolilta saatu P2SH osoite on `DcExampleAddr1For2Demo3PurposesOnly` ja fee-osoite on `DsExampleAddr1For2Demo3PurposesOnly`. Pool ottaa 7.5% maksun jos tämä lipuke äänestää onnistuneesti. Tämä lipuke ei vanhene mempoolista ennen kuin lipukkeen hinta muuttuu, sillä vain 7 argumenttia on spesifioitu (ei `expiry`).

---

#### Ticketbuyer Configuration

To set up your `dcrwallet` to enable its built-in `ticketbuyer` feature, add the following line to your `dcrwallet.conf` config file in the `[Application Options]` section:

    enableticketbuyer=1

Jos käytät stakepoolia, sinun tulisi myös lisätä seuraavat rivit (kaikki nämä löytyvät stakepoolisi "Tickets" sivulta):

    ticketaddress=<P2SH Address shared with Stakepool>
    pooladdress=<Stakepool's Fee Collection Address>
    poolfees=<Stakepool's Required Reward Fee>

With this configuration `ticketbuyer` will start running with it's default settings. You may want to modify the `ticketbuyer` configuration to tweak its behaviour - the full set of configuration options and their default values can be found in the chart [below](#full-ticketbuyer-options).

With `ticketbuyer` running and your wallet unlocked, you can watch your `dcrwallet` console to see whether or not tickets are being purchased. It will even display an explanation if tickets weren't purchased.

---

## Full Ticketbuyer Options

We recommended you read
and understand the options available before using the feature as you may set your fees and ticket
prices higher than desired.

All of these options can be specified on the command line or in dcrwallet.conf in the `[Ticket Buyer Options]` section. Note that at
this time there is no way to change settings while dcrwallet is running: you will need to restart it to
adjust your settings.

Parameter|Description|Default|Explanation
:----------:|:---------------------------:|:----------:|:---------------------------:
ticketbuyer.avgpricemode|The mode to use for calculating the average price if pricetarget is disabled (vwap, pool, dual) |vwap|!
ticketbuyer.avgpricevwapdelta|The number of blocks to use from the current block to calculate the VWAP |2880|!
ticketbuyer.maxfee|Maximum ticket fee per KB |0.1 DCR|Tickets are entered into the mempool in order of their fee per kilobyte. This sets the maximum fee you are willing to pay.
ticketbuyer.minfee|Minimum ticket fee per KB |0.01 DCR|The minimum fee per kilobyte you are willing to pay. This should probably be left at 0.01 unless you know what you're doing.
ticketbuyer.feesource|The fee source to use for ticket fee per KB (median or mean) |median|The fee chosen by the ticket buyer will be based off either the median (line all the fees up in order and choose the middle one) or the mean (also known as the average; add all the fees up and divide by 2). It's recommended to leave this at median as there have been instances of fee manipulation where people try to force up the average by buying one ticket with a very high fee.
ticketbuyer.maxperblock|Maximum tickets per block, with negative numbers indicating buy one ticket every 1-in-n blocks |5|Do not buy more than this number of tickets per block. A negative number means buy one ticket every n blocks. e.g. -2 would mean buy a ticket every second block.
ticketbuyer.blockstoavg|Number of blocks to average for fees calculation |11| Fees are calculated using this many previous blocks. You can usually leave this at the default.
ticketbuyer.feetargetscaling|Scaling factor for setting the ticket fee, multiplies by the average fee |1|The average fee is multiplied by this number to give the fee to pay. DO NOT change this until you really know what you're doing. It could raise your fees very high. Remember, fees are non-refundable!
ticketbuyer.dontwaitfortickets|Don't wait until your last round of tickets have entered the blockchain to attempt to purchase more| |By default, the ticket buyer will not buy more tickets until all the previous ones purchased have been entered into the blockchain. You can set this to purchase more even if some are still in the mempool.
ticketbuyer.nospreadticketpurchases|Do not spread ticket purchases evenly throughout the window| | By default `ticketbuyer` spreads out the purchase of tickets which may result in more favourable fees. This setting tells `ticketbuyer` to purchase all tickets at once.
ticketbuyer.maxinmempool|The maximum number of your tickets allowed in mempool before purchasing more tickets |40|If you have this many tickets in the mempool, the ticket buyer will not buy more until some are accepted into the blockchain.
ticketbuyer.expirydelta|Number of blocks in the future before the ticket expires |16|You can set an expiry so that if your tickets are not accepted into the blockchain due to high fees, they will cancel and you can try again by raising your fees.
ticketbuyer.maxpriceabsolute|Maximum absolute price to purchase a ticket |0 DCR| If the ticket price is above this value, you will not buy more tickets. The default of 0 turns this off.
ticketbuyer.maxpricerelative|Scaling factor for setting the maximum price, multiplies by the average price |1.25|If the current window price is significantly higher than the last few windows, do not buy any tickets. E.g. With the default value of 1.25, if the average price of the last few windows is 50DCR, you won't buy any tickets if the current window is over 75DCR.
ticketbuyer.balancetomaintainabsolute|Amount of funds to keep in wallet when stake mining |0 DCR| If your balance is lower than this number, you will not buy tickets. The default of 0 will use all the funds in your account to buy tickets.
ticketbuyer.balancetomaintainrelative|Proportion of funds to leave in wallet when stake mining |0.3|Similar to the last one, except it's based on a percentage of your total funds.

---
