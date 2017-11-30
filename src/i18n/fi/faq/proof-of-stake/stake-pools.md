# <i class="fa fa-life-ring"></i>Stakepoolit

---

#### 1. Onko stakepoolin käyttämisestä muuta hyötyä kuin se että ei tarvitse pitää lompakkoa auki ja lukitsematta? Esimerkiksi, onko "voiton" todennäköisyys suurempi?

Stakepooleilla on yleensä useampi lompakko ympäri maailmaa käynnissä. Tämä tarkoittaa että todennäköisyys äänestyksen missaamiseen on pienempi
vaikka yksi lompakko kaatuisi. Se myös vähentää viivettä lompakon ja verkon välillä joka pienentää äänestyksen missaamisen riskiä.

---

#### 2. Jakaako stakepool palkkion kaikkien osallistuneiden kesken (% perustuen pooliin lähettämiesi lipukkeiden määrään)?

On teknisesti mahdollista tehdä pooli joka tukee proportional splittiä[^9262], mutta tämän hetken viiteimplementaatio `dcrstakepool` ei salli tätä. Se vain äänestää puolestasi. Se tekee tämän tekemällä lipukkeen äänioikeudesta 1-of-2 multi-signature P2SH scriptin. Pool allekirjoittaa äänen omalla privaattiavaimellaan kun lippu valitaan äänestämään. Koska kyseessä on 1-of-2 multi-signature script se tarkoittaa että jos pool ei syystä tai toisesta äänestä (erittäin epätodennäköistä sillä mainnet pooleilla on useita automaattisia failovereita), on edelleen mahdollista äänestää koska sinulla on toinen privaattiavain ja voit tarvittaessa toimittaa validin allekirjoituksen joka täyttää 1-of-2 vaatimuksen.

Huomaa, että alkuperäinen lipukeosto sisältää sitoumuksen mennä palkkio-osoitteeseen johon vain sinulla on privaattiavain. Proof-of-Stake konsensus-säännöt valvovat tätä sitoumusta, jolloin poolin on mahdotonta varastaa rahojasi.

Palkkioiden jakoa varten poolin pitäisi olla kaikkien palkkioiden vastaanottaja, ja lisäksi luotettu jakamaan palkkiot kaikille osallistujille oikeassa suhteessa. On odotettavissa että tämänkaltainen järjestelmä tullaan kehittämään ymmärtäen että se on vähemmän turvallinen kuin tapa jolla tämänhetkinen pool design toimii.

---

#### 3. Lompakkoni tulee olla käynnissä ostaakseni lipukkeita, mutta äänestääkö pooli oikein ilman minua, jos sammutan lompakon ja annan poolin äänestää puolestani?

Kyllä[^9274] äänestää. Sinun tarvitsee käynnistää lompakkosi vain käyttääksesi kolikoita ostaaksesi lipukkeen, joka delegoi äänioikeutesi poolille, joka sitten äänestää puolestasi. Palkkio-osoite on konsensusvalvottu sitoumus lipukkeen ostossa omistamaasi osoitteeseen johon vain sinulla on privaattiavain.

---

#### 4. Voiko ilmetä ongelmia jos stakepoolissa on liikaa ihmisiä. Esimerkiksi lohkon puolesta tai vastaan force-äänestäminen?

Se on toki mahdollista[^9311], mutta yksi asia jota jokaisen poolin tulisi tukea on sallia jokaisen käyttäjän asettaa omat äänestyspreferenssinsä. Tällä tavalla, kun lipuke valitaan ja pool äänestää käyttäjän puolesta, se äänestää käyttäjän toiveiden mukaisesti.

---

#### 5. Asetetaanko vote bitit kun ostat lipukkeen vai kun lipuke valitaan äänestykseen? Muuttuuko tämä stakepoolissa?

Vote bitit asetetaan vasta kun äänestät[^13607] (joka käy järkeen sillä olet saattanut ostaa lipukkeen viikkoja tai kuukausia ennen kuin tietty äänestysagenda on ollut olemassa).

Stakepool voi toimia parhaaksi katsomallaan tavalla sillä lipukkeenosto sitousmusjärjestelmä jättää paljon tilaa joustolle. Silti, lähtökohtaisesti ihmisten tulisi välttää käyttämästä poolia joka ei salli käyttäjille kontrollia siitä miten he haluavat äänestää pooliin liittymättömistä asioista.

---

#### 6. Mitä turvamekanismeja on olemassa jotka estävät poolin omistajia katoamasta rahojen kanssa?

Tämänhetkiset poolit on suunniteltu niin että pool EI pysty varastamaan rahoja[^14593]. Delegoit vain äänestysoikeuden poolille (ja tosiassa se on 1-of-2 multisig joka tarkoittaa että joko sinä TAI pool voi äänestää). Lipukkeen osto sisältää konsensuksella valvottaman sitoumuksen lopullisesta palkkio-osoitteesta, jolloin poolilla ei yksinkertaisesti ole mitään keinoa varastaa rahoja.

Pahinta mitä voi sattua poolin kadotessa on se että ääniä missataan, joka johtaa lipukkeen peruuttamiseen joka taas johtaa alkuperäisten kolikoiden palautumiseen omistajalle (miinus alkuperäinen siirtomaksu tietysti). Tosin, kuten aikaisemmin mainittu, koska lipuke on 1-of-2 multisig, jokainen käyttäjä voi käynnistää oman lompakkonsa äänestääkseen jos poolin omistaja päättää kadota.

---

#### 7. Miten voin nähdä esimerkin stakepool-lipukkeesta lohkohaussa?

Stakepooleihin sisältyy 'Dc' osoitteita sillä stakepool käyttää pay-to-script-hash osoitteita[^17515]. Esimerkiksi, katso txid:  [c0abc0ec63a8de15550f067e2b6fde28f0432fb91b938574b282daa69f914103](https://mainnet.decred.org/tx/c0abc0ec63a8de15550f067e2b6fde28f0432fb91b938574b282daa69f914103).

Jatka lukemaan [PoS-äänestyslipukkeet FAQ](/faq/proof-of-stake/voting-tickets.md)

---

## <i class="fa fa-book"></i> Lähteet

[^9262]: Decred Forum, [Post 9,262](https://forum.decred.org/threads/626/#post-9262)
[^9274]: Decred Forum, [Post 9,274](https://forum.decred.org/threads/626/#post-9274)
[^9311]: Decred Forum, [Post 9,311](https://forum.decred.org/threads/582/page-2#post-9311)
[^13607]: Decred Forum, [Post 13,607](https://forum.decred.org/threads/1236/#post-13607)
[^14593]: Decred Forum, [Post 14,593](https://forum.decred.org/threads/1321/#post-14593)
[^17515]: Decred Forum, [Post 17,515](https://forum.decred.org/threads/1289/#post-17515)
