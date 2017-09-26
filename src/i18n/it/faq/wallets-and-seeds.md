# <i class="fa fa-money"></i> Portafogli e seeds 

---

#### 1. Dovrei dare a qualcuno il mio portafoglio? 

No, non dovresti mai[^8613] condividere il tuo portafoglio con chiunque. Fare così è l'equivalente di dare loro tutto il tuo DCR in quel portafoglio.

---

#### 2. Come posso convertire i miei  seed hex  in  seed words? 

È possibile utilizzare l'utilità [dcrseedhextowords](https://github.com/davecgh/dcrseedhextowords)[^8660] per convertire un  Decred seed dal hex in seed words , necessarie per l'importazione nei portafogli.

---

#### 3. Posso eseguire più portafogli con lo stesso seed? 

L'esecuzione di portafogli multipli con lo stesso seed può portare alla situazione in cui i portafogli non vedranno lo stesso equilibrio. Non dovresti eseguire più portafogli con lo stesso seed.[^9731]

Il problema è semplicemente che gli indirizzi vengono generati deterministicamente dal seed. Quindi, se avete due portafogli in esecuzione sullo stesso seed, fondamentalmente finire con una situazione come questa:

* Portafoglio A: conosce tutti gli indirizzi fino all'indirizzo #15
* *Portafoglio B: conosce circa tutti gli indirizzi fino all'indirizzo #12

Così, tutte le monete che sono state inviate agli indirizzi #13, #14 e #15 saranno noti a Wallet A, ma non a Wallet B.

Inoltre, se si dice semplicemente a Wallet B per ottenere l'indirizzo successivo, non vedrà anche le monete perché, dal suo punto di vista, tale indirizzo è appena esistito e quindi non cercherà le transazioni prima del momento attuale. Questa è un'ottimizzazione perché, come si può immaginare, il blockchain finisce per ottenere estremamente grandi nel tempo e sarebbe incredibilmente costoso (in termini di utilizzo delle risorse) per scansionare l'intera catena ogni volta che viene generato un nuovo indirizzo.

C'è un'eccezione a questo e quello per i portafogli caldi che non hanno fondi propri. Se il portafoglio è **only** a fare voto e non acquistare biglietti o creare altre transazioni, è sicuro.[^11319]

---

#### 4. Può qualcuno rubare le mie monete se accedono a wallet.db? 

Nessuno può rubare le tue monete se accedono al file wallet.db[^9803] a meno che non dispongano anche della tua passphrase privata. Se hai scelto di utilizzare la crittografia pubblica, non può anche accedere a nessuna delle tue chiavi o indirizzi pubblici estesi.

---

#### 5. Può qualcuno usare un attacco brutale su un portafoglio casuale per rigenerare le sue parole di semi (le parole non sono salate)? 

Tutte le parole del seed sono una mappatura diretta delle parole inglesi alle cifre esadecimali. Il seme non è altro che un numero casuale crittograficamente sicuro di 256 bit (32 byte). La vendita non si applica affatto. Non ha niente a che fare con i numeri casuali di tipo brutale[^10452] .

In altre parole, poiché ogni parola può essere 256 possibilità e ci sono 32 parole, che rendono 256^32 (o 2^256 a seconda di come si desidera guardare, ma è lo stesso numero) possibilità. Quel numero è più grande dell'intero numero di atomi di idrogeno nell'universo noto. Infatti, è quasi più del totale degli atomi nell'universo conosciuto.

Per mettere questo in prospettiva, supponendo che ci siano 7 miliardi di persone sul pianeta e ogni persona possedesse 10 computer e ognuno di questi computer potrebbe testare un miliardo di possibilità al secondo e che si potrebbe trovare la soluzione in media dopo aver testato solo il 50% Possibilità totali, avrebbe ancora 26x10^48 (cioè 26 trilioni di trilioni di trilioni di trilioni) per combattere un singolo seed.

---

#### 6. Il mio seed non funziona. Cosa posso fare? 

Assicurati che tutte le parole siano in una singola retta separata da spazi[^10657]. Even though they are printed out on multiple lines for readability, they must be entered on a single line. Also double-check your words have no typos by comparing them to the words in the [PGP word list](https://en.wikipedia.org/wiki/PGP_word_list).

---

#### 7. Come faccio ad importare un tasto nel formato di importazione del portafoglio (WIF)? 

È possibile importare una chiave privata autonoma[^10724] in `dcrwallet`. Tieni presente che questo è solo per gli indirizzi `--noseed` e non dovresti eseguirlo se non sai cosa stai facendo!

Sbloccare il portafoglio (ignorare le parentesi d'angolo):

```no-highlight
dcrctl --wallet walletpassphrase <private encryption passphrase> 60
```

Importa la chiave privata (`--noseed`) privata (ignora le parentesi d'angolo):

```no-highlight
dcrctl --wallet importprivkey <put WIF private key here>
```

Visualizzare l'equilibrio dell'account importato (dare un po 'di tempo per eseguire la scansione e guardare il registro in dcrwallet per visualizzare il progresso di scansione):

```no-highlight
dcrctl --wallet getbalance "imported" 0 all
```

---

#### 8. Qual è la differenza tra un testnet e l'indirizzo mainnet? 

Un indirizzo di chiave pubblica di testnet[^11507] inizia con le lettere `Tk`. Un indirizzo mainnet inizia con le lettere `Dk`. `T` = Testnet, `D` = (Decred) Mainnet.

---

#### 9. Quali sono i diversi tipi di indirizzi? 

Un indirizzo Decred[^14995] è in realtà solo una rappresentazione di una chiave pubblica (che in sé potrebbe essere un hash di script) insieme a un prefisso a 2 byte che identifica la rete e il tipo e un suffisso di checksum per rilevare indirizzi non corretti immessi.

Di conseguenza, puoi sempre dire quale tipo di indirizzo si basa sul prefisso a 2 byte.

Il primo byte del prefisso identifica la rete. Questo è il motivo per cui tutti gli indirizzi mainnet iniziano con "D", gli indirizzi testnet iniziano con "T" e gli indirizzi simnet iniziano con "S". Il secondo byte del prefisso identifica il tipo di indirizzo che è.

Gli indirizzi più comuni utilizzati al momento sono secp256k1 hashes public, identificati da una minuscola "s". Rappresenta una singola chiave pubblica e quindi ha solo una chiave privata associata che può essere utilizzata per riscattarlo.

Tuttavia, il pool di stake utilizza un indirizzo pay-to-script per hash, identificato dal secondo byte come una piccola c "(di nuovo indicata nei parami collegati). Il sapore specifico dello script che genera è una multi-firma 1-of-2, che è come consente il pool, o voi, a votare. Sia voi che il pool di balls avete le tue chiavi private e poiché lo script richiede solo una firma dei due possibili, è così che consente la delega dei diritti di voto in piscina senza che tu abbandoni completamente i tuoi diritti di voto.

---

## <i class="fa fa-book"></i> Sorgenti 

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
