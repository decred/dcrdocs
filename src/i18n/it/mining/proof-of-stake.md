# Prova di impegno (PoS) Mining 

Ultimo aggiornamento per v1.0.0

Questo documento è destinato ad essere una risorsa educativa per l'estrazione di Proof-of-Stake (stack) con Decred. Coprirà lo scopo del protocollo Proof-of-Stake, una breve introduzione al processo di stack, un ciclo di vita dei biglietti e farti iniziare con l'acquisto di biglietti. 

---

## Panoramica 

Il protocollo unico di Decred, Proof-of-Stake, serve scopi diversi:

Fornire una metrica per gli stakeholder / il supporto degli utenti finali di tutti gli aggiornamenti del consenso. Vale a dire, le parti interessate sono in grado di votare su proposte/agenda specifiche sul bloccaggio Decred. Le agende possono includere la decisione se il team di dev devia trascorrere il tempo per implementare una funzione specifica, attivando il codice di una funzionalità già sottoposta a implementazione o adottando altre decisioni come ad esempio la modalità di devoluzione della sovvenzione. Maggiori informazioni sul voto possono essere trovate nella nostra guida [Mainnet Voting Guide](/getting-started/user-guides/agenda-voting.md).

Il PoS di Decred fornisce anche un sistema di controlli e di equilibri per i miners non conformi. Gli stakeholder possono votare un blocco non valido se non corrisponde alle regole di consenso della rete.

---

## Staking 101 

