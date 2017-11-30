# Design ibrido 

---

Il principale contrasto con lo schema follow-the-satoshi precedentemente descritto[^1] è un nuovo sistema di lotteria in cui i biglietti devono essere acquistati e poi attendere un periodo di scadenza prima che possano essere selezionati e spesi. La selezione dei biglietti per un blocco è eseguita leksograficamente da un pool di biglietti maturo basato su pseudorandomness contenuto nell'intestazione di blocco. Poiché la manipolazione di questo pseudorandomismo è difficile in un sistema PoW, la manipolazione della selezione dei biglietti è associata ad un costo fondamentale per il miner PoW. La selezione dei biglietti per un periodo di tempo può essere descritta da una funzione di densità di probabilità simile alla probabilità di ottenere un blocco in PoW ad una velocità costante di hash nel tempo a una difficoltà costante[^2], con una distribuzione di probabilità con una modalità approssimativamente Pari alla metà della dimensione del biglietto. Il prezzo per l'acquisto di un biglietto è regolato da una nuova difficoltà di palo che è determinata dal numero medio esponenziale dei biglietti acquistati e dalla dimensione del pool di biglietti maturi nei blocchi precedenti.

La convalida dei blocchi PoW viene spiegata nei seguenti passaggi:

1. Un blocco viene estratto da un miner PoW, che seleziona le transazioni da mettere dentro. Le transazioni correlate al sistema di importo vengono inserite nel set UTXO.
2. I miners di PoS votano sul blocco producendo un'operazione di voto dal loro biglietto. Il voto consente entrambi di creare un blocco al di sopra del blocco precedente e sceglie se il tree di transazione regolare precedente (contenente le monete e le transazioni non legate alle azioni) è valido.
3. Un altro miner PoW comincia a costruire un blocco, inserendo i voti dei miners PoS. La maggioranza dei voti espressi deve essere inclusa nel blocco successivo per quel blocco da accettare dalla rete. Delle transazioni di voto in questo nuovo blocco, il minatore PoW controlla una bandiera per vedere se il miner PoS indicava se il tree di transazione normale del blocco era valido. Queste bandiere di voto sono raggruppate e, sulla base della maggioranza di voto, in questo blocco è impostata un flag di bit per indicare se il tree di transazione regolare del blocco precedente è valido.
4. Viene trovato un nonce che soddisfa la difficoltà di rete e il blocco viene inserito nel blockchain. Se il tree di transazione regolare del blocco precedente è stato convalidato, inserire queste transazioni nel set UTXO. Vai a 1.

TPer scoraggiare la manipolazione dei voti inclusi, viene applicata una pena di sovvenzione lineare al blocco corrente se non rientrano nel blocco tutte le transazioni di voto. La pena "morbida" di invalidare l'albero delle transazioni precedenti aiuta a prevenire il discarico del lavoro, necessario per assicurare il sistema, e fa supporre che il blocco successivo sarà ottenuto da un miner che sia disinteressato nel mantenere la sovvenzione del primo Bloccare a proprio favore. Anche nel caso in cui ciò non sia vero, un miner maligno con un tasso di hash alto avrà ancora almeno \((\text{numero per la maggioranza}/2)+1\) voti a favore del tree di transazione del loro precedente blocco Per produrre un blocco che dà loro alcuna sovvenzione dal blocco precedente.

I flag di bit vengono esplicitamente aggiunti sia all'intestazione di blocco che ai voti in modo che i miners possano facilmente votare in nuove forcelle rigide o morbide.

---

## <i class="fa fa-book"></i> Riferimenti

[^1]: Bentov I., Lee C., Mizrahi A., Rosenfeld M. 2014. [Proof-of-activity: Extending Bitcoin's proof-of-work via proof-of-stake](https://decred.org/research/bentov2014.pdf).
[^2]: Nakamoto S. 2008. [Bitcoin: A peer-to-peer electronic cash system](https://decred.org/research/nakamoto2008.pdf).
