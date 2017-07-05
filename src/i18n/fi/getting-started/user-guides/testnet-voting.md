# Testnet Hard Fork -Äänestysopas

Tämä opas on viimeksi päivitetty versiolle 1.0.1 

Version 0.8.0 julkaisusta 13. Helmikuuta 2017, hard-fork-äänestysmekanismi lisättiin Decred Testnetiin. Testiäänestyksen arvioidaan alkavan 25. Helmikuuta 2017, kello 13:00 CST, ja kestävän 7 päivää. Jos haluat osallistua, oppaat Paymetheukselle ja komentojonosovellukselle löytyvät täältä.

---

## Esittely

Äänestysprosessi jolla toteutetaan konsesusmuutokset jotka voivat johtaa hard forkiin, on kaksivaiheinen. HUOM: Seuraavat lohkointervallit ovat testnetille, ne eroavat mainnetin vastaavista.

Ensimmäinen askel on täyttää verkon päivitysvaatimus. Kun hard fork koodi on julkaistu, enemmistön PoW/PoS-louhintaan osallistuvista nodeista pitää päivittää ennen kuin äänestys voidaan aloittaa. Proof-of-Work-järjestelmässä uusin lohkoversio pitää olla vähintään 75% viimeisestä 100 lohkosta. Proof-of-Stake-järjestelmässä, uusin äänestysversio pitää olla vähintään 75% annetuista äänistä kiinteän 2016 intervallin aikana.

Prosessin toinen vaihe on itse äänestäminen. Edellinen 2016 lohkon intervalli putoaa jonnekin suuremman 5040 lohkon intervallin sisään ja verkon pitää odottaa tämän suuremman 5040 lohkon intervallin päättymistä. Intervallien eri pituudesta johtuen, *saatetaan* tarvita jopa 5040 lohkoa ennen kuin äänestysikkuna avautuu. Tämän jälkeen kiinteän 5040 lohkon ikkunan aikana tapahtuu äänestys ja jos 75% äänistä jotka louhitaan tuon intervallin aikana äänestävät 'yes' ehdotettuihin muutoksiin, muutokset otetaan käyttöön uuden lohko intervallin jälkeen (jotta kaikki nodet joiden tarvitsee, ehtivät päivittää eikä niitä forkata ulos lohkoketjusta). Alla yksinkertaistettu kartta joka selittää eri lohkointervallit siinä järjestyksessä kun ne tapahtuvat.

Intervallin kuvaus | Intervallin Tyyppi | Lohkojen Määrä
---------------------|-------------|---------------
Minimissään 75% lohkoista pitää olla uusinta versiota | Rullaava | 100
Minimissään 75% äänistä pitää olla uusinta versiota | Staattinen | 2016
Aikaväli kun päivitysvaatimukset täyttyvät | Staattinen | 5040 asti
Varsinainen äänestysjakso - 75% äänistä pitää viestittää "kyllä" läpimenoa varten | Staattinen | 5040
Pre-implementation-jakso jos äänestys menee läpi | Staattinen | 5040

Jos ehdotus ei saa 10% 'ei' tai 'kyllä' ääniä, stakeholderit voivat äänestää siitä uudestaan seuraavan äänestysintevallin aikana, kunnes tämä raja täyttyy tai ehdotus vanhenee.

Alla ohjeet demoäänestykseen osallistumiseen Testnetissä stakepoolin kautta Paymetheusta ja/tai komentojonosovelluksia `dcrd`, `dcrwallet`, ja `dcrctl` käyttäen. Komentojono-opas käyttää konfiguraatiotiedostoja syöttääkseen parametrejä sovellukselle käynnistyksen yhteydessä. Vaihtoehtoisesti, sovellusta käynnistettäessä voidaan käyttää flägejä, mutta niitä ei ole sisällytetty tähän.

## Paymetheus

> 1: Lataa ja Asenna Paymetheus

If you haven't already updated your Decred binaries to v1.1.0, visit the [Installation Guide](/getting-started/user-guides/paymetheus.md) and follow the directions for the Windows Installer.

>2: Käynnistä Decred Testnet

Käynnistä `Decred Testnet` Start valikosta. Tämä käynnistää `Paymetheuksen` ja uusi komentojonoikkuna aukeaa ja käynnistää `dcrd.exe`n. Jos tämä on ensimmäinen kerta kun käynnistät testnet daemonin, kestää hetken kun ohjelma synkronoi testnetin lohkoketjun.

`Paymetheus`-ikkunassa näet "Connect to dcrd" dialogin. Säilytä oletukset ja paina continue-näppäintä. Seuraavassa näkymässä on kaksi näppäintä, "Create a new wallet" ja "Restore wallet from seed." Tässä oppaassa oletamme että sinulla ei jo ole siidiä jonka haluaisit palauttaa.

