# <i class="fa fa-hdd-o"></i>Kirjautumistunnusten Säilyttäminen

Kaikki parametrit jotka on spesifioitu komentojonossa dcrd:tä,
dcrwalletia ja dcrctl:ää käynnistettäessä, voidaan myös laittaa konfiguraatiotiedostoihin. Tämä on
kätevä tapa säilöä kirjautumistunnuksesi niin että niitä ei tarvitse
sisällyttää scripteihin tai kirjoittaa niitä terminaaliin
jatkuvasti.

---

## <i class="fa fa-laptop"></i>Konfiguraatiotiedoston perusteet

Jos et ole vielä konfiguraatiotiedostojen perusasioista, tutustu oppaaseen [Alkuun pääsemisen perusteet](/getting-started/startup-basics.md#configuration-files) -sivullamme.

---

## <i class="fa fa-terminal"></i> dcrd.conf 

Valitse haluamasi käyttäjänimi ja salasana seuraavilla ohjeilla. Tunnuksia ei tarvitse rekisteröidä
missään ja niitä tarvitaan vain jotta `dcrwallet` ja `dcrctl` pystyvät kommunikoimaan `dcrd` :n kanssa.

> Esimerkki Config-tiedoston Käyttö

Seuraa alla olevia ohjeita jos olet jo kopioinut esimerkkikonfiguraatiotiedostot oikeisiin kansioihinsa.

1. Mene `dcrd` ohjelmiston kansioon, kuten [Alkuun pääsemisen perusteet](/getting-started/startup-basics.md#configuration-files) -oppaassa on ohjeistettu.
2. Avaa `dcrd.conf` tekstinkäsittelyohjelmassa.
3. Etsi seuraavat rivit:

    `;rpcuser=`<br />
    `;rpcpass=`

4. Poista puolipiste ja lisää haluamasi käyttäjänimi ja salasana niille kuuluville riveille.

> Uuden Konfiguraatiotiedoston Tekeminen

Seuraa alla olevia ohjeita jos **et** ole kopioinut esimerkkikonfiguraatiotiedostoja niille kuuluviin kansioihin.

1. Mene `dcrd` ohjelmiston kansioon, kuten [Alkuun pääsemisen perusteet](/getting-started/startup-basics.md#configuration-files) -oppaassa on ohjeistettu.
2. Luo uusi tekstitiedosto.
3. Uudelleen-nimeä se `dcrd.conf`.
3. Avaa `dcrd.conf` tekstinkäsittelyohjelmassa.
4. Lisää seuraavat rivit:

```no-highlight
[Application Options]

rpcuser=<username>
rpcpass=<password>
```

---

## <i class="fa fa-terminal"></i>dcrwallet.conf 

Prosessi `dcrwallet.conf`-tiedostolle on hyvin samanlainen kuin `dcrd.conf`-tiedostolle. 

Huomioi että jos  `username=` ja `password=` `dcrwallet.conf`-tiedostossa eivät vastaa `rpcuser=` ja `rpcpass=` arvoja `dcrd.conf`-tiedostossa, sinun tulee lisätä  `dcrdusername=` ja `dcrdpassword=` `dcrwallet.conf`-tiedostossa  vastaamaan  `rpcuser`/`rpcpass` arvoja `dcrd.conf`-tiedostossa (on helpointa asettaa kaikki käyttäjänimet ja salasana samalla kertaa).

> Esimerkkikonfiguraatiotiedoston Käyttö

Seuraa alla olevia ohjeita jos olet jo kopioinut esimerkkikonfiguraatiotiedostot oikeisiin kansioihinsa.

1. Mene `dcrwallet` ohjelmiston kansioon, kuten [Alkuun pääsemisen perusteet](/getting-started/startup-basics.md#configuration-files) -oppaassa on ohjeistettu.
2. Avaa `dcrwallet.conf` tekstinkäsittelyohjelmassa.
3. Etsi seuraavat rivit:

    `;username=` <br />
    `;password=`

4. Poista puolipiste ja lisää haluamasi käyttäjänimi ja salasana niille kuuluville riveille.

> Uuden Konfiguraatiotiedoston Tekeminen

Seuraa alla olevia ohjeita jos **et** ole kopioinut esimerkkikonfiguraatiotiedostoja niille kuuluviin kansioihin.

1. Mene `dcrwallet` ohjelmiston kansioon, kuten [Alkuun pääsemisen perusteet](/getting-started/startup-basics.md#configuration-files) -oppaassa on ohjeistettu.
2. Luo uusi tekstitiedosto.
3. Uudelleen-nimeä se `dcrwallet.conf`.
3. Avaa `dcrwallet.conf` tekstinkäsittelyohjelmassa.
4. Lisää seuraavat rivit:

```no-highlight
[Application Options]

username=<username>
password=<password>
```

Jos asetit vapaaehtoisen julkisen salasanan lompakolle (toinen salasana
lompakon teon yhteydesä) voit myös lisätä sen `dcrwallet.conf`-tiedostoon:

```no-highlight
walletpass=<yourwalletpassword>
```

Privaattia salasanaa ei voi lisätä konfiguraatiotiedostoihin. Se pitää asettaa manuaalisesti `dcrctl`:ssä.

---

## <i class="fa fa-terminal"></i>dcrctl.conf 

On helpointa käyttää samoja tunnuksia/salasanoja  `dcrd.conf`:iin, `dcrwallet.conf`:iin, ja `dcrctl.conf`:iin. Jos olet käyttänyt eri tunnuksia dcrwalletin kanssa, joudut spesifioimaan yhden tässä ja toisen komentojonossa komentoja käyttäessä.

> Esimerkkikonfiguraatiotiedoston käyttö

Seuraa alla olevia ohjeita jos olet jo kopioinut esimerkkikonfiguraatiotiedostot oikeisiin kansioihinsa.

1. Mene `dcrctl` ohjelmiston kansioon, kuten [Alkuun pääsemisen perusteet](/getting-started/startup-basics.md#configuration-files) -oppaassa on ohjeistettu.
2. Avaa `dcrctl.conf` tekstinkäsittelyohjelmassa.
3. Etsi seuraavat rivit:

    `;rpcuser=` <br />
    `;rpcpass=`

4. Poista puolipiste ja lisää haluamasi käyttäjänimi ja salasana niille kuuluville riveille.

> Uuden konfiguraatiotiedoston tekeminen

Seuraa alla olevia ohjeita jos **et** ole kopioinut esimerkkikonfiguraatiotiedostoja niille kuuluviin kansioihin.

1. Mene `dcrctl` ohjelmiston kansioon, kuten [Alkuun pääsemisen perusteet](/getting-started/startup-basics.md#configuration-files) -oppaassa on ohjeistettu.
2. Luo uusi tekstitiedosto.
3. Uudelleen-nimeä se `dcrctl.conf`.
3. Avaa `dcrctl.conf` tekstinkäsittelyohjelmassa.
4. Lisää seuraavat rivit:

```no-highlight
[Application Options]

rpcuser=<username>
rpcpass=<password>
```

---

## <i class="fa fa-tasks"></i>Muut konfiguraatioasetukset

Kaikki komentojonoasetukset voidaan lisätä konfiguraatiotiedostoon.
Esimerkkikonfiguraatiotiedostot release-paketissa sisältävät lisäkomentoja.
Voit myös käynnistää minkä tahansa sovelluksista `-h` flagiä käyttäen nähdäksesi listan ja kuvauksen kaikista komennoista kullekin sovellukselle.

Kattavan listan eri asetuksista jokaiselle sovellukselle löydät myös [täältä](/advanced/program-options.md).
