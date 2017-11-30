# <i class="fa fa-windows"></i> Windowsin Käyttäjän Opas

---

## <i class="fa fa-download"></i> Lataa ja pura cgminer

Osoitteesta https://github.com/decred/cgminer/releases löydät uusimman cgminer-version. 64-bittiselle Windowsille lataa ja pura `cgminer-decred-w64_*.zip`. 32-bittiselle Windowsille lataa ja pura `cgminer-decred-w32_*.zip`. Pura kaikki tiedostot uuteen kansioon ja avaa kansio tarkastellaksesi tiedostoja.

## <i class="fa fa-play-circle"></i> Alusta ja käynnistä cgminer

> Vaihe Yksi

Avaa command prompt -ikkuna kirjoittamalla `cmd` file explorerin yläreunan osoiteriville cgminer kansiossa ja painamalla `Enter`. Kirjoita seuraava komento command prompt -ikkunassa listataksesi louhintaan kelpaavan kalustosi:

```no-highlight
C:\Decred> cgminer -n
```

Sinun pitäisi nyt nähdä näytönohjaimesi listattuna joko niiden GPU-koodinimellä tai ajurin nimellä. Viimeisen rivin pitäisi kertoa louhintaan kelpaavien näytönohjaimien määrä.

> Vaihe Kaksi (vapaa-ehtoinen)

Testataksesi järjestelmääsi ja saadaksesi selville hashraten jolla se pystyy työskentelemään, käytä komentoa:

```no-highlight
C:\Decred> cgminer --blake256 --benchmark
```

> Vaihe Kolme

Rekisteröidy jonkin poolin sivustolle ja asenna uusi mineri jokaiselle tietokoneellesi. Poolin websivulta löydät ohjeita jos niitä tarvitset. Vaiheesta yksi tutussa komentojono-ikkunassasi, kirjoita seuraava komento käynnistääksesi cgminerin (ilman hakasulkuja):

```no-highlight
C:\Decred> cgminer --blake256 -o <pool url>:<port number> -u <web login>.<worker name> -p <worker password>
```

Esimerkki:

```no-highlight
C:\Decred> cgminer --blake256 -o http://dcr.maxminers.net:7727 -u DecredMiner.miner1 -p 7@!x5L1
```

> Vaihe Neljä

cgminerin pitäisi nyt käynnistyä. Tee cgminer-konfiguraatiotiedosto painamalla seuraavia näppäimiä: `S` (Settings), `W` (Write Config File), `Enter` (Save config file as `cgminer.conf`). Huomaa, että `cgminer.conf` tallennetaan samaan kansioon `cgminer.exe`n kanssa. Lisätäksesi muita pooleja konfiguraatiotiedostoosi, avaa `cgminer.conf` Notepadilla tai muulla tekstinkäsittelyohjelmalla. Käytä seuraavaa kaavaa tehdäksesi muutoksia tiedoston "pools" osioon (huomioi pilkku joka erottaa poolit toisistaan):

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

Tallenna `cgminer.conf` ja sulje `cgminer.exe`. Tuplaklikkaa cgmineria ja se käynnistyy ja lataa uuden konfiguraatiotiedoston. Tässä olivat perusasiat cgminerin pool-louhintaan. Saadaksesi lisätietoa cgminerista ja yksityiskohtaisemman selvityksen ohjelman toiminnoista, lue [cgminer README](https://github.com/decred/cgminer/blob/3.7/README).
