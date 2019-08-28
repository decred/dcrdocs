# Atomic Swaps

## Overview

An Atomic Swap is a smart contract technology which makes possible to exchange coins from two different blockchains without having to trust any third party, for example a centralized exchange.

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

The list of compatible currencies can be seen in the [GitHub repo](https://github.com/decred/atomicswap)


## Use cases

On-chain atomic swaps are not useful in all cases where users want to perform an exchange. This process is well-suited to larger trades that do not require a particularly low latency or high frequency. Since the process involves on-chain transactions, the speed of the process is bound by the mining of blocks, which can take roughly an hour in a worst-case scenario with Bitcoin. Additionally, users must pay transaction fees for both the swap transaction and the redeem transaction on each chain, which can have a non-trivial cost with Bitcoin.


## Privacy

Since these swaps are on-chain, there are some privacy implications that users should be aware of. The swap transactions on each chain include the same hashed value, meaning that anyone doing passive surveillance of the corresponding blockchains can link the coins on one side of the swap to the coins on the other side. This is a different threat model than typical centralized exchanges, where the exchange is required by nation state regulations to retain records of user identities and activity. Instead of having to request data from an exchange, interested parties can follow the coins from one chain to the other. However, despite the ease of determining provenance of the coins across chains, there is no associated identity data available on the counterparties.


## Further Information

For more technical information about Atomic Swaps, visit Decred's atomicswap [Github repo](https://github.com/decred/atomicswap).
You can also read about Atomic Swaps on [Decred's blog](https://blog.decred.org/2017/09/20/On-Chain-Atomic-Swaps/).


