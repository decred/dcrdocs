# Miglioramenti vari 

---

Come nel Bitcoin, il sovvenzionamento decade in modo esponenziale con l'altezza del blocco. Tuttavia, l'algoritmo di Decred, anche se estremamente semplice, interpola meglio questo decadimento nel tempo, in modo da non produrre scosse di mercato con minieventi di sovvenzione ripide simili a CryptoNote[^1]. Come PeerCoin[^2], la difficoltà PoW viene calcolata dalla media ponderata esponenzialmente delle differenze nei tempi precedenti del blocco. Tuttavia, questo calcolo viene interpolato anche nei periodi di finestra di difficoltà di Bitcoin. Il bug "timewarp" in Bitcoin viene corretto[^3], assicurando che ogni differenza di tempo di blocco sia incorporata nel calcolo del difficoltà.

Va notato anche che molti attacchi mining noti, come l'estrazione egoistica[^4] e l'estinzione ostinata[^5], non funzioneranno più vantaggiosamente in un sistema in cui esiste un efficace decentralizzazione dell'estrazione delle pinze e nessun minatore PoW-PoS collusione. Questo è semplicemente perché è impossibile generare estensioni segrete ai blocchi senza l'assistenza di miners of stake. La resilienza degli attacchi di mining descritti in precedenza e gli attacchi di miniera recentemente concepiti specifici per il nostro sistema, costituiranno una zona fruttuosa per la ricerca futura.

---

## <i class="fa fa-book"></i> Riferimenti 

[^1]: Buterin V. 2014. [A next-generation smart contract and decentralized application platform](https://decred.org/research/buterin2014.pdf).
[^2]: King S. and Nadal S. 2012. [PPCoin: Peer-to-peer crypto-currency with proof-of-stake](https://decred.org/research/king2012.pdf).
[^3]: ArtForz. 2011. [Re: Possible way to make a very profitable 50 plus-ish attack for pools?](https://decred.org/research/artforz2011.pdf)
[^4]: Eyal I. 2015. [The miner's dilemma](https://decred.org/research/eyal2015.pdf).
[^5]: Nayak K., Kumar S., Miller A., Shi E. 2015. [Stubborn mining: Generalizing selfish mining and combining with an eclipse attack](https://decred.org/research/nayak2015.pdf).
