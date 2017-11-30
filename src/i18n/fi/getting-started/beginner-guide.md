# Aloittelijan Opas

Viimeksi päivitetty versiolle 1.0.1

---

## Tervetuloa Decredin pariin

Tervetuloa Decredin pariin, mukavaa että olet täällä! Et välttämättä vielä ole tietoinen siitä, mutta Decred on erilainen. Uusia asioita opittavaksi riittää ennen kuin olet täysin perillä siitä miten kaikki toimii. Tämän selostuksen tarkoitus on tehdä kaikki vähän helpommaksi ymmärtää.

Aloittelijan oppaan avulla saat Decred-ohjelmiston toimimaan. Voit valita usean ohjelmiston välillä saadaksesi oman nodesi verkkoon ja Decrediä lompakkoosi. Oppaasta löydät ohjeen miten asennat ja käytät Decred applikaatioita; kuinka hankit Decrediä; Kuinka äänestät Proof-of-Stake-järjestelmässä; ja kuinka käytät lohkohakua.

Seuraa [asennusoppaan](#installation-guides) ohjeita, jonka jälkeen seuraa valitsemasi sovelluksen polkua. Kun sovelluksesi on asennettu, katso [Perusoppaat](#general-guides) tämän sivun lopussa. Jos eteen tulee kysyttävää, liity [Slack](/support-directory.md#join-us-on-slack)-kanavallemme.

**HUOM: Testnetin käyttäminen opetteluun on suositeltavaa, jotta voit käyttää Decred ohjelmistoa vailla pelkoa virheen tekemisestä ja oikean rahan menettämisestä. Asennettuasi valitsemasi ohjelmiston, lue [Testnetin käyttö](/getting-started/using-testnet.md) ja seuraa ohjetta käynnistääksesi ohjelmiston Decredin testnetissä.**

---

## Sovellukset

Ohessa lista tällä hetkellä saatavilla olevista sovelluksista, kartasta näet niiden yhteensopivuuden eri käyttöjärjestelmien kanssa.

**Paymetheus**: The only Windows GUI client as of v1.1.0. <br />
**dcrd**: The node daemon, this command-line application handles block management and consensus. <br />
**dcrwallet**: The wallet daemon, this command-line application handles address and transaction management. <br />
**dcrctl**: The remote procedure call (RPC) client, this command-line application is used to control dcrd and dcrwallet via RPC commands. <br />
**Decrediton**: Cross-platform GUI client as of v1.1.0.

|           | Paymetheus | dcrd | dcrwallet | dcrctl | Decrediton |
| ---------:|:----------:|:----:|:---------:|:------:|:-----------:|
| Windows   | X          | X    | X         | X      |             |
| macOS     |            | X    | X         | X      | X           |
| Linux     |            | X    | X         | X      | X           |
| Muut järjestelmät|            | X    | X         | X      |             |

"Muut järjestelmät" sisältää tällä hetkellä useita *BSD:tä ja Solaris/illumos.

Huom: Kuten huomaat, yksi monista eroavaisuuksista Decredin ja muiden
suosittujen kryptovaluuttojen välillä: lompakko daemon ja node daemon ovat erilliset.
Monet muut kolikot yhdistävät nämä toiminnot samalle daemonille.
Niille jotka valitsevat käyttää komentojonokäyttöliittymiä, tämä tarkoittaa että
on pakko käyttää `dcrd`  full node-toimintoja varten ja `dcrwallet`ia DCR:n säilömiseen,
siirtojen tekemiseen ja Proof-of-Stake louhintaan/äänestykseen osallistumiseen.

---

## Asennusoppaat

Päästäksesi alkuun, valitse käyttöjärjestelmällesi sopiva asennusvaihtoehto:

* [Paymetheus](/getting-started/user-guides/paymetheus.md)
* [Command Line Suite **via dcrinstall**](/getting-started/user-guides/cli-installation.md) - HUOM: `dcrinstall`-metodi on nopein ja helpoin tapa saattaa komentojono-node ja lompakko toimintaan. Se on suositeltavaa ja komentojono path -asennusoppaat alla olettavat että olet käyttänyt tätä metodia.
* [Decrediton (ALPHA)](/getting-started/user-guides/decrediton-setup.md)

---

**HUOM** Kaikki oheiset oppaat löytyvät navigaatio-valikosta samoilla nimillä.

## Paymetheus Polku

Näiden oppaiden avulla pääset alkuun Paymetheuksen käytössä

* [Paymetheuksen Asennus](/getting-started/user-guides/paymetheus.md)
* [Paymetheuksen Käyttö](/getting-started/user-guides/using-paymetheus.md)

## Decrediton Polku

Tämä opas auttaa sinua lataamaan Decreditonin:

* [Decrediton Asennus](/getting-started/user-guides/decrediton-setup.md)

## Komentojonopolku

Seuraavien oppaiden avulla pääset alkuun komentojonosovellusten kanssa (`dcrd`, `dcrwallet`, `dcrctl`):

* [Komentojono-eroavaisuudet](/getting-started/cli-differences.md)
* [Käynnistys-asetusten perusteet](/getting-started/startup-basics.md)
* [dcrd Asennus](/getting-started/user-guides/dcrd-setup.md)
* [dcrwallet Asennus](/getting-started/user-guides/dcrwallet-setup.md)
* [dcrctl Peruskäyttö](/getting-started/user-guides/dcrctl-basics.md)

## Perusoppaat

Seuraavat oppaat ovat riippumattomia eri sovelluksista:

* [Testnetin Käyttö](/getting-started/using-testnet.md)
* [DCR:än Hankkiminen](/getting-started/obtaining-dcr.md)
* [Lohkohaun Käyttö](/getting-started/using-the-block-explorer.md)
* [Proof-of-Stake Opas](/mining/proof-of-stake.md)
* [Mainnet-äänestysopas](/getting-started/user-guides/agenda-voting.md)
