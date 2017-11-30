# Differenze di riga di comando nei sistemi operativi 

Questa pagina è stata aggiornata per v1.0.0.

---

The purpose of this page is to explain the key differences for running the cross-platform command-line applications on Windows, Linux, and macOS.

---

> Comandi di avvio

La prima grande differenza nelle applicazioni della riga di comando (`dcrd`,`dcrwallet`,`dcrctl`) è come lanciarle dalla riga di comando. Questo non è tanto di un sistema operativo quanto è una differenza nelle conchiglie. Windows viene fornito con prompt dei comandi e PowerShell installato. MacOS utilizza Bash nell'applicazione Terminal e molte distribuzioni Linux utilizzano anche Bash. Di seguito sono riportati esempi dei comandi di run di base per Bash e prompt dei comandi.

**Prompt dei comandi:** `dcrd.exe`, `dcrwallet.exe`, `dcrctl.exe` <br />
**Bash:** `./dcrd`, `./dcrwallet`, `./dcrctl`

Alcune delle nostre guide potrebbero essere OS-agnostiche con i comandi di lancio. Se una guida dice di eseguire `dcrctl --wallet getbalance`, si riferisce all'utilizzo di `dcrctl.exe --wallet getbalance` per il prompt dei e `./dcrctl --wallet getbalance` per Bash.

> Sedi directory directory applicazioni

Altrimenti i client di riga di comando differiscono è la posizione di ogni directory delle applicazioni (blocchi, portafogli, file di configurazione sono tutti memorizzati nella directory dei dati). Di seguito è riportata una tabella delle directory di applicazioni predefinite per ciascuna applicazione. 

| OS      | dcrd, dcrwallet, dcrctl App Directories      | 
| -------:|:--------------------------------------------- |
| Windows | `C:\Users\<your-username>\AppData\Local\dcrd\`      |
|         | `C:\Users\<your-username>\AppData\Local\dcrwallet\` | 
|         | `C:\Users\<your-username>\AppData\Local\dcrctl\`    |
| macOS   | `~/Library/Application Support/dcrd/`         |
|         | `~/Library/Application Support/dcrwallet/`    |
|         | `~/Library/Application Support/dcrctl/`       |
| Linux   | `~/.dcrd/`                                    |
|         | `~/.dcrwallet/`                               |
|         | `~/.dcrctl/`                                  |

