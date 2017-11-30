# <i class="fa fa-desktop"></i> Configurazione 

---

#### 1. Come posso vedere informazioni sulle uscite `dcrd` dei numeri di porta? 

È possibile ottenere i numeri di porta[^8929] dai parametri `-h` o `--help` passati a `dcrd`:

```no-highlight
dcrd -h
```

Cerca la seguente riga:

```no-highlight
--rpclisten=  Add an interface/port to listen for RPC connections (default port: 9109, testnet: 19109)
```

Viene anche registrato quando si avvia il `dcrd`:

```no-highlight
12:01:46 2016-02-08 [INF] RPCS: RPC server listening on [::1]:9109
12:01:46 2016-02-08 [INF] RPCS: RPC server listening on 127.0.0.1:9109
```

---

#### 2. Cosa si intende per file di configurazione per `dcrd`,` dcrwallet` e `dcrctl`? 

Ogni applicazione (`dcrd`, `dcrwallet`, `dcrctl`) può avere i propri file di configurazione[^9055]. Utilizza `-h` e guarda il percorso tra parentesi dell'opzione file di configurazione (`-C`, `--configfile`) per vedere il percorso predefinito. Crea un file di testo nel percorso e chiamalo in base a quel percorso che hai appena cercato.

Quindi puoi utilizzare il file `dcrd` [sample config file](https://github.com/decred/dcrd/blob/master/sample-dcrd.conf) e `dcrwallet` [sample config file](https://github.com/decred/dcrwallet/blob/master/sample-dcrwallet.conf) per impostare le opzioni desiderate. È possibile fare la stessa cosa anche per `dcrctl` . Il formato è lo stesso. Ogni opzione di riga di comando elencata da `-h` può essere specificata nei file di configurazione (basta usare il nome dell'opzione a lungo).

Una volta creati e messi in atto, non è necessario aggiungere tutte le opzioni alla riga di comando per tutto il tempo. Ad esempio, è possibile eseguire `dcrctl` senza passare in alcun parametro sulla riga di comando:

```no-highlight
dcrctl getnetworkhashps
2547036949350
```

---

#### 3. Posso eseguire i daemns e i portafogli mainnet e testnet contemporaneamente e sulla stessa macchina? 

Sì[^9264], basta aggiungere `--testnet` ai punti appropriati (`dcrd`, `dcrwallet`, `dcrctl`) e tutto funzionerà. Ecco perché utilizzano diverse porte e directory di dati/registri!

---

#### 4. Quali sono le implicazioni sulla sicurezza nell' utilizzare le stesse password di autenticazione del server RPC con `dcrd` e` dcrwallet`? 

Si può fare molto meno   con l'accesso a `dcrd` rispetto  all'accesso a `dcrwallet`. Importante, l'accesso RPC[^11480] a `dcrwallet`, quando il portafoglio è sbloccato, può essere utilizzato per spendere monete.

Quando `dcrd` e `dcrwallet` sono entrambi sulla stessa macchina, probabilmente non importa tanto, ma quando si eseguono configurazioni più sicure in cui il portafoglio si trova su una macchina separata di `dcrd`, si dovrebbe abbastanza chiaramente non voler utilizzare le stesse credenziali per entrambi. Ricorda che `dcrd` deve trovarsi su una macchina connessa  a Internet per restare sincronizzata con la rete (scaricare i dati della catena di blocchi, le transazioni di trasmissione e così via).

D'altra parte, il `dcrwallet` che contiene i vostri fondi, per la migliore sicurezza, non dovrebbe effettivamente  essere su un sistema che ha accesso a Internet in quanto è molto più difficile per qualcuno rubare le vostre monete se il portafoglio che li contiene non è nemmeno su una macchina accessibile via Internet. Ovviamente, se si sta stazionando le tue monete, avrà bisogno almeno di un'istanza `dcrwallet` rivolta verso Internet. Quindi, la configurazione più sicura prevede l'avere un'istanza "fredda" `dcrwallet` che si trova su una macchina non accessibile a Internet e una seconda istanza "hot" `dcrwallet` (usando un seed diverso di corso) con cui i delegati di istanza dcrwallet votano direttamente tramite il parametro `--ticketaddress` entrambi che utilizzano credenziali diverse.

---

#### 5. Perché sono collegato a solo 8 peers in uscita? 

C'è un limite intenzionale non configurabile di 8 peers in uscita[^15399].  Più peers in uscita che non ti aiutano in alcun modo e sono in realtà peggiori per voi e per la rete. Questo è stato testato in modo estremamente accurato in Bitcoin, tra cui btcsuite (il progetto a monte per Decred). Tutto ciò che fai facendo aumentare le tue connessioni in uscita è sprecare oggetti preziosi delle relativamente pochi colleghi pubblici che ci sono (c'é sempre un numero molto maggiore di "leechers" rispetto a quello dei "seeders").

D'altra parte, aumentando le connessioni massime, che aumenta realmente  solo il numero di connessioni in entrata consentite, aiuta la rete assicurando che ci sono più slot disponibili per nuovi nodi e client SPV.

---

## <i class="fa fa-book"></i> Sorgenti 

[^8929]: Decred Forum, [Post 8,929](https://forum.decred.org/threads/600/#post-8929)
[^9055]: Decred Forum, [Post 9,062](https://forum.decred.org/threads/472/page-12#post-9062)
[^9264]: Decred Forum, [Post 9,264](https://forum.decred.org/threads/626/#post-9264)
[^11480]: Decred Forum, [Post 11,480](https://forum.decred.org/threads/428/#post-11480)
[^15399]: Decred Forum, [Post 15,399](https://forum.decred.org/threads/1371/page-2#post-15399)
