# <img class="dcr-icon" src="/img/dcr-icons/Code.svg" /> Signature Script Isolation and Fraud Proofs 

---

To prevent transaction malleability, the ability to generate a transaction with the same input references and outputs and yet a different transaction ID, input scripts have been removed from the calculation of the transaction hash. The origins of this modification have been controversial, although it appears to have been implemented in both CryptoNote coins and sidechains in the past[^1] [^2]. After the activation of the “Segregated Witness” [^3] soft fork, it is implemented in Bitcoin as well. As in the Elements sidechains implementation, commitments to the witness data are included in the merkle tree of the block[^2]. In addition, fraud proofs, as suggested for Bitcoin's soft fork[^3], are set by miners and also committed to as part of the data in the merkle tree.

If DCP-0005 [^4] activates, Decred will include inclusion and fraud proofs in the block header. The name of the field will be CommitmentRoot, and it will take the place of the StakeRoot, which will be rolled into the Merkle root. Each leaf of the Merkle tree is intended to be a commitment to some arbitrary data which will typically be some structure that employs techniques that also allow compact fraud and inclusion proofs to be constructed such as Fenwick trees, Golomb-Rice filters, and additional Merkle trees. The number of short proofs will be extensible.

---

## :fa-book: References

[^1]: von Saberhagen N. 2013. [CryptoNote v2.0](https://decred.org/research/saberhagen2013.pdf).
[^2]: Maxwell G. 2015. [Bringing new elements to Bitcoin with sidechains](https://decred.org/research/maxwell2015.pdf).
[^3]: Wuille P. 2015. [Segregated witness for Bitcoin](https://prezi.com/lyghixkrguao/segregated-witness-and-deploying-it-for-bitcoin/).
