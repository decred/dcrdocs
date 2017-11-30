# **<i class="fa fa-linux"></i> *gominer* Guida all'uso di Linux Pool Mining**

Questa guida è destinata all'impostazione iniziale di base di gominer con il pool mining di scelta utilizzando un file di configurazione; Sono disponibili opzioni più avanzate.

Ultimo aggiornamento il 28 aprile 2017.

---

### **<i class="fa fa-download"></i> Scarica e estrae il *gominer* Binary**


> Scarica il file .tar.gz

Visita [https://github.com/decred/decred-binaries/releases](https://github.com/decred/decred-binaries/releases) per scaricare i più recenti binari Linux di gominer. Sono disponibili solo versioni a 64 bit di gominer. Le ultime versioni attuali sono:

- `gominer-linux-amd64-cuda-v1.0.0.tar.gz`,
- `gominer-linux-amd64-opencl-v1.0.0.tar.gz`,
- `gominer-linux-amd64-opencladl-v1.0.0.tar.gz`.

Per le schede grafiche NVIDIA, scaricare il file `*-cuda-*.tar.gz` file. <br />
Per le schede grafiche AMD dalle righe Radeon e FirePro, scaricare il file `*-opencladl-*.tar.gz` file. <br />
Per altre schede grafiche scaricare il file `*-opencl-*.tar.gz`.

Per voi amanti della linea di comando, ecco i collegamenti diretti per v1.0.0:

```no-highlight
$ wget https://github.com/decred/decred-binaries/releases/download/v1.0.0_gominer/gominer-linux-amd64-cuda-v1.0.0.tar.gz
$ wget https://github.com/decred/decred-binaries/releases/download/v1.0.0_gominer/gominer-linux-amd64-opencl-v1.0.0.tar.gz
$ wget https://github.com/decred/decred-binaries/releases/download/v1.0.0_gominer/gominer-linux-amd64-opencladl-v1.0.0.tar.gz
```

> Estrarre il file .tar.gz

Estrarre o copiare tutti i file in una nuova directory. Per questo tutorial useremo `~/decred/` come nostra directory di lavoro. Dalla riga di comando:

```no-highlight
$ tar -xzf gominer-linux-amd64-cuda-v1.0.0.tar.gz -C ~/decred/
```

Quando si sfoglia il catrame, creerà una directory denominata `gominer-linux-amd64-opencladl-v1.0.0`. Il contenuto di questa directory dovrebbe essere `blake256.cl`, `blake256-old.cl`, `gominer`, `LICENSE`, `README.md`, e `sample-gominer.conf`.

Per la versione CUDA è ora inclusa la libreria di runtime CUDA. I file in questa versione includeranno anche `libcudart.so.8.0` e `rungominer.sh`. Lo script viene utilizzato per avviare gominer con la libreria di runtime inclusa per la vostra convenienza. È necessario disporre di un driver installato per la scheda grafica che supporta CUDA 8. I driver più vecchi causeranno l'intasamento e l'arresto del lancio.

### **Imposta il *gominer* File di configurazione**

> Fase 1: scegliere la piscina mineraria

Prima di iniziare questo passaggio, è importante che tu abbia già firmato un account di pool mining (se richiesto dalla tua pool mining scelta, dovrai creare un lavoratore sul sito della piscina). Registrare il login e la password del tuo lavoratore e lo strato + indirizzo tcp della piscina: porta per un utilizzo successivo.

Se questo è nuovo per te, qui ci sono alcune guide per la creazione di lavoratori in alcuni pool mining di Decred (ATTENZIONE: non dimenticare il tuo PIN impostato durante la creazione dell'account - non potrai ritirare qualsiasi DCR minato senza di esso):

- [https://dcr.maxminers.net/index.php?page=gettingstarted](https://dcr.maxminers.net/index.php?page=gettingstarted)
- [https://dcr.suprnova.cc/index.php?page=gettingstarted](https://dcr.suprnova.cc/index.php?page=gettingstarted)
- [https://www2.coinmine.pl/dcr/index.php?page=gettingstarted](https://www2.coinmine.pl/dcr/index.php?page=gettingstarted)
- [https://pool.mn/dcr/index.php?page=gettingstarted](https://pool.mn/dcr/index.php?page=gettingstarted)

> Passaggio 2: Verifica ID dispositivo#

Prima di impostare il file di configurazione, è fondamentale determinare quali dispositivi,  si desidera utilizzare per il mining. A tale scopo, aprire una finestra di terminale, spostarsi nella posizione in cui è stato installato sopra (ad esempio `~/decred/gominer-linux-amd64-cuda-v1.0.0`), digitare `./gominer -l` o `./rungominer.sh -l` se si utilizza la versione CUDA, premere Invio e verrà visualizzato un elenco dei dispositivi con cui è possibile eseguire il mining. Registrare quali ID dispositivo desideri utilizzare. Suggerimento: Le schede video possono essere elencate per il loro nome di codifica.

> Passo 3: Modifica del file di configurazione

Apri il file `sample-gominer.conf` con il tuo editor di testo a scelta. Per ogni impostazione che stiamo per cambiare, è sufficiente eliminare il semicolon prima della variabile di impostazione dopo il segno `=`. 

All'interno della sezione "Impostazioni generali":

- impostare `devices=` all'ID # Device registrato utilizzando il comando `./gominer -l` or `./rungominer.sh -l` nel passaggio 2. I dispositivi multipli dovrebbero essere separati con virgola, ad esempio. `devices=2,3`.

All'interno della sezione "Impostazioni di estrazione mineraria":

- impostare `pool=` allo strato + indirizzo tcp: porta del pool minerario di tua scelta, ad esempio decredpool.org uses `stratum+tcp://stratum.decredpool.org:3333` (ATTENZIONE: l'indirizzo http://address:port non funziona con gominer - stratum+tcp *must* essere utilizzato).
- impostare `pooluser=` al login del tuo lavoratore.
- impostare `poolpass=` alla password del tuo operatore.

Una volta effettuate queste modifiche, salvare il file. Effettuare una copia di esso e chiamarlo gominer.conf nella directory config di gipiner:

```no-highlight
$ mkdir -p ~/.gominer
$ cp sample-gominer.conf ~/.gominer/gominer.conf
```

### **Lancia il via gominer**

Passare indietro alla directory che contiene `gominer` e `blake256.cl`, `e.g. ~/decred/gominer-linux-amd64-cuda-v1.0.0/`, e lanciarlo - `./gominer` o `./rungominer.sh`. Se tutto è stato fatto correttamente, il gominer dovrebbe leggere dal file di configurazione, connettersi al pool e avviare la ricerca con i dispositivi specificati. Comincerai a vedere i messaggi di scorrimento, incluse le statistiche relative al tuo hashrate da ciascun dispositivo e le azioni accettate, respinte, vecchie e totali inviate.

Se esiste un errore di connessione, è probabile che il `pool`, `pooluser` or `poolpass` siano configurati in modo errato.

Se gominer inizia la ricerca di hash su un dispositivo che non si desidera utilizzare, è probabile che l'impostazione `devices` sia configurata in modo errato.

Se entrambi i problemi di cui sopra esistono, è probabile che il file di configurazione sia immesso in modo errato (deve essere denominato`gominer.conf`) o situato nella directory sbagliata (deve essere in `~/.gominer/`).

### **amiliarizza con il tuo sito web del pool**

Ora  hai tempo per controllare il tuo sito web della tua pool. La maggior parte deipool ha uno spazio sul loro sito web che è possibile utilizzare per trovare statistiche relative al pool, alla rete e al round corrente (il tempo trascorso tra ogni blocco trovato dalla piscina). Inoltre, una volta che ricevi una vincita abbastanza grande, puoi ritirare le tue monete attraverso la pagina Modifica impostazione impostando un indirizzo di pagamento DCR e impostando una soglia di pagamento automatico oppure scegliendo di rimborsare l'equilibrio totale del tuo account.

### **Suggerimenti utili**

*Per le versioni OpenCL e OpenCL ADL del gominer*, gominer calcola automaticamente un WorkSize che determina l'esecuzione dell'algoritmo di lavoro ogni 500ms. Modificare le impostazioni di Intensity/WorkSize all'interno di `gominer.conf` comporterà un problema conosciuto - l'algoritmo verrà eseguito a ritmi molto più rapidi a causa della WorkSize abbassata (ciò non determinerà più parti in generazione), con conseguente incremento dell'utilizzo Di memoria a volte alto come 10MB / sec. Questo porta infine al sistema che esegue lo spazio RAM e termina automaticamente il gommone. È consigliabile lasciare queste impostazioni da solo e permettere a gominer di calcolare il proprio WorkSize.
