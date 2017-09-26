# Decentralized Stake Pooling 

---

One issue arising from previous PoS designs is how to perform pooling in PoS mining analogous to PoW mining pooling.

Decred solves this problem by allowing multiple inputs into a ticket purchase transaction and committing to the UTXO subsidy amount for each input proportionally, while also committing to a new output public key or script for these proportional rewards. The subsidy is then given to those generating the ticket in a trustless manner, and the ticket can be signed round robin before submission to the network. Importantly, control over the production of the vote itself is given to another public key or script which can not manipulate the subsidy given to the recipients. Production of the vote in a distributed manner can be achieved by using a script in the ticket that allows for multiple signers.
