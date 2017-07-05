# <i class="fa fa-hdd-o">Lompakon Poistaminen</i>

Saatat joskus muutamasta mahdollisesta syystä joutua poistamaan lompakkosi.

* Sinun tarvitsee palauttaa lompakkosi siidin avulla.
* Olet hukannut siidin ja haluat tehdä uuden lompakon.
* Haluat poistaa lompakon tietyltä tietokoneelta.

Ensin sinun tarvitsee löytää kansio johon dcrwallet-applikaatio on asennettu. Tämä vaihtelee eri alustojen mukaan.
Tästä kansiosta löytyvät myös [konfigraatiotiedostot](/getting-started/startup-basics.md#configuration-files).

Tästä kansiosta, sinun tulee poistaa tiedosto `mainnet/wallet.db`.
Tämä poistaa lompakon tietokoneeltasi kokonaan. Päästäksesi
siihen taas käsiksi, se pitää tuoda takaisin alkuperäisen siidin avulla. 

Huomaa, että on mahdollista (mutta ei varmaa) että
poistetun tiedoston voi palauttaa palautustyökaluilla. 
Jos olet poistamassa tiedostoa turvallisuussyistä, on järkeväää käyttää
turvallista poistotyökalua, kuten
[GNU shred](https://www.gnu.org/software/coreutils/manual/html_node/shred-invocation.html).


