# <i class="fa fa-linux"></i> Guida per l'utente di Linux 

---

## <i class="fa fa-download"></i> Scarica ed estrapa cgminer 

Visita https://github.com/decred/cgminer/releases per trovare l'ultima versione di cgminer. Per scaricare e estrarre i file dal terminale, eseguire i seguenti comandi. Si noti che questo esempio scarica cgminer v0.0.4.

```no-highlight
~/Decred/$ wget "https://github.com/decred/decred-release/releases/download/v0.0.4_cgminer/cgminer-decred-linux-x86_64-20160208.tar.gz"
~/Decred/$ tar -xvf cgminer*
```

Passare alla nuova directory cgminer:

```
~/Decred/$ cd cgminer*
```

## <i class="fa fa-play-circle"></i> Inizializza e fai funzionare cgminer 

> Passo uno

Digitare quanto segue nella finestra del terminale per elencare l'hardware hardware di estrazione mineraria:

```no-highlight
~/Decred/$ ./cgminer -n
```

Dovresti vedere le schede video elencate sia dal nome del codice GPU o dal nome del driver. L'ultima riga di output dovrebbe mostrare il numero di GPU compatibili con cui è possibile eseguire la miniatura.

> Secondo passo (facoltativo)

Per benchmarkare il sistema e scoprire il hashrate che le GPU sono in grado di utilizzare, utilizzare il comando:

```no-highlight
~/Decred/$ ./cgminer --blake256 --benchmark
```

> Fase tre

Registrarsi su uno dei siti web della piscina e impostare un nuovo minatore per ciascuno dei tuoi computer minerari. Per istruzioni, fare riferimento al sito web della piscina di vostra scelta, se necessario. Nella finestra del terminale dal primo passaggio, digitare il seguente comando per lanciare cgminer (ignora parentesi quadre):

```no-highlight
~/Decred/$ ./cgminer --blake256 -o <pool url>:<port number> -u <web login>.<worker name> -p <worker password>
```

Esempio:

```no-highlight
~/Decred/$ ./cgminer --blake256 -o http://dcr.maxminers.net:7727 -u DecredMiner.miner1 -p 7@!x5L1
```

> Fase quattro

Cgminer dovrebbe ora lanciare. Creare un file di configurazione cgminer premendo i seguenti tasti: `S` (Impostazioni), `W` (Scrittura configurazione file), `Enter` (Salva file di configurazione come `cgminer.conf`). Si noti che `cgminer.conf` verrà inserito nella stessa directory di `cgminer`. Per aggiungere altri pool al file di configurazione, aprire `cgminer.conf` con Gedit (GUI) / Pico (CLI) o un editor di testo simile. È possibile aggiungere più piscine seguendo questa sintassi nella sezione "pool" del file di configurazione (nota la virgola tra ogni voce di pool):

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

Salvare `cgminer.conf` e chiudere `cgminer`. Riavviare cgminer utilizzando il comando:

```no-highlight
~/Decred/$ ./cgminer
```

Ciò conclude la guida base di installazione della pool cgminer. Per ulteriori informazioni sull'uso di cgminer e spiegazioni dettagliate sulle funzioni del programma, fare riferimento al file ufficiale [cgminer README](https://github.com/decred/cgminer/blob/3.7/README).
