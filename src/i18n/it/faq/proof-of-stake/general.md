# <i class="fa fa-ticket"></i> PoS FAQ Generali 

---

#### 1. Che cosa è il sistema Decred's Proof-of-Stake? 

Il sistema Proof-of-Stake (PoS) consente ai titolari di Decred di avere una parola nella governance della moneta. Essa mira a dare agli utenti una voce accanto ai miners.
Per partecipare, gli utenti possono acquistare "biglietti", che entrano in un pool di lotterie. Ogni blocco 5 biglietti sono scelti dal biglietto del biglietto PoS. Se almeno 3 di quelli convalidano il blocco precedentemente estratto,
Il blocco di nuova estrazione viene aggiunto alla catena e vengono pagati sia i miners PoW che gli stacker PoS. Se il blocco non è convalidato dagli stack PoS, i minatori PoW non vengono pagati, ma i banchieri PoS lo fanno. Questo è
per incentivare i miners di PoW al mining secondo i desideri degli stacker PoS.

Questo sistema PoS ha diversi vantaggi che risolvono i problemi che potrebbero incontrare problemi con i sistemi PoW. Ad esempio, poiché gli stack di PoS devono convalidare i blocchi che i miners di PoW sono, i miners PoW non possono
Decidono da soli di cambiare le regole della rete (un attacco del 51%). Oppure, quando la catena Decrede forza la vecchia catena, la catena si interromperà rapidamente per non essere convalidata dal componente PoS della catena.

