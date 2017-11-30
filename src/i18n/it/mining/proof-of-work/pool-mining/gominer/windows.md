# <i class="fa fa-windows"></i> *gominer* Guida per l'utente di Windows Pool Mining 

Questa guida è destinata all'impostazione iniziale di base di gominer su una piscina mineraria scelta utilizzando un file di configurazione, sono disponibili opzioni più avanzate.

Ultimo aggiornamento per gominer v1.0.0.

---

### <i class="fa fa-download"></i> Scarica e estrae *gominer* Binary 


> Scarica il file .zip

Visita [https://github.com/decred/decred-binaries/releases/tag/v1.0.0](https://github.com/decred/decred-binaries/releases/tag/v1.0.0)  per scaricare Gominer Windows binaries. Nella sezione "Download" si devono vedere i seguenti file:

- `gominer-windows-amd64-cuda-v1.0.0.zip`,
- `gominer-windows-amd64-opencl-v1.0.0.zip`,
- `gominer-windows-amd64-opencladl-v1.0.0.zip`.

Per le schede grafiche NVIDIA, scarica il file `*-cuda-*.zip` file. <br />
Per le schede grafiche AMD dalle righe Radeon e FirePro, scaricare il file `*-opencladl-*.zip` file. <br />
er altre schede grafiche scaricare il file `*-opencl-*.zip` file.

Estrarre o copiare tutti i file in una nuova cartella. Ricorda il nome di percorso in questa cartella oppure apri una nuova finestra di Esplora file per visualizzare il contenuto della cartella (per il resto di questo tutorial, useremo come esempio il `C:\decred\gominer\` as an example). Il contenuto di questa cartella dovrebbe essere `blake256.cl`, `gominer.exe`, `LICENSE`, `README.md`, e `sample-gominer.conf`.

> Note del prompt dei comandi

Per coloro che sono nuovi, familiarizza con alcuni metodi per aprire un prompt dei comandi in una directory (cartella) specifica:

- In Esplora file, navigare in una cartella specifica, digitare `cmd` nella barra degli indirizzi e premere enter.
- In Esplora file, passare a una cartella specifica, fare clic sul menu a discesa "File", passare all'opzione "Aprire il prompt dei comandi" e selezionare "Aprire il prompt dei comandi".
- Fare clic sul menu di avvio o premere il tasto Windows sulla tastiera, digitare `cmd`, e aprire l'applicazione desktop di prompt dei comandi che dovrebbe apparire nei risultati della ricerca. Modificare la directory corrente in una specifica cartella utilizzando il comando, `e.g. cd C:\decred\gominer\`. Il comando `dir` in sé può essere utilizzato per visualizzare il contenuto della directory corrente.

### Setup *gominer* File di configurazione 

> Fase 1: scegliere la piscina mineraria

Prima di iniziare questo passaggio, è importante che tu abbia già firmato un account di pool mining (se richiesto dal pool mining  scelto, dovrai creare un profil sul sito della pool). Registrare il login e la password del tuo profilo e lo strato + indirizzo tcp del pool: porta per un utilizzo successivo.

Se questo è nuovo per te, qui ci sono alcune guide per la creazione di lavoratori in alcune delle pool mining di Decred (ATTENZIONE: non dimenticare il tuo PIN impostato durante la creazione dell'account - non potrai ritirare qualsiasi DCR minato senza di esso):

- [https://dcr.maxminers.net/index.php?page=gettingstarted](https://dcr.maxminers.net/index.php?page=gettingstarted)
- [https://dcr.suprnova.cc/index.php?page=gettingstarted](https://dcr.suprnova.cc/index.php?page=gettingstarted)
- [https://www2.coinmine.pl/dcr/index.php?page=gettingstarted](https://www2.coinmine.pl/dcr/index.php?page=gettingstarted)
- [https://pool.mn/dcr/index.php?page=gettingstarted](https://pool.mn/dcr/index.php?page=gettingstarted)

> Passaggio 2: Verifica ID dispositivo#

Prima di impostare il file di configurazione, è fondamentale determinare quali dispositivi, come identificati dal gommatore, si desidera utilizzare per la miniera (soprattutto se si desidera evitare l'estrazione con la CPU o IGP). A tale scopo, aprire il prompt dei comandi nella posizione di `gominer.exe` (`e.g. C:\decred\gominer\`), digitare `gominer.exe -l`, premere Invio e un elenco dei dispositivi che puoi Verrà visualizzata la mia con. Registrare quali ID dispositivo desideri utilizzare. Suggerimento: Le schede video possono essere elencate per il loro nome di codifica.

> Passo 3: Modifica del file di configurazione

Aprire il file `sample-gominer.conf`. Per ogni impostazione che stiamo per cambiare, è sufficiente eliminare il semicolon prima della variabile di impostazione dopo il segno `=`. 

All'interno della sezione "Impostazioni generali":

- impostare `devices=` per i ID Device ID registrati utilizzando il comando `gominer.exe -l` nel passaggio 2. I dispositivi multipli dovrebbero essere separati con virgola, ad es. `devices=2,3`.

All'interno della sezione "Impostazioni di estrazione mining":

- impostare `pool=` allo strato + indirizzo tcp: porta del pool minerario di tua scelta, ad esempio decredpool.org usa `stratum+tcp://stratum.decredpool.org:3333` (ATTENZIONE: l'indirizzo http://address:port non funziona con gominer - stratum+tcp *must* essere utilizzato).
- impostare `pooluser=` al login del tuo lavoratore.
- impostare `poolpass=` alla password del tuo operatore.

Dopo che queste modifiche sono state apportate, salvare come o salvare + rinominare il file come gominer.conf.

> Passo 4: Copia gominer.conf alla cartella AppData locale

All'interno di un nuovo File Explorer, digitare `%localappdata%\Gominer\` nella barra degli indirizzi. Copiare `gominer.conf` dalla sua posizione originale, `e.g. C:\decred\gominer\`, in `%localappdata%\Gominer\`.

### Lancio gominer.exe 

Passare indietro alla directory che contiene `gominer.exe` e `blake256.cl`, `e.g. C:\decred\gominer\`, e lanciare `gominer.exe`. Se tutto è stato fatto correttamente, il gominer dovrebbe leggere dal file di configurazione, connettersi alla piscina e avviare la ricerca con i dispositivi specificati. Comincerai a vedere i messaggi di scorrimento, incluse le statistiche relative al tuo hashrate da ciascun dispositivo e le azioni accettate, respinte, stantie e totali inviate.

Se esiste un errore di connessione, è probabile che il `pool`, `pooluser` o `poolpass` siano configurati in modo errato.

Se gominer inizia la ricerca di hash su un dispositivo che non si desidera utilizzare, è probabile che l'impostazione `devices` sia configurata in modo errato.

e entrambi i problemi di cui sopra esistono, è probabile che il file di configurazione sia stato nominato in modo errato (deve essere denominato `gominer.conf`) o situato nella directory errata (deve trovarsi in `%localappdata%\Gominer\`).

### Familiarizza con il tuo sito web del pool 

Ora che il tuo gonfiatore sta uscendo per te, hai tempo per controllare il tuo sito web del tuo pool. La maggior parte dei pools hanno uno spazio sul loro sito web che è possibile utilizzare per trovare statistiche relative al pool, alla rete e al round corrente (il tempo trascorso tra ogni blocco trovato dalla piscina). Inoltre, una volta che ricevi una vincita abbastanza grande, puoi ritirare le tue monete attraverso la pagina Modifica impostazione impostando un indirizzo di pagamento DCR e impostando una soglia di pagamento automatico oppure scegliendo di rimborsare l'equilibrio totale del tuo account.

### Suggerimenti utili 

*Per le versioni OpenCL e OpenCL ADL del gominer*, gominer calcola automaticamente un WorkSize che determina l'esecuzione dell'algoritmo di lavoro ogni 500ms. odificare le impostazioni di Intensity/WorkSize all'interno di `gominer.conf` comporterà un problema conosciuto - l'algoritmo verrà eseguito a ritmi molto più rapidi a causa della WorkSize abbassata (ciò non determinerà più parti in generazione), con conseguente incremento dell'utilizzo Di memoria a volte alto come 10MB/sec. Questo porta infine al sistema che esegue lo spazio RAM e termina automaticamente il gommone. È consigliabile lasciare queste impostazioni da solo e permettere a gominer di calcolare il proprio WorkSize.
