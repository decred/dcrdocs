# <i class="fa fa-windows"></i> Guida dell'utente di Windows 

---

## <i class="fa fa-download"></i> Scarica ed estrapa cgminer 

Visita https://github.com/decred/cgminer/releases  per trovare l'ultima versione di cgminer. Per Windows a 64 bit, scaricare e estrarre `cgminer-decred-w64_*.zip`. Per Windows a 32 bit, scaricare e estrarre `cgminer-decred-w32_*.zip`. Estrarre tutti i file in una nuova cartella e aprire la nuova cartella per visualizzare i file.

## <i class="fa fa-play-circle"></i> Inizializza e fai funzionare cgminer 

> Passo uno

Aprire una finestra del prompt dei comandi digitando `cmd` nella barra degli indirizzi nella parte superiore dell'esploratore di file che contiene i nuovi file cgminer e premendo `Enter`. Digitare quanto segue nella finestra di prompt dei comandi per elencare l'hardware in grado di estrarre:

```no-highlight
C:\Decred> cgminer -n
```

Dovresti vedere le schede video elencate sia dal nome del codice GPU o dal nome del driver. L'ultima riga di output dovrebbe mostrare il numero di GPU compatibili con cui è possibile eseguire la miniatura.

> Secondo passo (facoltativo)

Per confrontare il tuo sistema e scoprire il hashrate che può eseguire, utilizza il comando:

```no-highlight
C:\Decred> cgminer --blake256 --benchmark
```

> Fase tre

Registrarsi su uno dei siti web della piscina e impostare un nuovo minatore per ciascuno dei tuoi computer minerari. Per istruzioni, fare riferimento al sito web della piscina di vostra scelta, se necessario. Nella finestra della riga di comando dal passaggio uno, digitare il seguente comando per lanciare cgminer (ignora parentesi quadre):

```no-highlight
C:\Decred> cgminer --blake256 -o <pool url>:<port number> -u <web login>.<worker name> -p <worker password>
```

Esempio:

```no-highlight
C:\Decred> cgminer --blake256 -o http://dcr.maxminers.net:7727 -u DecredMiner.miner1 -p 7@!x5L1
```

> Fase quattro

Cgminer dovrebbe ora lanciare. Creare un file di configurazione cgminer premendo i seguenti tasti: `S` (Impostazioni), `W` (Scrittura configurazione file), `Enter` (Salva file di configurazione come `cgminer.conf`). Si noti che `cgminer.conf` verrà inserito nella stessa directory di `cgminer.exe` Per aggiungere altri pool al file di configurazione, aprire `cgminer.conf` con Blocco note o un editor di testo simile. Utilizzare la seguente sintassi per apportare modifiche nella sezione "pool" del file di configurazione (nota la virgola tra ogni voce di pool):

```no-highlight
"pools" : [
   {
      "url" : "http://dcr.maxminers.net:7727",
      "user" : "Login.Worker",
      "pass" : "password"
   },
   {
      "url" : "http://dcr.suprnova.cc:9110",
      "user" : "Login.Worker",
      "pass" : "password"
   }
]
```

> Fase cinque

Salvare `cgminer.conf` e chiudere `cgminer.exe`. Fare doppio clic sul programma cgminer e lanciare e caricare il file di configurazione appena creato. Ciò conclude la guida base di installazione della piscina cgminer. Per ulteriori informazioni sull'utilizzo di cgminer e spiegazioni dettagliate sulle funzioni del programma, fare riferimento a [cgminer README](https://github.com/decred/cgminer/blob/3.7/README).
