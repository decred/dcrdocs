# Atomic Swaps

---

## Overview

An Atomic Swap is a smart contract technology which makes possible to exchange coins from two different blockchains without having to trust any third party, for example a centralized exchange.
The smart contracts used in this case are not necessarily Turing-complete smart contracts (like in the system of Ethereum).
Smart contracts also exist in the system of Bitcoin or Decred, or almost any other cryptocurrency.
The scripting languages of these cryptocurrencies are not Turing-complete, which is intentionally designed like this to avoid loops, which would create security vulnerabilities.  
For an atomic swap, a cryptocurrency must have the 'OP_CHECKLOCKTIMEVERIFY' opcode, which makes a timelock possible.
The other prerequisite is that they need to have the same hash function.

---

## History of Atomic Swaps

Tier Nolan is considered the inventor of atomic swaps. The concept of decentralized exchanges were widely discussed already in 2012. [The first atomic swap](https://blog.decred.org/2017/09/20/On-Chain-Atomic-Swaps/) happened between Decred and Litecoin on September 20, 2017.

## Using Decred's atomicswap tool

To perform an atomic swap, one needs to use the necessary command line tools for both chains. Each blockchain has it’s own tools. 
One of the parties needs to *initiate* the process. This way a smart contract will be created. In this smart contract, a hash of a secret will be visible. The secret is only known by the initiator at this point. 
The other party is *auditing* the contract. If the address, the amount and the locktime is correct, he or she will *participate* in the contract.
After this, the creator of the original contract also needs to *audit* the second contract, that was created with the *participate* command on the other chain. If the address, the amount, the timelock and the secret hash is correct, the initiator will *redeem* the money the second party paid in by participating.
After redeeming, the other party can *extract the secret* from the original contract. This way he or she can also withdraw the money, thus the exchange is completed.

Atomic Swap will create the possibility to the widespread adoptin of decentralized exchanges. Atomic swaps don't only operate on-chain. A side-channel is required. Most likely, the Lightning Network will be the most widely used side-channel. However, other side-channels could do this work as well. For an atomic swap to happen, the users need to exchange information in some way. This could be done in a text-chat as well, or any other form of written communication.

## Further Information

For more technical information about Atomic Swaps, visit Decred's [atomicswap Github repo](https://github.com/decred/atomicswap).

