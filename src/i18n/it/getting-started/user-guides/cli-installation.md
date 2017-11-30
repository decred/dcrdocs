# CLI Guida all'installazione  

Questa pagina è stata aggiornata l'ultima volta per v1.0.1.

---

## dcrinstall 

`dcrinstall` è il metodo consigliato per installare gli strumenti di interfaccia della riga di comando Decred, `dcrd`, `dcrwallet`, e `dcrctl`.

`dcrinstall` is an automatic installer and upgrader for the Decred software. The newest release can be found here: [https://github.com/decred/decred-release/releases/tag/v1.1.0](https://github.com/decred/decred-release/releases/tag/v1.1.0). Binaries are provided for Windows, macOS, Linux, OpenBSD, and FreeBSD. Executing installer will install `dcrd`, `dcrwallet`, and `dcrctl`. Instructions are provided for macOS, Linux, and Windows below (assumed proficiency for *BSD users).

`dcrinstall` scaricherà automaticamente il pacchetto binario precompilato e firmato trovato su GitHub, verificare la firma di questo pacchetto, copiare i binari all'interno del pacchetto in una specifica cartella dipendente dal sistema operativo, creare file di configurazione con le impostazioni per consentire alle 3 applicazioni di comunicare con L'un l'altro, e l'esecuzione attraverso il processo di creazione del portafoglio. Dopo l'esecuzione di `dcrinstall`, sarà possibile lanciare il software senza ulteriori configurazioni.

> macOS:

1. Scarica il file corretto:

    For 32-bit computers, download the `dcrinstall-darwin-386-v1.1.0` file. <br />
    For 64-bit computers, download the `dcrinstall-darwin-amd64-v1.1.0` file.

2. Creare dcrinstall-darwin-xxxx-vx.x.x un eseguibile all'interno del terminale e eseguirlo:

     Passare alla directory in cui è stato scaricato il file dcrinstall usando il comando `cd` , eseguire chmod con modalità u+x nel file dcrinstall e eseguire l'eseguibile creato. Di seguito è riportato un esempio dei comandi (cambia directory o nome file a seconda delle necessità):
    
    `cd ~/Downloads/` <br />
    `chmod u+x dcrinstall-darwin-amd64-v1.1.0` <br />
    `./dcrinstall-darwin-amd64-v1.1.0`
    
3. I binari eseguibili per `dcrd`, `dcrwallet`, e `dcrctl` possono essere trovati nella directory `~/decred/` . Prima che il processo `dcrinstall` sia completato, verrà richiamato al prompt di creazione del portafoglio. Seguire i passaggi contenuti nella guida di installazione di [Wallet Creation Walkthrough](/getting-started/user-guides/dcrwallet-setup.md#wallet-creation-walkthrough) della Guida di installazione di dcrwallet.

> Linux:

1. Scarica il file corretto:

    For 32-bit computers, download the `dcrinstall-linux-386-v1.1.0` file. <br />
    For 64-bit computers, download the `dcrinstall-linux-amd64-v1.1.0` file. <br />
    For 32-bit ARM computers, download the `dcrinstall-linux-arm-v1.1.0` file. <br />
    For 64-bit ARM computers, download the `dcrinstall-linux-arm64-v1.1.0` file.

2. Eseguire dcrinstall-linux-xxxx-vx.x.x un eseguibile all'interno del terminale e eseguirlo:

   Passare alla directory in cui è stato scaricato il file dcrinstall usando il comando `cd` , eseguire chmod con modalità u+x nel file dcrinstall e eseguire l'eseguibile creato. Di seguito è riportato un esempio dei comandi (cambia directory o nome file a seconda delle necessità):
    
    `cd ~/Downloads/` <br />
    `chmod u+x dcrinstall-linux-amd64-v1.1.0` <br />
    `./dcrinstall-linux-amd64-v1.1.0`
    
3. I binari per `dcrd`, `dcrwallet`, e `dcrctl` possono essere trovati nella directory `~/decred/` . Prima che il processo `dcrinstall` sia completato, verrà richiamato al prompt di creazione del portafoglio. Seguire i passaggi contenuti nella guida di installazione di [Wallet Creation Walkthrough](/getting-started/user-guides/dcrwallet-setup.md#wallet-creation-walkthrough) della Guida di installazione di dcrwallet.

> Windows:

1. Scarica il file corretto:

    For 32-bit computers, download the `dcrinstall-windows-386-v1.1.0.exe` file. <br />
    For 64-bit computers, download the `dcrinstall-windows-amd64-v1.1.0.exe` file. <br />

2.  Eseguire il file eseguibile dcrinstall.

    È possibile fare doppio clic su di esso oppure eseguirlo dal prompt dei comandi. 
    
3. I binari per `dcrd`, `dcrwallet`, e `dcrctl` possono essere trovati nella directory `%HOMEPATH%\decred\`  (solitamente %HOMEPATH% è `C:\Users\<username>`). Prima che il processo `dcrinstall` sia completato, verrà richiamato al prompt di creazione del portafoglio. Seguire i passaggi contenuti nella guida di installazione di [Wallet Creation Walkthrough](/getting-started/user-guides/dcrwallet-setup.md#wallet-creation-walkthrough) della Guida di installazione di dcrwallet.
