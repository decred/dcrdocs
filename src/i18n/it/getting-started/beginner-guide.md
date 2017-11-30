# Guida per principianti 

Ultimo aggiornamento per v1.0.1

---

## Benvenuti in Decred 

Benvenuti in Decred! Siamo molto contenti di averti . Come sai o forse no, Decred è diverso. Ci sono molte cose nuove da imparare a comprendere appieno circa  come funzionano le cose. Questa documentazione cercherà di rendere le cose più semplici da capire.

Questa guida per i principianti è un percorso per ottenere il software Decred in esecuzione. È possibile scegliere tra più client per ottenere un nodo sulla rete e Decred nel portafoglio. In particolare, imparerai come installare, configurare e utilizzare le applicazioni Decred; Come ottenere DCR; Come votare tramite Proof-of-Stake; E come utilizzare l'explorer di blocco.

Dovrai seguire una [Installation Guide](#installation-guides), quindi seguire il percorso dell'applicazione che hai scelto di seguito. Dopo aver impostato l'applicazione, passare attraverso le [General Guides](#general-guides) in fondo a questa pagina. Se avete delle domande lungo il percorso, unisciti a noi nel nostro [Slack](/support-directory.md#join-us-on-slack).

**NOTA: l'utilizzo di Testnet è altamente raccomandato per imparare a utilizzare il software Decred senza la paura di commettere errori e perdere soldi reali. Dopo aver seguito le guide per impostare la scelta del software, visitare il manuale [Using Testnet guide](/getting-started/using-testnet.md) per imparare a lanciare l'applicazione sul testnet di Decred.**

---

## Applicazioni 

Di seguito troverai un elenco delle applicazioni attualmente disponibili, con un grafico che mostra la loro compatibilità con diversi sistemi operativi.

**Paymetheus**: The only Windows GUI client as of v1.1.0. <br />
**dcrd**: The node daemon, this command-line application handles block management and consensus. <br />
**dcrwallet**: The wallet daemon, this command-line application handles address and transaction management. <br />
**dcrctl**: The remote procedure call (RPC) client, this command-line application is used to control dcrd and dcrwallet via RPC commands. <br />
**Decrediton**: Cross-platform GUI client as of v1.1.0.

|           | Paymetheus | dcrd | dcrwallet | dcrctl | Decrediton |
| ---------:|:----------:|:----:|:---------:|:------:|:-----------:|
| Windows   | X          | X    | X         | X      |             |
| macOS     |            | X    | X         | X      | X           |
| Linux     |            | X    | X         | X      | X           |
| Other UNIX|            | X    | X         | X      |             |

"Altre UNIX" include attualmente vari *BSDs e Solaris/illumos.

Nota: Potresti notare presto una delle tante differenze tra Decred e altri
Cripptocurrencies popolari: il daemon del portafoglio e il daemon del nodo sono separati.
Molte altre monete eseguono insieme queste funzioni in un unico daemon.
Per coloro che scelgono di utilizzare le interfacce di riga di comando, questo significa che devi
Eseguire `dcrd` per la funzionalità completa del nodo e `dcrwallet` per memorizzare il DCR,
Creare transazioni e partecipare a estrazione/votazione Proof-of-Stake.

---

## Guide di installazione 

Per iniziare, scegli un'opzione per le installazioni disponibili per il sistema operativo di seguito:

* [Paymetheus](/getting-started/user-guides/paymetheus.md)
* [Command Line Suite **via dcrinstall**](/getting-started/user-guides/cli-installation.md) - NOTE: The `dcrinstall` method is the fastest and easiest way to get a command-line node and wallet running. It is recommended and the command-line path setup guides below will assume you've used this method.
* [Decrediton (ALPHA)](/getting-started/user-guides/decrediton-setup.md)

---

**NOTA:** Nel menu di navigazione con gli stessi nomi si possono trovare tutte le guide seguenti.

## Percorso Paymetheus 

Le seguenti guide, in ordine, ti faranno iniziare con Paymetheus:

* [Paymetheus Setup](/getting-started/user-guides/paymetheus.md)
* [Using Paymetheus](/getting-started/user-guides/using-paymetheus.md)

## Decrediton Path 

La guida seguente ti aiuterà a caricare Decred:

* [Decrediton Setup](/getting-started/user-guides/decrediton-setup.md)

## Percorso della riga di comando 

Le seguenti guide, in ordine, inizieranno con le applicazioni della riga di comando (`dcrd`, `dcrwallet`, `dcrctl`):

* [Command-Line Differences](/getting-started/cli-differences.md)
* [Startup Option Basics](/getting-started/startup-basics.md)
* [dcrd Setup](/getting-started/user-guides/dcrd-setup.md)
* [dcrwallet Setup](/getting-started/user-guides/dcrwallet-setup.md)
* [dcrctl Basic Usage](/getting-started/user-guides/dcrctl-basics.md)

## Guide generali 

Le seguenti guide sono indipendenti dalle diverse applicazioni:

* [Using Testnet](/getting-started/using-testnet.md)
* [Obtaining DCR](/getting-started/obtaining-dcr.md)
* [Using the Block Explorer](/getting-started/using-the-block-explorer.md)
* [Proof-of-Stake Guide](/mining/proof-of-stake.md)
* [Mainnet Voting Guide](/getting-started/user-guides/agenda-voting.md)
