# <i class="fa fa-cubes"></i> blocchi 

---

#### 1. Può un blocco diventare orfano dopo essere stato confermato più volte? 

Solo se c'è un reorg sufficientemente lungo[^8918]. Affinché ciò avvenga, è necessario un maggiore potere hash   sull'altro lato di una fork rispetto  al potere hash che sta lavorando sulla migliore catena  corrente.

---

#### 2. Possiamo rimuovere l'esploratore del blocco testnet dato che uno per il mainnet è disponibile?

Testnet continuerà ad essere un punto di prova per le nuove funzionalità, per cui è opportuno mantenere l'esploratore del blocco di testnet[^9621] .

---

#### 3. Che cosa significa "[INF] CHAN: Aggiunta di orfani"? 

Significa solo che  un blocco di cui non  hai il ""genitore"  è stato ricevuto[^14660]. Praticamente accade sempre quando si
 riavvia `dcrd` a causa del modo in cui funziona la sincronizzazione. Ancora stai sincronizzando fino all'ultimo blocco, ma il peer remoto, che è davanti a te, ha inviato una notifica che è arrivato un nuovo blocco, uno per il quale non hai ancora il "genitore".

Rather than ignoring it, once you are sufficiently close to being synced, it essentially saves them for later so once you do have the parent blocks those newer blocks automatically get connected.

---

#### 4. Dovrei scaricare nuovamente il blockchain con ogni nuova versione del software? 

Non dovresti mai scaricare nuovamente la catena[^14788] in un aggiornamento, a meno che non sia solo un cambiamento enorme, dove ha senso cominciare. Tipicamente, però, dovrebbe migrare le cose in modo che funziona semplicemente.

---

#### 5. Qual è il numero di blocco genesi? 

Il blocco di genesi[^16987] iè l'altezza di blocco 0 (blocco numero 0). Ogni blocco successivo aumenta di 1.

---

#### 6. Cosa significano i messaggi "[INF] CHAN: FORK: Block 000..."? 

Ecco un esempio:

```no-highlight
[INF] CHAN: FORK: Block 0000000000001aedcf1b82b087a1d05ef787550174da1012e473e8ee8c178937 (height 17879) forks the chain at height 17878/block 000000000000150f863186cab6ef5c433bcc155d2f683394f8e65cb037f80b16, but does not cause a reorganize
```

Ciò significa che due minatori hanno trovato una soluzione a un blocco intorno allo stesso tempo e entrambi hanno inviato i loro blocchi risolti alla rete[^17791]. Both are equally valid, however your node saw the other solution ([000000000000147d33cde5e9823122924fb43405418712720eb6457956d8edbb](https://mainnet.decred.org/block/000000000000147d33cde5e9823122924fb43405418712720eb6457956d8edbb)) prima, quindi dal punto di vista del nodo, il nuovo blocco ([0000000000001aedcf1b82b087a1d05ef787550174da1012e473e8ee8c178937](https://mainnet.decred.org/block/0000000000001aedcf1b82b087a1d05ef787550174da1012e473e8ee8c178937)) era su una catena laterale.

Poiché richiede tempo per trasmettere blocchi, altri nodi avrebbero potuto vedere 0000000000001aedcf1b82b087a1d05ef787550174da1012e473e8ee8c178937 prima che significa per loro l'altra soluzione che il nodo visto prima ([000000000000147d33cde5e9823122924fb43405418712720eb6457956d8edbb](https://mainnet.decred.org/block/000000000000147d33cde5e9823122924fb43405418712720eb6457956d8edbb)) was the one on the side chain.

Questo è totalmente normale e si risolve ogni volta che viene trovato il blocco successivo in quanto definirà la catena più lunga e qualunque soluzione non sia stata costruita sarà orfana.

In questo caso, il blocco #17880 ([000000000000154c6091747245e3c2620447c71b346aed09548e74b4543d0d66](https://mainnet.decred.org/block/000000000000154c6091747245e3c2620447c71b346aed09548e74b4543d0d66)) ha finito per costruzione in cima 000000000000147d33cde5e9823122924fb43405418712720eb6457956d8edbb, quindi l'altra soluzione ([0000000000001aedcf1b82b087a1d05ef787550174da1012e473e8ee8c178937](https://mainnet.decred.org/block/0000000000001aedcf1b82b087a1d05ef787550174da1012e473e8ee8c178937)) era orfano.

---

## <i class="fa fa-book"></i> Sorgenti 

[^8918]: Decred Forum, [Post 8,918](https://forum.decred.org/threads/557/#post-8918)
[^9621]: Decred Forum, [Post 9,621](https://forum.decred.org/threads/651/#post-9621)
[^14660]: Decred Forum, [Post 14,660](https://forum.decred.org/threads/1333/#post-14660)
[^14788]: Decred Forum, [Post 14,788](https://forum.decred.org/threads/1336/#post-14788)
[^16987]: Decred Forum, [Post 16,987](https://forum.decred.org/threads/1852/#post-16987)
[^17791]: Decred Forum, [Post 17,791](https://forum.decred.org/threads/2925/#post-17791)
