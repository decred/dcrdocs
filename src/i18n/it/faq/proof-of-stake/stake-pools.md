# <i class="fa fa-life-ring"></i> Stack Pools

---

#### 1. Esistono altri vantaggi per un pool di palo diverso da non aver bisogno di eseguire un nodo completo e mantenere il tuo portafoglio sbloccato? Ad esempio, avrà maggiori probabilità di vincere o qualcosa di simile? 

Le piscine di pile attiveranno solitamente la ridondanza multi-wallet, avendo molti portafogli distribuiti fisicamente in tutto il mondo. Ciò significa che c'è meno possibilità di voto
Essere mancato perché un portafoglio è in discesa. Riduce anche la latenza tra il portafoglio e la rete che può ridurre la probabilità che un voto venga perduto.

---

#### 2. Un pool di stake suddivide la ricompensa tra tutti i partecipanti (% in base alla quantità di biglietti che hai inviato al pool)? 

È tecnicamente possibile creare un pool che sostiene la suddivisione proporzionale[^9262], ma l'attuale implementazione di riferimento di stakeholder `dcrstakepool` non lo consente. Vota semplicemente per tuo conto. Lo fa facendo il diritto di voto del biglietto uno script P2SH multi-firma 1-of-2. La piscina segna il voto con la chiave privata al momento della selezione del biglietto. Poiché è uno script di firma multi-firma di 1 o 2, significa che se la piscina non è riuscita a votare per te per qualsiasi ragione (estremamente improbabile, poiché il pool mainnet avrà più ridondanza e failover automatico), sarebbe comunque possibile Votare a proprio nome perché hai la seconda chiave privata e potrebbe quindi fornire una firma valida e soddisfare il requisito 1-of-2.

Inoltre, è importante notare che l'acquisto originale del biglietto contiene un impegno per andare ad un indirizzo di ricompensa per il quale solo tu abbia la chiave privata. Le regole del consenso sulla votazione dei voti consentono l'impegno, quindi è impossibile per il pool di rubare i fondi.

Al fine di dividere i premi, il pool dovrà essere il destinatario di tutti i premi e quindi fidarsi di dividere correttamente i premi tra tutti i partecipanti in base alla loro proporzionalità. Si prevede che un simile schema sarà sviluppato con la comprensione che sia meno sicura dell'approccio che utilizza l'attuale modello di pool.

---

#### 3. Devo gestire il mio portafoglio per acquistare i biglietti, ma voteranno correttamente senza di me se lo chiudo e il pool vota per me invece? 

Sì[^9274], che è corretto. È sufficiente eseguire il portafoglio per spendere le tue monete per acquistare il biglietto che delega i tuoi diritti di voto alla piscina che poi voterà per tuo conto. L'indirizzo di ricompensa è un impegno costantemente impegnato nell'acquisto di un biglietto per uno dei tuoi indirizzi per i quali hai solo la chiave privata.

---

#### 4. Ci sono problemi che potrebbero derivare da una pool di stake con troppe persone. Ad esempio, la forza di votare un blocco dentro o fuori? 

È certamente possibile[^9311], ma una delle cose che tutte le piscine dovrebbe sostenere è consentire ad ogni utente di scegliere le loro preferenze di voto individuali. In questo modo, ogni volta che il loro biglietto esce e il pool valuta per suo conto, voterà secondo le loro preferenze.

---

#### 5. I voti sono impostati quando si acquista un biglietto o quando il biglietto è chiamato a votare? Questo cambia quando in un pool di stakeholder? 

I bit di voto sono impostati quando effettivamente votate[^13607] (che ha veramente senso solo perché avreste potuto comprare i biglietti settimanali o mesi prima che esista anche una specifica agenda di voto).

Un pool di stakeholder può operare per quanto vuole, dato che c'è molto spazio per la flessibilità a causa del modo in cui è progettato il piano di impegno per l'acquisto del biglietto. Detto questo, in generale, le persone dovrebbero evitare di utilizzare pool di bals che non permettano loro di controllare il modo in cui vogliono votare su questioni non specifiche in pool.

---

#### 6. Quali sono le garanzie in atto per impedire che i possessori di pool scompaiono con i fondi in pool? 

L'attuale struttura del pool è tale che esso NON può rubare i fondi[^14593].  Stai solo delegando i diritti di voto (e in realtà è un 1-of-2 multisig che significa che voi o il pool può votare). L'acquisto del biglietto contiene un impegno impegnato a livello di consenso per l'indirizzo finale di sovvenzione, quindi non c'è semplicemente alcun modo per il pool di rubare i fondi.

Il peggiore che sarebbe accaduto se un possessore di un pool scompare è che i voti saranno persi, il che comporta la revoca del biglietto che a sua volta provoca le monete originali per ritornare al proprietario originale della moneta (meno il costo iniziale di transazione ovviamente). Tuttavia, come accennato in precedenza, perché il biglietto è un multisigno 1-of-2, ogni utente potrebbe eseguire il proprio portafoglio per votare se il proprietario della piscina scomparire.

---

#### 7. Dove posso vedere un esempio di un biglietto di pool di stake in l'explorer di blocco? 

Le pile di stake includono gli indirizzi 'Dc' poiché la pool di stake utilizza gli indirizzi pay-to-script-hash[^17515]. For example, see txid: [c0abc0ec63a8de15550f067e2b6fde28f0432fb91b938574b282daa69f914103](https://mainnet.decred.org/tx/c0abc0ec63a8de15550f067e2b6fde28f0432fb91b938574b282daa69f914103).

Continuare a [PoS Voting Tickets FAQ](/faq/proof-of-stake/voting-tickets.md)

---

## <i class="fa fa-book"></i> Sorgenti 

[^9262]: Decred Forum, [Post 9,262](https://forum.decred.org/threads/626/#post-9262)
[^9274]: Decred Forum, [Post 9,274](https://forum.decred.org/threads/626/#post-9274)
[^9311]: Decred Forum, [Post 9,311](https://forum.decred.org/threads/582/page-2#post-9311)
[^13607]: Decred Forum, [Post 13,607](https://forum.decred.org/threads/1236/#post-13607)
[^14593]: Decred Forum, [Post 14,593](https://forum.decred.org/threads/1321/#post-14593)
[^17515]: Decred Forum, [Post 17,515](https://forum.decred.org/threads/1289/#post-17515)
