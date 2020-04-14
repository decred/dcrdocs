# <img class="dcr-icon" src="/img/dcr-icons/Code.svg" /> Signature Script Isolation and Fraud Proofs

---

To prevent transaction malleability, the ability to generate a transaction with the same input references and outputs and yet a different transaction ID, input scripts have been removed from the calculation of the transaction hash. The origins of this modification have been controversial, although it appears to have been implemented in both CryptoNote coins and sidechains in the past[^1] [^2]. After the activation of the “Segregated Witness” [^3] soft fork, it was implemented in Bitcoin as well. As in the Elements sidechains implementation, commitments to the witness data are included in the Merkle tree of the block[^2]. In addition, fraud proofs, as suggested for Bitcoin's soft fork[^3], are set by miners and also committed to as part of the data in the Merkle tree. 

---

## <img class="dcr-icon" src="/img/dcr-icons/Sources.svg" /> References

[^1]: von Saberhagen N. 2013. [CryptoNote v2.0](https://decred.org/research/saberhagen2013.pdf).
[^2]: Maxwell G. 2015. [Bringing new elements to Bitcoin with sidechains](https://decred.org/research/maxwell2015.pdf).
[^3]: Wuille P. 2015. [Segregated witness for Bitcoin](https://prezi.com/lyghixkrguao/segregated-witness-and-deploying-it-for-bitcoin/).
