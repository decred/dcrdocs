# Uso della Testnet Guide

Ultimo aggiornamento per testnet2

---

## Perché utilizzare testnet?

Il testnet è un luogo meraviglioso dove si può sperimentare con le applicazioni Decred senza preoccuparsi che un errore vi costerà denaro reale. È in realtà consigliabile che la gente usi il testnet per apprendere le basi del software Decred e le nuove funzionalità.

Decred è attualmente sulla sua 2 Testnet, nota anche come testnet2. Le testnet vengono periodicamente resettate per contribuire a mantenere una dimensione del file blockchain gestibile. 

---

## Come eseguire un nodo testnet

L'esecuzione di un nodo testnet2 è incredibilmente facile. L'applicazione di scelta dovrà scaricare il blocco di testnet2 e sarà necessario creare un nuovo file di raccoglitori per l'utilizzo di testnet2. I file di blocco principale e portafogli mainnet rimarranno intatti. Il passaggio tra i due è incredibilmente facile.

---

## Paymetheus

Per lanciare `Paymetheus` su testnet2, lanciate semplicemente l'applicazione `Decred Testnet` invece della solita applicazione `Decred` . Sarai quindi attraversato la creazione del portafoglio (gli stessi passaggi della [Paymetheus Setup guide](/getting-started/user-guides/paymetheus.md)). Dopo che `dcrd` finisce di sincronizzazione in background, potrai riempire il portafoglio `Paymetheus` con DCR testnet e familiarizzarsi con il software.

---

## Decrediton 

Per lanciare `Decrediton` su testnet2, è necessario lanciare `Decrediton` dalla riga di comando con la bandiera `--testnet` . Tieni presente che usando la bandiera una volta lo farà sempre iniziare in quella modalità finché non si utilizza il flag `--mainnet` per tornare al blocco di rete mainnet.

Per Linux, 

1. Aprire il terminale e passare alla directory con l'eseguibile decrediton.
2. Emettere il comando `./decrediton --testnet`.
3. Decrediton lancerà e cercherà di connettersi a testnet2.

For macOS,

1. Aprire il terminale e emettere il seguente comando: `/Applications/decrediton.app/Contents/MacOS/decrediton --testnet`
2. Decred lancerà e cercherà di connettersi a testnet2.

Ricorda, se si desidera passare da Decred a mainnet, è necessario emettere questi comandi con il flag  `--mainnet` .

___ 

## Suite di riga di comando

Per lanciare `dcrd` e `dcrwallet` sulla testnet, basta aggiungere il flag `--testnet` al comando di lancio. In alternativa, puoi mettere `testnet=1` in tutti i file di configurazione, ma di solito è molto più veloce usare il flag di avvio.

Al primo avvio di `dcrd --testnet`, `dcrd` a scaricare il blockchain testnet2 nella cartella `data/testnet2` della directory home di `dcrd` .

Prima di poter lanciare `dcrwallet` con la bandiera `--testnet` è necessario creare un portafoglio separato testnet utilizzando il comando `dcrwallet --testnet --create` . I passaggi sono identici a quelli trovati nella [dcrwallet Setup Guide](/getting-started/user-guides/dcrwallet-setup.md). 

Per inviare comandi sia a `dcrwallet` che a `dcrd`, è necessario aggiungere la bandiera `--testnet` a uno qualsiasi dei comandi `dcrctl` che si utilizza. Per esempio. Si esegue il comando `dcrctl --testnet --wallet getbalance` per controllare il saldo del testnet. 

---

## Acquisizione di monete Testnet

È possibile acquistare monete attraverso la risorsa [Decred Testnet Faucet](https://faucet.decred.org). Si prega di restituire le monete all'indirizzo indicato in fondo a quella pagina quando hai finito di giocare con il testnet.

---

