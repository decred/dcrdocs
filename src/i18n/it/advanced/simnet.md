# Simnet 

---

## Panoramica 

Quando si sviluppano applicazioni decredate o si verificano modifiche potenziali, è spesso estremamente utile avere una rete di test in cui i livelli di difficoltà siano abbastanza bassi per generare blocchi se necessario.

Per facilitare questi scenari, dcrd fornisce una rete di simulazione (`--simnet`).  Di seguito è una panoramica delle proprietà più importanti che la distinguono dalla rete principale:

* La difficoltà inizia estremamente bassa per consentire la rapida estrazione della CPU di blocchi
* Cambiamenti di rete:
    * All code related to peer discovery and IP address dissemination is disabled to help ensure the network remains private
    * Le porte di rete peer e RPC sono diverse
    * AUna sequenza di byte di rete comune viene usata nel protocollo di messaggi peer-to-peer in modo che i blocchi non possano essere attraversati accidentalmente con la rete principale
* Tutti i parametri di indirizzi di catena e pagamento sono unici per impedire confusione con la rete principale:
    * Blocco diverso di genesi
    * Gli indirizzi di pagamento iniziano con diversi prefissi:
        * Il pay-to-pubkeyhash standard (P2PKH) inizia con la maiuscola `S`
        * Lo standard pay-to-scripthash (P2SH) inizia con la minuscola `s`
    * Tasti estesi deterministici gerarchici esportati (BIP32) iniziano con diversi prefissi:
        * Tasti estesi pubblici iniziano con `spub`
        * Tasti estesi privati ​​iniziano con `sprv`
    * Il tipo di moneta BIP44 utilizzato nei percorsi chiave HD è minuscolo `s`

  ---

## Iniziare 

Eseguire un singolo nodo `dcrd` su simnet è semplicemente iniziando `dcrd` con la flag `--simnet` .  Tuttavia, per essere davvero utile, in genere desideri essere in grado di inviare monete tra gli indirizzi che implica che i blocchi dovranno essere estratti e che avrà bisogno di interfacciarsi con un portafoglio.

Inoltre, poiché non ci sono ancora monete ancora sulla nuova rete privata, sarà necessario estrarre una serie iniziale di blocchi che pagano a un indirizzo che possiedi in modo da poter utilizzare monete utilizzabili.

Come detto in precedenza, la simnet utilizza indirizzi univoci per evitare confusione con la rete principale. Pertanto, significa che è necessario utilizzare un portafoglio che supporti il ​​formato dell'indirizzo. Per questo, può essere utilizzato `dcrwallet` con la flag `--simnet` .

Il seguente è un riferimento di comando per andare avanti:

**NOTA: Tutti questi comandi possono essere semplificati creando i file di configurazione e utilizzandoli, comunque i comandi utilizzano tutti gli interruttori sulla riga di comando per mostrare esattamente ciò che è necessario per ciascuno.**

* Avviare dcrd su simnet:

    `$ dcrd --simnet --rpcuser=<username> --rpcpass=<password>`

* Creare un nuovo portafoglio di simnet:

    `$ dcrwallet --simnet --create`

* Avviare dcrwallet su simnet:

    `$ dcrwallet --simnet --username=<username> --password=<password>`

* Creare un nuovo indirizzo simnet Decred:

    `$ dcrctl --simnet --wallet --rpcuser=<username> --rpcpass=<password> getnewaddress`

* Arrestare il processo dcrd iniziale e riavviarlo con l'indirizzo di estrazione impostato sull'output dal comando precedente:

    `$ dcrd --simnet --rpcuser=<username> --rpcpass=<password> --miningaddr=<S....>`

* nstrui dcrd per generare abbastanza blocchi iniziali per la maturazione del primo coinbase:

    `$ dcrctl --simnet --rpcuser=<username> --rpcpass=<password> generate 100`

* Controllare l'equilibrio del portafoglio per assicurare che le monete siano disponibili:

    `$ dcrctl --simnet --wallet --rpcuser=<username> --rpcpass=<password> getbalance`
  
A questo punto, c'è una simnet privata completamente funzionale con monete disponibili per l'invio ad altri indirizzi simnet. Ogni volta che una o più transazioni vengono inviate, è necessario rilasciare un RPC "generare 1" per il mining di un nuovo blocco con le transazioni incluse.
