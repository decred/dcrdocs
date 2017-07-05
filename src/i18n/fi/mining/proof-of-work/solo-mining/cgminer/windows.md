# <i class="fa fa-windows"></i> Windows-käyttäjän Opas

---

## <i class="fa fa-cloud"></i> Yhdistä dcrd Decred-verkkoon

> Vaihe Yksi

Huomaa että kaikki `dcrd`, `dcrwallet`, ja `dcrctl` -komennot tulee suorittaa siinä kansiossa missä Decred tiedostosi sijaitsevat! Käynnistä `dcrd`:

```no-highlight
C:\Decred> dcrd -u <username> -P <password>
```

Käynnistä dcrwallet:

```no-highlight
C:\Decred> dcrwallet -u <username> -P <password>
```

> Vaihe Kaksi

Tee lompakkoosi uusi osoite:

```no-highlight
C:\Decred> dcrctl -u <username> -P <password> --wallet getnewaddress
```

Kopioi uusi osoite (viimeisimmän komennon output). Sammuta `dcrd` ja `dcrwallet` painamalla `ctrl+c` kummassakin ikkunassa.

> Vaihe Kolme

Käynnistä `dcrd` uudelleen käyttäen komentoa:

```no-highlight
C:\Decred> dcrd --miningaddr <new address from step two or your web client wallet address>
```

---

## <i class="fa fa-download"></i> Lataa ja pura cgminer

Osoitteesta https://github.com/decred/cgminer/releases löydät uusimman cgminer version. 64-bittiselle Windowsille, lataa ja pura `cgminer-decred-w64_*.zip`. 32-bittiselle Windowsille, lataa ja pura `cgminer-decred-w32_*.zip`. Pura kaikki tiedostot uuteen kansioon ja avaa kansio nähdäksesi tiedostot.

---

## <i class="fa fa-play-circle"></i> Käynnistä cgminer

>Vaihe Yksi

Klikkaa `start_local.bat` oikealla näppäimellä ja valitse `Edit`. Vaihda käyttäjänimi ja salasana samoiksi mitä käytettiin vaiheessa 1. Tallenna ja sulje start_local.bat Referrenssiksi, tässä komento in start_local.bat:ssa

```no-highlight
C:\Decred> cgminer --blake256 -o https://127.0.0.1:9109 -u <username> -p <password> --cert "%LOCALAPPDATA%\Dcrd\rpc.cert"
```

> Vaihe Kaksi

Jos `dcrd` ei ole vielä synkronoinut lohkoketjua kokonaan, odota että se on valmis ennen kuin siirryt seuraavaan vaiheeseen. Kun se on valmis, se ilmoittaa:

```no-highlight
[INF] BMGR: Processed 1 block in the last 5m34.49s
```

> Vaihe Kolme

Tuplaklikkaa `start_local.bat`. `cgminer`in pitäisi käynnistyä. Tee `cgminer` konfiguraatiotiedosto painamalla seuraavia näppäimiä: `S` (Settings), `W` (Write Config File), `Enter` (Save config file as `cgminer.conf`). Huomaa että `cgminer.conf` tallennetaan samaan kansion kuin cgminer. cgminer voidaan nyt käynnistää tuplaklikkaamalla `cgminer.exe`. Siinä perusopas soolo-louhintaan. Lisätietoa cgminerista ja yksityiskohtainen selostus ohjelman toiminnoista löytyy virallisesta [cgminer README](https://github.com/decred/cgminer/blob/3.7/README) oppaasta.
