# <i class="fa fa-cubes"></i> Utilizzo  blocco Explorer 

---

## <i class="fa fa-info-circle"></i> Panoramica 

Un esploratore di blocchi basato su
[Insight](https://github.com/bitpay/insight-ui) è fornito per il
Rete decred. Tutti i blocchi e le transazioni nel bloccato Decred
Sono visibili tramite l'utilizzo di questo esploratore di blocchi, situato a
[`https://mainnet.decred.org`](https://mainnet.decred.org) e
[`https://testnet.decred.org`](https://testnet.decred.org) per il
Portafoglio testnet. Di seguito è riportata una rapida revisione di alcune informazioni
esso.

Opzione         | Spiegazione
---            | ---
`Height`       | Il numero di blocco.
`Age`          | Quanto tempo il blocco è stato aggiunto al blockchain.
`Transactions` | Il numero di transazioni incluse nel blocco.
`Votes`        | Il numero di voti di prova della quota inclusi nel blocco.
`Fresh Stake`  | Il numero di nuovi biglietti acquistati in questo blocco.
`Size`         | La dimensione (in byte) del blocco.

Sotto `Latest Transactions`, è possibile visualizzare l'ID transazione (txid) e
Il valore (in DCR) trasmesso in rete.

---

## <i class="fa fa-cube"></i> blocchi

I blocchi possono essere trovati cercando il loro numero di altezza blocco,
Facendo clic su un valore `Height` dalla home page o dal loro
`BlockHash` Valore. I blocchi più vecchi avranno numeri di blocco inferiori. La cima
Metà di una panoramica a blocchi mostra informazioni pertinenti su questo
Blocco specifico. Queste informazioni includono: l'altezza del blocco, il blocco
Hash e diversi parametri di rete chiave descritti di seguito:

Opzione                   | Spiegazione
---                      | ---
`Number of Transactions` | Il numero di transazioni standard (DCR inviato da un utente all'altro).
`Height`                 | L'altezza del blockchain in cui questo blocco risiede.
`Block Reward`           | La quantità di nuovi DCR presente in questo blocco.
`Timestamp`              | Il tempo che questo blocco è stato creato da un minatore ed è stato incluso nel blockchain.
`Merkle Root`            | Un valore hash di tutti gli hash di transazioni inclusi in questo blocco.
`Stake Root`             | Un valore di hash di tutti gli hash di transazione correlati a stake in questo blocco. Ciò include gli acquisti di biglietto, i voti e le revocazioni dei biglietti.
`VoteBits`               | (1) Il blocco è stato approvato dagli elettori di prova. (2) Il blocco è stato veto da parte di elettori di prova e di tutte le transazioni non in blocco nel blocco sono state invalidate, insieme al minatore di prova e di sussidi allo sviluppo.
`Final State`            | Lo stato finale del generatore pseudo randomizzato utilizzato per la selezione dei biglietti.
`Voters`                 | Il numero di voti ottenuti con successo in questo blocco. Il valore massimo è 5.
`Fresh Stake`            | Il numero degli acquisti di biglietti di palo confermato in questo blocco.
`Revocations`            | Il numero di biglietti che non hanno votato e sono stati revocati.
`PoolSize`               | Il numero totale di biglietti attivi di prova.
`Difficulty`             | La difficoltà di rete di prova.
`SBits`                  | Il prezzo di un biglietto di prova.
`Bits`                   | Una versione compatta della difficoltà di rete nel momento in cui il blocco è stato estratto.
`Size`                   | La dimensione del blocco (in byte).
`Version`                | La versione del blocco.
`Nonce`                  | Il valore utilizzato da un minatore per trovare la soluzione corretta per questo blocco.

## <i class="fa fa-exchange"></i> Transazioni 

Questa sezione elenca tutte le operazioni che sono state estratte in questo
bloccare. Le transazioni vengono scelte dal membro della rete in ordine di prima tariffa più alta. Tutte le transazioni nella panoramica dei blocchi seguono questa operazione
Ordine: transazioni standard (trasferimento peer-to-peer), prova della posta
Voti, acquisti di biglietteria di prova. Le sezioni seguenti vedranno rivedere ogni tipo di transazione.

---

### Transazioni standard

Ecco le informazioni incluse nelle transazioni standard Decred.

Opzione              | Spiegazione
---                 | ---
`Size`              | La dimensione della transazione in byte.
`Fee rate`          | Il tasso delle commissioni raccolte dalla rete (per kB).
`Received Time`     | Il tempo in cui la rete ha confermato la transazione.
`Mined Time`        | Il tempo in cui un minatore ha incluso la transazione in un blocco.
`Included in Block` | Il numero di blocco che la transazione è entrata a far parte.

Nota `Received Time`, `Mined Time`, e `Included in Block` non avrà un valore fino a che un minatore non convalida la transazione e lo inserisce in un blocco Decredito. Dopo essere stato confermato in un blocco, la transazione è considerata completa.


---

### Acquisto di biglietti

Per l'acquisto di un biglietto (presentazione di una puntata) ci sono alcune differenze con una transazione standard mostrata.

Si noti la differenza nei dettagli: La parola «Ticket» appare sopra l'indirizzo del portafoglio del mittente a sinistra, e le parole
 `Subsidy
appaiono sulla destra. Questo utente ha acquistato un il biglietto di stake per 8.75411638 DCR e ha ricevuto la modifica dell'importo di 7.15994209 DCR. L'indirizzo elencato sulla sinistra sotto
 `Ticket` è l'indirizzo che contiene i fondi utilizzati per acquistare questo
biglietto. La prima uscita a destra è l'indirizzo che mantiene
Diritti di voto per questo biglietto specifico. La seconda uscita, "Sovvenzione"
Impegno ", è l'indirizzo in cui riceverà la ricompensa. Questo non è ancora mostrato dall'esploratore di blocchi in questo momento. La terza ed ultima uscita é l'indirizzo in cui verrà inviata la modifica per questa transazione.

---

### Votazioni di prova

Notare i termini identificativi nella sezione dettagli: `Vote`, `Stake
Base`, `Block Commitment`, e `Vote Bits`:

Queste parole chiave indicano che questa transazione è un voto espresso da un titolare del biglietto di prova. In questo esempio particolare, l'utente aveva già acquistato un biglietto per 8.99472311 DCR ed ha inviato 10,82959184 DCR dopo che il voto è stato lanciato in questa transazione.
