# <i class="fa fa-desktop"></i>Konfiguraatio 

---

#### 1. Mistä näen tiedon `dcrd`:n käyttämien porttien numeroista?

Saat porttien numerot[^8929] esiin käyttämällä  `-h` tai `--help` parametrejä `dcrd`:ssä:

```no-highlight
dcrd -h
```

Etsi seuraava rivi:

```no-highlight
--rpclisten= Add an interface/port to listen for RPC connections (default port: 9109, testnet: 19109)
```

Se löytyy myös lokitiedoista kun käynnistät `dcrd`:n 

```no-highlight
12:01:46 2016-02-08 [INF] RPCS: RPC server listening on [::1]:9109
12:01:46 2016-02-08 [INF] RPCS: RPC server listening on 127.0.0.1:9109
```

---

#### 2. Mitä tarkoittaa konfiguraatio-tiedosto `dcrd`:lle, `dcrwallet`:lle, ja `dcrctl`:lle? 

Jokaisella sovelluksella (`dcrd`, `dcrwallet`, `dcrctl`) voi olla oma konfiguraatiotiedostonsa[^9055]. Käytä `-h` nähdäksesi oletus tiedostopolun suluissa config file optiossa (`-C`, `--configfile`). Tee tekstitiedosto kyseiseen polkuun ja nimeä se riippuen polusta jonka juuri katsoit.

Seuraavaksi voit käyttää `dcrd` [esimerkki conf-tiedostoa](https://github.com/decred/dcrd/blob/master/sample-dcrd.conf) ja `dcrwallet` [esimerkki conf-tiedostoa](https://github.com/decred/dcrwallet/blob/master/sample-dcrwallet.conf) tehdäksesi mieleisesi asetukset. Voit tehdä saman myös `dcrctl`:lle. Formaatti on sama. Jokainen komentorivi jonka `-h` listaa voidaan spesifioida konfiguraatiotiedostoissa (käytä vain asetuksen pitkää nimeä). 

Kun nämä tiedostot ovat tehtyinä ja oikeassa paikassa, sinun ei tarvitse lisätä kaikkia asetuksia komentojonoon joka kerta. Voit esimerkiksi käynnistää `dcrctl`:n määrittämättä mitään parametrejä komentojonossa:

```no-highlight
dcrctl getnetworkhashps
2547036949350
```

---

#### 3. Voinko käyttää mainnet ja testnet daemonia ja lompakoita yhtäaikaa samalta koneelta?

Kyllä[^9264], lisää vain `--testnet` tarvittaviin paikkoihin (`dcrd`, `dcrwallet`, `dcrctl`) ja kaikki toimii kuten pitääkin. Tästä syystä ne käyttävät eri portteja ja data/log kansioita! 

---

#### 4. Mitkä ovat vaikutukset turvallisuuteen jos käytän samaa RPC server salasanaa `dcrd`:n ja `dcrwallet`in kanssa? 

Pääsyllä `dcrd`:hen pystyy tekemään paljon vähemmän kuin pääsyllä `dcrwallet`:iin. Tärkeimpänä RPC pääsyä[^11480] `dcrwallet`:iin, kun lompakko ei ole lukittuna, voidaan käyttää kolikoiden siirtämiseen.

Kun `dcrd` ja `dcrwallet` ovat molemmat samalla koneella, sillä ei luultavasti ole suurta merkitystä, mutta turvallisemmissa järjestelmissä joissa lompakko on eri koneella kuin `dcrd`, ei luonnollisesti ole järkevää käyttää samoja tunnuksia molempiin. Muista että `dcrd`:n pitää olla netissä olevalla koneella pysyäkseen synkattuna verkon kanssa (lohkoketjun ajan tasalla pitäminen, rahansiirtojen lähetys jne).

Toisaalta, parhaan turvallisuuden kannalta `dcrwallet` jossa säilytät rahojasi ei pitäisi sijaita järjestelmässä jossa on internet-yhteys, sillä on huomattavasti vaikeampaa kenenkään varastaa kolikoitasi jos lompakko jossa ne ovat ei ole koneella johon on yhteys internetin kautta. Luonnollisesti, jos stake-louhit, tarvitset vähintään yhden internetiin yhteydessä olevan `dcrwallet`-prosessin. Täten, kaikken turvallisin käytäntö on pitää yhtä "kylmää" `dcrwallet` prosessia koneella jossa ei ole internet-yhteyttä, ja toista, "hot" `dcrwallet`:ia (joka käyttää eri siidiä luonnollisesti) johon kylmälompakko delegoi äänioikeuden `--ticketaddress` parametria käyttämällä. Molemmissa eri käyttäjätunnukset.

---

#### 5. Miksi olen yhteydessä vain 8 muuhun käyttäjään?

Yhteyksien määrä ulospäin on tarkoituksella rajoitettu 8:aan vailla mahdollisuutta muuttaa tätä[^15399]. Suurempi määrä yhteyksiä ulospäin ei auta millään tapaa ja on tosiasiassa huonompi sekä sinun että verkon kannalta. Tämä on testattu erittäin huolellisesti Bitcoinissa, btcsuite mukaanlukien (Decredin esiaste). Ainut mitä tapahtuu lisäämällä yhteyksien määrää on tärkeiden slottien tuhlaaminen verrattain pieneltä peer-määrältä ("leechejä" on aina paljon suurempi määrä kuin "seedejä").

Toisaalta, yhteyksien maksimimäärän lisääminen, joka oikeastaan vain lisää sallittujen sisääntulevien yhteyksien määrää, auttaa verkkoa varmistamalla että tarjolla on enemmän slotteja uusille nodeille ja SPV clienteille.

---

## <i class="fa fa-book"></i> Lähteet

[^8929]: Decred Forum, [Post 8,929](https://forum.decred.org/threads/600/#post-8929)
[^9055]: Decred Forum, [Post 9,062](https://forum.decred.org/threads/472/page-12#post-9062)
[^9264]: Decred Forum, [Post 9,264](https://forum.decred.org/threads/626/#post-9264)
[^11480]: Decred Forum, [Post 11,480](https://forum.decred.org/threads/428/#post-11480)
[^15399]: Decred Forum, [Post 15,399](https://forum.decred.org/threads/1371/page-2#post-15399)
