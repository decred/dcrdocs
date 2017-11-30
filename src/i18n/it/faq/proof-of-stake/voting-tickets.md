# Biglietti di votazione 

---

#### 1. Quando è iniziata la votazione per la votazione dei titoli? 

Il voto di voto di voto è iniziato[^7969] al blocco 4.096.

---

#### 2. Nel codice sorgente TicketPoolSize è impostato su 8.192, ma la dimensione corrente del biglietto corrente è maggiore di quella. Perché? 

È intenzionale ed è parte integrante del dinamico aggiustamento dei prezzi dei biglietti[^8965]. È intenzionale ed è parte integrante del dinamico aggiustamento dei prezzi dei biglietti `TicketPoolSize` è la dimensione del pool di biglietteria di destinazione e funziona molto simile alla difficoltà target per la prova del lavoro (PoW). Il fatto che la dimensione attuale della biglietteria sia più grande del bersaglio è ciò che provoca un aumento del prezzo del biglietto che a sua volta potrebbe causare un minor numero di biglietti da acquistare e provocare il numero di biglietti nella piscina riducendosi verso l'obiettivo. Se rientra, il prezzo scenderà per incoraggiare più vendite di biglietti per aumentare il numero di biglietti nella piscina verso l'obiettivo.

---

#### 3. Se sono sfortunato e il mio biglietto scade senza votazione, perdo la tassa di transazione? 

Sì[^9806].

---

#### 4. Votare su mainnet era sospeso fino al blocco 4.096, con le persone che acquistano biglietti. Significa che ci sarà un rischio significativamente maggiore per la scadenza di questi biglietti? 

No[^9806], il tempo di scadenza non si avvia finché un biglietto non viene effettivamente estratto in un blocco. I biglietti erano appena posti nel pool  di memoria fino a quando non potevano essere inclusi nei blocchi che iniziano con il blocco 4.096.

---

#### 5. Cosa succede se nessuno (o meno di 3) degli elettori selezionati emette le proprie transazioni? 

I voti sono sempre determinati dalla punta corrente. I miners non cominciano l'estrazione per un nuovo blocco fino a quando almeno 3+ degli elettori selezionati non rilasciano le loro transazioni. Quindi, se un blocco trovato non riesce a ottenere i voti selezionati[^10219], il blocco è semplicemente orfano dal blocco successivo che trova un altro miner.

Per un esempio più concreto, supponiamo che la punta della catena corrente sia al blocco 5.000. Gli elettori determinati da blocco 5.000 hanno già presentato i loro voti, in modo che i miners stanno abbandonando a cercare il blocco 5.001. Ora, un miner trova una soluzione per il blocco 5 001 e la invia alla rete. Tutti i daemons (e quindi i portafogli) vedranno che 5.001 sono appena arrivati. Tuttavia i miners non iniziano immediatamente a estrarre 5.001. Invece continuano ad estirpare fuori da 5.000 fino a 3+ voti per il blocco 5,001 mostrano. A quel punto tutti passano e iniziano a estrarre 5.001. Se quei 3 voti non verranno mai mostrati, un altro blocco candidato sarà trovato dagli altri miners che lavorano ancora su blocco 5.000 che presentano la loro soluzione (diversa) per il blocco 5.001 alla rete. Poiché ognuno di questi nuovi blocchi candidati per 5,001 ha un hash diverso, vengono selezionati diversi biglietti.

---

#### 6. Cosa succede se un biglietto ha perso un voto? 

Il tuo portafoglio annulla automaticamente il biglietto nel blocco dopo che è stato perso[^13912], quindi ti restituirà solo dopo che sono stati perduti come fondi immaturi (il che significa che non saranno spendibili per 256 blocchi quando maturano).

Per esempio:

```no-highlight
dcrctl --wallet getstakeinfo
```

Output          | Descrizione
---             |---
`allmempooltix` | Tutti i biglietti di stake nel pool di memoria (in attesa di essere estratti in un blocco).
`ownmempooltix` | I tuoi biglietti di stake nel pool di memoria (in attesa di essere estratti in un blocco).

---

#### 7. Qual è la differenza tra un biglietto perso e revocato? 

I biglietti mancati sono i biglietti che sono stati chiamati a votare, ma non lo hanno fatto. Dopo che un biglietto è stato perso, può essere revocato[^14763]. Il portafoglio annulla automaticamente i biglietti mancati che controlla (supponendo che sia sbloccato in modo da poter firmare la transazione di revoca).

Tutto il `rebroadcastmissed` indica il portafoglio a chiedere al demone di rete (`dcrd`) di dare all'elenco dei biglietti mancati nuovamente per verificare se c'è bisogno di essere revocati. In genere questo non è necessario a meno che, ad esempio, non sia stato eseguito un tentativo di revoca di un biglietto, ma non è riuscito perché il portafoglio è stato bloccato. In altre parole, se si nota che il revocato non è uguale, potrebbe essere necessario eseguire il `rebroadcastmissed`. Come detto, però raramente è necessario perché il portafoglio lo fa automaticamente all'avvio e cerca i biglietti mancati su ogni blocco.

Continuare a [Proof-of-Work Mining](/mining/proof-of-work.md)

---

## <i class="fa fa-book"></i> Sorgenti 

[^7969]: Decred Forum, [Post 7,969](https://forum.decred.org/threads/531/#post-7969)
[^8965]: Decred Forum, [Post 8,965](https://forum.decred.org/threads/531/page-2#post-8965)
[^9806]: Decred Forum, [Post 9,806](https://forum.decred.org/threads/180/page-6#post-9806)
[^10219]: Decred Forum, [Post 10,219](https://forum.decred.org/threads/180/page-6#post-10219)
[^13912]: Decred Forum, [Post 13,912](https://forum.decred.org/threads/1271/#post-13912)
[^14763]: Decred Forum, [Post 14,763](https://forum.decred.org/threads/1335/#post-14763)
