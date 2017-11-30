# <i class="fa fa-firefox"></i>Web-sovelluksen Käyttöopas

---

Jos et halua asentaa sovelluksia tietokoneellesi, voit käyttää
yksinkertaista web-lompakkoa. Se perustuu
[Copayhin](https://github.com/bitpay/copay) jota on muokattu Decrediä varten
ja se löytyy osoitteesta
[https://wallet.decred.org](https://wallet.decred.org)

Pari asiaa mitä sinun tulee tietää web-sovelluksesta 
ennen sen käyttöä:

* Et voi
  [stake-louhia](/mining/proof-of-stake.md)
  sillä.
* Lompakkosi pidetään kokonaisuudessaan selaimesi paikallisessa
  muistissa. Tämä tarkoittaa että jos tyhjennät paikallisen muistisi, poistat
  samalla lompakkosi ja joudut luomaan sen uudestaan siidistä.
* Lompakkosi turvallisuus riippuu täysin 
  selaimesi turvallisuudesta.
* Voit asettaa lompakollesi pin-koodin estääksesi rahojen lähettämisen, mutta
  kaikki muu pääsy riippuu täysin käyttäjäkontrollista
  tietokoneellasi, ei serveristä tai kirjautumistunnuksista.

---

## <i class="fa fa-plus-circle"></i> Tee oma web-sovellus lompakkosi

> Vaihe Yksi

Mene osoitteeseen [https://wallet.decred.org](https://wallet.decred.org). Siellä näet
`Käyttöehdot` ruudun. Huomioi erityisesti
seuraava:

Kuten komentojonolompakon kanssa, jos hukkaat siidisanasi tai
salasanasi, menetät pääsyn lompakkoosi. Salasanaa ei voi
palauttaa. Huomaa myös että kaikki Decred-siirrot ovat
mahdottomia peruuttaa. Jos vahingossa lähetät rahaa väärään
osoitteeseen, joudut pyytämään vastaanottajaa lähettämään ne takaisin.
Developerit eivät pysty peruuttamaan siirtoja.

Klikkaa `I Agree` luettuasi `Käyttöehdot`. Nyt näet
tervetuloa-ruudun. Jos tämä on ensimmäinen kerta kun
käytät Decrediä, klikkaa `Get Started`. Jos haluat palauttaa
aikaisemmin käytetyn lompakon, klikkaa `Import Backup`. Tämä opas
olettaa että olet aloittelija, joten klikkaa `Get Started`.

> Vaihe Kaksi

Click the dropdown in the top left, then click `Add wallet`. Click
`Create New Wallet`. Give your wallet a name then click `Create New Wallet`.

A wallet will be generated for you.


> Vaihe Kolme

Lompakkosi on nyt tehty ja valmis käytettäväksi. Ennen kuin teet muuta,
on erittäin suositeltavaa lisätä salasana varojen lähettämistä varten ja
kirjoittaa ylös siidisanat joita käytimme lompakon luomiseen. Tämä on erityisen
tärkeää web clientille joka ei säilytä lompakkoasi pysyvästi muistissa.
Lompakkosi data on tallennettu selaimesi välimuistiin ja voidaan poistaa
varsin helposti. Jos käytät incognito-tilaa, se poistetaan heti kun sammutat
selaimen. **ILMAN TÄTÄ SEED PHRASEA MENETÄT PÄÄSYN LOMPAKOSSASI
OLEVIIN RAHOIHIN** jos lompakon data poistetaan tai se tuhoutuu. Varat itsessään
ovat olemassa lohkoketjussa, mutta ilman siidiä et pääse niihin käsiksi.

<i class="fa fa-exclamation-triangle"></i> **ÄLÄ KÄYTÄ SAMAA SIIDIÄ USEAMMASSA LOMPAKOSSA! Lue [Lompakot ja Siidit FAQ](/faq/wallets-and-seeds.md#3-can-i-run-multiple-wallets) nähdäksesi miksi tämä on tärkeää. On suositeltavaa, aina kun mahdollista, että uusi lompakko = uusi siidi.**

Klikkaa `Preferences`-näppäintä oikealla lompakon nimeä vastapäätä. Täällä on oikeastaan vain kolme asiaa jotka saattavat olla kiinnostavia:

Asetus                                | Kuvaus
---                                   | ---
`Wallet Alias`                        | Voit uudelleen-nimetä lompakon jos haluat.
`Request Password for Spending Funds` | Koska lompakkosi on tallennettu selaimen välimuistiin, siihen käsiksi pääsemiseen ei tarvita erillistä salasanaa. Asettamalla salasanan tässä, varmistat että vain sinä pystyt käyttämään rahojasi, jos joku muu käyttää selaintasi. Syötä salasana ja klikkaa `Set`. Huomioi muistutus joka sanoo että salasanoja ei voi palauttaa. Lompakossa ei ole salasananpalautus-mahdollisuutta. Jos hukkaat salasanasi, et ikinä enää voi siirtää kolikoitasi ulos lompakosta tai käyttää niitä proof-of-stake-äänestämiseen.
`Backup`                              | Täältä löydät siidisanasi.

> Vaihe Neljä

Klikkaa `Backup`. Näet tämän ruudun:

Ihan ensimmäisenä, lue huomautus. Käytä vain YHTÄ lompakkoa kerrallaan tietylle siidille
(Katso: [FAQ](#)). Sinulla voi olla useita lompakkoja asennettuna eri laitteille, mutta
vain yhden niistä pitäisi olla käynnissä kerrallaan. Klikkaa `Show Wallet Seed`.  Kirjoita tämä
ylös turvalliseen paikkaan, tai kirjaa se salattuun dokumenttiin jonka salasanan pidät tallessa.
Tätä listaa sanoja käytetään generoimaan authentication key lompakollesi. Kuka tahansa jolla on tämä
lista hallussaan pääsee käsiksi lompakossasi oleviin varoihin.

> **ERITTÄIN TÄRKEÄÄ**

**ÄLÄ KOSKAAN, MISSÄÄN TAPAUKSESSA, ANNA SIIDIÄSI KENELLEKÄÄN! EI EDES DEVELOPEREILLE!**

Kun olet kirjoittanut sanat ylös (ja huolellisesti tarkistanut että ne ovat oikein; isot kirjaimet ovat tärkeät), siirry seuraavaan vaiheeseen.

> Vaihe Viisi

Nyt kun olet kirjoittanut ylös siidisanasi ja tarkistanut ne, tee se uudelleen.
Oikeasti. Tämä on kriittinen askel. Ilman tätä listaa lompakkoasi
ei voida palauttaa ja kukaan, edes developerit eivät voi sitä tehdä.
Nyt kun olet varma että lista on tallennettu oikein, klikkaa
`Delete Words`. Klikkaa `Back` kaksi kertaa päästäksesi takaisin lompakon perusnäkymään.

---

## <i class="fa fa-long-arrow-right"></i> Lähetä rahaa web clientilla

> Vaihe Yksi

Web-lompakon pääsivulla, klikkaa `Send` näppäintä alhaalla.
Pääset tälle sivulle. Huomaa että `Advanced Options`
on jo laajennettu. `To`-kenttään, syötä vastaanottajan
Decred-osoite.

> Vaihe Kaksi

Kohtaan `Amount` syötä DCR-määrä jonka haluat lähettää vastaanottajalle. Jos niin
haluat, voit kirjoittaa vapaaehtoisen viestin `Note`-kenttään. Paina `Send`. 
`Use Unconfirmed Funds`-valinta sallii sinun käyttää varoja jotka verkko tietää
olevan lähetetty sinulle, mutta joita ei ole vielä vahvistettu [proof-of-work-louhijoiden](/mining/proof-of-work.md) toimesta. Jos tämä vaihtoehto on päällä ja spesifioitu summa voidaan täyttää vain
käyttämällä vahvistamattomia varoja, siirto ei etene ennen kuin tarvittavat varat on vahvistettu.

---

## <i class="fa fa-long-arrow-left"></i> Vastaanota rahaa web clientilla

> Vaihe Yksi

Klikkaa `Receive` nappulaa ikkunan alalaidassa. Näkyviin tulee
seuraava ruutu:

Anna näkyvissä oleva osoite henkilölle joka on lähettämässä sinulle DCR:ää (se alkaa
etuliitteellä `Ds`) tai hän voi käyttää QR koodia jos hänen lompakkonsa tai palvelunsa
ne hyväksyy. Voit käyttää samaa osoitetta niin usein kuin haluat, mutta
yksityisyyden vuoksi on suositeltavaa tehdä uusi osoite joka kerta.
Älä huoli osoitteen kaksoiskappaleen saamisesta. Mahdollisia osoitteita
on noin `2.08x10^93`, joten luultavasti näemme maailmanlopun ennen
kuin meiltä loppuvat Decred-osoitteet kesken.

