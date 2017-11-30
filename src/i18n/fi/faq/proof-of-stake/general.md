# <i class="fa fa-ticket"></i>PoS Yleinen FAQ

---

#### 1. Mikä on Decredin Proof-of-Stake-järjestelmä?

Proof-of-Stake (PoS)-järjestelmä antaa Decrediä omistaville sanavaltaa valuutan hallinnoinnissa. Tarkoitus on antaa myös käyttäjille ääni louhijoiden ohella.
Osallistuakseen käyttäjät voivat ostaa "lipukkeita", jotka lisätään arvontapooliin. Jokaisen lohkon kohdalla 5 lipuketta valitaan PoS-lipukkeiden joukosta. Jos näistä vähintään 3 hyväksyvät edellisen louhitun lohkon,
uusi lohko lisätään ketjuun, ja sekä PoW-louhijoille että PoS-steikkaajille maksetaan palkkio. Jos PoS-steikkaajat eivät hyväksy lohkoa, PoW-louhijat eivät saa palkkiota, mutta PoS-steikkaajat saavat. Tämän tarkoitus
 on saada PoW-louhijat louhimaan PoS-steikkaajien toiveiden mukaisesti.

PoS-järjestelmässä on useita etuja jotka ratkaisevat ongelmia joita pelkät PoW-systeemit saattavat kohdata. Esimerkiksi, koska PoS-steikkaajien pitää hyväksyä PoW-louhijoiden lohkot, PoW-louhijat eivät voi
yksin päättää verkon sääntöjen muuttamisesta (nk. 51% attack). Tai kun Decred-ketju hardforkkaa, vanha, lyhyempi ketju kuolee pois nopeasti kun se ei saa vahvistusta ketjun
PoS-komponentilta.

PoS-järjestelmä palkitsee osallistujat steikkaamisesta. Jokainen Decred-lohko sisältää PoS-palkkion joka jaetaan jokaiselle lipukkeelle jotka on valittu äänestämään kyseisessä lohkossa. Järjestelmä on suunniteltu niin
että keskimääräinen aika lipukkeella tulla valituksi on 28 päivää. Jos lipuketta ei ole valittu 40960 lohkon jälkeen (vähän alle 5 kuukautta), se poistetaan järjestelmästä. DCR joka on käytetty lipukkeen
 ostoon palautetaan riipumatta siitä äänestääkö lipuke vai ei.

Toinen kiintoisa ominaisuus jonka PoS-järjestelmä sallii, on mahdollisuus äänestää erilaisista esityksistä/agendoista. Koska lohkon hyväksyminen voidaan ajatella annettuna äänenä, lisäämällä votebit komponentteja lipukkeeseen, järjestelmä pystyy jäljittämään ja laskemaan ääniä useiden lohkojen ajalta. Nämä äänet voivat koskea mitä tahansa.

Decredin Proof-of-Stake-järjestelmässä jokainen DCR:ää omistava voi osallistua ostamalla lipukkeen.

---

#### 2. Mitä lipukkeet ovat?

Lipuke on eräänlainen poletti joka ostetaan PoS-järjestelmään osallistumista varten. Voit ostaa lipukkeita dcrctl:n komentojono-sovelluksessa, tai GUI-lompakolla kuten Paymetheus[^1] tai Decrediton. Kun ostat
lipukkeen, maksat sen hetkisen lipukkeen hinnan ja siirtomaksun DCR:ällä. Kun lipuke on ostettu, se menee tilapäiseen "mempooliin". Jokaiseen lohkoon voidaan louhia 20 lipuketta, ja lipukkeet valitaan
louhittavaksi niiden siirtomaksun/kb perusteella. Rajallinen määrä lipukkeita voidaan louhia lohkoihin tietyllä hinnalla (2880), jolloin useat lipukkeet saattavat kilpailla louhituksi tulemisesta. Tässä tapauksessa
voit nostaa siirtomaksua jonka olet valmis maksamaan saadaksesi lipukkeesi louhituksi. Kun lipukkeesi on louhittu, se siirtyy 'allmempoolista' 'immature' lipukepooliin. 256 lohkon jälkeen
(noin 20 tuntia) se kypsyy ja siirtyy live ticket pooliin, josta se on valmis valittavaksi äänestykseen.

