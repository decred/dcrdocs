# <i class="fa fa-money"></i> Lisnice i sjeme

---

#### 1. Moram li dati račun sjemena nekome? 

Ne, nikada ne biste trebali[^8613] dijeliti sjeme računa s nikim. Učinite to tako da vam daju sve vaše DCR u računu.

---

#### 2. Kako mogu pretvoriti podatke s računom u bazi podataka? 

Možete koristiti pomoćnik [dcrhexriječibazepodataka](https://github.com/davecgh/dcrseedhextowords)[^8660] da biste pretvorili Decredovu bazu podataka iz šesterokutnika na bazu podataka riječi potrebne za uvoz u račune.

---

#### 3. Mogu li pokrenuti više računa s istom bazom podataka? 

Pokretanje više računa s istom bazom podataka može dovesti do situacije u kojoj račun neće vidjeti  ravnotežu. Ne biste trebali koristiti više računa s istom bazom podataka.[^9731]

Problem je jednostavno da se adrese generiraju deterministički iz baze podataka. Dakle, ako imate dva računa s istom bazom podataka, zapravo završite ovakvim situacijom:

* račun A: zna o svim adresama do adrese # 15
* račun B: zna o svim adresama do adrese # 12

Dakle, sve kovanice koje su poslane na adrese # 13, # 14 i # 15 bit će poznate računu A, ali ne i računu B.

Nadalje, ako jednostavno kažete računu B da dobije sljedeću adresu, također neće vidjeti kovanice, jer je sa svoje točke gledišta ta adresa tek nastala i tako neće tražiti transakcije prije tekućeg trenutka. Ovo je optimizacija jer, kao što možete zamisliti, lanacblokova završava s izuzetno velikim vremenom i bilo bi nevjerojatno skupo (u smislu korištenja resursa) da skenira cijeli lanac svaki put kada se stvori nova adresa.

Postoji jedna iznimka od ovoga, a to je za glasanje vruće račune bez vlastitih sredstava. Ako je račun **samo** koji glasi, a ne kupuje ulaznice ili stvara druge transakcije, to je sigurno.[^11319]

---

#### 4. Može li netko ukrasti moje novčiće ako pristupaju račun.db? 

Nitko ne može ukrasti vaše kovanice ako dobije pristup domeni račun.db[^9803] osim ako imaju i vašu osobnu zaporku. Ako ste odabrali upotrebu javne enkripcije, oni također ne mogu pristupiti ni jednom od vaših proširenih ključeva ili adresa publike.

---

#### 5. Može li netko koristiti napad s velikim silama na slučajni račun kako bi obnovio svoju bazu podataka riječi (riječi nisu slane)? 

Sve riječi baze podataka su izravno mapirane engleskih riječi u hex znamenke. Baza podataka nije ništa više od 256-bitni (32-byte) kriptografski sigurni slučajni brojeva. Sol se ovdje ne primjenjuje. Nema nikakve veze s slučajnim brojevima[^10452] koji su se brutalno prisiljavali.

Drugim riječima, budući da svaka riječ može biti 256 mogućnosti i ima 32 riječi, koja daje 256 ^ 32 (ili 2 ^ 256 ovisno o tome kako želite pogledati, ali to je isti broj) mogućnosti. Taj broj je veći od cijelog broja vodikovih atoma u poznatom svemiru. Zapravo, gotovo je više od ukupnog broja atoma u poznatom svemiru.

Da biste to stavili u perspektivu, pretpostavljajući da na planeti ima 7 milijardi ljudi, a svaka osoba posjedovala 10 računala, a svako od tih računala moglo bi testirati milijardu mogućnosti u sekundi i da biste mogli naći rješenje u prosjeku nakon testiranja samo 50% Ukupne mogućnosti, trebalo bi 26x10 ^ 48 (tj. 26 trilijuna bilijuna trilijuna trilijuna) godine da se brutalno sili jedno sjeme.

---

#### 6. Moje sjeme ne radi. Što mogu učiniti?

Provjerite jesu li sve riječi na jednoj liniji odvojene razmakom[^10657]. Iako su ispisani na više redaka za čitljivost, oni moraju biti uneseni na jednu liniju. Također dvaput provjerite da vaše riječi nemaju pogrešku pri upisu uspoređujući ih s riječima [PGP lista riječi](https://en.wikipedia.org/wiki/PGP_word_list).

---

#### 7. Kako uvesti ključ koji je u formatu za uvoz računa (WIF)? 

Moguće je uvesti samostalni privatni ključ[^10724] u `dcrwallet`. Imajte na umu da se to odnosi samo na adrese `--noseed` i ne biste trebali pokrenuti ovo osim ako ne znate što radite!

Otključavanje računa (zanemarite kutne zagrade):

```no-highlight
dcrctl --wallet walletpassphrase <private encryption passphrase> 60
```

Uvoz samostalnog (`--noseed`) privatnog ključa (ignoriraj kutne zagrade):

```no-highlight
dcrctl --wallet importprivkey <put WIF private key here>
```

Pogledajte ravnotežu uvezenog računa (dajte mu neko vrijeme za pretragu i pogledaj prijavu u dcrračun da biste vidjeli ponovnu izmjenu napretka):

```no-highlight
dcrctl --wallet getbalance "imported" 0 all
```

---

#### 8. Koja je razlika između testnet i mainnet adrese? 

Adresa javne ključne riječi testnet[^11507] počinje slovima `Tk`. Glavna adresa započinje slovima `Dk`. `T` = Testnet, `D` = (Decred) Mainnet.

---

#### 9. Koje su različite vrste adresa? 

Određena adresa[^14995] zapravo je samo prikaz javnog ključa (koji bi mogao biti ključ skripte) uz predbroj od dva bajta koji identificira mrežu i vrstu i sufiks sučelja kako bi se otkrile nepravilno unesene adrese.

Prema tome, uvijek možete odrediti koju vrstu adrese temelji na prefiksu od 2 bajta.

Prvi bajt prefiksa identificira mrežu. To je razlog zašto sve mainnet adrese počinju s "D", testnet adrese počinju s "T", a simnet adrese počinju sa "S". Drugi bajt prefiksa identificira vrstu adrese koju jest.

Najčešće korištene adrese u ovom trenutku su secp256k1 pubble ključevi, koje su identificirani malim "s". Ona predstavlja jedan javni ključ i zato ima samo jedan pridruženi privatni ključ koji se može iskoristiti za otkup.

Zalihe uloga, međutim, upotrebljavaju adresu isplata za skriptu, koja se identificira prema drugom bajtu kao mala slova "c" (opet prikazana u povezanim parametrima). Specifičan okus skripte koju generira je više-potpis 1-od-2, što znači kako dopušta ili bazen ili vi, da glasate. I vi i udio u udruzi imaju svoje privatne ključeve i budući da skripta zahtijeva samo jedan potpis mogućih dviju, to znači kako omogućuje delegiranje glasačkih prava u ulog bez da potpuno odustane od glasačkih prava.

---

## <i class="fa fa-book"></i> Izvori 

[^8613]: Decred Forum, [Post 8,613](https://forum.decred.org/threads/576/#post-8613)
[^8660]: Decred Forum, [Post 8,660](https://forum.decred.org/threads/534/page-3#post-8660)
[^9731]: Decred Forum, [Post 9,731](https://forum.decred.org/threads/657/#post-9731)
[^11319]: Decred Forum, [Post 11,319](https://forum.decred.org/threads/531/page-3#post-11319)
[^9803]: Decred Forum, [Post 9,803](https://forum.decred.org/threads/686/#post-9803)
[^10452]: Decred Forum, [Post 10,452](https://forum.decred.org/threads/734/#post-10452)
[^10657]: Decred Forum, [Post 10,657](https://forum.decred.org/threads/483/#post-10657)
[^10724]: Decred Forum, [Post 10,724](https://forum.decred.org/threads/643/page-3#post-10724)
[^11507]: Decred Forum, [Post 11,507](https://forum.decred.org/threads/792/#post-11507)
[^14995]: Decred Forum, [Post 14,995](https://forum.decred.org/threads/1321/page-2#post-14995)
