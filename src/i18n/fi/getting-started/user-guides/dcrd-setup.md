# dcrd Asennusopas

Viimeksi päivitetty versiolle 1.0.0.

Tämän oppaan tarkoitus on auttaa sinua asentamaan `dcrd` sovellus käyttäen  [käynnistys-flägejä](/getting-started/startup-basics.md#startup-command-flags). 

**Vaatimukset:**

- Käytä uusinta  [dcrinstall](/getting-started/user-guides/cli-installation.md) versiota asentaaksesi `dcrd`:n. Jos käytät jotain toista metodia, tarvitaan lisäaskelia.
- Review how the launch commands for the Command Prompt (Windows) and Bash (macOS/Linux) shells differ [here](/getting-started/cli-differences.md).

---

`dcrd` on node daemon Decredille. Daemon on ohjelma joka toimii taustalla ja jonka kanssa käyttäjä ei suoraan kommunikoi. `dcrd` ylläpitää Decredin koko siirtohistorian sisältävää kirjanpitoa (lohkoketjua) ja sallii siirroista tiedottamisen muille Decred-nodeille ympäri maailman. Voit ajatella sitä ikään kuin omana henkilökohtaisena Decred-lohkoketjuserverinäsi. Lohkoketju on tallennettu `data`-kansioon `dcrd`:n kotikansiossa.

**Edistyneet Käyttäjät: Jos runnaat headless modessa SSH:n kautta,** sinun
tarvitsee käyttää terminal multiplexeriä kuten [screen](http://www.howtogeek.com/howto/ubuntu/keep-your-ssh-session-running-when-you-disconnect/)
tai [tmux](https://tmux.github.io/). Kun näet ohjeen siirtyä
toiseen shelliin, sinun pitää käynnistää uusi ikkuna `screen`issä
tai `tmux`:ssa.

---

## <i class="fa fa-cloud"></i> Ota yhteys Decred-verkkoon

Kun käynnistät `dcrd`:n ensimmäisen kerran, se ottaa yhteyden Decred-verkkoon ja alkaa lataamaan lohkoketjua. Jotta `dcrwallet` ja `dcrctl` voivat kommunikoida `dcrd`:n kanssa,  `rpcuser` ja `rpcpass` tulee olla asetettuna konfiguraatiotiedostoissa.

> Aseta RPC Käyttäjänimi ja Salasana

Jos käytit [`dcrinstall`](/getting-started/user-guides/cli-installation.md), konfiguraatiotiedostoihisi on jo asetettu RPC käyttäjätunnus/salasana `dcrd`:lle, `dcrwallet`ille, and `dcrctl`:lle.

Jos et käyttänyt `dcrinstall`ia, sinun tulee ottaa käyttöön minimiasetukset konfiguraatiotiedostoissasi. Seuraa [tätä opasta](/advanced/manual-cli-install.md#minimum-configuration) tehdäksesi tämän.

> Käynnistä dcrd

Kun config-tiedostot on oikein asetettu, avaa uusi shell-ikkuna Decred-kansiossasi (tai käytä viimeisintä ikkunaa jos olet juuri tehnyt lompakkosi). Kirjoita seuraava komento (tutustu tämän oppaan vaatimuksiin selvittääksesi oikean komennon käyttöjärjestelmällesi/Shell sovelluksellesi):

```no-highlight
dcrd
```

> Odota että dcrd synkronoi Decred-lohkoketjuun

Kun `dcrd` käynnistyy, shell-ikkunasi alkaa täyttyä viesteistä kun daemon ottaa yhteyttä verkkoon ja alkaa prosessoimaan lohkoja. Odota kunnes se on valmis - koko lohkoketju ladataan `dcrd` data-kansioon.

Aluksi näkyvissä on tämän kaltainen rivi:

```no-highlight
22:58:04 2016-02-09 [INF] BMGR: Syncing to block height 617 from peer 104.236.167.133:9108
```

Kun ohjelma alkaa lataamaan lohkoja, näet tämän kaltaisia rivejä:

```no-highlight
22:58:16 2016-02-09 [INF] BMGR: Processed 321 blocks in the last 10.03s (544 transactions, height 322, 2016-02-09 09:50:34 +1000 EST)
```

Lohkoketju on täysin synkronoitu kun viimeksi prosessoitu lohko on sama kuin tämänhetkinen lohkonumero. Tämän voi tarkistaa joko vertaamalla päivämäärää ja kellonaikaa loki-viestissä tai vertaamalla viimeksi prosessoidun lohkon numeroa viimeisimpään lohkonumeroon  [virallisessa lohkohaussa](https://mainnet.decred.org/). 

Huomaa että tätä yhteyttä tarvitaan jatkossakin. Sinun pitää jättää `dcrd` päälle käyttääksesi `dcrwallet`ia.

---

Nyt kun olet asentanut `dcrd`, jatka [dcrwallet asennus](/getting-started/user-guides/dcrwallet-setup.md)-oppaaseen.
