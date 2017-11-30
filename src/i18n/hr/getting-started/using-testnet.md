# Korištenje vodiča Testnet

Posljednji put ažuriran za testnet2

---

## Zašto koristiti testnet?

Testnet je divno mjesto gdje možete eksperimentirati s Decredovim aplikacijama bez brige da će vas pogreška koštati pravi novac. Zapravo se preporučuje da ljudi koriste testnet kako bi saznali osnove programa Decreda i sve nove značajke.

Decred je trenutno na svom 2. Testnetu, također poznatom i kao testnet2. Testnet mreže se periodički vraćaju kako bi zadržale veličinu datoteke s blokadom.

---

## Kako pokrenuti čvor mreže Testnet

Pokretanje čvora testnet2 nevjerojatno je lako. Primjena izbora morat ćete preuzeti testnet2 lanacblokova i morat ćete stvoriti novu datoteku račune za uporabu testa. Vaši glavni mrežni blokovi i računi ostaju netaknuti. Prebacivanje između dva je nevjerojatno lako.

---

## Paymetheus

Da biste pokrenuli `Paymetheus` na testnet2, jednostavno pokrenite aplikaciju `Decred Testnet` umjesto uobičajene aplikacije `Decred`. Tada ćete proći kroz stvaranje računa (iste korake u vodiču za [Paymetheus Setup guide](/getting-started/user-guides/paymetheus.md)). Nakon `dcrd` završi sinkronizaciju u pozadini, tada ćete moći napuniti svoj `Paymetheus` račun s testnet DCR i upoznati se sa softverom.

---

## Proslijedi 

Da biste pokrenuli `Decrediton` na testnet2, morate pokrenuti `Decrediton` iz naredbenog retka sa `--testnet` zastavom. Imajte na umu da će jednom upotrebom zastavice uvijek početi u tom načinu dok ne koristite `--mainnet` zastavicu da biste se vratili na mrežu mainnet.

Za Linux, 

1. Otvorite svoj terminal i krenite u direktorij s izvršnim programom dekreditacije.
2. Izdajte naredbu `./decrediton --testnet`.
3. Decrediton će pokrenuti i pokušati se povezati s testnet2.

For macOS,

1. Otvorite svoj terminal i unesite sljedeću naredbu: `/Applications/decrediton.app/Contents/MacOS/decrediton --testnet`
2. Decrediton će pokrenuti i pokušati se povezati s testnet2.

Zapamtite, ako želite prebaciti Decredon na glavnu mrežu, morat ćete izdati te naredbe s oznakom `--mainnet`.

___ 

## Komplet Linearnih Naredbi

Da biste pokrenuli `dcrd` i `dcrwallet` na testnetu, jednostavno dodajte `--testnet` flag na naredbu za pokretanje. Alternativno, možete staviti `testnet=1` u sve vaše konfiguracijske datoteke, ali obično je mnogo brže koristiti zastavu za pokretanje.

Na prvom pokretanju `dcrd --testnet`, `dcrd` će početi preuzimati testnet2 blockchain u mapu `data/testnet2` u kućnom imeniku `dcrd`.

Prije nego što možete pokrenuti `dcrwallet` sa `--testnet` zastavom, morate stvoriti zaseban račun testnet koristeći `dcrwallet --testnet --create` naredbu. Koraci su isti kao oni koji se nalaze u [dcrračun Vodič za Instalaciju](/getting-started/user-guides/dcrwallet-setup.md). 

Da biste izdali naredbe i za `dcrwallet` i `dcrd`, morate dodati i `--testnet` oznaku na bilo koju od `dcrctl` naredbi koje koristite. Npr Izdat ćete naredbu `dcrctl --testnet --wallet getbalance` kako biste provjerili ravnotežu testnet-a. 

---

## Stjecanje novčića Testnet

Možete kupiti kovanice kroz [Decred Testnet Rub](https://faucet.decred.org). Vratite sve kovanice na adresu navedenu na dnu te stranice kad završite s testnim mrežama.

---

