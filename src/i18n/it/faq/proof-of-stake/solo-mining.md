# <i class="fa fa-male"></i> Solo Mining 

---

#### 1. Ho bisogno di un potere di hash per la mia mining? 

L'attività di "mining" non richiede alcun potere hash[^9304]. Pensateci un po 'come l'interesse per le monete investite. Si blocca le tue monete per un periodo di tempo per acquistare un biglietto che ti dà un'elevata probabilità (>99%) di acquisire diritti di voto e di ricevere interessi in cambio di una votazione e il costo di opportunità di non essere in grado di utilizzare tali Monete per potenzialmente fino a ~4,7 mesi.

Se hai già acquistato biglietti per palo, queste monete saranno bloccate finché i biglietti non vinceranno o scadranno. Stai solo stack e quindi devi mantenere il tuo portafoglio in linea 24/7 finché tutti i tuoi biglietti hanno vinto (o sono scaduti) o ti mancherà dei premi poiché non puoi votare se il portafoglio non è online. Poiché le monete sono ora bloccate non c'è modo per voi di cambiare le monete già impegnate ora.

Il pool di stake, d'altra parte, consente di delegare i tuoi diritti di voto alla piscina in modo che sia responsabile di essere online 24 ore su 24 e di castare il tuo voto per te.

---

#### 2. Non è una delle ragioni principali per l'estinzione delle scommesse per garantire che ci siano sempre una quantità sufficiente di peers online? 

Sicuramente non[^9311]. L'estrazione delle stake non può forzarlo. Un portafoglio di stile SPV potrebbe facilmente eseguire lo staking necessario comunicando con altri nodi completi (`dcrd` istanze) sulla rete. È vero che il portafoglio corrente richiede che `dcrd` sia in esecuzione, ma questo non sempre sarà il caso.

Anche se il software ha cercato di far valere questo, non potresti impedire alle persone di scrivere utilità e quindi di farlo tramite la rete peer-to-peer senza dover eseguire la propria istanza locale.

---

#### 3. Cosa succede se il mio portafoglio non è raggiungibile o bloccato quando i miei biglietti sono selezionati dai miners? 

Se il tuo portafoglio non è in linea o è bloccato[^9806] quando i tuoi biglietti sono stati selezionati, perderai i premi e il tuo biglietto viene rimosso immediatamente dal pool. Non ci sono "redos".

---

#### 4. Posso testare in qualche modo se la mia macchina è raggiungibile per votare? In altre parole, eseguire le azioni di un minatore che vorrebbe ottenere il mio voto. 

Non è necessario essere raggiungibili. La votazione è deterministica su base bloccata[^9806]. Vale a dire che il portafoglio saprà se il vostro biglietto è selezionato in base al blocco corrente e quindi una "transazione di voto" (transazione ssgen) viene trasmessa alla rete, proprio come altre transazioni.

---

#### 5. Posso eseguire più portafogli di voto solo con lo stesso seed su più server? 

Puoi avere più portafogli a votazione multipli perché non stanno creando nuovi indirizzi[^12697]. Il problema viene quando si dispone di due portafogli che creano transazioni che coinvolgono nuovi indirizzi perché non sanno cosa sta facendo l'altro.

Se si esegue un'installazione calda/fredda, è possibile creare più portafogli caldi a caldo solo senza votazioni, a condizione che entrambi siano a conoscenza dell'indirizzo di cui dispongono i diritti di voto.

Continuare a [Stake Pools FAQ](/faq/proof-of-stake/stake-pools.md)

---

## <i class="fa fa-book"></i> Sorgenti 

[^9304]: Decred Forum, [Post 9,304](https://forum.decred.org/threads/626/page-2#post-9304)
[^9311]: Decred Forum, [Post 9,311](https://forum.decred.org/threads/582/page-2#post-9311)
[^9806]: Decred Forum, [Post 9,806](https://forum.decred.org/threads/180/page-6#post-9806)
[^12697]: Decred Forum, [Post 12,697](https://forum.decred.org/threads/1127/#post-12697)
