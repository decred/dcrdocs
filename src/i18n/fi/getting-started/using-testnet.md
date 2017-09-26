# Testnetin Käyttöopas

Viimeksi päivitetty testnet2:lle

---

## Miksi käyttää testnetiä?

Testnet on mainio paikka tehdä kokeiluja Decred-applikaatioilla ilman huolta että mahdollinen virhe maksaisi sinulle oikeaa rahaa. On oikeastaan suositeltavaa että ihmiset käyttäisivät testnetiä oppiakseen Decred-ohjelmistojen perusteet ja uusimmat ominaisuudet.

Decredin tämänhetkinen testnet on toinen laatuaan, se tunnetaan myös nimellä testnet2. Testnetit resetoidaan säännöllisesti jotta lohkoketju pysyisi järkevän kokoisena.

---

## Miten pyörittää testnet nodea

Testnet2 noden pyörittäminen on erittäin helppoa. Valitsemasi sovelluksen pitää ladata testnet2 lohkoketju, ja sinun tarvitsee tehdä uusi lompakkotiedosto testnet2-käyttöön. Mainnet-lohkoketjusi ja lompakkotiedostosi säilyvät koskemattomina. Näiden kahden välillä vaihtaminen on erittäin helppoa.

---

## Paymetheus

Käynnistääksesi `Paymetheuksen` testnet2:ssa, käynnistä `Decred Testnet`-applikaatio normaalin `Decred`-applikaation sijaan. Sovellus opastaa sinut läpi lompakontekoprosessin (samat vaiheet kuin [Paymetheus Asennusoppaassa](/getting-started/user-guides/paymetheus.md)). Kun `dcrd` saa synkkaamisen valmiiksi taustalla, voit käyttää `Paymetheus`-lompakkoasi testnet DCR:llä ja tutustua ohjelmistoon.

---

## Decrediton 

Käynnistääksesi `Decrediton`in testnet2:ssa, sinun pitää käynnistää `Decrediton` komentojonosta `--testnet` flägillä. Muista että flägin käyttö kerran käynnistää sen aina samassa tilassa kunnes käytät  `--mainnet`-flägiä vaihtaaksesi takaisin mainnet-lohkoketjuun.

Linuxille,

1. Avaa terminaali ja mene kansioon jossa decrediton executable sijaitsee.
2. Syötä komento `./decrediton --testnet`.
3. Decrediton käynnistyy ja yrittää ottaa yhteyden testnet2:een.

For macOS,

1. Avaa terminaalisi ja syötä seuraava komento: `/Applications/decrediton.app/Contents/MacOS/decrediton --testnet`
2. Decrediton käynnistyy ja yrittää ottaa yhteyden testnet2:een.

Muista, jos haluat vaihtaa Decreditonin takaisin mainnetiin, sinun tulee syöttää samat komennot `--mainnet` flägillä.

___ 

## Komentojono-ohjelma

Käynnistääksesi `dcrd`:n ja `dcrwallet`in testnetissä, lisää vain `--testnet`-flägi käynnistyskomentoon. Vaihtoehtoisesti voit lisätä rivin `testnet=1` config-tiedostoihisi, mutta on useimmiten paljon nopeampaa vain käyttää käynnistys-flägiä.

Ensimmäisen `dcrd --testnet`-käynnistyksen yhteydessä `dcrd` alkaa lataamaan testnet2-lohkoketjua kansioon `data/testnet2` `dcrd`:n kotikansion sisällä.

Ennen kuin voit käynnistää `dcrwallet`in `--testnet`-flägillä, sinun tulee tehdä erillinen testnet-lompakko  `dcrwallet --testnet --create`-komentoa käyttäen. Vaiheet tähän ovat samat kuin [dcrwallet Asennusoppaassa](/getting-started/user-guides/dcrwallet-setup.md). 

Lähettääksesi komentoja `dcrwallet`ille ja `dcrd`:lle, sinun tulee myös lisätä `--testnet`-flägi kaikkiin `dcrctl`-komentoihin mitä käytät. Esim. `dcrctl --testnet --wallet getbalance`-komento tarkistaa testnet-saldosi.

---

## Testnet-kolikoiden Hankkiminen

Voit hankkia kolikoita [Decred Testnet Faucetista](https://faucet.decred.org). Palautathan kolikot sivun alalaidassa listattuun osoitteeseen kun et enää leiki testnetillä.

---

