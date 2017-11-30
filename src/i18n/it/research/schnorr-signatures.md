# Firma di Schnorr 

---

Sono state proposte firme di Schnorr per Bitcoin. Inoltre sono stati utilizzati ampiamente in altri cryptocurrencies, come le monete Nxt e CryptoNote. Nel caso più semplice, un cryptosystem di firma Schnorr della ECDSA può essere descritto come segue:

1. \(y = xG\) dove \(y\) è il punto di chiave pubblica sulla curva, \(x\) è lo scalare privato, \(G\) è il generatore di curva.
2. \(r = kG\) dove \(r\) è il punto della curva risultante dalla moltiplicazione di \(k\), il nonce scalare, dal generatore.
3. \(h = H(M || r)\) dove \(H\) è una funzione hash protetta, \(M\) è il messaggio (di solito hash di 32 byte) e \(r\) Il punto codificato precedentemente descritto. \(||\) denota la concatenazione.
4. \(s = k - hx\) dove \(s\) è lo scalare indicato da \(k - hx\).
5. La firma è \((r,s)\), e la verifica è semplicemente \(H(M || r) == hQ + sG\).

Nel precedente, le moltiplicazioni di una lettera maiuscola (ad esempio, \ (kG \)) sono moltiplicazioni di punti da uno scalare e quindi  risultano sempre come un punto sulla curva. L'aggiunta di questi punti produce un altro punto. Le aggiunte e le moltiplicazioni degli scalari tra di loro sono le stesse della moltiplicazione regolare che si farebbe con un intero. È importante notare che moltiplicando un punto da uno scalare è considerato un passo irreversibile, poiché il calcolo dello scalare dal nuovo punto è predefinito al problema discreto di logaritmo.

FDa quanto sopra, è chiaro che \(r\) è un punto sulla curva, mentre \(s\) è uno scalare. Considerate il gruppo di segnalini rappresentati da \(x_{sum} = x_1 + ... + x_n\) con nonces \(k_{sum} = k_1 + ... + k_n\). La chiave pubblica per la somma scalare privata sarebbe: \(y = x_{sum} G\). La firma per queste somme (da tutti i partecipanti al gruppo) sarebbe: \(r' = k_{sum} G s' = k_{sum} - h x_{sum}\). Per generare questa firma tutti i partecipanti dovrebbero condividere la loro chiave privata e non accedere in precedenza. Vogliamo ovviamente evitare questo, per cui ciascun partecipante deve creare una firma parziale. \(r_n = k_1 G + ... + k_n G = r'\) (la somma dei punti nonce pubblici, che i partecipanti possono liberamente pubblicare individualmente) \(s_n = k_n - h x_n\). Sostituendolo nelle formule generali per le firme e utilizzando l'aggiunta di punti o scalari: \(r = r_n = r'\) (uguale a quello precedente) \(s = s_1 + ... + s_n = s'\) (semplice scalare Inoltre, deve essere vero che \((k_1 - h x_1) + ... + (k_n - h x_n) = s_1 + ... + s_n = s')\). Fare una firma m-of-n non è banale. È stato suggerito di utilizzare un tree di merkle contenente tutte le somme di chiave pubbliche possibili per i partecipanti \(m\) per questi casi, generando una firma di tipo \(log(n)\) sized signature [28].

---

## <i class="fa fa-book"></i> Riferimenti 

[^1]: Wuille P. 2015. [Tree signatures: Multisig on steroids using tree signatures](https://decred.org/research/wuille2015.pdf).
