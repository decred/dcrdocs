# Virheilmoitukset ja yleisimmät ongelmat

## Paymetheus

#### 1. Aloitin juuri Paymetheuksen käyttämisen, mutta se vaikuttaisi olevan jumissa.

Kun käynnistät Paymetheuksen ensimmäistä kertaa, se lataa lohkoketjun kokonaisuudessaan. Tämä saattaa kestää tunnin ja näyttää siltä ettei Paymetheus tekisi mitään.

#### 2. Virheellinen salasana privaattiavaimelle.

Pitempi tapa sanoa "väärä salasana". Kirjoitit lompakkosi salasanan väärin.

#### 3. "Varat eivät riitä lipukkeiden ostoon..." mutta lompakkoni väittää että rahaa on tarpeeksi.

Paymetheuksessa on tunnettu bugi joka laskee yhä lukitut varat käytettävissä oleviksi. Äänestyksen tapahduttua kestää 256 lohkoa ennen kuin rahat vapautuvat ja vasta sen jälkeen ne ovat käytettävissä.

#### 4. Paymetheus näyttää virheellisen saldon.

> Nämä ohjeet ovat voimassa versioon 0.8.x asti eivätkä välttämättä päde uudempiin versioihin.

Jos Paymetheus näyttää väärää balanssia, voit korjata asian muuttamalla paria tiedostoa komentojono-työkalulla.
Tämä saattaa tuntua sekavalta jos komentojonon käyttö ei ole sinulle tuttua, mutta seuraamalla ohjeita rivi riviltä
se onnistuu kyllä. Kun näet komennon, joka `näyttää tältä`, kopioi ja liitä se sellaisenaan komentojonoon.
Muista painaa <ENTER> jokaisen komennon jälkeen. Jos jäät jumiin, liity  [Slack kanavallemme](https://decred.slack.com) josta löydät avuliasta ryhmää,
mutta ensin, tarkista komento ja varmista että kirjoitit sen oikein. Tarvitset myös lompakkosiidisi. Tämä prosessi kestää noin 15 minuuttia.

1. Avaamme nyt kolme PowerShell-ikkunaa. Paina Windows-näppäintä, kirjoita 'powershell' (ilman lainausmerkkejä) ja paina ENTER.
2. Tee sama vielä kaksi kertaa uudelleen.
3. Asettele ikkunat niin että näet ne kaikki.
4. Kopioi ja liitä seuraava käsky: `cd $env:programfiles/decred/paymetheus` (Huomio: powershellissä voit liittää joko näppäinkomennolla CTRL+V tai oikealla hiirennäppäimellä Liitä). Paina ENTER.
5. Liitä sama komento kahteen muuhunkin ikkunaan.
6. Avaa Windows Explorer.
7. Liitä `%localappdata%/decred/paymetheus` sijaintipalkkiin. Paina ENTER.
8. Poista 'mainnet'-kansio.
9. Mene takaisin yhteen PowerShell-ikkunoistasi ja liitä `./dcrd -u<username> -P <password>`. Paina ENTER.
10. Mene toiseen PowerShell-ikkunaan ja liitä `./dcrwallet --appdata=$env:localappdata/decred/paymetheus --create`
11. Noudata ohjeita ja importtaa siidisi. Kysyttäessä ylimääräisestä salauskerroksesta vastaa ei ja kysyttäessä onko sinulla siidi vastaa kyllä.
12. Kun ohjeistus pyytää siidiäsi, kirjoita siidisanat ja paina ENTER kaksi kertaa.
13. Liitä tämä komento samaan ikkunaan: `./dcrwallet -u <username> -P <password> --appdata=$env:localappdata/decred/paymetheus`. Paina ENTER.
14. Kirjoita se salasana jonka valitsit luodessasi lompakkosi.
15. Mene kolmanteen PowerShell-ikkunaan ja liitä `./dcrctl -u <username> -P <password> --wallet -c $env:localappdata/decred/paymetheus/rpc.cert getbalance`. Paina ENTER.
16. Paina CTRL+C kahdessa ensimmäisessä ikkunassa sulkeaksesi ohjelmat (dcrd ja dcrdlompakko).
17. Voit nyt sulkea kaikki kolme PowerShell-ikkunaa.
18. Mene takaisin Windows Explorer-ikkunaan. Poista kaksi tiedostoa, rpc.cert ja rpc.key.
19. Käynnistä Decred-ohjelma ja jatka Paymetheuksen käyttöä.

-----

## Proof-of-Stake

#### 1. Osa vanhentuneista lipukkeistani on yhä lukossa yli vuorokauden jälkeen.

1. Käynnistä lompakkoprosesi käyttäen `--enablevoting` flägiä. Ilman tätä prosessi ei julkaise peruutuksia.
2. Avaa lompakon lukitus komennolla `dcrctl --wallet walletpassphrase<yourpassphrase> 0`. Lompakon pitää olla lukitsematon jotta se pystyy tekemään peruutuksia ja allekirjoittamaan ne.
3. Ohjeista dcrd ilmoittamaan lompakolle missatuista lipukkeista uudestaan, jolloin se tekee peruutukset komennolla `dcrctl rebroadcastmissed`.


Nyt peruutusten pitäisi olla nähtävissä lompakon loki-osiossa.
Kun peruutusten siirrot on louhittu lohkoon (jonka pitäisi olla seuraava lohko),
rahat siirtyvät immaturestakegeneration-kategoriaan `dcrctl --wallet`:in getbalance outputissa.
Lopulta 256 lohkon jälkeen, ne siirtyvät käytettävissä olevien varojen kategoriaan.