Il sistema PoS premia i partecipanti per il loro stack. Ogni blocco Decred ha un componente di ricompensa PoS che verrà distribuito a ogni biglietto scelto per votare in quel blocco. Il sistema è stato progettato in un
Modo che il tempo medio per il biglietto da selezionare è di 28 giorni. Se un biglietto non è stato selezionato dopo 40960 blocchi (un po 'meno di 5 mesi) verrà revocato dal sistema. Il DCR usato per acquistare un
 Il biglietto viene restituito a prescindere dal voto o meno.

Un'altra caratteristica interessante che il sistema PoS consente è la capacità di votare in un ordine del giorno. Poiché la convalida dei blocchi può essere considerata una votazione, aggiungendo componenti extra di votesbit al biglietto che il sistema può monitorare e contare voti su una serie di blocchi. Questi voti possono essere di qualsiasi cosa.

Nel sistema Decred Proof-of-Stake è possibile partecipare chiunque abbia la DCR acquistando un biglietto.

---

#### 2. Quali sono i biglietti?

Un biglietto è un token acquistato per partecipare al sistema PoS. È possibile acquistare i biglietti tramite l'interfaccia di riga di comando di dcrctl, o attraverso una GUI come Paymetheus[^1] o Decrediton. Ogni volta che si acquista un
Biglietto, si paga il prezzo del biglietto corrente e la tassa del biglietto utilizzando il DCR. Quando viene acquistato un biglietto, va a un "mempool" temporaneo. 20 biglietti possono essere estratti in ogni blocco e vengono scelti i biglietti
Da estirpare sulla base della loro tariffa per kilobyte. Dal momento che esiste un numero limitato di biglietti che possono essere estratti in blocchi ad un determinato prezzo (2880), potrebbe esservi la concorrenza per ottenere i biglietti minati. In questo caso,
Puoi aumentare la tassa che sei disposta a pagare per ottenere il tuo biglietto estratto. Una volta che il tuo biglietto viene estratto, passerà dall'attuale 'allmempool' al pool di biglietti immaturi. Dopo 256 blocchi
(Circa 20 ore) poi si maturerà e entra nel pool biglietto dal vivo dove è eleggibile per essere scelto per votare.

---

#### 3. Devo essere costantemente connesso alla rete per partecipare a PoS? 

Un portafoglio deve essere online 24 ore su 24 per rispondere ad un voto se uno dei tuoi biglietti è selezionato. Ci sono due modi principali per farlo; Un raccoglitore di solista che hai impostato e mantenuto in linea tutto il tempo, oppure tu
Può utilizzare un pool [stake pool](/mining/proof-of-stake.md#solo-mining-or-pool-mining). Una piscina di palo è fondamentalmente un portafoglio gestito dalla comunità a cui è possibile assegnare i diritti di voto dei biglietti e il pool
Votare a vostro favore per una piccola percentuale della ricompensa PoS.

È importante notare che si assegna solo diritti di voto alla piscina, non i fondi effettivi. Un pool di stake non ha accesso ai tuoi fondi in qualsiasi momento.

---

#### 4. Qual è il "prezzo del biglietto"? 

Il prezzo per i biglietti è determinato da un algoritmo che mira a mantenere la dimensione del pool di biglietti, che è l'ammontare totale dei biglietti nel biglietto del sistema di biglietteria PoS attorno ad una grandezza target di 40960 biglietti.
Il prezzo del biglietto aumenta o diminuisce in base alla richiesta di biglietti e al numero di biglietti attualmente in piscina.

Ogni 144 blocchi l'algoritmo regola il prezzo del biglietto. Questa è chiamata finestra di acquisto. Ogni blocco può contenere 20 nuovi biglietti acquistati. Ciò significa che in ogni finestra di acquisto un massimo di 2880 biglietti
Può essere aggiunto al pool di ticket del sistema PoS.

Il prezzo del biglietto è sempre rimborsato non importa se il tuo biglietto sarà votato, manca o scade.

---

#### 5. Quali sono le tasse? 

Il sistema PoS utilizza due tipi di tasse, un txfee (noto anche come una tariffa "split") e un ticketfee.
	
Il txfee è una tassa che si paga alla rete per gestire la transazione per acquistare il tuo biglietto. Questa tassa è impostata in modo predefinito a una quantità minima (0.01 DCR/kB) e non deve essere modificata.
Il ticketfee è la tassa che paghi se il tuo biglietto viene estratto. Questa tassa è un incentivo per i miners di PoW di immaginare il biglietto e aggiungerlo al cumulo dei biglietti.

Se la finestra di acquisto è piena, il che significa che sono stati acquistati più biglietti di quelli disponibili per essere estratti durante quella finestra, il ticketfee verrà utilizzato per determinare quali biglietti vengono messi in
Il bigliettero. I biglietti con il ticketfee più alto saranno selezionati dai minatori PoW.

Le tariffe sono calcolate in DCR per kilobyte. Poiché un biglietto è di circa 300 (solo) o 540 (pool) byte di dimensioni, le commissioni effettive da pagare saranno inferiori a quelle impostate come importo specifico della quota.

Sia txfees che ticketfees non saranno restituiti quando un biglietto vota, scade o manca un voto.

Il ritorno dei fondi al portafoglio dopo il voto dei biglietti o revocato non genera una tassa.

---

#### 6. Che cos'è un pool di stake? 

Un pool di balls è l'equivalente di una mining pool, ma per il sistema PoS. Attraverso le opzioni del tuo portafoglio Decred, puoi dare i tuoi diritti di voto a un pool di stake. Se il tuo biglietto è selezionato per votare,
Il pool di palle lancerà il voto per te e ti ricompenserai con la retribuzione PoS meno la quota di pool stake (di solito 4-5%). A differenza delle piscine minerarie, la ricompensa PoS non è divisa tra gli utenti del pool di palo. La ricompensa completa va al proprietario del biglietto.

Un pool di balls vi permetterà di acquistare i biglietti ma non avere il proprio portafoglio sbloccato e sempre in linea. È importante notare che i vostri fondi non lasciano mai il portafoglio. Non stai mandando nulla alla piscina,
Solo dandogli l'autorità di votare a vostro nome. Un pool di stake non può accedere ai tuoi fondi. 

Le pools di pile attiveranno solitamente la ridondanza multi-wallet, avendo molti portafogli distribuiti fisicamente in tutto il mondo. Ciò significa che c'è meno possibilità di perdere un voto perché un portafoglio è in discesa.
Riduce anche la latenza tra il portafoglio e la rete che può ridurre la probabilità che un voto venga perduto.

---

#### 7. Cosa succede ai miei fondi quando compro un biglietto? 

I fondi utilizzati per acquistare i biglietti sono bloccati fino a quando il biglietto è scelto per votare o scade. Non sono in grado di lasciare il portafoglio e appariranno nella sezione "lockedbytickets" del portafoglio.
Se il tuo biglietto è selezionato per votare, ti verrà rimborsato l'importo totale pagato per il biglietto e dato la ricompensa PoS.

L'unico costo per utilizzare questo sistema è quello delle impostazioni impostate. Il txfee verrà addebitato per la transazione del tuo biglietto in rete. Il ticketfee verrà addebitato per l'incorporazione nella
biglietteria, e viene pagata ai minatori di PoW. Se il tuo biglietto non viene estratto, non c'è nessun costo perché la transazione non è mai stata fatta sulla rete.

Nel caso in cui il tuo biglietto non sia stato selezionato per votare dopo 40960 blocchi (circa 4 mesi), il sistema annullerà il tuo biglietto e il decredo che hai pagato (meno tasse) verrà trasferito nel tuo portafoglio. 

---

#### 8. Quali sono le possibilità di votare il mio biglietto? 

Il sistema PoS in Decred utilizza una distribuzione Poisson per determinare le possibilità di un voto di un biglietto in qualsiasi momento. Data la dimensione del pool target di 40960 biglietti, ogni biglietto ha un 50% di possibilità di voto
Entro 28 giorni e un voto del 99,5% prima della scadenza. Tieni presente che questi valori cambiano con la dimensione del pool.


---

#### 9. Che cosa è il voto di Proof-of-Stake? 

Poiché la convalida dei blocchi eseguita dal sistema PoS si comporta come un sistema di voto, può essere utilizzato per votare anche su altri problemi.

Quando selezionato per convalidare un blocco, i biglietti votano se approvare o meno il blocco precedentemente estratto. Ciò richiede 3 su 5 biglietti selezionati per votare sì.

Aggiungendo un altro parametro al biglietto che non interferisce con l'approvazione dei blocchi minati, il sistema può monitorare la quantità di biglietti che utilizzano tale parametro su un numero di blocchi. Puoi impostare questo parametro nel tuo portafoglio in qualsiasi momento prima del voto del biglietto. 

Ad esempio, potresti scegliere il colore del tuo biglietto per essere rosso o blu, impostare questa opzione e il sistema contare per i prossimi 1000 blocchi quanti biglietti rossi e quanti biglietti blu vi sono. Forse ci sono 3000 biglietti rossi, 1500 biglietti blu e 500 che non hanno selezionato un colore.

Se si sostituisce l'opzione rossa o blu con un'opzione sì o no, si dispone di un sistema di voto che può contare i voti nel tempo. Utilizzando il sistema di votazione PoS chiunque detiene DCR può votare su questioni fissate in un ordine del giorno.

Questo sistema di voto può essere utilizzato per qualsiasi problema di governance. Per Decred, l'uso più importante sarà quello di votare su hardforks, che sono le modifiche tecniche del modo in cui funziona la valuta. Qualche esempio:

- Aumentare la dimensione massima del blocco.
- Modificare l'utilità PoS algoritmo per determinare il prezzo del biglietto.
- Vote on major new features for the currency (e.g. lightning network, enhanced privacy).
- Modificare l'algoritmo PoW.
- Pretty much anything the community decides would be in the best interest of the currency.

Attualmente, è in fase di sviluppo una piattaforma per la comunità di presentare e promuovere un'agenda di voto.

---

#### 10. Che cosa è il voto di hardfork?

Come ogni altra crittografia, il Decred potrebbe avere bisogno di un certo punto.

Una delle questioni di ordine del giorno fissate per il sistema di votazione PoS potrebbe essere un hardfork. Se un problema è impostato, la nuova versione del codice sorgente di Decred includerà il hardfork in esso, ma la forcella non sarà attivata finché il sistema PoS non ha votato.

Per una votazione hardfork per avviare due condizioni critiche devono essere soddisfatte:

- In primo luogo, il 75% dei minatori PoW deve aggiornare alla versione più recente della versione del blocco di rete corrente. Questo controllo viene eseguito negli ultimi 1000 blocchi.
- In secondo luogo, il 75% dei minatori PoS deve aggiornare l'ultima versione. Questo controllo viene eseguito negli ultimi 2016 blocchi.

Una volta che questi controlli sono soddisfatti, inizia il processo di voto. I biglietti possono essere impostati con un parametro aggiuntivo di sì / no / astenersi. Fai questo nel tuo portafoglio prima che vota il biglietto. I biglietti contrassegnati come astenuti non verranno conteggiati nell'ammontare totale dei voti.

Il sistema PoS inizia quindi a contare i biglietti con questi parametri impostati su una quantità predeterminata di blocchi. Se durante questo intervallo l'ammontare dei voti "yes" è del 75% o più, il voto è passato. Una serratura in un periodo di un determinato numero di blocchi inizierà prima che il hardfork vada in diretta, per cui ognuno ha la possibilità di eseguire l'aggiornamento e di non essere duro fuori dalla rete.

Poiché il codice per la hardfork è già nella versione corrente di Decred, non c'è bisogno che gli sviluppatori interferiscano o che la maggioranza dei minatori PoW e dei minatori PoS possano aggiornare dopo una decisione raggiunta. Se la votazione su un hardfork passa sarà attuata automaticamente dopo la chiusura in periodo.

Il voto hardfork può fallire in più punti. Il voto potrebbe non cominciare affatto se i minatori PoW oi minatori PoS non aggiornano. Dopo di ciò, la soglia del 75% di voti potrebbe non essere raggiunta.

Nel caso in cui un voto non sia riuscito, un nuovo ciclo avrà inizio all'inizio del processo. Ciò significa controllare se i minatori PoW hanno aggiornato, se i minatori PoS hanno aggiornato e poi un altro periodo di conteggio delle votazioni. Ciò continuerà per un certo numero di giri, dopo di che, se il voto non è passato, verrà presentata l'ordine del giorno.

---

#### 11. Il PoS è suscettibile di scambi di grandi dimensioni utilizzando il decred dei loro clienti? 

Il numero di decred a persona (o scambio) non ha niente a che fare con PoS. È il numero di biglietti che hai. I fondi utilizzati per l'acquisto dei biglietti sono bloccati fino al biglietto che hanno acquistato voti. Ciò significa che
Decreti coinvolti in PoS sono effettivamente non trasferibili. Per uno scambio di utilizzo dei decreti dei loro clienti per il voto, dovrebbero trasferirli dai portafogli e bloccarli per un massimo di 5 mesi. Persone
Avrebbe notato che i loro saldi cambiano (i decreti bloccati in PoS non si dimostreranno spendibili) e non sarebbero in grado di ritirare fondi in modo che lo scambio avrebbe subito una grande perdita di liquidità.

Inoltre c'è un limite duro di 20 biglietti aggiunti per blocco in modo che nessun scambio potrebbe inondare la piscina più velocemente di questo.

Infine, c'è un soft cap sul numero totale di biglietti in pool. Ogni 144 blocchi (2880 biglietti) il prezzo del biglietto viene regolato in base al numero di biglietti in piscina e al tasso dei nuovi biglietti
Sono stati aggiunti nell'ultima finestra. Alla fine il prezzo del biglietto sarebbe così alto che anche uno scambio non sarebbe in grado di acquistare molti biglietti. E ricordate che anche se hanno fatto che i loro DCR sono bloccati così
Non può più acquistare quando il prezzo scende di nuovo.

---

#### 12. Il PoS è suscettibile di influenzare da grandi possessori di equilibri, come gli sviluppatori originali? 

Qui si applicano i limiti di dimensione della piscina. Ciò impedisce a una persona / gruppo di inondare la piscina PoS con un gran numero di propri biglietti. Anche se hanno acquistato l'intera piscina (con ingenti oneri) la maggior parte che avrebbero fatto
Probabilmente ottenere circa 4000 biglietti (in base alle precedenti biglietterie dove quelle circa 30DCR normalmente salgono fino a 100 per la prossima finestra e il massimo per quello successivamente è spesso superiore a 300). Così un grande
Il titolare della bilancia potrebbe probabilmente comprare 2 finestre fuori. Una finestra a 30 sarebbe 86,400DCR poi la prossima a 100 sarebbe 288,000DCR. Quindi sarebbe costato 374,400DCR per acquistare 5760 biglietti. Con una quota di 40960 biglietterie target, 374400 DCR ti darà circa il 14% di tutti i biglietti.

Now the holder could wait a couple of days for the price to drop then start buying back up again. Except that most of their funds will be locked in the ones they bought earlier (although some will have voted) so their buying power for the new window is greatly reduced. But let's say they have super capital and bought all the decred on all exchanges. So they are able to buy another two windows and replace those tickets that voted and were successful in buying all the tickets (at very high fees and/or prices). Let's say that takes them to about 25% of the tickets.

I biglietti per un blocco vengono scelti con una distribuzione casuale. Per forzare un voto per andare in un certo modo avrete bisogno di 3 su 5 voti per un blocco dato che è del 60%. Anche con quell'enorme spesa di capitale,
Sono meno di mezza strada. E un voto non è deciso su un singolo blocco in modo da richiederebbe il 60% del 75% dei blocchi nel periodo di voto.

E poi hai ancora bisogno dei miners di PoW per confermare i voti. Se pensano che qualcuno sta cercando di giocare il sistema, può scegliere di annullare i blocchi.

Quindi, in fondo, questo è quasi impossibile, anche se una sola persona ha una percentuale enorme di DCR.

But then we come to the stake pools. Stake pools, while not having access to any of their users' funds, do have the ability to change votes on tickets assigned to them. This is why it is suggested that when joining a stake pool, people don't just go for the largest one. Decred is short for 'decentralised credit' so part of the spirit of PoS is ensuring that the PoS stake pools don't get too large in relation to the others. However, even the largest at almost 20% would still only get on average one vote per block.

Quindi Decred è stato specificamente progettato per ridurre al minimo l'impatto sia dalle grandi piscine PoW che PoS, nonché da individui (compresi gli sviluppatori) con grandi aziende. 

## <i class="fa fa-book"></i> Collegamenti 

[^1]: [Paymetheus Ticket Purchasing Guide](/getting-started/user-guides/using-paymetheus.md#-purchase-tickets-tab)