Per partecipare a un'attività mining dimostrativa, le parti interessate bloccano un DCR in cambio di un biglietto. Ogni biglietto di proprietà conferisce a un stakeholder la possibilità di lanciare un voto unico. Al momento della votazione, ogni biglietto restituisce una piccola ricompensa più l'originale **Ticket Price** del biglietto. Ogni biglietto è scelto per votare a caso, dando un tempo medio di 28 giorni, ma forse richiedendo fino a 142 giorni, con una probabilità di scadenza del 5,5% prima di essere scelti per votare (questa scadenza restituisce l'originale **Ticket Price** Senza una ricompensa). Ogni blocco estratto deve includere 5 voti (i minatori sono penalizzati con una deduzione retributiva se sono inclusi meno di 5 voti). Ogni blocco estratto può includere fino a 20 acquisti di biglietti freschi. Un nuovo biglietto richiede 256 blocchi da maturare prima che venga inserito nel **Ticket Pool* e in grado di essere chiamato a votare.

Ci sono alcune importanti variabili che dovresti familiarizzare con lo stack.

Ogni 144 blocchi (~ 12 ore), l'algoritmo di difficoltà di stake calcola un nuovo **Ticket Price** el tentativo di mantenere la dimensione **Ticket Pool** vicino alla dimensione del pool target di 40.960 biglietti. Questa finestra di blocco 144 è denominata `StakeDiffWindowSize`.

Il **Ticket Price**/**Stake Difficulty** è il prezzo che dovete pagare per un biglietto durante una singola finestra a blocchi 144.

Il **Ticket Pool** è il numero totale dei biglietti nella rete Decred.

Il **Ticket Fee** (`ticketfee`) è la tariffa che deve essere inclusa nell'acquisto del biglietto per incentivare i miners Proof-of-Work per includere quel biglietto in un nuovo blocco. **Ticket Fee** si riferisce di solito alla tariffa tariffaria DCR / kB per una transazione di acquisto di biglietti. Pertanto, con una maggiore dimensione delle transazioni, si finisce per pagare una quota assoluta superiore. Ad esempio, gli acquisti di biglietti da solista sono di circa 300 byte, il che significa che un **Ticket Fee** di 3 DCR / kB comporterà la spesa su .1 DCR se e solo se quel biglietto viene incluso in un blocco .

Quando il **Ticket Price** è relativamente basso per una singola **Ticket Window**,  di solito si può aspettarsi che si crei un mercato delle tariffe, con molte parti interessate che cercano di acquistare i biglietti prima che finisca la finestra. Quando il **Ticket Price** non è ad un prezzo estremamente basso e redditizio, la tariffa **Ticket Fee** di default di 0.01 DCR/kB è di solito abbastanza alta da essere inclusa in un blocco.  

Quando un biglietto è chiamato a votare, il portafoglio che ha diritto di voto per quel biglietto deve essere online. Se il portafoglio non è online per lanciare il suo voto, il biglietto verrà contrassegnato come `missed` e non riceverai una ricompensa per quel biglietto. Gli Stakepools sono offerti come soluzione per coloro che non possono avere un portafoglio di votazioni online 24/7.

Gli Stakepool consentono agli stakeholder di generare transazioni di acquisto del biglietto che danno diritto di voto a stakepool per il biglietto. Vogliono per vostro conto, richiedendo solitamente una piccola quota di partecipazione (meno del 7%) che copre il costo di ospitare almeno 3 server necessari per eseguire un pool di stakeholder. Questa tariffa è conosciuta come la tariffa **Pool Fee** e viene esclusa solo dalla piccola ricompensa PoS. Un elenco di stakepools può essere trovato [below](#list-of-stakepools).

---

## Ciclo di vita del biglietto 

L'acquisto di un biglietto per PoS è abbastanza semplice (vedi sotto) ma cosa succede dopo aver acquistato?
Un biglietto sulla rete principale (rete di test utilizza diversi parametri) passerà attraverso alcune fasi della sua vita:

1. Acquistate un biglietto utilizzando un portafoglio Paymetheus <!--, Decrediton,--> o dcrwallet. Il costo totale di ogni singola transazione del biglietto deve essere **Ticket Price** + **Ticket Fee**(`ticketfee`).
2. Il tuo biglietto entra nel `mempool`. Questo è dove il tuo biglietto aspetta di essere minato da minatori PoW. Solo 20 biglietti freschi vengono estratti in ogni blocco.
3. I biglietti vengono estratti in un blocco con maggiori transazioni **Ticket Fee** che hanno una priorità più elevata. Si noti che la tariffa **Ticket Fee** è DCR per KB della transazione. Alcune comuni transazioni sono 298 byte (un solo acquisto di biglietti) e 539 bytes (acquisto di un pool).
4. **A -** Se il tuo biglietto viene estratto in un blocco, diventa un biglietto immaturo. Questo stato dura 256 blocchi (circa 20 ore). Durante questo periodo il biglietto non può votare. A questo punto, la tassa del biglietto non è rimborsabile. <br /> 
**B -** Se il tuo biglietto non è stato estratto, sia il **Ticket Price** e **Ticket Fee** vengono restituiti sul conto acquisti.
5. Dopo il tuo biglietto maturo (256 blocchi), entra nel **Ticket Pool** ed è idoneo a votare.
6. La possibilità di votare un biglietto è basata su una distribuzione di Poisson con una media di 28 giorni. Dopo 28 giorni un biglietto ha una probabilità del 50% di aver già votato.
7. Data la dimensione del pool target di 40960 biglietti, ogni biglietto ha una probabilità del voto del 99,5% entro 142 giorni (circa 4,7 mesi). Se dopo questo tempo un biglietto non ha votato, scade. Riceverai un rimborso per l'originale **Ticket Price**.
8. Un biglietto potrebbe mancare la sua chiamata a votare se il portafoglio di voto non risponde o due blocchi validi si trovano in prossimità di vicenda. Se ciò accade, riceverai un rimborso sul prezzo **Ticket Price**.
9. Dopo che un biglietto ha votato, mancato o scaduto, i fondi (prezzo del biglietto e sovvenzione, se applicabile, meno la tassa) entreranno in stato immaturo per altri 256 blocchi, dopo di che vengono rilasciati. Se un biglietto è mancato o scaduto, una transazione di revoca del biglietto viene inviata dal portafoglio che libera le uscite del biglietto bloccato. **NOTE:** Le annullamenti possono essere inviate solo per un corrispondente biglietto mancato. Non puoi revocare un biglietto fino a che non sia stato perso.

---

## Come realizzare lo stake 

Un portafoglio aperto e sbloccato 24/7 è *highly recommended* per lo stack. Qualsiasi perdita di uptime può provocare una perdita di voto e ricompensa. Stakepools sono disponibili per coloro che non sono in grado di mantenere un portafoglio personale di voto per sempre.

L'unico altro requisito per lo stack è quello di acquistare un biglietto. Di seguito troverai le guide per acquistare i biglietti utilizzando [Paymetheus](#paymetheus) e [dcrwallet](#dcrwallet).

Se si intende utilizzare un pool di partecipazione, è necessario prima registrarsi per uno. I collegamenti ai palazzi riconosciuti ufficialmente sono forniti [here](#list-of-stakepools).

---

## Paymetheus 

L'applicazione Paymetheus non è in grado di votare se stesso, il che significa che i diritti di voto devono essere assegnati a un pool di stakeholder.

Per vedere come acquistare i biglietti con Paymetheus e un pool di partecipazione, consulta la sezione [Purchase Tickets tab guide](/getting-started/user-guides/using-paymetheus.md#purchase-tickets-tab) 

---

## dcrwallet 

Il manuale [Buying Tickets with dcrwallet](/getting-started/user-guides/dcrwallet-tickets.md) vi mostrerà come acquistare i biglietti manualmente e automaticamente per il pool o il solo stack.

---

## <i class="fa fa-life-ring"></i> Elenco degli Stakepools 

Questi stakepool sono ufficialmente riconosciuti:

* [<i class="fa fa-external-link-square"></i> https://dcr.stakepool.net](https://dcr.stakepool.net)
* [<i class="fa fa-external-link-square"></i> https://dcr.stakeminer.com](https://dcr.stakeminer.com)
* [<i class="fa fa-external-link-square"></i> https://pool.d3c.red](https://pool.d3c.red)
* [<i class="fa fa-external-link-square"></i> https://stakepool.dcrstats.com](https://stakepool.dcrstats.com)
* [<i class="fa fa-external-link-square"></i> https://stake.decredbrasil.com](https://stake.decredbrasil.com)
* [<i class="fa fa-external-link-square"></i> https://stakepool.eu](https://stakepool.eu)
* [<i class="fa fa-external-link-square"></i> https://dcr.ubiqsmart.com](https://dcr.ubiqsmart.com)
* [<i class="fa fa-external-link-square"></i> https://ultrapool.eu](https://ultrapool.eu)

Puoi trovare un confronto delle tasse e delle statistiche di ciascuna piscina visitando il sito
[<i class="fa fa-external-link-square"></i> Decred website](https://decred.org)
E cliccando sul link 'Stakepools' all'interno del piè di pagina in fondo alla pagina.

---

<!-- TODO: **Purchasing Tickets with Decrediton** -->

## Informazioni aggiuntive 

[Mainnet Voting Guide](/getting-started/user-guides/agenda-voting.md)

[Proof-of-Stake Commands](/advanced/program-options.md#pos-commands)

[Proof-of-Stake FAQ - General](/faq/proof-of-stake/general.md)

[Proof-of-Stake FAQ - Buying Tickets and Fees](/faq/proof-of-stake/buying-tickets-and-fees.md)

[Proof-of-Stake FAQ - Solo Mining](/faq/proof-of-stake/solo-mining.md)

[Proof-of-Stake FAQ - Stake Pools](/faq/proof-of-stake/stake-pools.md)

[Proof-of-Stake FAQ - Voting Tickets](/faq/proof-of-stake/voting-tickets.md)

[Proof-of-Stake Mining Parameters](/advanced/program-options.md#pos-network-parameters)
