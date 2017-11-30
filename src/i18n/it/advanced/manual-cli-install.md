# Installazione manuale CLI 

---

The newest Binary Releases can be found here: [https://github.com/decred/decred-binaries/releases](https://github.com/decred/decred-binaries/releases). With the exception of the `.msi` and `.dmg` files, they are archives of the latest executable binaries for each release. Although most of this will be unzip and go, instructions are provided for macOS, Linux, and Windows below (assumed proficiency for *BSD users).

> macOS

1. Scarica il file corretto:

    For 32-bit computers, download the `decred-darwin-386-v1.1.0.tar.gz` file. <br />
    For 64-bit computers, download the `decred-darwin-amd64-v1.1.0.tar.gz` file.

2. Navigare per scaricare la posizione e estrarre il file .tar.gz:

    Finder: basta fare doppio clic sul file .tar.gz. <br />
    Terminale: utilizzare il comando `tar -xvzf filename.tar.gz` . 

    **NOTA**: Se si utilizza Safari su macOS Sierra e si dispone dei file "aperti" sicuri dopo il download, la preferenza è abilitata, i file .gz e .zip vengono automaticamente non compressi dopo il download. Il comando `tar -xvzf filename.tar.gz` risulta in questo errore: `tar: Errore durante l'apertura dell'archivio: Impossibile aprire il file 'filename.tar.gz'`. Usare invece `tar -xvzf filename.tar` (rimuovere il .gz dal comando precedente).
    
    Both of these should extract the tar into a folder that shares the same name. (`e.g. tar -xvzf decred-darwin-amd64-v1.1.0.tar.gz` should extract to `decred-darwin-amd64-v1.1.0`). It should include `dcrctl`, `dcrd`, `dcrwallet`, `sample-dcrctl.conf`, `sample-dcrd.conf`, and `sample-dcrwallet.conf`.


> Linux

1. Scarica il file corretto:

    For 32-bit computers, download the `decred-linux-386-v1.1.0.tar.gz` file. <br />
    For 64-bit computers, download the `decred-darwin-amd64-v1.1.0.tar.gz` file. <br />
    For 32-bit ARM computers, download the `decred-linux-arm-v1.1.0.tar.gz` file. <br />
    For 64-bit ARM computers, download the `decred-linux-arm64-v1.1.0.tar.gz` file.

2. Navigare per scaricare la posizione e estrarre il file .tar.gz:

    Ubuntu File Browser: basta cliccare con il tasto destro del mouse su .tar.gz e selezionare "Extract Here". <br />
    Terminale: utilizzare il comando `tar -xvzf filename.tar.gz` . 
    
    Both of these should extract the tar.gz into a folder that shares the same name. (`e.g. tar -xvzf decred-darwin-amd64-v1.1.0.tar.gz` should extract to `decred-darwin-amd64-v1.1.0`). It should include `dcrctl`, `dcrd`, `dcrwallet`, `sample-dcrctl.conf`, `sample-dcrd.conf`, and `sample-dcrwallet.conf`.

> Windows

Nota: Windows 7/8/10 fornisce per default il supporto per i file `.zip` , quindi è preferibile utilizzare il file `.zip` in modo che le applicazioni di terze parti non siano richieste per il file `.tar.gz` . Sono fornite istruzioni per il file `.zip` .

1. Scarica il file corretto:

    For 32-bit computers, download the `decred-windows-386-v1.1.0.zip` file. <br />
    For 64-bit computers, download the `decred-windows-amd64-v1.1.0.zip` file.

2. Navigare per scaricare la posizione e deselezionare il file `.zip` :

    File Explorer: fare clic con il pulsante destro del mouse sul file zip, selezionare "Extract All .." e aprire un prompt per chiedere la directory da utilizzare. Il valore predefinito estrae `.zip` in una cartella con lo stesso nome. Dovrebbe includere `dcrctl`, `dcrd`, `dcrwallet`, `sample-dcrctl.conf`, `sample-dcrd.conf`, e `sample-dcrwallet.conf`.

Se si decide di scaricare il file `.tar.gz`, richiede due estrazioni separate in alcune applicazioni di terze parti (7-zip, winRAR, ecc.) per arrivare ai binari reali.

---

## Configurazione minima

Come  minimo, `dcrd`, `dcrwallet`, e `dcrctl` per essere in grado di comunicare tra di loro, devono essere avviati con la stessa combinazione rpcuser/rpcpass. Per la configurazione manuale, attenersi alla seguente procedura:

1. Se le directory home dipendenti dal sistema operativo elencate nella sezione [configuration files](#configuration-file-locations) non esistono, crearle per `dcrd`, `dcrwallet`, e `dcrctl`.
2. Using your favourite text editor, create a new file enter the text, `[Application Options]` as the first line. Save it as `dcrd.conf` in `dcrd`'s home directory.
3. Create another new file and add the text `[Application Options]` to the first line as before. Save it as `dcrwallet.conf` in `dcrwallet`'s home directory.
4. Create a third text file and save it as `dcrctl.conf` in `dcrctl`'s home directory. You don't need to add anything to this one right now.
5. Scegliere un nome utente e una password arbitrari, questi saranno utilizzati solo per ogni applicazione per comunicare tramite chiamata di procedura remota. La configurazione più semplice è impostarli tutti uguali.
6. All'interno di `dcrd.conf`, sotto `[Application Options]`, aggiungere le seguenti righe:<br /><br />
        `rpcuser=<chosen-username>`<br />
        `rpcpass=<chosen-password>`<br /><br />
7. All'interno di `dcrwallet.conf`, sotto `[Application Options]`, aggiungere le seguenti righe:<br /><br />
        `username=<chosen-username>`<br />
        `password=<chosen-password>`<br /><br />
8. All'interno di `dcrctl.conf`, aggiungere le seguenti righe:<br /><br />
        `rpcuser=<chosen-username>`<br />
        `rpcpass=<chosen-password>`<br /><br />
9. Salvare tutti e tre i file di configurazione.

Please see the [sample config](https://github.com/decred/dcrd/blob/master/sampleconfig/sampleconfig.go#L8-L352) for more customisation options.