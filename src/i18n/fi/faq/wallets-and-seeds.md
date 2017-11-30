# <i class="fa fa-money"></i>Lompakot ja Siidit

---

#### 1. Pitäisikö minun antaa lompakkoni siidi jollekulle?

Ei, sinun ei koskaan[^8613] kannata antaa lompakkosi siidiä muille. Luovuttamalla siidisi luovutat samalla kaikki lompakossasi olevat rahat.

---

#### 2. Kuinka muutan lompakkoni siidin hexini siid sanoiksi?

Voit käyttää  [dcrseedhextowords](https://github.com/davecgh/dcrseedhextowords)[^8660]  työkalua muuttaaksesi  Decred siidin hexistä siidi-sanoiksi joita tarvitset tuodaksesi sen lompakkoon.

---

#### 3. Voiko minulla olla useampi lompakko samalle siidille?

Useampi lompakko samalle siidille saattaa johtaa tilanteeseen jossa lompakot eivät tunnista samaa balanssia. Ei ole suositeltavaa käyttää useampaa lompakkoa samalla siidillä.[^9731]

Ongelma on yksinkertaisesti se että osoitteet generoidaan deterministisesti siidistä. Eli jos sinulla on kaksi lompakkoa samasta siidistä, päädyt tällaiseen tilanteeseen:

* Lompakko A: Tietää kaikki osoitteet osoitteeseen #15 saakka
* Lompakko B: Tietää kaikki osoitteet osoitteeseen #12 saakka

Jolloin kaikki kolikot jotka on lähetetty osoitteisiin #13, #14 ja #15 ovat lompakko A:n tiedossa mutta eivät lompakko B:n.

Jos pyydät lompakko B:tä hakemaan seuraavan osoitteen, se ei löydä kolikoita koska sen näkökulmasta tämä osoite on täysin uusi, joten se ei etsi siirtoja ennen tätä hetkeä. Tämä on optimoitu tarkoituksella näin, sillä ajan myötä lohkoketju kasvaa valtavan kokoiseksi, ja olisi (resurssien puolesta) todella kallista skannata koko ketju joka kerta kun uusi osoite luodaan.

Tähän on yksi poikkeus ja se koskee äänestäviä hot walleteja joissa ei itsessään ole lainkaan kolikoita. Jos lompakko **vain** äänestää eikä osta lipukkeita tai tee muita siirtoja, se on turvallinen.[^11319]

---

#### 4. Voiko joku varastaa rahani jos he saavat käsiinsä wallet.db-tiedostoni?

Kukaan ei voi varastaa kolikoitasi saadessaan haltuunsa wallet.db[^9803] tiedoston, ellei heillä ole myös hallussaan salasanaasi. Jos olet käyttänyt public encryptionia, ei varkaalla ole myöskään pääsyä julkisiin avaimiisi tai osoitteisiisi.

---

#### 5. Voiko joku saada siidisanat selville satunnaisesta lompakosta brute-force hyökkäyksellä (sanat eivät ole "suolattu")?

Siidisanat ovat Englannin kielen sanoja kartoitettuna hexadesimaaliksi. Siidi on vain 256-bit (32-byte) kryptograafisesti turvallinen satunnainen numero. Salt ei toimi tässä ollenkaan. Sillä ei ole mitään tekemistä satunnaisten numeroiden brute-forceamisen[^10452] kanssa.

Toisin sanoen, koska jokainen sana voi olla 256 eri mahdollisuutta ja sanoja on 32, on mahdollisia yhdistelmiä 256^32 (tai 2^256, riippuen siitä miten haluat asian nähdä mutta lukumäärä on sama). Tämä luku on korkeampi kuin vety-atomien määrä tunnetussa maailmankaikkeudessa. Itse asiassa se on melkeinpä enemmän kuin kaikkien atomien määrä maailmankaikkeudessa.

Laitetaan tämä perspektiiviin, oletetaan että ihmisiä on 7 miljardia ja jokainen ihminen omistaa 10 tietokonetta, ja jokainen noista koneista pystyy kokeilemaan miljardia eri mahdollisuutta sekunnissa, ja että keskimäärin oikea ratkaisu löytyy kun 50% kaikista mahdollisuuksista on kokeiltu, kestäisi siltikin 26x10^48 (eli 26 biljoonaa biljoonaa biljoonaa biljoonaa) vuotta brute-forcea yksi siidi.

---

#### 6. Siidini ei toimi. Mitä voin tehdä?

Varmista että kaikki sanat ovat yhdellä rivillä, välilyönnillä erotettuna[^10657]. Vaikka ne printataan usealle riville lukemisen helpoittamiseksi, ne pitää syöttää yhtenä rivinä. Tarkista myös että sanoissasi ei ole näppäilyvirheitä vertaamalla niitä sanoihin [PGP sanalistalla](https://en.wikipedia.org/wiki/PGP_word_list).

---

#### 7. Miten tuon avaimen joka on wallet import formaatissa (WIF)?

On mahdollista tuoda yksittäinen privaattiavain[^10724] `dcrwallet`iin. Huomaa että tämä on vain  `--noseed` osoitteille ja tätä ei tule käyttää ellet ole perillä mitä olet tekemässä!

Poista lompakon lukitus (älä huomioi hakasulkuja):

```no-highlight
dcrctl --wallet walletpassphrase <private encryption passphrase> 60
```

Importtaa standalone (`--noseed`) privaattiavain (älä huomioi hakasulkuja):

```no-highlight
dcrctl --wallet importprivkey <put WIF private key here>
```

Tarkastele importatun tilin saldoa (anna tälle hetki uudelleenskannata, katso loki dcrwalletissa seurataksesi skannauksen edistymistä):

```no-highlight
dcrctl --wallet getbalance "imported" 0 all
```

---

#### 8. Mitä eroa on mainnet ja testnet -osoitteilla?

Testnet public key osoite[^11507] alkaa kirjaimilla `Tk`. Mainnet osoite alkaa kirjaimilla`Dk`. `T` = Testnet, `D` = (Decred) Mainnet.

---

#### 9. Mitä ovat erityyppiset osoitteet?

Decred osoite[^14995] on oikeastaan vain julkinen avain (joka itsessään voisi olla script hash) jonka 2 merkin etuliite identifioi verkon ja tyypin sekä tarkastusluvun jolla tunnistetaan väärin syötetyt osoitteet.

Eli pystyt aina kertomaan minkä typpinen osoite on kyseessä sen 2 merkin etuliitteen perusteella.

Ensimmäinen merkki etuliitteessä identifioi verkon. Tämän takia kaikki mainnet osoitteet alkavat "D":llä, testnet osoitteet alkavat "T":llä, ja simnet osoitteet alkavat "S":llä. Etuliitteen toinen merkki kertoo minkä tyyppinen osoite on kyseessä.

Tyypillisimmin käytetyt osoitteet tällä hetkellä ovat secp256k1 pubkey hasheja, jotka identifioidaan pienellä "s":llä. Se edustaa vain yhtä julkista avainta joten sillä on vain yksi privaattiavain jota voidaan käyttää sen lunastamiseen.

Stakepool tosin käyttää pay-to-script-hash osoitetta, jonka tunnistaa siitä että toinen merkki on pieni "c" (nähtävissä linkatuissa parametreissä). Scripti jonka se generoi on multisignature 1-of-2, jonka avulla se sallii poolin, tai sinun, äänestää. Sekä sinulla että poolilla on omat private keyt ja koska scripti vaatii vain yhden allekirjoituksen mahdollisista kahdesta, tämä sallii sinun delegoida äänioikeuden poolille luopumatta siitä kuitenkaan kokonaan.

---

## <i class="fa fa-book"></i> Lähteet

[^8613]: Decred Forum, [Post 8,613](https://forum.decred.org/threads/576/#post-8613)
[^8660]: Decred Forum, [Post 8,660](https://forum.decred.org/threads/534/page-3#post-8660)
[^9731]: Decred Forum, [Post 9,731](https://forum.decred.org/threads/657/#post-9731)
[^11319]: Decred Forum, [Post 11,319](https://forum.decred.org/threads/531/page-3#post-11319)
[^9803]: Decred Forum, [Post 9,803](https://forum.decred.org/threads/686/#post-9803)
[^10452]: Decred Forum, [Post 10,452](https://forum.decred.org/threads/734/#post-10452)
[^10657]: Decred Forum, [Post 10,657](https://forum.decred.org/threads/483/#post-10657)
[^10724]: Decred Forum, [Post 10,724](https://forum.decred.org/threads/643/page-3#post-10724)
[^11507]: Decred Forum, [Post 11,507](https://forum.decred.org/threads/792/#post-11507)
[^14995]: Decred Forum, [Post 14,995](https://forum.decred.org/threads/1321/page-2#post-14995)
