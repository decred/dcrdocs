# Atomic Swaps

---

## Overview

An Atomic Swap is a smart contract technology which makes possible to exchange coins from two different blockchains without having to trust any third party, for example a centralized exchange. 
For an atomic swap, a cryptocurrency must have the 'OP_CHECKLOCKTIMEVERIFY' opcode, which makes a timelock possible.
The other prerequisite is that they need to have the same hash function. That doesn't necessarily mean that they use the same hash functions for mining, but they need to have the same hash function available in their transaction scripting language.

---

## History of Atomic Swaps

Tier Nolan is considered the inventor of atomic swaps. The concept of decentralized exchanges were widely discussed already in 2012. [The first atomic swap](https://blog.decred.org/2017/09/20/On-Chain-Atomic-Swaps/) happened between Decred and Litecoin on September 20, 2017.

## Using Decred's atomicswap tool

To perform an atomic swap, one needs to use the necessary command line tools for both chains. Each blockchain has it’s own tools. 
This are the steps for an atomic swap:
 * One of the parties needs to *initiate* the process. This way a smart contract will be created. In this smart contract, a hash of a secret will be visible. The secret is only known by the initiator at this point. The secret is a very large number (32 byte). 
 * The other party is *auditing* the contract. The address (their receiving address), the amount and the locktime should be correct
 * If the audit was successful, he or she will *participate* in the contract.
 * The creator of the original contract also needs to *audit* the second contract, that was created with the *participate* command on the other chain. 
 * If the address, the amount, the timelock and the secret hash is correct, the initiator will *redeem* the money the second party paid in by participating.
 * After redeeming, the other party can *extract the secret* from the original contract. This way he or she can also withdraw the money, thus the exchange is completed.

Atomic swaps don't only operate on-chain. A side-channel is required. The Lightning Network can be used as a side-channel. However, other side-channels could do this work as well. For an atomic swap to happen, the users need to exchange information in some way. This could be done in a text-chat as well, or any other form of written communication.

## Use cases
 * Atomic Swap can create the possibility to the widespread adoption of decentralized exchanges.
 * 2 parties could exchange currencies without any exchange involved. 

## Further Information

For more technical information about Atomic Swaps, visit Decred's [atomicswap Github repo](https://github.com/decred/atomicswap).


