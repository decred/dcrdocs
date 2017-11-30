#  <i class="fa fa-gavel"></i> Decredin Perustuslaki

---

*Decred* (/ˈdi:ˈkred/, /dɪˈkred/, dee-cred) on avoin, progressiivinen ja itse-rahoittava kryptovaluutta, jonka lohkoketjuun on intergroitu yhteisöpohjainen hallintojärjestelmä. Projektin tehtävä on kehittää teknologiaa yhteiseksi hyväksi, pääasiallinen fokus cryptovaluuttateknologiassa. *Decred*iä, valuuttana ja projektina, sitoo seuraavat säännöt, jotka sisältävät ohjeistavia periaatteita, hallintojärjestelmän, ja rahoitusmekanismin. Nämä säännöt ovat olemassa jotta saadaan luotua oikeudenmukaiset ja kestävät puitteet *Decred*in tavoitteiden saavuttamiseksi.

---

## Periaatteet

* *Ilmainen avoimen lähdekoodin ohjelmisto* - Kaikki sovellukset jotka kehitetään osana *Decrediä* ovat ilmaisia ja lähdekoodi on avoin.
* *Sananvapaus ja harkinta* - Kaikilla on oikeus tuoda julki mielipiteensä ja ideansa ilman pelkoa sensuurista. Kaikki rakentava puhe joka perustuu faktoihin ja kohtuullisuuteen pääsee harkintaan.
* *Multi-Stakeholder Inklusiivisuus* - Inklusiivisuus edustaa multi-stakeholdersysteemiä jonka tarkoitus on varmistaa käyttäjien ja mielipiteitten monipuolisuus. Vaikka olisi ideaalista sisällyttää kaikki, *Decred* on sitoutunut noudattamaan tarvittuja lakeja ja säädöksiä, kuten kauppasaartoja ja muita kaupanrajoituksia.
* *Porrastettu Yksityisyys ja Turvallisuus* Yksityisyys ja turvallisuus ovat prioriteetteja ja ne tasapainotetaan monimuotoisuuden lisäämisellä. Lisäturvallisuus- ja yksityisyysteknologiaa lisätään jatkuvasti porrastetusti, sekä yllättäviä uhkia vastaan että muuten vain.
* *Kiinteä Rajallinen Kokonaismäärä* - Kolikoiden liikkeellelasku on rajoitettu ja *Decred* kolikoiden maksimimäärä ei muutu. Maksimimäärä *Decred* kolikoita on 20,999,999.99800912, jotka lasketaan liikkeelle per-lohko määräisesti, 6,144 lohkon välein (noin 21.33 päivää) tätä määrää pienentäen kertoimella 100/101. Genesis-lohko palkkio alkaa 31.19582664 kolikosta.
* *Universaali vaihdettavuus* - Universaali vaihdettavuus on elintärkeää *Decredille* arvon säilyttämisen kannalta ja hyökkäyksiä sitä vastaan valvotaan aktiivisesti ja vastatoimia tehdään vaatimusten mukaan.

---

## Hallinto Lohkoketjussa

* Verkon hallinnointi tapahtuu suoraan lohkoketjussa yhdistämällä lohkon proof-of-work ("PoW") proof-of-staken ("PoS") kanssa. PoSiin osallistujat, joita kutsutaan stakeholdereiksi, voivat ohittaa PoW-osallistujat, joita kutsutaan louhijoiksi, jos vähintään 60% stakeholdereista äänestää louhijan ratkaisemaa lohkoa vastaan.
* Arvontajärjestelmää käyttäen päätetään ketkä stakeholderit äänestävät kussakin lohkossa ja saavat tästä palkkion.
* Tullakseen stakeholderiksi, käyttäjän pitää ostaa yksi tai useampi lipuke, joka vaatii tietyn kolikkomäärän lukitsemista noin 1 päivän ajaksi (256 lohkoa).
* Kun lipuke odottamisen jälkeen kypsyy, se osallistuu arvontaan joka tapahtuu joka lohkossa. Voittavat lipukkeet saavat äänioikeuden edelliseen lohkoon.
* Stakeholdereiden pitää odottaa keskimäärin 28 päivää (8,192 lohkoa) äänestääkseen lipukkeillaan, ja tänä aikana kolikot jotka on käytetty lipukkeen ostamiseen pysyvät lukittuina. Odotusaika saattaa olla pidempi tai lyhyempi kuin keskiarvo 28 päivää sillä lipukkeiden valintaprosessi on pseudo-satunnainen. Lipukkeet vanhenevat noin 142 päästä (40,960 lohkoa).
* Stakeholdereiden äänet tallennetaan lohkoketjuun ja niistä maksetaan palkkiona 6% lohkossa syntyvistä uusista kolikoista. Jokaisessa lohkossa voi olla 5 äänestäjää, jolloin äänestäjät saavat yhteensä 30 prosenttia lohkopalkkiosta.
* PoW saa 60% jokaisen lohkon palkkiosta, rajoitettuna niin että se skaalaa lineaarisesti PoS-äänten määrän kanssa. esim. 3/5 äänestäjää vähentää PoW-palkkion 60% maksimista.
* Äänet itsessään päättävät enemmistön päätöksellä, onko edellisen lohkon transaction tree, mukaanlukien PoW-palkkio, validi. Jos PoS-äänestäjät äänestävät tiettyä PoW-lohkoa vastaan, PoW-palkkio (ja kehittämiseen menevä osuus) tuhotaan ja kaikki lohkon sisältämät tavalliset siirrot mitätöidään.
* Lisää vote bittejä voidaan asettaa stakeholdereiden äänestäessä, sallien stakeholdereiden äänestää muistakin asioista kuin viimeisimmästä lohkosta.

