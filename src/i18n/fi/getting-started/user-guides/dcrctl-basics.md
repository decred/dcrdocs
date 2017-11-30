# dcrctl Perusteet

Viimeksi päivitetty versiolle v1.0.0.

Tämän ohjeistuksen tarkoitus on auttaa sinua oppimaan `dcrctl` sovelluksen peruskäskyt käyttäen [minimaalista konfiguraatiotiedostoa](/advanced/manual-cli-install.md#minimum-configuration). 

**Vaatimukset:**

- Käytä uusinta [dcrinstall](/getting-started/user-guides/cli-installation.md) `dcrctl` asennusversiota. Muiden asennusmetodien käyttäminen vaatii lisäaskeleita.
- Review how the launch commands for the Command Prompt (Windows) and Bash (macOS/Linux) shells differ [here](/getting-started/cli-differences.md).
- [Asenna dcrd](/getting-started/user-guides/dcrd-setup.md) ja käynnistä se taustalle.
- [Asenna dcrwallet](/getting-started/user-guides/dcrwallet-setup.md) ja käynnistä se taustalle.

---

`dcrctl` on ohjelma joka kontrolloi `dcrd`:ta ja`dcrwallet`:ia remote procedure callin (RPC):n kautta. Voit käyttää `dcrctl`:ää moniin asioihin, kuten saldosi tarkistamiseen, lipukkeiden ostoon, siirtojen tekemiseen ja verkon tietojen tarkasteluun.

**MUISTUTUS:** Tämä opas käyttää käyttöjärjestelmästä riippumattomia esimerkkejä komennoista. Katso vaatimukset selvittääksesi pitääkö sinun käyttää `./dcrctl` tai `dcrctl.exe`  `dcrctl`:n sijaan.

---

> Tee RPC Käyttäjätunnus ja Salasana

Komennot jotka lähetetään joko `dcrd`:hen tai `dcrwallet`:iin vaativat että RPC käyttäjänimi/salasana on asetettu konfiguraatiotiedostoissa.

Jos käytit [`dcrinstall`](/getting-started/user-guides/cli-installation.md), konfiguraatiotiedostoihisi on jo asetettu RPC käyttäjänimi/salasana `dcrd`:lle, `dcrwallet`ille, ja `dcrctl`:lle.

Jos et käyttänyt `dcrinstall`ia, sinun tulee ottaa käyttöön vähimmäismäärä asetuksia konfiguraatiotiedostoissasi. Seuraa [tätä opasta](/advanced/manual-cli-install.md#minimum-configuration) tehdäksesi sen.

---

## dcrctl Komennot

dcrctl komentojen käyttöä varten tarvitset erillisen shell-ikkunan (Command Prompt/Bash).

Antaaksesi komentoja `dcrwallet`ille käytä `dcrctl --wallet <command>`.

Antaaksesi komentoja `dcrd`:lle, käytä `dcrctl <command>`.

Nähdäksesi täyden listan komennoista jotka `dcrctl` voi lähettää `dcrd`:lle ja `dcrwallet`ille, syötä seuraava komento shelliisi:

```no-highlight
dcrctl -l
```

Tällä saat näkyviin pitkän listan komentoja, eroteltuna sovelluksen mukaan. Komennot ylemmässä osiossa ovat `dcrd`:lle ja komennot alemmassa osiossa ovat `dcrwallet`ille. Saat lisätietoa yksittäisestä komennosta kirjoittamalla seuraavan `dcrwallet` komennoille:

```no-highlight
dcrctl help --wallet <command>
```

tai seuraavan `dcrd` komennoille:

```no-highlight
dcrctl help <command>
```

---

## Lompakon Lukituksen Avaaminen

Jotkut `dcrwallet`in toiminnot vaativat lompakon lukituksen avaamista.

Komento jolla avaat lompakkosi lukituksen:

```no-highlight
dcrctl --wallet walletpassphrase <private passphrase set during wallet creation> 0
```

Tässä käskemme `dcrctl`:n lähettää komennon `dcrwallet`ille käyttämällä `--wallet`-flägiä. Itse komento on  `walletpassphrase` joka hyväksyy kaksi parametria, salasanasi ja aikarajan. Määrittämällä aikarajaksi `0` `dcrwallet` aukeaa ilman aikarajoitusta. Huomaa että tämä avaa lukituksen vain tämänhetkiselle sessiolle. Jos suljet lompakko-ikkunan, tai sammutat/uudelleenkäynnistät `dcrwallet`in, joudut avaamaan lukituksen uudestaan kun seuraavan kerran käynnistät sen.

Jos komento suoritettiin onnistuneesti, et saa vahvistusta `dcrctl`:tä, mutta jos katsot `dcrwallet`iasi, se ilmoittaa: 

```no-highlight
[INF] RPCS: The wallet has been unlocked without a time limit.
```

HUOM: Koska monet `dcrwallet`in toiminnot vaativat lompakon lukituksen avaamista, `dcrwallet` voidaan käynnistää `--promptpass` flägin kanssa tai asettaa `promptpass=true` rivi `dcrwallet.conf`-tiedostoon  (mainittu [täällä](/advanced/storing-login-details.md#dcrwalletconf)).

---

## Saldon Tarkistaminen

Lähettääksesi `getbalance`-komennon `dcrwallet`iin `dcrctl`ää käyttäen, kirjoita seuraava shelliisi:

```no-highlight
dcrctl --wallet getbalance
```

Tämä näyttää kaikki saldot kaikille tileillesi.

---

## Uuden Vastaanotto-osoitteen Saaminen

Lähettääksesi `getnewaddress` komennon `dcrwallet`iin `dcrctl`:ää käyttäen, kirjoita seuraava shelliisi:

```no-highlight
dcrctl --wallet getnewaddress
```

Tämä generoi ja ilmoittaa uuden osoitteen. Minimoidaksesi saman osoitteen uudelleenkäytön, käytä tätä komentoa tehdäksesi uuden osoitteen jokaiselle maksulle jonka otat vastaan.

---

## DCR:n Lähettäminen

Lähettääksesi DCR:ää osoitteeseen, lähetä `sendtoaddress` `dcrwallet`ille `dcrctl`:ää käyttäen. Kirjoita seuraava shelliisi, ja lisää osoite ja lähetettävä summa:

```no-highlight
dcrctl --wallet sendtoaddress <address> <amount>
```

Jos siirto onnistui, `dcrctl` kertoo sinulle transaction hashin jonka avulla voit seurata siirtoa virallisessa [Decred Lohkohaussa](/getting-started/using-the-block-explorer.md).

---

## Tarkastele Verkon Statistiikkaa

Verkon statistiikan katselemiseen on useita eri komentoja. Tässä katamme komennon `getinfo` lähettämisen `dcrd`:lle ja komennon `getstakeinfo` lähettämisen `dcrwallet`ille.

Saadaksesi tietoa paikallisesta `dcrd` nodestasi, lähetä komento `getinfo` `dcrd`:lle `dcrctl`:ää käyttäen. Kirjoita seuraava komento shelliisi:

```no-highlight
dcrctl getinfo
```

Saadaksesi staking-tiedot Proof-of-Stake-verkosta, lähetä komento `getstakeinfo`   `dcrwallet`ille `dcrctl`:ää käyttäen. Kirjoita seuraava komento shelliisi:

```no-highlight
dcrctl --wallet getstakeinfo
```

---

## Lisäkomennot

Lisää komentoja löydät myös [Program Options](/advanced/program-options.md)-sivulta.

---
