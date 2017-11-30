# Elementi di avvio

Questa guida è stata aggiornata l'ultima volta per v1.0.0

---

Questa guida si applica agli utenti delle applicazioni di riga di comando. Gli utenti Paymetheus e Decrediton possono ignorare in modo sicuro l'utilizzo dei file di configurazione - Paymetheus e Decrediton gestiscono automaticamente la configurazione di base. Vale anche la pena di notare che alcune delle nostre guide mostrano le impostazioni del file di configurazione e altre guide mostrano i flag di avvio di avvio.

---

## Locazioni dei file di configurazione

Tutto il software Decred, quando è stato avviato, legge da un file di configurazione per determinare quali impostazioni dovrebbero abilitare / disabilitare / impostare durante quel carico iniziale. Tutti i flag di avvio della riga di comando `(e.g. dcrwallet --testnet)` possono essere sostituiti da impostazioni all'interno del file di configurazione appropriato `(e.g. dcrwallet --testnet could be replaced by testnet=1 in dcrwallet.conf)`.

These configuration files are located within the application home directory of the application. The location of these default home directories for Windows, macOS, and Linux are listed below:

Windows:

    C:\Users\<username>\AppData\Local\Dcrwallet\
    C:\Users\<username>\AppData\Local\Dcrd\
    C:\Users\<username>\AppData\Local\Dcrctl\ 
    C:\Users\<username>\AppData\Local\Decred\Paymetheus

macOS: 

    ~/Library/Application Support/Dcrwallet/
    ~/Library/Application Support/Dcrd/
    ~/Library/Application Support/Dcrctl/
    ~/Library/Application Support/decrediton/
    
Linux: 
    
    ~/.dcrwallet/
    ~/.dcrd/
    ~/.dcrctl/
    ~/.config/decrediton

Ciascuna di queste cartelle ha il proprio file `.conf` , denominato dopo l'applicazione individuale (`e.g. dcrd uses dcrd.conf`). Si prega inoltre di notare che le directory home `Dcrd` e `Dcrwallet` vengono create automaticamente ogni volta che viene avviata ogni applicazione. Dovresti creare manualmente una home directory `Dcrctl` per utilizzare un file di configurazione.

Il metodo di installazione di [dcrinstall](/getting-started/user-guides/cli-installation.md) crea automaticamente i file di configurazione, con le [minimum configuration settings](/advanced/manual-cli-install.md#minimum-configuration) Già abilitato. 

Il metodo [Manual Installation](/advanced/manual-cli-install.md#installation) include i file di configurazione di esempio all'interno del file .zip/.tar.gz. Si consiglia di copiare questi file di configurazione nella directory appropriata sopra descritta e rinominarli per rimuovere il 'sample-'. Questi file hanno molte osservazioni commentate (i commenti non vengono letti dal programma durante il runtime) in modo che tutte queste impostazioni siano effettivamente disattivate. È possibile abilitare queste impostazioni pre-scritte semplicemente eliminando il semicolon prima della linea.

---

## Flag di Comando di Avvio

La maggior parte delle impostazioni che è possibile impostare tramite il file di configurazione può anche essere passata all'applicazione come parametri durante il lancio. Ad esempio, i seguenti comandi specifici per l'utente avrebbero aperto `dcrd` per l'utilizzo di Testnet, un'alternativa all'utilizzo di `testnet=1` nel file di configurazione:

    Windows: dcrd.exe --testnet
    macOS: ./dcrd --testnet
    Linux: ./dcrd --testnet

L'esempio precedente esamina innanzitutto il file di configurazione `dcrd` per le impostazioni e quindi cerca il comando eseguibile per attivare l'impostazione testnet.

---

## Utilizzo avanzato

[Storing Login Details in Config Files](/advanced/storing-login-details.md) <!-- Ci sono le stesse informazioni riportate nella sezione Configurazione minima. Potrebbe probabilmente eliminare. -->

[Full List of Options for Each Application](/advanced/program-options.md)