---

#### 3. Tarvitseeko minun olla koko ajan yhteydessä verkkoon osallistuakseni PoS:iin?

Lompakon pitää olla online 24/7 vastatakseen äänestykseen mikäli yksi sinun lipukkeistasi on valittu. Tämän toteuttamiseen on kaksi tapaa; soolo staking lompakko jonka pidät online kaiken aikaa, tai vaihtoehtoisesti
voit käyttää [stake poolia](/mining/proof-of-stake.md#solo-mining-or-pool-mining). Stake pool on käytännössä usean tahon yhteisesti pyörittämä lompakko johon voit asettaa äänioikeuden lipukkeillesi ja pooli
äänestää puolestasi vastineeksi pienestä prosentista PoS-palkkiota.

On tärkeää huomauttaa että annat poolille vain äänioikeuden, et varojasi. Stake poolilla ei ole missään vaiheessa pääsyä varoihisi.

---

#### 4. Mikä on "lipukkeen hinta"?

Lipukkeen hinnan määrittää algoritmi joka pyrkii pitämään ticket poolin koon, eli siis PoS-järjestelmän poolissa olevien lipukkeiden yhteismäärän, lähellä tavoitetta, 40960 lipuketta.
Lipukkeen hinta nousee tai laskee kysynnän ja poolissä olevien lipukkeiden määrän mukaan.

144 lohkon välein algoritmi laskee lippujen hinnan uudelleen. Tätä kutsutaan ostoikkunaksi. Jokaisessa lohkossa voi olla mukana 20 uutta lipuketta. Tämä tarkoittaa että jokaisen ostoikkunan aikana 2880 lipuketta
voidaan lisätä PoS-järjestelmän ticket pooliin.

Lipukkeen hinta palautetaan aina riippumatta siitä äänestääkö, missaako tai vanheneeko lipukkeesi.

---

#### 5. Mitä ovat kulut/maksut?

PoS-järjestelmään sisältyy kahdenlaisia maksuja, txfee (tunnetaan myös nimellä 'split' fee) ja ticketfee.
	
Txfee on maksu jonka maksat verkolle lipukkeen ostossa tapahtuvan siirron hoitamisesta. Tämä maksun on oletuksena asetettu matalaksi (0.01 DCR/kB) ja sitä ei tulisi muuttaa.
Ticketfee on maksu jonka maksat jos lipukkeesi louhitaan. Tämä maksu on kannustin PoW-louhijoille louhia lipukkeesi ja lisätä se ticket pooliin.

Jos ostoikkuna on täynnä, eli enemmän lipukkeita on ostettu kuin mitä voidaan louhia ikkunan aikana, ticketfee määrittää mitkä lipukkeet pääsevät ticket pooliin.
PoW-louhijat valitsevat lipukkeet joissa on korkein ticketfee.

DCR siirtomaksut lasketaan per kilobitti. Koska lipuke on vain noin 300 (soolo) tai 540 (pool) bittiä kooltaan, todellinen maksu jonka maksat on alhaisempi kuin se mitä olet asettanut siirtomaksun määräksi.

Txfee ja ticketfee eivät palaudu sinulle kun lipuke äänestää, vanhenee tai missaa äänestyksen.

Rahojen palautuminen lompakkoosi kun lipuke on äänestäänyt tai poistetaan ei generoi siirtomaksua.

---

#### 6. Mikä on stake pool?

Stake pool on samankaltainen kuin mining pool, mutta PoS-järjestelmälle. Decred-lompakkosi asetusten kautta voit antaa äänestysoikeutesi stake poolille. Jos lipukkeesi valitaan äänestämään,
stake pool äänestää puolestasi ja maksaa sinulle PoS-palkkion, miinus stake poolin osuus (normaalisti 4-5%). Toisin kuin mining pooleissa, PoS-palkkiota ei jaeta kaikkien poolin käyttäjien kesken. Koko palkkio menee lipukkeen omistajalle.

Stake poolin avulla voit ostaa lipukkeita ilman tarvettaa pitää lompakkoasi lukitsematta ja aina online. On tärkeää huomauttaa että rahasi eivät missään vaiheessa poistu lompakostasi. Et lähetä pooliin mitään,
annat vain sille luvan äänestää puolestasi. Stake poolilla ei ole pääsyä rahoihisi.

Stake pooleilla on yleensä useita lompakoita käynnissä ympäri maailmaa. Tämä tarkoittaa että äänestyksen missaamisen riski on pienempi vaikka yksi lompakko kaatuisi.
Se myös vähentää viivettä lompakon ja verkon välillä joka myös pienentää riskiä missata äänestys.

---

#### 7. Mitä rahoilleni tapahtuu kun ostan lipukkeen?

Lipukkeiden ostoon käytetyt varat lukitaan kunnes lipuke valitaan äänestykseen tai se vanhenee. Lukittuja varoja ei voi siirtää pois lompakosta ja ne ovat nähtävissä kohdassa "lockedbytickets".
Jos lipukkeesi valitaan äänestykseen, sinulle palautuu koko lipukkeen ostoon käytetty summa sekä PoS-palkkio.

Ainut kustannus tämän järjestelmän käyttämisestä ovat asettamasi siirtomaksut. Txfee veloitetaan lipukkeesi siirrosta verkossa. Ticketfee veloitetaan lipukkeen lisäämisestä ticket pooliin,
ja maksetaan PoW-louhijoille. Jos lipukettasi ei louhita, maksua ei veloiteta sillä tuolloin siirto ei koskaan päätynyt verkkoon.

Jos lipukettasi ei ole valittu äänestykseen 40960 lohkon aikana (n. 4 kuukautta), järjestelmä peruuttaa lipukkeesi ja decred jonka olet siitä maksanut (miinus siirtomaksut) palautetaan takaisin lompakkoosi.

---

#### 8. Kuinka suurella todennäköisyydellä lipukkeeni pääsee äänestämään?

Decredin PoS-järjestelmä käyttää Poissonin jakaumaa määrittääkseen lipukkeen mahdollisuuden äänestykseen kaikkina aikoina. Laskettuna poolin tavoitekoosta, joka on 40960 lipuketta, jokaisella lipukkeella on 50% mahdollisuus äänestää
28 päivän kuluessa ja 99.5% mahdollisuus äänestää ennen vanhenemistaan. Huomaa että nämä luvut muuttuvat poolin koon puuttuessa.


---

#### 9. Mitä on Proof-of-Stake-äänestäminen?

Koska PoS-järjestelmän suorittama lohkonvahvistus toimii kuin äänestysjärjestelmä, sitä voidaan käyttää muistakin asioista äänestämiseen.

Tultuaan valituksi vahvistamaan lohko, lipukkeet äänestävät edellisen louhitun lohkon hyväksymisestä. Tämä vaatii että kolme viidestä valitusta lipukkeesta äänestää kyllä.

Lisäämällä lipukkeeseen ylimääräisen parametrin joka ei vaikuta louhittujen lohkojen hyväksymiseen, järjestelmä voi seurata lipukkeiden määrää käyttämällä tätä parametria tietyn lohkomäärän ajalta. Voit asettaa tämän parametrin lompakossasi koska tahansa ennen kuin lipuke äänestää.

Esimerkiksi, voisit valita lippusi väriksi sinisen tai punaisen, asettaa tämän vaihtoehdon, ja järjestelmä laskee seuraavan 1000 lohkon ajalta sinisten ja punaisten lipukkeiden määrän. Ehkäpä punaisia lipukkeita on 3000, sinisiä 1500 ja 500 ei ole valinnut väriä.

Jos korvaamme punainen tai sininen -vaihtoehdon kyllä tai ei -vaihtoehdolla, meillä on äänestysjärjestelmä joka laskee ääniä ajan myötä. PoS-äänestysjärjestelmää käyttäen kuka tahansa joka omistaa DCR:ää voi äänestää agendaksi asetetuista asioista.

Tätä äänestysjärjestelmää voidaan käyttää mihin tahansa hallinnolliseen asiaan. Decredille tärkein käyttötarkoitus on äänestäminen hardforkeista, jotka ovat teknisiä muutoksia siihen miten valuutta toimii. Joitain esimerkkejä:

- Maksimi lohkon koon kasvattaminen.
- PoS-järjestelmän lipukkeen hinnan määrittelevän algoritmin muuttaminen.
- Vote on major new features for the currency (e.g. lightning network, enhanced privacy).
- PoW-algoritmin muuttaminen.
- Pretty much anything the community decides would be in the best interest of the currency.

Alusta jolla yhteisö voi esittää ja puoltaa äänestys agendoja on kehityksen alla.

---

#### 10. Mitä on hardfork äänestäminen?

Kuten mikä tahansa muukin kryptovaluutta, Decredin saattaa olla tarve hardforkata jossain kohtaa.

Yksi PoS-äänestysjäjestelmään asetettavista agendakysymyksistä voi olla hardfork. Jos tällainen kysymys asetetaan, hardfork sisällytetään uuteen versioon Decredin lähdekoodista, mutta hardfork ei aktivoidu ennen kuin PoS-järjestelmä on äänestänyt siitä.

Jotta hardfork-äänestys voi alkaa, kaksi kriittistä ehtoa pitää täyttyä:

- Ensiksi, 75% PoW-louhijoista pitää päivittää uusimpaan versioon verkon block versiosta. Tämä tarkastetaan 1000 lohkon ajalta.
- Toiseksi, 75% PoS-louhijoista pitää päivittää uusimpaan versioon. Tämä tarkistetaan viimeisen 2016 lohkon ajalta.

Kun nämä ehdot täyttyvät, äänestysprosessi alkaa. Lipukkeisiin voidaan asettaa lisäparametri yes/no/abstain. Tämä tehdään lompakossa ennen kuin lipuke äänestää. Pidättäytyviksi merkattuja lipukkeita ei lasketa äänten kokonaismäärään.

PoS-järjestelmä alkaa sitten laskemaan lipukkeita joissa nämä parametrit on asetettu ennaltasovitun lohkomäärän ajalta. Jos tältä ajalta ‘yes’-äänten määrä on 75% tai enemmän, äänestys on mennyt läpi. Tietyn lohkomäärän ajaksi asetettu lukitusaika alkaa ennen kuin hardfork aktivoituu, jotta kaikilla on mahdollisuus päivittää joutumatta hardforkatuksi ulos verkosta.

Koska koodi hardforkille on jo Decredin uusimmassa versiossa, developereiden ei tarvitse tehdä mitään, eikä enemmistön PoW- ja PoS-louhijoista tarvitse päivittää sen jälkeen kun on päästy päätökseen. Jos äänestys hardforkin puolesta menee läpi, se alkaa toimia automaattisesti lukitusajan jälkeen.

Hardfork-äänestys voi epäonnistua useammassa vaiheessa. Äänestys ei välttämättä ala ollenkaan jos PoW- ja PoS-louhijat eivät päivitä. Tämän jälkeen voi olla että 75% raja äänten määrässä ei täyty.

Jos äänestys epäonnistuu, uusi kierros alkaa prosessin alusta. Tämä tarkoittaa että tarkistetaan ovatko PoW-louhijat päivittäneet, ovatko PoS-louhijat päivittäneet ja sen jälkeen aloitetaan uusi ääntenlaskujakso. Tämä jatkuu tietyn kierrosmäärän ajan, kunnes, jos äänestys ei ole mennyt läpi, agenda otetaan käsiteltäväksi.

---

#### 11. Voivatko asiakkaidensa decrediä käyttävät suuret kauppapaikat vaikuttaa PoSiin?

Henkilön (tai kauppapaikan) hallussa oleva decred määrä ei merkkaa mitään PoS:n kannalta. Omistamiesi lipukkeiden määrä ratkaisee. Lipukkeiden ostoon käytetyt varat on lukittu kunnes niillä ostettu lipuke
äänestää. Tämä tarkoittaa että PoS:iin osallistuvat decredit eivät ole siirrettävissä. Jos kauppapaikka käyttäisi asiakkaidensa decrediä äänestämiseen, heidän pitäisi siirtää ne pois lompakoista ja lukita ne jopa 
5 kuukaudeksi. Ihmiset huomaisivat saldomuutoksen (decredit lukittuna PoS:iin eivät näy käytettävissä olevina) eivätkä pystyisi nostamaan varojaan jolloin kauppapaikka kärsisi valtavasta likviditeettivajeesta.

Lisäksi, uusien lipukkeiden määrä on rajoitettu 20 per lohko, eli mikään kauppapaikka ei pystyisi syytämään lipukkeita pooliin tätä nopeammin.

Lopuksi, lipukkeiden määrälle poolissa on asetettu soft cap. 144 lohkon välein (2880 lipuketta) lipukkeen hintaa säädetään perustuen lipukkeiden määrään poolissa, ja vauhtiin jolla uusia lipukkeita
lisättiin edellisessä ikkunassa. Ennen pitkää lipukkeen hinta nousisi niin korkeaksi että edes kauppapaikka ei pystyisi ostamaan montaa lipuketta. Ja muista että vaikka he tekisivät niin, heidän hallussaan oleva DCR
olisi lukittuna jolloin he eivät pystyisi ostamaan lisää kun hinta taas putoaisi.

---

#### 12. Voivatko suuria määriä omistavat tahot, esim. alkuperäiset developerit vaikuttaa PoSiin?

Poolin kokorajoitukset estävät yhtä tahoa syytämästä valtavaa määrää omia lipukkeitaan PoS-pooliin. Vaikka tämä taho ostaisi koko poolin (valtavilla siirtomaksuilla), enimmilään he saisivat
ehkä 4000 lipuketta (perustuen aikaisempiin ikkunoihin joissa noin 30DCR on tavallisesti noussut lähemmäs 100 seuraavaan ikkunaan, ja sen jälkeen maksimiin, joka on usein yli 300). Eli suuren
balanssin omaava voisi ehkä ostaa 2 ikkunaa täyteen. Ikkuna 30 hinnalla tekisi yhteensä 86,400DCR, jonka jälkeen seuraava 100 hinnalla olisi 288,000DCR. Eli maksaisi 374,400DCR ostaa 5760 lipuketta. Tavoite poolin koon ollessa 40960 lipuketta, 374400 DCR tarkoittaisi noin 14% kaikista lipukkeista.

Now the holder could wait a couple of days for the price to drop then start buying back up again. Except that most of their funds will be locked in the ones they bought earlier (although some will have voted) so their buying power for the new window is greatly reduced. But let's say they have super capital and bought all the decred on all exchanges. So they are able to buy another two windows and replace those tickets that voted and were successful in buying all the tickets (at very high fees and/or prices). Let's say that takes them to about 25% of the tickets.

Lohkon lipukkeen valitaan satunnaisesti. Pakottaaksesi äänestyksen tuloksen johonkin suuntaan, tarvitsisit 3 ääntä viidestä kyseisessä lohkossa, eli 60%. Käytettyään valtavan määrän rahaa,
tällä taholla olisi silti alle puolet siitä mitä vaaditaan. Ja äänestystä ei päätetä yhdessä lohkossa, eli tarvitaan 60% 75%:sta koko äänestysjakson lohkoista.

Jonka jälkeen vielä PoW-louhijoiden pitää vahvistaa äänet. Jos he uskovat jonkun yrittävän manipuloida järjestelmää, he voivat hylätä lohkot.

Joten käytännössä tämä on lähes mahdotonta, vaikka yhdellä taholla olisi VALTAVA määrä DCR:ää.

But then we come to the stake pools. Stake pools, while not having access to any of their users' funds, do have the ability to change votes on tickets assigned to them. This is why it is suggested that when joining a stake pool, people don't just go for the largest one. Decred is short for 'decentralised credit' so part of the spirit of PoS is ensuring that the PoS stake pools don't get too large in relation to the others. However, even the largest at almost 20% would still only get on average one vote per block.

Eli Decred on vartavasten suunniteltu minimoimaan sekä suurten PoW- että PoS-poolien kuten myös suuria määriä omistavien yksittäisten tahojen (mukaanlukien developerit) vaikutus.

## <i class="fa fa-book"></i> Linkit

[^1]: [Paymetheus Lipukkeenosto-opas](/getting-started/user-guides/using-paymetheus.md#-purchase-tickets-tab)
