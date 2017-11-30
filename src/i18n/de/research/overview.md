# <i class="fa fa-info-circle"></i> Overview 

---

Distributed timestamping protocols were first applied to decentralizing a financial network in the ground-breaking paper on Bitcoin by Nakamoto[^1]. The field has seen explosive research follow-up from both amateurs and professionals, competing to offer extensions, adjustments, improvements, and refinements of the existing protocol. Notable implementations of new ideas include Ethereum[^2], which extended scripting, CryptoNote[^3], which refined privacy, and Sidechains[^4], which investigated two-way pegs with 1:1 Bitcoin tokens. These protocols all utilize proof-of-work (PoW) as originally described in the Bitcoin whitepaper.

A common extension to the Bitcoin protocol modifies the consensus mechanism to either completely or partially use proof-of-stake (PoS), or the use of one's stake (tokens) rather than one's computational power to participate in the timestamping process. The first proof-of-stake blockchain based on the Bitcoin protocol was implemented in 2012 by King and Nadal[^5], and includes both PoW and PoS that gradually skew towards complete PoS over time. Criticisms of pure PoS consensus systems have themselves been abundant[^6] [^7], with the most vehement opposition coming from those working with purely PoW blockchains. The most common argument against PoS for distributed timestamping is "nothing-at-stake" or "costless simulation", describing the systematic instability resulting from stakeholders being able to generate alternatively timestamped histories with no cost to themselves.

Despite the controversy, it is apparent that systems with a PoS overlay dependent on a PoW timestamping system may be able to independently achieve consensus. This is mathematically explored by Bentov and colleagues[^8] in a paper on their scheme, proof-of-activity (PoA), and appears to be a viable extension to the PoW protocols that may enable some interesting new properties. A similar design called MC2 was earlier proposed by Mackenzie in 2013[^9]. Here we describe the construction and implementation of a similar consensus system that we have named "Decred".

Research work in Decred is currently organized around the following subsections:

* [Hybrid Design](hybrid-design.md)
* [Decentralized Stake Pooling](decentralized-stake-pooling.md)
* [Elliptic Curve Signature Algorithms](elliptic-curve-signature-algorithms.md)
* [BLAKE-256 Hash Function](blake-256-hash-function.md)
* [Script Extensions](script-extensions.md)
* [Signature Script Isolation and Fraud Proofs](signature-script-isolation-and-fraud-proofs.md)
* [Transaction Extensions](transaction-extensions.md)
* [Schnorr Signatures](schnorr-signatures.md)
* [Miscellaneous Improvements](miscellaneous-improvements.md)

## <i class="fa fa-book"></i> References 

[^1]: Nakamoto S. 2008. [Bitcoin: A peer-to-peer electronic cash system](https://decred.org/research/nakamoto2008.pdf).
[^2]: Buterin V. 2014. [A Next-generation smart contract and decentralized application platform](https://decred.org/research/buterin2014.pdf).
[^3]: von Saberhagen N. 2013. [CryptoNote v2.0](https://decred.org/research/saberhagen2013.pdf).
[^4]: Back A., Corallo M., Dashjr L., Friedenbach M., Maxwell G., Miller A., Poelstra A., Timon A., Wuille P. 2014. [Enabling Bitcoin innovations with pegged sidechains](https://decred.org/research/back2014.pdf).
[^5]: King S. and Nadal S. 2012. [PPCoin: Peer-to-peer crypto-currency with proof-of-stake](https://decred.org/research/king2012.pdf).
[^6]: Bentov I., Gabizon A., Mizrahi A. 2015. [Cryptocurrencies without proof-of-work](https://decred.org/research/bentov2015.pdf).
[^7]: Poelstra A. 2015. [On stake and consensus](https://decred.org/research/poelstra2015.pdf).
[^8]: Bentov I., Lee C., Mizrahi A., Rosenfeld M. 2014. [Proof-of-activity: Extending Bitcoin's proof-of-work via proof-of-stake](https://decred.org/research/bentov2014.pdf).
[^9]: Mackenzie A. 2013. [MEMCOIN2: A hybrid proof-of-work, proof-of-stake crypto-currency](https://decred.org/research/mackenzie2013.pdf).
