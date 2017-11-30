# <i class="fa fa-info-circle"></i> Panoramica 

---

I protocolli di timestamping distribuiti sono stati applicati per la decentralizzazione di una rete finanziaria nella carta da parati di Bitcoin di Nakamoto[^1]. Il campo ha visto esplosivi follow-up di ricerca da amatori e professionisti, in concorrenza per offrire estensioni, aggiustamenti, miglioramenti e perfezionamenti del protocollo esistente. Implementazioni notevoli di nuove idee includono Ethereum[^2], che ha esteso lo scripting, CryptoNote[^3], che ha raffinato la privacy e Sidechains[^4], che hanno esaminato i pioli bidirezionali con token Bitcoin 1: 1. Questi protocolli utilizzano tutte le prove di lavoro (PoW) come descritto in origine nel white paper di Bitcoin.

Un'estensione comune al protocollo di Bitcoin modifica il meccanismo di consenso per utilizzare completamente o parzialmente il punteggio di prova (PoS) o l'utilizzo di un proprio giacimento (token) piuttosto che il potere computazionale di un partecipante al processo di timestamping. Il primo blockchain basato sul protocollo Bitcoin è stato implementato nel 2012 da King e Nadal[^5], e include sia PoW che PoS che gradualmente si avvicinano verso il PoS completo nel tempo. Le critiche dei sistemi di consenso puro di PoS sono stati abbondanti[^6] [^7], con l'opposizione più forte proveniente da coloro che lavorano con blocchi puramente PoW. L'argomento più comune contro i PoS per il timestamping distribuito è "niente a palo" o "simulazione senza spese", che descrive l'instabilità sistematica risultante dalle parti interessate in grado di generare in alternativa storie timestamped senza costi per se stessi.

Nonostante la controversia, è evidente che i sistemi con sovrapposizione PoS dipendenti da un sistema di timestamping PoW potrebbero essere in grado di raggiungere in modo indipendente il consenso. Questo è esplorato matematicamente da Bentov e dai colleghi[^8] in un documento sul loro schema, prova di attività (PoA), e sembra un'estensione valida ai protocolli PoW che potrebbero consentire alcune interessanti nuove proprietà. Un progetto simile denominato MC2 è stato precedentemente proposto da Mackenzie nel 2013[^9]. Qui descriviamo la costruzione e l'implementazione di un simile sistema di consenso che abbiamo chiamato "Decred".

Il lavoro di ricerca di Decred è attualmente organizzato attorno alle seguenti sottosezioni:

* [Hybrid Design](hybrid-design.md)
* [Decentralized Stake Pooling](decentralized-stake-pooling.md)
* [Elliptic Curve Signature Algorithms](elliptic-curve-signature-algorithms.md)
* [BLAKE-256 Hash Function](blake-256-hash-function.md)
* [Script Extensions](script-extensions.md)
* [Signature Script Isolation and Fraud Proofs](signature-script-isolation-and-fraud-proofs.md)
* [Transaction Extensions](transaction-extensions.md)
* [Schnorr Signatures](schnorr-signatures.md)
* [Miscellaneous Improvements](miscellaneous-improvements.md)

## <i class="fa fa-book"></i> Riferimenti 

[^1]: Nakamoto S. 2008. [Bitcoin: A peer-to-peer electronic cash system](https://decred.org/research/nakamoto2008.pdf).
[^2]: Buterin V. 2014. [A Next-generation smart contract and decentralized application platform](https://decred.org/research/buterin2014.pdf).
[^3]: von Saberhagen N. 2013. [CryptoNote v2.0](https://decred.org/research/saberhagen2013.pdf).
[^4]: Back A., Corallo M., Dashjr L., Friedenbach M., Maxwell G., Miller A., Poelstra A., Timon A., Wuille P. 2014. [Enabling Bitcoin innovations with pegged sidechains](https://decred.org/research/back2014.pdf).
[^5]: King S. and Nadal S. 2012. [PPCoin: Peer-to-peer crypto-currency with proof-of-stake](https://decred.org/research/king2012.pdf).
[^6]: Bentov I., Gabizon A., Mizrahi A. 2015. [Cryptocurrencies without proof-of-work](https://decred.org/research/bentov2015.pdf).
[^7]: Poelstra A. 2015. [On stake and consensus](https://decred.org/research/poelstra2015.pdf).
[^8]: Bentov I., Lee C., Mizrahi A., Rosenfeld M. 2014. [Proof-of-activity: Extending Bitcoin's proof-of-work via proof-of-stake](https://decred.org/research/bentov2014.pdf).
[^9]: Mackenzie A. 2013. [MEMCOIN2: A hybrid proof-of-work, proof-of-stake crypto-currency](https://decred.org/research/mackenzie2013.pdf).