---

## Projektin Hallinointi

* Lohkoketjuun liittymätöntä päätösvaltaa käytetään ratkaisemaan kehitykseen liittyviä riitoja niiden ilmaantuessa *Decred Assembly*n toimesta äänestämällä ("PoA"), kunnes ratkaisu liitetään lohkoketjuun.
* *Decred Assembly* kootaan monipuolisesta jäsenistöstä jotka valitaan edustamaan *Admission Council*in toimesta projektin ekosysteemiä.
* Neuvostot jotka koostuvat Assembly-jäsenistä muodostetaan päättämään ajankohtaisista asioista. Alustavat neuvostot päättävät erikseen johtamisesta (*Johtoneuvosto*), luomisesta (*Luomisneuvosto*), ja säätelystä (*Säätelyneuvosto*).
* *Johtoneuvosto* äänestää ja päättää Assemblyyn otettavista uusista jäsenistä. Kaikki muut neuvostot luo *Luomisneuvosto*. *Säätelyneuvosto* irtisanoo tarvittaessa toiset neuvostot tai Assembly-jäsenet.
* *Decred Assembly*yn hyväksytään jäsenet jotka saavat 60% *Johtoneuvosto*n äänistä taakseen. Assemblyn jäsenille ei ole ikä- tai kansallisuusvaatimuksia, ainoastaan *Johtoneuvosto*n hyväksyntä vaikuttaa. Sopivuutta arvioidaan kahdella tavalla: (1) projektissa mukanaoloajan pituus, ja (2) ehdokkaan aikaansaamat muutokset/parannukset projektiin.
* *Säätelyneuvosto* voi erottaa tai poistaa jäseniä Assemblystä 60% enemmistöäänillä, jos (1) jäsen laiminlyö vastuunsa neuvostossa tai Assemblyssä, ja/tai (2) on haitaksi projektille tai muuten rikkoo tai loukkaa sen perustuslakia.
* Kaikki neuvostolle muodollisesti esitellyt asiat päätetään äänestyksellä 365 päivän sisään.

---

## Rahoitus

* Kestävyys ja jatkuvuus vaativat että 10% kaikista lohkopalkkioista annetaan  jatkuvasti kehityksestä vastaavalle organisaatiolle. Alkuperäinen kehitysorganisaatio on *Decred Holdings Group* LLC ("DHG"), Nevis LLC joka on vastuussa projektin kehittämiseen tähtäävän työn, kuten ohjelmistokehityksen, infrastruktuurin ja tiedotuksen, rahoituksesta.
* DHG rahoittaa ainoastaan työtä joka noudattaa ohjeistavia periaatteita.
* DHG antaa julkisen rahoitusselvityksen kuuden kuukauden välein, alkaen Maaliskuun 8. päivä, 2016. Rahoitusselvitysten väliä voidaan tihentää tarvittaessa, mutta ne annetaan enintään kerran vuosineljänneksessä.
* DHG esittelee budjettiehdotuksen joka vuosi Maaliskuun 8. päivänä, sen jälkeen kun vastaava julkinen rahoitusselvitys on annettu.
* *Rahoitusneuvosto* tarkistaa, ehdottaa ja tekee muutoksia, ja lopulta hyväksyy ehdotuksen Huhtikuun 8. päivään mennessä, kuukausi alkuperäisen budjettiehdotuksen jälkeen.
* Budjetin lopullinen hyväksyntä PoA:n äänestyksellä tapahtuu *Rahoitusneuvosto*n hyväksynnän jälkeen 18. Huhtikuuta mennessä, kaksi kuukautta alkuperäisen ehdotelman jälkeen.
* DHG tekee julkisen ehdotuksen ("RFP") projektista joka on tarkoitus toteuttaa urakkatyönä. RFP:hen kuuluu selvitys siitä miten työ edistää tai parantaa projektia. Urakasta kiinnostuneiden tulee toimittaa: (1) yksityiskohtainen kuvaus siitä miten urakka suoritetaan, (2) lista vaiheista joilla voidaan todentaa työn edistyminen, sekä (3) vaihekohtainen palkkapyyntö U.S dollareissa ("USD").
* Kaikki ehdotukset, sekä esitetyt että hyväksytyt, tehdään julkisiksi viikko sen jälkeen kun esitys on valittu. Kun valinta tapahtuu, siihen liittyvä RFP poistetaan. Sopimuksella työskenteleville osapuolille maksettava palkkio suoritetaan ainoastaan *decredillä*  ("DCR") maksuhetken DCR/USD kurssilla, ellei erikseen muuta sovita.
* Tulevaisuudessa organisaation kehitys saattaa vaatia DHG:n muuttamista toiseen tahoon identtisellä tarkoituksella. Jos ja kun tämä tapahtuu, DHG siirtää kaiken varallisuutensa uudelle taholle ja kehitystyöhön varatut rahat ohjataan uuden tahon haltuun.
