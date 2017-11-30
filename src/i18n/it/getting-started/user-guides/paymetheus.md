# Guida all'installazione di Paymetheus 

Paymetheus è un portafoglio grafico semplice da usare per Decred. Con esso, è possibile inviare e ricevere DCR,
Acquistare biglietti per [PoS voting](/mining/proof-of-stake.md), avere una storia di tutte le transazioni e altro ancora.
L'unica cosa che Paymetheus non fa è il voto di PoS.

---

## Scarica e installa 

The Windows Installer (`.msi` file) is located here: [https://github.com/decred/decred-binaries/releases/tag/v1.1.0](https://github.com/decred/decred-binaries/releases/tag/v1.1.0). It will install Paymetheus to your computer's Program Files folder. Installation is pretty straightforward, but instructions are provided below:

1. Scarica il file corretto:

    For 32-bit computers, download the `decred_1.1.0-release_x86.msi` file. <br />
    For 64-bit computers, download the `decred_1.1.0-release_x64.msi` file.

2. Navigare per scaricare la posizione e fare doppio clic sul file `.msi` .

3. eguire i passaggi di installazione. All'interno di questo processo verrà richiesto di accettare un contratto di licenza per l'utente finale.

4. Dopo l'installazione, le funzionalità devono essere installate nella cartella `..\Program Files\Decred\` e accessibili tramite il menu Start (cercare il `Decred` nell'elenco Programmi)

---

## Avviare Paymetheus 
Ora sei pronto per iniziare a utilizzare Decred! Avviare il programma 'Decred' . Vedrai ora la schermata di connessione:  

![Paymetheus connection screen](../../img/Paymetheus-dcrd-login.png)  

>Due programmi sono in esecuzione quando si avvia Decred. C'è 'Paymetheus' che è il portafoglio grafico che parleremo ulteriormente
>E 'dcrd' che è il daemon di comunicazione (pronunciato DAY-mon; un programma che funziona in background e che non interagisce direttamente
> Con un utente) che effettivamente parla alla rete Decred. Ciò significa che è possibile eseguire dcrd
>Su un altro computer (ad esempio sempre sul server) e quindi utilizzare Paymetheus per connettersi a distanza.

Per utilizzare un locale che Paymetheus abbia già iniziato, basta premere Continua.

> La prima volta che Paymetheus inizia, scaricherà il blockchain in background. Ciò può richiedere fino a un'ora.

---

## Crea o ripristina il portafoglio 
Avrai ora la possibilità di creare un nuovo portafoglio o di ripristinare un portafoglio da un seed. Se stai leggendo questo, probabilmente sei nuovo e non si ha  già un portafoglio, quindi ne creiamo   uno nuovo. Se fai clic su Ripristina, ti verrà chiesto di inserire le tue parole di seed invece di vedersi assegnato un nuovo seed.
Il resto del processo è lo stesso. Fai clic su "Crea un nuovo portafoglio". Verrà visualizzata la seguente schermata:  

![Paymetheus wallet creation screen](/img/Paymetheus-seed-window.png)  

<i class="fa fa-exclamation-triangle"></i> **STOP QUI!!! NON CLICCA CONTINUA! **

**Questa è la parte più importante dell'utilizzo di Decred. Nella casella bianca vengono visualizzate le tue sementi. Queste parole sono la chiave del tuo portafoglio.  **
 **SENZA QUESTE PAROLE O LA CHIAVE  DI HEX VOI PERMANENTEMENTE E PER SEMPRE PERDERETE L' ACCESSO AI VOSTRI FONDI!**  

**NON DOVRETE CONSEGNARLE A NESSUNO,NEANCHE AGLI SVILUPPATORI!**

Con queste parole, qualcun altro può ricreare il tuo portafoglio su un altro computer e trasferire tutti i fondi in un altro portafoglio. Non è possibile invertire una transazione in Decred, quindi se qualcuno ruba il tuo Decred, non c'è modo di ripristinarlo.  

<i class="fa fa-exclamation-triangle"></i> **NON UTILIZZARE LO STESSO  SEED IN PIU' WALLETS! Visita [Wallets and Seeds FAQ](/faq/wallets-and-seeds.md#3-can-i-run-multiple-wallets) per vedere perché questo è importante. Si raccomanda che, se possibile, un nuovo portafoglio dovrebbe significare generare un nuovo seed.** 

Le decred e le altre valute digitali vengono spesso descritte come un conto bancario. Tuttavia, a differenza di quanto avviene con il sistema bancario online, nel sistema Decred non esiste una terza persona affidabile che detiene i vostri soldi per tuo conto. Tu e tU da solO controlli il tuo DCR, proprio come con i soldi fisici. Quando il denaro o la DCR sono persi, ingiustificati o rubati, è molto probabilmente andato in modo permanente.

Se perdi il portafoglio, perderai l'accesso a tutto ciò che avevi in ​​esso e nessuno, nemmeno gli sviluppatori di Decred possono rimetterlo indietro. Quindi è molto importante che tu prendi il tempo per leggere questa pagina e SCRIVI le parole del seed in un luogo sicuro. Una buona idea è di scrivere su un pezzo di carta e memorizzarli da qualche parte protetti e memorizzarli in un file ENCRYPTED sul computer. La memorizzazione Cloud come Dropbox o OneDrive va bene quando vengono prese le precauzioni. Dato che gli account online possono essere attaccato, è necessario crittografare fortemente il file del portafoglio (MS Word o Libre/OpenOffice possono farlo) prima di caricarlo in un servizio di archiviazione cloud.  

Okay, così hai protetto le tue parole di seed in almeno due luoghi diversi. Fare clic su Continua. Ti viene chiesto di digitarli nuovamente per assicurarti di averli scritti correttamente nel caso in cui dovresti ripristinare il portafoglio in un secondo momento. Nota che non è possibile incollarli; Dovrai digitarli. Questo è per assicurarsi di avere le parole salvate da qualche altra parte diversa dagli appunti. Fai clic su "Conferma".

---

## Scegli una Passphrase di Wallet Privato 
Inserisci una passphrase da utilizzare ogni volta che crei una transazione sulla rete. Finché il portafoglio è bloccato con questa frase, i fondi del portafoglio non sono accessibili a chiunque abbia il controllo sul file del portafoglio. Esiste anche l'opzione per una passphrase pubblica. Viene utilizzato per crittografare tutti i dati pubblici (transazioni e indirizzi) all'interno del file del portafoglio, quindi se viene rubato, un avversario non può collegarti alle transazioni. Per la maggior parte delle persone, una passphrase pubblica è di solito overkill, in modo da poterlo lasciare indifferente. Una volta inserita la tua nuova passphrase privata (e pubblica opzionale), fai clic su Encrypt.  

Il portafoglio ora creerà e sincronizza con il blockchain. Questo può richiedere alcuni minuti su computer più lenti. Si noti che le parole del seme che hai scritto apprezzeranno
Lavorare con qualsiasi applicazione Wallet decred, non solo Paymetheus.

Continuare a [Using Paymetheus](using-paymetheus.md)
