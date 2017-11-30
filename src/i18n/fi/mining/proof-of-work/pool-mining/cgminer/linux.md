# <i class="fa fa-linux"></i> Linux-käyttäjän Opas

---

## <i class="fa fa-download"></i>Lataa ja pura cgminer

Osoitteesta https://github.com/decred/cgminer/releases löydät uusimman cgminer-version. Ladataksesi ja purkaaksesi tiedostot terminaalin kautta, käytä seuraavia komentoja. Huomioi että tämä esimerkki lataa cgminer-version 0.0.4.

```no-highlight
~/Decred/$ wget "https://github.com/decred/decred-release/releases/download/v0.0.4_cgminer/cgminer-decred-linux-x86_64-20160208.tar.gz"
~/Decred/$ tar -xvf cgminer*
```

Siirry uuteen cgminer -kansioon:

```
~/Decred/$ cd cgminer*
```

## <i class="fa fa-play-circle"></i>Aloita ja käynnistä cgminer

> Vaihe Yksi

Kirjoita seuraava terminaaliin listataksesi louhintakelpoisen laitteistosi:

```no-highlight
~/Decred/$ ./cgminer -n
```

Sinun pitäisi nyt nähdä näytönohjaimesi listattuna, joko GPU-nimellään tai ohjaimen nimellä. Viimeisen rivin tulisi näyttää yhteensopivien louhintakelpoisten näytönohjaimien määrän.

> Vaihe Kaksi (vapaa-ehtoinen)

Testataksesi järjestelmääsi ja selvittääksesi hashraten johon näytönohjaimesi pystyvät, käytä seuraavaa komentoa:

```no-highlight
~/Decred/$ ./cgminer --blake256 --benchmark
```

> Vaihe Kolme

Rekisteröidy valitsemasi poolin websivulla ja aseta uusi mineri jokaiselle louhintatietokoneellesi. Ohjeet löydät poolin websivulta tarvittaessa. Terminal-ikkunassasi, kirjoita seuraava komento käynnistääksesi cgminerin (ilman hakasulkuja):

```no-highlight
~/Decred/$ ./cgminer --blake256 -o <pool url>:<port number> -u <web login>.<worker name> -p <worker password>
```

Esimerkki:

```no-highlight
~/Decred/$ ./cgminer --blake256 -o http://dcr.maxminers.net:7727 -u DecredMiner.miner1 -p 7@!x5L1
```

> Vaihe Neljä

cgminerin pitäisi nyt käynnistyä. Tee cgminer conf-tiedosto painamalla seuraavia näppäimiä:  `S` (Settings), `W` (Write Config File), `Enter` (Save config file as `cgminer.conf`). Huomaa että `cgminer.conf` tallennetaan samaan kansioon kuin `cgminer`. Lisätäksesi pooleja conf-tiedostoon, avaa `cgminer.conf` Geditillä(GUI) / Picolla (CLI) tai vastaavalla tekstinkäsittelyohjelmalla. Useita pooleja voidaan lisätä käyttämällä seuraavaa syntaxia "pool" osiossa conf-tiedostoa (huomioi pilkku poolien välissä):

```no-highlight
"pools" : [
   {
      "url" : "http://dcr.maxminers.net:7727",
      "user" : "Login.Worker",
      "pass" : "password"
   },
   {
      "url" : "http://dcr.suprnova.cc:9110",
      "user" : "Login.Worker",
      "pass" : "password"
   }
]
```

> Vaihe Viisi

Tallenna `cgminer.conf` ja sulje `cgminer`. Käynnistä uudelleen seuraavalla komennolla:

```no-highlight
~/Decred/$ ./cgminer
```

Siinä siis perusasiat cgminerin asettamiseen poolilouhintaa varten. Lisätietoa cgminerin käytöstä ja yksityiskohtaisemmat selvitykset ohjelman eri toiminnoista löydät virallisesta oppaasta [cgminer README](https://github.com/decred/cgminer/blob/3.7/README).