Klikattuasi "Create a new wallet," saat uuden lompakkosi siidin. Kirjoita siidi ylös ja säilö se turvalliseen paikkaan, äläkä ikinä jaa sitä kenenkään kanssa. Joudut myös syöttämään sen uudelleen painettuasi CONTINUE näppäintä.

Kun olet kirjoittanut siidisi, Encrypt Wallet-näkymä on seuraavaksi. Syötä yksityinen salasanasi kuten ohje sanoo. Paina ENCRYPT. Paymetheus alkaa nyt tekemään lompakkoasi. Kun se on tehty, se aukeaa lompakon yleiskatsaus-sivulle.

> Vaihe 3: Rekisteröity Stakepool Websivulle

Kun odotat nodesi/lompakkosi synkkaavan, käy osoitteessa [https://teststakepool.decred.org](https://teststakepool.decred.org) ja rekisteröi uusi käyttäjätili.

> Vaihe 4: Hanki Testnet-kolikoita

Seuraavaksi sinun tarvitsee hankkia Testnet-kolikoita jotta voit ostaa Testnet-lipukkeita. Virallisen Testnet faucetin löydät osoitteesta [https://faucet.decred.org](https://faucet.decred.org). Saadaksesi uuden osoitteen Paymetheuksesta, klikkaa "Request payment"-välilehteä navigation-valikossa. Kun klikkaat "GENERATE ADDRESS" nappia, saat osoitteen jonka pitäisi alkaa etuliitteellä "Ts". Kopioi ja liitä tämä osoite faucetiin saadaksesi kolikkosi.

> Vaihe 5: Osta Testnet-lipukkeita

Klikkaa "Purchase tickets"-välilehteä Paymetheuksen navigaatiovalikossa. Näet sivulla 7 lomake-kenttää. Kaikki oletusarvot kelpaavat lipukkeiden ostoon **paitsi** "Stake pool preference". Klikkaa "Manage pools" nappia. Sinun tarvitsee syöttää testnet stakepool-tilisi API-avain. Tehdäksesi tämän, mene osoitteeseen [https://teststakepool.decred.org/settings](https://teststakepool.decred.org/settings) - API-avaimesi pitäisi olla sivulla nähtävissä ylimpänä. Syötä se API Key -kenttään Paymetheuksessa ja paina Save. 1-of-2 multi-sig scriptisi tehdään nyt automaattisesti ja voit painaa Close. 

Seuraavaksi, valitse teststakepool.decred.org Stake pool preference -menusta ja paina Purchase-painiketta aloitaaksesi lipukkeiden ostamisen! HUOM: lipukkeen vaikeustaso on yhtä kuin lipukkeen hinta, joten varmista että sinulla on riittävästi testnet-kolikoita ostaaksesi vähintään yhden.

> Vaihe 6: Aseta Lipukkeidesi Votebitit Stakepoolin Kautta

Kun käytät stakepoolia, kaikkien ostamiesi lipukkeiden äänioikeus delegoidaan stakepoolille. Oletuksena pool äänestää haluamallaan tavalla. Voit luonnollisesti halutessasi muuttaa miten lipukkeesi äänestävät.

Voit asettaa lipukkeidesi votebitit stakepoolin tickets-paneelista. Alla ruutukaappaus [https://teststakepool.decred.org/tickets](https://teststakepool.decred.org/tickets) -sivulta. "Live/Immature"-osion allan näet votebit-asetukset. Voit editoida vain *kaikkien* lipukkeidesi votebitejä kerralla poolin interfacessa. Lipukkeet kuvattuna alla on asetettu äänestämään "Yes" aiheesta "Previous Block Valid?" ja "Yes" aiheesta "Increase Block Size from 1.0 MiB to 1.25MB" jonka lopputulos on Votebit arvo 5.

<img src="/img/testnet-voting_votebit-setting.jpg">

Saadaksesi perustietoa Votebitseistä käy osoitteessa [An Explanation of Votebits](#an-explanation-of-votebits).

## Komentojono-ohjeet

> Vaihe 1: Lataa ja asenna Decred

If you haven't already updated your Decred binaries to v1.1.0, visit the [Installation Guide](/getting-started/user-guides/cli-installation.md) and follow the directions for your operating system.

> Vaihe 2: Tee Config-Tiedostot

Jos `.conf`-tiedostot ovat sinulle tuttuja, jatka vaiheeseen 3.

Ole hyvä ja lue [Konfiguraatiotiedostojen Alkeet](/getting-started/startup-basics.md#configuration-files) ja joko tee uudet conf-tiedostot tai kopioi esimerkkitiedostot käyttöjärjestelmästä riippuen oikeaan kansioonsa.

> Vaihe 3: Editoi Config-Tiedostoja Käynnistääksesi Testnet

Käynnistääksesi `dcrd`:n, `dcrwallet`in, ja `dcrctl`:n testnetissä, lisää `testnet=true` tai `testnet=1` kaikkiin kolmeen konfiguraatiotiedostoon. Jos käytät jotain esimerkkiconf-tiedostoista, voit vain etsiä rivin `;testnet=1` (ensimmäinen asetus Network Settings-osiossa) ja poistaa puolipisteen.

Tämä pitää tehdä kaikille kolmelle konfiguraatiotiedostolle.

> Vaihe 4: Tee Uusi Testnet Lompakko

Jos et ole koskaan käyttänyt testnet-lompakkoa, sinun tulee tehdä uusi. `dcrwallet.conf`-tiedostosi asetettuna testnetiä varten **(katso vaihe 3)**, käynnistä `dcrwallet` `--create` flägillä. 

Jos tämän tekeminen ei ole sinulle tuttua, seuraa käyttöjärjestelmääsi vastaavia ohjeita alla:

**Windows**: <br />
    1. Command Promptia tai File Exploreria käyttäen, mene kansioon jossa `dcrwallet` executable sijaitsee <br />
    2. Jos käytät File Exploreria, valitse "Open command prompt" "File" valikosta <br />
    3. Syötä komento `dcrwallet.exe --create`

**macOS**: <br />
    1. Terminalia tai Finderia käyttäen, mene kansioon jossa `dcrwallet` executable sijaitsee <br />
    2. Jos käytät Finderia, voit avata uuden Terminaalin kansiossa klikkaamalla kansiota oikealla näppäimellä valitsemalla Services > New Terminal at Window -dropdown-valikosta<br />
    3. Syötä komento `./dcrwallet --create` 

**Linux**: <br />
    1. Käyttäen mitä keinoa haluat, mene kansioon jossa `dcrwallet` executable sijaitsee <br />
    2. Syötä komento `./dcrwallet --create` 

Tämä vie sinut tavanomaisten lompakontekoruutujen läpi. Seuraa ohjeita ruudulla. Sinun tulee tehdä yksityinen salasana (jota käytät myöhemmin lompakon lukituksen avaamiseen tehdessäsi siirtoja). Salauksen lisäkerros on täysin vapaaehtoinen. Siidiäsi voidaan käyttää palauttamaan lompakkosi millä tahansa tietokoneellä dcrwalletia käyttäen. Kirjoita siidisi ylös ja säilö se turvalliseen paikkaan äläkä ikinä jaa sitä kenenkään kanssa. Lompakko sulkeutuu kun kaikki on valmista.

> Vaihe 5: Käynnistä dcrd Testnetissä

Käynnistääksesi nodesi testnetissä, käynnistä `dcrd` executable käyttäen flägiä `testnet=1` tai lisäämällä config-tiedostoon asetus `testnet=true`. Nodesi alkaa synkronoimaan verkon kanssa. Tämä kestää jonkin aikaa.

> Vaihe 6: Käynnistä dcrwallet Testnetissä

Käynnistä `dcrwallet` executable `testnet=1` tai `testnet=true` asetettuna config-tiedostoon käynnistääksesi lompakon testnetissä. Lompakkosi ottaa yhteyttä nodeen ja alkaa synkronoimaan osoitteitasi. Synkronointi saattaa kestää hetken.

> Vaihe 7: Rekisteröidy Stakepoolin Websivulla

Kun odotat että nodesi/lompakkosi synkronoi, käy osoitteessa [https://teststakepool.decred.org](https://teststakepool.decred.org) ja rekisteröi uusi tili. Jatka vaiheeseen 8.

> Vaihe 8: Odota että Testnet Node/Lompakko Synkronoi

Pidä tauko, tässä kestää hetken.

> Vaihe 9: Tee Public Key -Osoite Käyttääksesi Stakepoolia

Ensimmäinen askel stakepoolin käyttöön on generoida uusi public key -osoite jota käytetään 1-of-2 multisignature scriptin tekemiseen. Seuraa ohjeita osoitteessa [https://teststakepool.decred.org/address](https://teststakepool.decred.org/address) generoidaksesi ja tallentaaksesi tämän osoitteen. Jos olet tehnyt tilin mainnet stakepooliin, tämä on sama.

> Vaihe 10: Importtaa P2SH Multi-Sig Scriptisi Stakepoolista

Seuraavaksi sinun pitää importata scripti joka sallii sinun delegoida äänioikeuden poolille. Edellisen vaiheen jälkeen scriptin pitäisi olla saatavissa osoitteessa [https://teststakepool.decred.org/tickets](https://teststakepool.decred.org/tickets) . Seuraa jälleen ohjeita importataksesi scriptin. Jos olet tehny tilin mainnet stakepoolin, tämä on sama asia.

> Vaihe 11: Hanki Testnet-kolikoita

Seuraavaksi, tarvitse Testnet-kolikoita ostaaksesi Testnet-lipukkeita. Virallinen Testnet faucet löytyy osoitteesta [https://faucet.decred.org](https://faucet.decred.org). Syötä Testnet-osoite (jonka voit hakea käyttämällä `getnewaddress` komentoa - esimerkit eri käyttöjärjestelmille alla)

    Windows: dcrctl.exe --wallet getnewaddress
    macOS/Linux: ./dcrctl --wallet getnewaddress

> Vaihe 12: Osta Testnet-lipukkeita

[https://teststakepool.decred.org/tickets](https://teststakepool.decred.org/tickets) esittelee kolme vaihtoehtoa lipukkeiden ostoon. Paras vaihtoehto on ostaa manuaalisesti, jolloin voit ostaa lipukkeita silloin kun niitä tarvitset.

Syötä komento `dcrctl --wallet getstakeinfo` nähdäksesi tämänhetkisen vaikeustason. Tämä on tämänhetkinen lipukkeen hinta. Säädä purchaseticket-komentoa joka on nähtävissä stakepoolin tickets-sivulla täyttääksesi tämänhetkisen hinnan.

> Vaihe 13: Odota että Äänestys Alkaa

Ensiksi, minimissään 75% KAIKISTA annetuista äänistä viimeisen 2016 lohkon aikana pitää tulla nodesta jolla on käynnissä uusin Decred-ohjelmisto. Seuraavaksi, 5040 lohkon intervallin pitää kulua ennen kuin äänestys alkaa. Katso [https://hardforkdemo.decred.org](https://hardforkdemo.decred.org) nähdäksesi tuoreimman statuksen koko äänestysprosessille.

> Vaihe 14: Aseta Lipukkeesi Votebitit Stakepoolin Kautta

Kun käytät stakepoolia, kaikkien ostamiesi lipukkeiden äänioikeus delegoidaan stakepoolille. Oletuksena pool äänestää parhaaksi katsomallaan tavalla. Tietysti saatat haluta muuttaa sitä miten lipukkeesi äänestävät.

Voit asettaa lipukkeidesi votebitit stakepoolin tickets interfacessa. Alla ruutukaappaus [https://teststakepool.decred.org/tickets](https://teststakepool.decred.org/tickets) sivusta. "Live/Immature"-osion alta löydät votebit-asetukset. Voit muokata votebittejä ainoastaan *kaikille* lipukkeillesi kerralla poolin interfacen kautta. Alla nähtävissä olevat lipukkeet on asetettu äänestämään "Yes" kysymykseen "Previous Block Valid?" ja "Yes" kysymykseen "Increase Block Size from 1.0 MiB to 1.25MB" jonka tuloksena Votebit arvo on 5.

<img src="/img/testnet-voting_votebit-setting.jpg">

## Votebits Selitys

Alla ruutukaappaus oleellisista votebit-arvoista vote version 4:lle

<img alt="Graph explaining the votebit values of vote version 4." src="/img/testnet-voting_vote-version-4.jpg">

Ruutukaappaus on aika selkeä. Poolin interfacessa, jos käyttäjä valitsee "Yes" lohkon koon kasvattamiselle ja "Yes" edellisen lohkon hyväksymiselle, lipukkeen votebit-asetus on "5".

Alla ruutukaappaus josta näkyy mistä Votebits ja Vote Version löytyvät äänestävän siirron sisältä lohkohaun kautta osoitteessa [https://testnet.decred.org](https://testnet.decred.org). Tämä ääni annettiin votebit arvolla 5, kuten 2. siirto output osoittaa.

<img src="/img/testnet-voting_vote-version-and-votebits.jpg">

Voit helposti tarkistaa antamasi äänet klikkaamalla Ticket Transaction Hashia minkä tahansa lipukkeen kohdalta "Voted Tickets" -osiossa [https://teststakepool.decred.org/tickets](https://teststakepool.decred.org/tickets) sivulla. (HUOM: Äänesi *saattaa* näkyä V0:na [Version 0] johtuen stakepoolin koodissa olevasta bugista -  tämä on työn alla ja saattaa olla jo korjattu siihen mennessä kuin tämä opas julkaistaan.)

## Hard Fork Demo Websivu

Uuden äänetysimplementaation esittelyä varten olemme tehneet sivun [https://hardforkdemo.decred.org](https://hardforkdemo.decred.org). Jokainen vaihe on visualisoitu grafiikoin suoraviivaisten selvitysten kera.
