# Komentojonojen eroavaisuudet eri käyttöjärjestelmissä

Tämä sivu on viimeksi päivitetty versiolle 1.0.0.

---

The purpose of this page is to explain the key differences for running the cross-platform command-line applications on Windows, Linux, and macOS.

---

> Käynnistyskomennot

Ensimmäinen iso eroavaisuus komentojono-sovellusten (`dcrd`,`dcrwallet`,`dcrctl`)  välillä on se miten ne käynnistetään komentojonosta. Tämä ei riipu niinkään käyttöjärjestelmästä vaan eroavaisuuksista shelleissä. Windowsin mukana tulevat Command Prompt ja PowerShell valmiiksi asennettuina. macOS käyttää Bashia Terminal applikaation sisällä ja monet Linux versiot käyttävät Bashia myös. Alla esimerkkejä perus käynnistyskomennoista Bashille ja Command Promptille.

**Command Prompt:** `dcrd.exe`, `dcrwallet.exe`, `dcrctl.exe` <br />
**Bash:** `./dcrd`, `./dcrwallet`, `./dcrctl`

Jotkut oppaistamme ovat riippumattomia järjestelmästä käynnistyskomentojen kanssa. Jos opas käskee käyttämään `dcrctl --wallet getbalance` komentoa, se viittaa `dcrctl.exe --wallet getbalance` komentoon Command Promptissa ja  `./dcrctl --wallet getbalance` komentoon Bashissa. 

> Sovelluskansioiden Sijainnit

Toinen tapa jolla komentojonosovellukset eroavat on sovellusten kansioiden sijainti (lohkot, lompakot, konfiguraatiotiedostot on kaikki tallennettu datakansioon). Alla luettelo oletus sovelluskansioista joka sovellukselle.

| Käyttöjärjestelmä      | dcrd, dcrwallet, dcrctl Sovellusten Kansiot      | 
| -------:|:--------------------------------------------- |
| Windows | `C:\Users\<your-username>\AppData\Local\dcrd\`      |
|         | `C:\Users\<your-username>\AppData\Local\dcrwallet\` | 
|         | `C:\Users\<your-username>\AppData\Local\dcrctl\`    |
| macOS   | `~/Library/Application Support/dcrd/`         |
|         | `~/Library/Application Support/dcrwallet/`    |
|         | `~/Library/Application Support/dcrctl/`       |
| Linux   | `~/.dcrd/`                                    |
|         | `~/.dcrwallet/`                               |
|         | `~/.dcrctl/`                                  |

