# Dcrwallet Guida all'installazione

Ultimo aggiornamento per v1.0.0.

Questa guida intende aiutarti a impostare l'applicazione `dcrwallet` usando [startup flags](/getting-started/startup-basics.md#startup-command-flags). 

**Prerequisiti:**

- Utilizzare le ultime [dcrinstall](/getting-started/user-guides/cli-installation.md) per installare `dcrwallet`. Ulteriori passaggi saranno richiesti se è stato utilizzato un altro metodo di installazione.
- Review how the launch commands differ for the Command Prompt (Windows) and Bash (macOS/Linux) shells, and how the home directories differ [here](/getting-started/cli-differences.md).
- [Setup dcrd](/getting-started/user-guides/dcrd-setup.md) e l'esecuzione in background.

---

`dcrwallet` è il daemon che gestisce le funzionalità del portafoglio Decred per un singolo utente. Gestisce tutti i tuoi account, indirizzi e transazioni; Traccia i saldi tra gli indirizzi; E consente ai soggetti interessati di partecipare a votazioni Proof-of-Stake.

Per eseguire `dcrwallet`, deve esistere un `wallet.db` nella directory principale di `dcrwallet` . Per poter esistere questo file, è necessario creare un nuovo portafoglio. `dcrinstall` inizia automaticamente il processo di creazione. Se si elimina il wallet.db o utilizza un altro processo di installazione, è necessario eseguire il comando [manual wallet creation command](#manual-wallet-creation-command).

---

## Informazioni critiche 

Durante il processo di creazione del portafoglio, verrà assegnata una sequenza di 33 parole conosciuta come una frase di seed. Questa frase di seed è essenzialmente la chiave privata per il tuo portafoglio. Sarai in grado di utilizzare questa frase di seme per ripristinare le chiavi private, la cronologia delle transazioni ei saldi utilizzando un portafoglio Decred su qualsiasi computer.

Ciò significa in ultima analisi che *chiunque* che conosca il tuo seed possa utilizzarlo per ripristinare i tuoi chiavi privati, la cronologia delle transazioni e i saldi a un portafoglio Decred nel computer senza la tua conoscenza. Per questa ragione, è di massima importanza mantenere la tua frase di seed sicura. Trattare questo seme nello stesso modo in cui trattare una chiave fisica in una cassaforte. Se perdi la tua frase di seed, perderti permanentemente l'accesso al portafoglio e tutti i fondi in esso contenuti. Non può essere recuperato da nessuno, inclusi gli sviluppatori Decred. Si raccomanda di scrivere su carta e memorizzare in qualche luogo sicuro. Se decidi di tenerlo sul tuo computer, sarebbe meglio mantenerlo in un documento crittografato (non dimenticare la password) nel caso in cui il file o il computer venga rubato.

Ogni frase seed è associata anche ad un esagono di seed di 64 caratteri. Il seed hex funziona allo stesso modo della frase del seed - `dcrwallet` lo accetta quando si tenta di ripristinare il portafoglio. È inoltre importante mantenere sicuro il vostro seme.

**RICORDA: NON, IN UNA CIRCOSTANZA, DIVIRE LA VOSTRA SEDE O L'ASSOCIATO HEX CHIAVE DA QUALSIASI! NON ANCHE LE SVILUPPATORI!**

---

## Comando manuale di creazione del portafoglio

Se non si dispone già di un file `wallet.db` archiviato nella directory home di `dcrwallet` , è necessario eseguire il comando `dcrwallet --create` . I passi per questo possono essere trovati di seguito.

1. Aprire una nuova finestra di shell (Bash/prompt di comandi/etc, ..).
2. Passare alla directory del `dcrwallet` eseguibile.
3. Immettere il comando `dcrwallet --create` (esaminare i Prerequisiti di cui sopra se non siete sicuri se si dovrebbe utilizzare `./dcrwallet` o `dcrwallet.exe` per il comando precedente). 

---

## Passaggio di creazione di un portafoglio

Durante questo processo, impostare una passphrase privata, eventualmente impostare una frase pubblica e registrare il tuo seme. Per eseguire questa operazione, attenersi alla seguente procedura:

> Imposta le passphrase per il tuo portafoglio

Se il comando `dcrwallet --create` è stato eseguito correttamente, è necessario essere accolti dal seguente testo:

```no-highlight
Enter the private passphrase for your new wallet:
```

Questa prima passphrase, la passphrase privata, è quella che userai per sbloccare il tuo portafoglio quando crei transazioni o votati con Proof-of-Stake. Utilizza una password univoca e forte. Questa password protegge anche le chiavi private nel file del portafoglio, assicurandolo dal furto.

Dopo aver verificato la tua passphrase privata, dovrebbe essere visualizzato il seguente prompt:

```no-highlight
Do you want to add an additional layer of encryption for public data? (n/no/y/yes) [no]:
```

La passphrase pubblica è facoltativa. Viene utilizzato per crittografare tutti i dati pubblici (transazioni e indirizzi) all'interno del file del portafoglio, quindi se viene rubato, un avversario non può collegarti alle transazioni. 

> Registra il tuo seme

Prima di creare un nuovo seed per il tuo portafoglio, consulta la sezione [Critical Information section](/getting-started/user-guides/dcrwallet-setup.md#critical-information).

Dopo aver impostato la tua passphrase privata e la passphrase pubblica opzionale, verrà visualizzato il seguente prompt:

```no-highlight
Do you have an existing wallet seed you want to use? (n/no/y/yes) [no]:
```

Questa guida presuppone che non si dispone di un seed esistente, pertanto continuare premendo il tasto `Enter` che risponderà alla richiesta con il valore predefinito `[no]`. NOTA: Se si desidera ripristinare il portafoglio utilizzando il proprio seme, inserire semplicemente `[yes]` e seguire le istruzioni visualizzate.

<i class="fa fa-exclamation-triangle"></i> **NON UTILIZZARE LA SAME SEED IN MULTIPLE WALLETS! Visita [Wallets and Seeds FAQ](/faq/wallets-and-seeds.md#3-can-i-run-multiple-wallets) per vedere perché questo è importante. Si raccomanda che, se possibile, un nuovo portafoglio dovrebbe significare generare un nuovo seed.** 

Dopo aver risposto `[no]`,  nella finestra verrà visualizzata la frase di seed (seed di generazione del portafoglio) e il suo hex. Leggere attentamente la sezione IMPORTANTE visualizzata immediatamente dopo l'Hex.

Non è possibile sottolineare quanto sia importante salvare la tua frase di seme in una posizione protetta, quindi se non l'hai commesso nella memoria, consulta la sezione [Critical Information section](/getting-started/user-guides/dcrwallet-setup.md#critical-information) ancora una volta.

Una volta scritta la frase e il seed hex, digitare `OK` e premere `Enter`.  NOTA: se non hai scritto la frase prima di continuare, dovresti [start this process over](/getting-started/user-guides/dcrwallet-setup.md#create-a-new-wallet) after [deleting your wallet file](/advanced/deleting-your-wallet.md)

Dopo aver premuto `Enter`, ysi dovrebbe vedere il seguente messaggio:

```no-highlight
Creating the wallet...
The wallet has been created successfully.
```

Sarà quindi creato il portafoglio. Questo potrebbe richiedere alcuni minuti se si dispone di un computer lento.

---

## Avvio di dcrwallet

Per lanciare `dcrwallet`, devi prima avere creato [created your wallet](#wallet-creation-walkthrough) e
[connected dcrd to the Decred network](/getting-started/user-guides/dcrd-setup.md#connect-to-the-decred-network).

> Configurare il nome utente e la password RPC

Se hai utilizzato [`dcrinstall`](/getting-started/user-guides/cli-installation.md),  i file di configurazione sono già configurati con il nome utente / la password RPC per `dcrd`, `dcrwallet`, e `dcrctl`.

Se non si è utilizzato `dcrinstall`, è necessario abilitare le impostazioni minime nude nei file di configurazione. Seguire [this guide](/advanced/manual-cli-install.md#minimum-configuration) per farlo.

> Avviare dcrwallet

Con i file di configurazione correttamente impostati, apri un'altra finestra di shell nella directory Decred (o utilizza l'ultima finestra se hai appena creato il tuo portafoglio). Digitare il seguente comando (esamina i Prerequisiti di questa guida per determinare il comando giusto per l'applicazione OS/Shell):

```no-highlight
dcrwallet
```

Il `dcrwallet` ora si connette alla rete tramite `dcrd`. Comincerà a eseguire la scansione della rete per gli indirizzi attivi che possono richiedere alcuni minuti sui computer lenti. Alla fine comincerà a mostrare linee come:

```no-highlight
[INF] WLLT: Connecting block 0000000000002004ea8fa74af334cb291a22832642b5be603995683534bbb97b, height 9990
```

Ciò significa che il portafoglio è connesso con successo alla rete
Attraverso il tuo daemon.

---

Per imparare a utilizzare `dcrd` e  `dcrwallet`, visitare la guida [dcrctl Basics](/getting-started/user-guides/dcrctl-basics.md) . mparerai come sbloccare il tuo portafoglio, inviare e ricevere DCR utilizzando `dcrctl`, controllare il tuo equilibrio e controllare le diverse statistiche di rete.
