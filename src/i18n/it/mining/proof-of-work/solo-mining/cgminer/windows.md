# <i class="fa fa-windows"></i> Guida dell'utente di Windows

---

## <i class="fa fa-cloud"></i> Connettere dcrd alla rete Decred 

> Passo uno

Si noti che tutti i comandi `dcrd`, `dcrwallet`, e `dcrctl` devono essere eseguiti nella directory in cui si trovano i file Decred! Avviare `dcrd`:

```no-highlight
C:\Decred> dcrd -u <username> -P <password>
```

Avviare dcrwallet:

```no-highlight
C:\Decred> dcrwallet -u <username> -P <password>
```

> Secondo passo

Generare un nuovo indirizzo del portafoglio:

```no-highlight
C:\Decred> dcrctl -u <username> -P <password> --wallet getnewaddress
```

Copiare il nuovo indirizzo (uscita dall'ultimo comando). Chiudere/arresto `dcrd` e `dcrwallet` by pressing `ctrl+c` in ogni finestra.

> Fase tre

Riavviare `dcrd` utilizzando il comando:

```no-highlight
C:\Decred> dcrd --miningaddr <new address from step two or your web client wallet address>
```

---

## <i class="fa fa-download"></i> Scarica ed estrapa cgminer 

Visita https://github.com/decred/cgminer/releases per trovare l'ultima versione di cgminer. Per Windows a 64 bit, scaricare e estrarre `cgminer-decred-w64_*.zip`. Per Windows a 32 bit, scaricare e estrarre `cgminer-decred-w32_*.zip`. Estrarre tutti i file in una nuova cartella e aprire la nuova cartella per visualizzare i file.

---

## <i class="fa fa-play-circle"></i> Inizializza e fai funzionare cgminer

> Passo uno

Fare clic con il pulsante destro del mouse su `start_local.bat` e fare  clic su`Edit`. Modificare il nome utente e la password corrispondenti alle credenziali utilizzate nel passaggio 1. Salva e chiudi start_local.bat Per riferimento, ecco il comando in start_local.bat:

```no-highlight
C:\Decred> cgminer --blake256 -o https://127.0.0.1:9109 -u <username> -p <password> --cert "%LOCALAPPDATA%\Dcrd\rpc.cert"
```

> Secondo passo

Se dcrd non ha finito di sincronizzare il blockchain, attendere che finisca, quindi passare al passaggio successivo. Quando è terminato, mostrerà:

```no-highlight
[INF] BMGR: Processed 1 block in the last 5m34.49s
```

> Fase tre

Fare doppio clic su `start_local.bat`. `cgminer` dovrebbe aprire. Creare un file di configurazione `cgminer` premendo i tasti seguenti: `S` (Impostazioni), `W` (Scrittura configurazione file), `Enter` (Salva file di configurazione come `cgminer.conf`). Si noti che `cgminer.conf` verrà inserito nella stessa directory come cgminer. Ora è possibile avviare cgminer semplicemente facendo doppio clic su `cgminer.exe`. Ciò conclude la guida di installazione di base solo cgminer. Per ulteriori informazioni sull'uso di cgminer e spiegazioni dettagliate sulle funzioni del programma, fare riferimento al file ufficiale [cgminer README](https://github.com/decred/cgminer/blob/3.7/README).
