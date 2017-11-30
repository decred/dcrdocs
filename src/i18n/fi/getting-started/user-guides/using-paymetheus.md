# The Paymetheus Windows Wallet

Tämä opas olettaa että olet jo luonut Paymetheus-lompakon [tämän oppaan] avulla (paymetheus.md). 

---

## Overview

Yleiskatsaus-välilehti näyttää nopean yhteenvedon Decredeistäsi (käytettävissä olevat ja lukitut), tilien määrästä ja siirroista, kuten myös listan
viimeaikaisista tapahtumista.

![Overview tab](/img/Paymetheus-overview.png) 

---

## Tilit

Tilit-välilehti näyttää lompakkosi tilit ja sallii sinun lisätä uusia tilejä.
Decred-tilit toimivat kuin pankkitilit.
Ne sallivat sinun pitää kirjaa DCR'stäsi. Tämä ominaisuus on
hyödyllisin yrittäjille jotka haluavat pitää erillisiä tilejä esim
verokirjanpitoa varten. DCR:n siirtäminen tililtä toiselle tekee
siirron lohkoketjussa.

![Overview välilehti](/img/Paymetheus-accounts.png) 

---

## Scripts

Tällä hetkellä käytössä vain PoS-louhinnalle poolissa. Versiosta 0.8.0
lähtien script setup on automatisoitu. Katso Lipukkeiden Osto -osio alla lisätietoa varten.
Sitä tulla käyttämään edistyneempiin ominaisuuksiin tulevaisuudessa.

![Scripts välilehti](/img/Paymetheus-import-script.png) 

---

## Create Transaction

Tällä välilehdellä lähetät rahaa toiseen osoitteeseen. Kopioi saajan osoite
sille varattuun kenttään ja kirjoita summa jonka haluat lähettää.
Tämä näyttää myös arvioidun siirtomaksun. Voit klikata '+' näppäintä
lähettääksesi Decrediä useampaan osoitteseen samalla siirrolla niin halutessasi.

![Tee siirto -välilehti](/img/Paymetheus-send.png) 

---

## Purchase Tickets tab

