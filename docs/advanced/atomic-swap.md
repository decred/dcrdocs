# Atomic Swaps

## Overview

A cross-chain swap is a trade between two users of different cryptocurrencies. For example, one party may send Decred to a second party's Decred address, while the second party would send Bitcoin to the first party's Bitcoin address. However, as the blockchains are unrelated and transactions can not be reversed, this provides no protection against one of the parties never honoring their end of the trade. One common solution to this problem is to introduce a mutually-trusted third party for escrow. An atomic cross-chain swap solves this problem without the need for a third party.

Atomic swaps involve each party paying into a contract transaction, one contract for each blockchain. The contracts contain an output that is spendable by either party, but the rules required for redemption are different for each party involved.

One party (called counterparty 1 or the initiator) generates a secret and pays the intended trade amount into a contract transaction. The contract output can be redeemed by the second party (called counterparty 2 or the participant) as long as the secret is known. If a period of time (typically 48 hours) expires after the contract transaction has been mined but has not been redeemed by the participant, the contract output can be refunded back to the initiator's wallet.


## Prerequisites

In order to perform an on-chain atomic swap between 2 cryptocurrencies, there are several prerequisites. Both chains must support:

 * Branched transaction scripts
 * The same hash algorithm in both chains’ transaction scripts
 * Signature checks in transaction scripts
 * CheckLockTimeVerify or CheckSequenceVerify (“CLTV” and “CSV” for short) in transaction scripts

The hash function in the scripting language is different from the function used for mining. For example, Decred supports blake256, sha256, ripemd160, and sha1.
The CLTV and the CSV is for performing a timelock.



## Decred-compatible cross-chain atomic swapping

 * Bitcoin (Bitcoin Core)
 * Bitcoin Cash (Bitcoin ABC, Bitcoin Unlimited, Bitcoin XT)
 * Decred (dcrwallet)
 * Litecoin (Litecoin Core)
 * Monacoin (Monacoin Core)
 * Particl (Particl Core)
 * Qtum (Qtum Core)
 * Vertcoin (Vertcoin Core)
 * Viacoin (Viacoin Core)
 * Zcoin (Zcoin Core)

External support exists for the following coins and wallets:

 * ThreeFold Token (ThreeFold Chain)

The list of compatible currencies may change over time.


## Using Decred's atomicswap tool

To perform an atomic swap, one needs to use the necessary command line tools for both chains. Each blockchain has it’s own tools. 
These are the steps for an atomic swap:

 * One of the parties needs to *initiate* the process. This way a smart contract will be created. In this smart contract, a hash of a secret will be visible. The secret is only known by the initiator at this point. The secret is a very large number (32 bytes). 
 * The other party is *auditing* the contract. The address (their receiving address), the amount and the locktime should be correct
 * If the audit was successful, he or she will *participate* in the contract.
 * The creator of the original contract also needs to *audit* the second contract, that was created with the *participate* command on the other chain. 
 * If the address, the amount, the timelock and the secret hash is correct, the initiator will *redeem* the money the second party paid in by participating.
 * After redeeming, the other party can *extract the secret* from the original contract. This way he or she can also withdraw the money, thus the exchange is completed.

Atomic swaps don't only operate on-chain. A side-channel is required. The Lightning Network can be used as a side-channel. However, other side-channels could do this work as well. For an atomic swap to happen, the users need to exchange information in some way. This could be done in a text-chat as well, or any other form of written communication.


## Use cases

On-chain atomic swaps are not useful in all cases where users want to perform an exchange. This process is well-suited to larger trades that do not require a particularly low latency or high frequency. Since the process involves on-chain transactions, the speed of the process is bound by the mining of blocks, which can take roughly an hour in a worst-case scenario with Bitcoin. Additionally, users must pay transaction fees for both the swap transaction and the redeem transaction on each chain, which can have a non-trivial cost with Bitcoin.


## Privacy

Since these swaps are on-chain, there are some privacy implications that users should be aware of. The swap transactions on each chain include the same hashed value, meaning that anyone doing passive surveillance of the corresponding blockchains can link the coins on one side of the swap to the coins on the other side. This is a different threat model than typical centralized exchanges, where the exchange is required by nation state regulations to retain records of user identities and activity. Instead of having to request data from an exchange, interested parties can follow the coins from one chain to the other. However, despite the ease of determining provenance of the coins across chains, there is no associated identity data available on the counterparties.


## Further Information

For more technical information about Atomic Swaps, visit Decred's [atomicswap Github repo](https://github.com/decred/atomicswap).
[Atomic Swaps on Decred's blog](https://blog.decred.org/2017/09/20/On-Chain-Atomic-Swaps/)


