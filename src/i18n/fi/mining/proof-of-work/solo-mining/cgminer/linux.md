# <i class="fa fa-linux"></i> Linux-käyttäjän Opas

---

## <i class="fa fa-cloud"></i> Yhdistä dcrd Decred-verkkoon

> Vaihe Yksi

Huomaa että kaikki `dcrd`, `dcrwallet`, ja `dcrctl` -komennot pitää suorittaa siinä kansiossa missä Decred-tiedostot sijaitsevat! Käynnistä `dcrd`:

```no-highlight
~/Decred/$ ./dcrd -u <username> -P <password>
```

Käynnistä dcrwallet:

```no-highlight
~/Decred/$ ./dcrwallet -u <username> -P <password>
```

> Vaihe Kaksi

Tee lompakkoon uusi osoite:

```no-highlight
~/Decred/$ ./dcrctl -u <username> -P <password> --wallet getnewaddress default
```

Kopioi uusi osoite (edellisen komennon output). Sammuta `dcrd` ja `dcrwallet` painamalla `ctrl+c` kummassakin ikkunassa.

> Vaihe Kolme

Käynnistä `dcrd` käyttäen komentoa:

```no-highlight
~/Decred/$ ./dcrd -u 1<username>-P <password> --miningaddr <new address from step two or your web client wallet address>
```

> Vaihe Neljä

Asenna TLS security kopioimalla rpc.cert sijaintiin /usr/share/ca-certificates:

```no-highlight
sudo cp /home/<username>/.dcrd/rpc.cert /usr/share/ca-certificates/dcrd.crt
```

Lisää rivi "dcrd.crt" (ilman lainausmerkkejä) /etc/ca-certificates.conf:iin tekstinkäsittelyohjelmalla:

```no-highlight
sudo gedit /etc/ca-certificates.conf
```

Päivitä CA-sertifikaattilista:

```no-highlight
sudo update-ca-certificates
```

---

## <i class="fa fa-download"></i> Lataa ja pura cgminer

Osoitteesta https://github.com/decred/cgminer/releases löydät uusimman cgminer version. Ladataksesi ja purkaaksesi sen Linux-terminaalilla, käytä seuraavia komentoja:

```no-highlight
wget https://github.com/decred/decred-release/releases/download/v0.0.4_cgminer/cgminer-decred-linux-x86_64-20160208.tar.gz
tar -xvf cgminer-decred-linux-x86_64-20160208.tar.gz
```

---

## <i class="fa fa-play-circle"></i> Käynnistä cgminer

> Vaihe Yksi

Jos `dcrd` ei ole vielä synkronoinut lohkoketjua kokonaan, odota että se on valmis ennen kuin siirryt seuraavaan vaiheeseen. Kun se on valmis, se ilmoittaa:

```no-highlight
[INF] BMGR: Processed 1 block in the last 5m34.49s
```

> Vaihe Kaksi

cgminer kansiossasi, käynnistä cgminer komennolla:

```no-highlight
~/Decred/$ ./cgminer --blake256 -o https://127.0.0.1:9109 -u <username>-p <password>
```

Tee cgminer-konfiguraatiotiedosto painamalla seuraavia näppäimiä: `S` (Settings), `W` (Write Config File), `Enter` (Save config file as `cgminer.conf`). Huomaa että `cgminer.conf` tallennetaan samaan kansioon kuin cgminer. cgminer voidaan nyt käynnistää simppelillä komennolla:

```no-highlight
~/Decred/$ ./cgminer
```

Siinä perus cgminer soolo-louhinta opas. Saadaksesi lisätietoa cgminerin käytöstä ja yksityiskohtaisemmat selitykset ohjelman funktioista, lue virallinen [cgminer README](https://github.com/decred/cgminer/blob/3.7/README).
