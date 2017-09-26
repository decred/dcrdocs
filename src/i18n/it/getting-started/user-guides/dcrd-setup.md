# Dcrd Guida all'installazione

Ultimo aggiornamento per v1.0.0.

Questa guida intende aiutarti a configurare l'applicazione `dcrd` usando [startup flags](/getting-started/startup-basics.md#startup-command-flags). 

**Prerequisiti:**

- Utilizzare le ultime [dcrinstall](/getting-started/user-guides/cli-installation.md) per installare `dcrd`. Ulteriori passaggi saranno richiesti se è stato utilizzato un altro metodo di installazione.
- Review how the launch commands for the Command Prompt (Windows) and Bash (macOS/Linux) shells differ [here](/getting-started/cli-differences.md).

---

`dcrd` è il daemon del nodo per Decred. Un daemon è un programma che funziona in background che non si interfaccia con direttamente. `dcrd` mantiene l'intero registro transazionale (o blockchain) di Decred e consente la trasmissione di transazioni ad altri nodi Decred in tutto il mondo. Puoi pensare a questo come tuo personale server declinato Blockchain. Il blockchain viene salvato nella cartella `data` all'interno della directory home di `dcrd` .

**Utenti avanzati: se si esegue in modalità senza testa tramite SSH,** voi
Sarà necessario utilizzare un multiplexer terminale come [screen](http://www.howtogeek.com/howto/ubuntu/keep-your-ssh-session-running-when-you-disconnect/)
O [tmux](https://tmux.github.io/). Dove si vede l'istruzione
Passare a un'altra shell, dovrai avviare una nuova finestra in `screen`
o `tmux`.

---

## <i class="fa fa-cloud"></i> Connetti alla rete Decred 

La prima volta che lancia `dcrd`, si collega alla rete Decred e inizia a scaricare il blockchain. Per consentire a `dcrwallet` e `dcrctl` di comunicare con `dcrd`, i file di configurazione devono essere abilitati con `rpcuser` e `rpcpass` . 

> Configurare il nome utente e la password RPC

Se hai utilizzato [`dcrinstall`](/getting-started/user-guides/cli-installation.md), i file di configurazione sono già configurati con il nome utente/la password RPC per `dcrd`, `dcrwallet`, e `dcrctl`.

Se non si è utilizzato `dcrinstall`,  è necessario abilitare le impostazioni minime nude nei file di configurazione. Seguire [this guide](/advanced/manual-cli-install.md#minimum-configuration) per farlo 

> Avvia dcrd

Con i file di configurazione correttamente impostati, apri un'altra finestra di shell nella directory Decred (o utilizza l'ultima finestra se hai appena creato il tuo portafoglio). Digitare il seguente comando (esamina i Prerequisiti di questa guida per determinare il comando giusto per l'applicazione OS/Shell):

```no-highlight
dcrd
```

> Attendere che dcrd si sincronizzi con la Blockcable Decred

Quando `dcrd` si avvia con successo, dovresti vedere che la finestra della shell si riempie di messaggi quando il daemon si connette alla rete e inizia a elaborare blocchi. Attendere finché non si completa - l'intero blocco di cache viene scaricato nella directory dati `dcrd` . 

Vedrai una riga all'inizio:

```no-highlight
22:58:04 2016-02-09 [INF] BMGR: Syncing to block height 617 from peer 104.236.167.133:9108
```

Poi, mentre continua a scaricare i blocchi, vedrete le seguenti linee:

```no-highlight
22:58:16 2016-02-09 [INF] BMGR: Processed 321 blocks in the last 10.03s (544 transactions, height 322, 2016-02-09 09:50:34 +1000 EST)
```

Il blockchain verrà sincronizzato completamente quando il blocco recentemente elaborato è l'altezza del blocco corrente. È possibile indicare la comparazione della data e dell'ora nel messaggio di registro oppure confrontare l'altezza dell'ultimo blocco trattato rispetto all'ultima altezza del blocco su [the official block explorer](https://mainnet.decred.org/).  

Tieni presente che questa connessione sarà utilizzata in futuro. Devi lasciare l'esecuzione di questa istanza `dcrd` per utilizzare `dcrwallet`.

---

Ora che hai impostato `dcrd`, visita la guida [dcrwallet Setup](/getting-started/user-guides/dcrwallet-setup.md) .