Paymetheus kykenee ostamaan lipukkeita Proof of Stake-louhintaan käyttämällä sen manuaalista
lipukkeenosto-ominaisuutta. Huomaa että Paymetheus pystyy vain *ostamaan* lipukkeita, se ei pysty
suorittamaan äänestämistä. Sitä varten sinun tarvitsee joko tehdä [soolo-PoS](/mining/proof-of-stake.md) setup
tai käyttää PoS-[stakepoolia](/mining/proof-of-stake.md#list-of-stakepools).

> Liittyäksesi pooliin, anna public key -osoite jota voidaan käyttää generoimaan
> 1-of-2 multisignature scripti. Multisignature scripti generoidaan poolin toimesta
> ja kerrotaan sinulle, kuten myös P2SH osoite jolle annat äänioikeuden.

Älä huoli jos et ymmärtänyt tätä. Se tarkoittaa että teet osoitteen
jota kaksi eri lompakkoa voi käyttää. Vain yhden lompakon tarvitsee olla tavoitettavissa
osoitetta käyttääkseen. Tämä tarkoittaa että pool voi äänestää puolestasi ja voit
itse äänestää omaa lompakkoasi käyttäen jos pool lakkaa toimimasta.

Tämä EI ANNA poolille pääsyä varoihisi. Annat ainoastaan äänestysoikeuden
poolille. Pool ei koske rahoihisi.

Viralliset stakepoolit on [listattu täällä](/mining/proof-of-stake.md#list-of-stakepools).
Kaikki stakepoolit käyttävät samaa koodia, mutta eroja saattaa olla esim. varmuudessa.
Lisää varmistuksia tarkoittaa pienempää todennäköisyyttä missata ääniä (tosin kaikki poolit
missaavat ääniä sillä monet missatut äänet johtuva PoW-louhijoista (jotka joskus löytävät ratkaisun
uuteen lohkoon niin nopeasti että äänet eivät ole vielä ehtineet päätyä koko verkon tietoon). Jotta 
voitaisiin varmistaa ettei yksi pool kasva liian isoksi, suosittelemme että liityt pienempään pooliin. Vaikka
pooleilla ei ole pääsyä varoihisi, ne VOIVAT äänestää toiveidesi vastaisesti. Sen tekeminen johtaa mustalle
listalle päätymiseen melko nopeasti, mutta pitämällä yksittäisen poolin koon pienenä varmistamme että
yksittäisen operaattorin on erittäin vaikea vaikuttaa äänestyksen lopputulokseen. Lipukkeiden levittäminen
eri pooleihin tekee verkosta entistä hajautetumman.

![Creating voting account](/img/Paymetheus-create-voting-account.png)

Tässä on aika paljon informaatiota joten käydään jokainen asetus läpi.

* **Ticket difficulty** - Lipukkeen tämänhetkinen hinta.
* **Blocks until retarget** - Kun tämä on 0, lipukkeelle lasketaan uusi hinta.
* **Source account** - Tämä on se tili joka ostaa lipukkeet ja saa palkkion.
* **Tickets to purchase** - Ostettavien lipukkeiden määrä.
* **Ticket fee (DCR/kB)** - Lipukkeet lisätään voting pooliin maksujärjestyksessä. Kysynnän ollessa korkea,
                        sinun tarvitsee nostaa tätä arvoa jotta lipukkeesi pääsevät mukaan.
                        Lipukkeiden tämänhetkiset siirtomaksut näet [täältä](https://www.dcrstats.com).
* **Split fee (DCR/kB)** - Paymetheus käyttää "split"-siirtoa välttääkseen blokkaamasta saldoasi, splittaamalla
                       tarkan summan joka tarvitaan lipukkeeseen lompakkosi balanssista.
                       "Split"-siirto tarvitsee vähintään yhden vahvistuksen ennen kuin voit taas käyttää
                       saldoasi. Tämä voi blokata koko saldosi useaksi minuutiksi kun vahvistusta odotetaan.
                       Ilman splittiä joutuisit odottamaan vahvistusta ticket transactionille, joka saattaisi kestää useita tunteja.
                       Voit jättää tähän arvoksi 0.01. Se ei vaikuta mahdollisuuteesi ostaa lipukkeita tai äänestää niillä.

* **Expiry (blocks)** - Often ticket fees will increase during a window and you may be stopped out by higher fees. By setting an expiry, tickets that are not mined by the given block height are cancelled so you can try again with higher fees if you wish. If this is empty, they will not expire until the end of the window.

* **Stake pool preference** - Automate setup with PoS pools. See below for more information.
* **Voting address** - The Decred address that will do the voting. Solo and custom pool miners only.
* **Pool fee address** - For those using a custom pool.
* **Pool fees (%)** - For those using a custom pool.

![Purchasing tickets](/img/Paymetheus-ticket-purchasing.png)  

To easily set up ticket purchasing for a stake pool, click the 'Manage pools button'. If you haven't already,
you'll need to register with a stake pool (see above). Once you've registered, log in, look for your API key, and copy it.
Select the pool you just registered with from the drop down. Paste the key into the 'API key' box and click 'Save'.
You should see a bunch of letters and numbers appear in the bottom box. Click 'Close'. You can now purchase
tickets by clicking the 'Purchase' button!

![Manage stake pools](/img/Paymetheus-manage-stake-pool.png)

NOTE: While you can purchase tickets using Paymetheus, it cannot vote for you so you must either use a pool
or run your own voting wallet which needs to be online 24/7. If you would prefer to solo mine,
check the [dcrd Setup Guide](/getting-started/user-guides/dcrd-setup.md), [dcrwallet Setup Guide](/getting-started/user-guides/dcrd-setup.md) and [PoS Mining Guide](/mining/proof-of-stake.md) for more information.

---

## Request Payment

This is where you can generate wallet addresses to give to other people so they can
send you DCR. Simply choose the account you want funds to go to and press Generate Address.
Copy the address (it's the top line that starts with Ds) and share that with the other person.
Decred addresses can be used as many times as you want, but for privacy reasons it's best
to generate a new one for each transaction. There's around 1.4E48 (that's 14 followed by 47 zeroes)
addresses available so you don't need to worry about running out.

![Request Payment](/img/Paymetheus-receive.png)  

---

## Transaction History

This tab shows a list of all transactions that have occurred. The transaction hash can be used with the
[block explorer](/getting-started/using-the-block-explorer.md) to see more information about the transaction.  

![Transaction History](/img/Paymetheus-transactions.png)  

---

## Stake Mining

This tab shows some statistics on the PoS network:  

Item                         | Description
:-----------------------------:|:------------------------------------------------------------:
Number of live tickets       | The total number of tickets that are eligible for voting across the network
Number of tickets in mempool | The total number of tickets waiting to enter the voting pool
Ticket difficulty            | The cost of a ticket (refunded on ticket vote/expiry)
Owned tickets in mempool     | The number of your tickets in the mempool
Owned live tickets           | The number of your tickets that are eligible for voting
Owned immature tickets       | Number of tickets waiting to mature before going live (256 blocks, ~17 hours)
Tickets missed               | Tickets that missed a vote either because the voting wallet or stake pool was offline or the PoW miner didn't mine it properly
Tickets revoked              | Tickets that missed a vote and have had the ticket price refunded (minus the ticket fee), should be the same as tickets missed
Tickets voted                | Lifetime tickets voted by this wallet
Total subsidy earned         | Lifetime DCR subsidy earned by this wallet
