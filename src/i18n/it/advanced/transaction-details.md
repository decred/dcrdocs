# Dettagli di Transazione 

---

Le transazioni decredite sono trasferimenti di DCR che esistono all'interno di blocchi. Le transazioni sono costituite principalmente da input e output, anche se hanno altri campi di dati. 


## Formato di transazione 

Campo        | Descrizione                                                                                    | Size
---          | ---                                                                                            | ---
Versione      | Versione di transazione. Questo numero viene utilizzato per indicare come deve essere interpretata la transazione  | 4 byte
Conteggio dell'input  | The number of inputs in the transaction encoded as a variable-length integer                   | 1-9 byte
Ingressi       | Elenco seriale di tutti gli ingressi della transazione                                                | Variable
Conteggio delle uscite | Il numero di uscite nella transazione codificata come un intero a lunghezza variabile.                  | 1-9 byte
Outputs      | Uscite Elenco seriale di tutte le uscite della transazione.                                               | Variable
Lock time    | Tempo di blocco Il tempo in cui può essere spesa una transazione. (Di solito zero, nel qual caso non ha alcun effetto)       | 4 byte
Scadenza       | T L'altezza di blocco al quale la transazione scade e non è più valida                       | 4 byte


### Input dei testimoni
Un ingresso di transazione di testimoni contiene i dati necessari per dimostrare che un'uscita può essere spesa. Gli ingressi testimoni contengono quattro campi di dati:


#### Ingressi non testimoni
Un ingresso di transazione non testimone è un riferimento a un'uscita non trascritta e ad un numero di sequenza. Un riferimento a un output non viene chiamato "outpoint". Gli outpoints hanno tre campi:

Campo            | Descrizione                                                                                                                           | Dimensione
---              | ---                                                                                                                                   | ---
Transaction hash | L'hash della transazione che contiene l'output speso                                                                     | 32 byte
Indice di uscita     | L'indice dell'output che è stato speso                                                                                                   | 4 byte
Tree             | Per quale tree è in uscita l'uscita. È necessario perché più di un albero viene utilizzato per individuare le transazioni in un blocco. | 1 byte

Oltre ad un outpoint, gli ingressi non-testimoni contengono un numero di sequenza. Questo numero ha più significato storico rispetto all'utilizzo pertinente; tuttavia, il suo scopo più rilevante è quello di consentire la "chiusura" dei pagamenti in modo che non possano essere riscattati fino a un certo tempo.


#### Input dei testimoni
Un ingresso di transazione di testimoni contiene i dati necessari per dimostrare che un'uscita può essere spesa. Gli ingressi testimoni contengono quattro campi di dati:

Campo            | Descrizione
---              | ---
Valore            | La quantità di monete che l'uscita  spesa trasferisce.
Altezza del blocco     | l'altezza del blocco che contiene la transazione in cui si trova l'uscita in esercizio.
Indice di blocco      | l'indice della transazione in cui si trova l'uscita in esercizio.
Script di firma | o script che soddisfa i requisiti dello script nell'output da spendere.


### Uscite
Le uscite sono trasferimenti di DCR che possono essere spesi dagli ingressi. Le uscite hanno sempre tre campi di dati:

Campo             | Descrizione                                                                                     | Dimensione
---               | ---                                                                                             | ---
Valore             | La quantità di DCR viene inviata dall'uscita.                                                     | 8 byte
Versione           | La versione dell'uscita. Questo numero viene utilizzato per indicare come deve essere interpretato l'output. | 2 byte
Script di chiave pubblica | Lo script che deve essere soddisfatto per spendere l'output                                           | Variabile

---

## Serializzazione 
Il formato visualizzato sopra non è il formato in cui le transazioni vengono inviate e ricevute. Quando si inviano o ricevono transazioni, possono essere serializzati in alcuni modi. Il modo in cui una transazione deve essere deserializzata può essere determinata dalla sua versione. Le versioni di transazione occupano quattro byte, ma quei quattro byte vengono effettivamente usati per memorizzare due valori separati. I primi due byte della versione di una transazione indicano il suo numero di versione effettivo. I secondi due byte indicano il suo formato di serializzazione.


### Formati di serializzazione
Quando si serializza, ci sono due parti principali di una transazione: il suo "prefisso" ei suoi dati di testimonianza.
Il prefisso della transazione è composto da:

* Ingressi (senza dati di testimone)
* Uscite
* Tempo di blocco
* Scadenza

I dati del testimone di un'operazione comportano solo i suoi input. I campi dati inclusi dei suoi input dipendono dal formato specifico di serializzazione. Questo formato può essere uno dei seguenti:

* **0 (serializzazione completa)** - Il prefisso della transazione si trova immediatamente prima dei suoi dati di testimonianza.
* **1 (nessun testimone)** - Il prefisso della transazione è l'unico dato presente.
* **2 (solo testimone)** - I dati del testimone della transazione sono i soli dati presenti. Per ogni ingresso, questo include il suo valore, l'altezza del blocco, l'indice di blocco e lo script di firma.
* **3 (Firma dei testimoni)** - I dati del testimone della transazione sono i soli dati presenti e sono serializzati per scopi di firma. Per ogni input, questo include solo il suo script di firma.
* **4 (Firma testimone con valore)** - I dati dei testimoni della transazione sono i soli dati presenti e sono serializzati per scopi di firma. A differenza del formato di firma del testimone, questo formato include il valore di ciascun ingresso prima del suo script di firma.
