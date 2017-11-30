# <i class="fa fa-linux"></i> Guida per l'utente di Linux 

---

## <i class="fa fa-cloud"></i> Connettere dcrd alla rete Decred 

> Passo uno

Si noti che tutti i comandi `dcrd`, `dcrwallet`, e `dcrctl` devono essere eseguiti nella directory in cui si trovano i file Decred! Avviare `dcrd`:

```no-highlight
~/Decred/$ ./dcrd -u <username> -P <password>
```

Avviare dcrwallet:

```no-highlight
~/Decred/$ ./dcrwallet -u <username> -P <password>
```

> Secondo passo

Generare un nuovo indirizzo del portafoglio:

```no-highlight
~/Decred/$ ./dcrctl -u <username> -P <password> --wallet getnewaddress default
```

Copiare il nuovo indirizzo (uscita dall'ultimo comando). Chiudere/arresto `dcrd` e `dcrwallet` premendo `ctrl+c` in ogni finestra.

> Fase tre

Riavviare `dcrd` utilizzando il comando:

```no-highlight
~/Decred/$ ./dcrd -u <username> -P <password> --miningaddr <new address from step two or your web client wallet address>
```

> Fase quattro

Impostare la protezione TLS copiando rpc.cert to /usr/share/ca-certificates:

```no-highlight
sudo cp /home/<username>/.dcrd/rpc.cert /usr/share/ca-certificates/dcrd.crt
```

Utilizza un editor di testo per aggiungere la riga "dcrd.crt" (nessuna virgoletta) a /etc/ca-certificates.conf:

```no-highlight
sudo gedit /etc/ca-certificates.conf
```

Aggiorna l'elenco dei certificati CA:

```no-highlight
sudo update-ca-certificates
```

---

## <i class="fa fa-download"></i> Scarica ed estrapa cgminer 

Visita https://github.com/decred/cgminer/releases per trovare l'ultima versione di cgminer. Per scaricare e estrarre dal tuo terminale Linux, utilizzare i seguenti comandi:

```no-highlight
wget https://github.com/decred/decred-release/releases/download/v0.0.4_cgminer/cgminer-decred-linux-x86_64-20160208.tar.gz
tar -xvf cgminer-decred-linux-x86_64-20160208.tar.gz
```

---

## <i class="fa fa-play-circle"></i> Inizializza e fai funzionare cgminer 

> Passo uno

Se `dcrd` non è terminato per essere sincronizzato con il blockchain, attendere che finisca, quindi procedi al passo successivo. Quando è terminato, mostrerà:

```no-highlight
[INF] BMGR: Processed 1 block in the last 5m34.49s
```

> Secondo passo

Nella directory cgminer, avviare cgminer con il comando:

```no-highlight
~/Decred/$ ./cgminer --blake256 -o https://127.0.0.1:9109 -u <username> -p <password>
```

Creare un file di configurazione cgminer premendo i seguenti tasti: `S` (Impostazioni), `W` (Scrittura configurazione file), `Enter` (Salva file di configurazione come `cgminer.conf`). Si noti che `cgminer.conf` verrà inserito nella stessa directory come cgminer. Ora è possibile avviare cgminer semplicemente eseguendo il comando:

```no-highlight
~/Decred/$ ./cgminer
```

Ciò conclude la guida di installazione di base solo cgminer. Per ulteriori informazioni sull'uso di cgminer e spiegazioni dettagliate sulle funzioni del programma, fare riferimento al file ufficiale [cgminer README](https://github.com/decred/cgminer/blob/3.7/README).
