# ![](../img/dcr-icons/BlockExplorer.svg){ .dcr-icon } Using the Block Explorer

---

## ![](../img/dcr-icons/Info.svg){ .dcr-icon } Overview

All blocks and transactions on the Decred blockchain are visible through the
use of the block explorer, [dcrdata](https://github.com/decred/dcrdata).

Public instances of dcrdata are available for the following networks:

- [mainnet](https://dcrdata.decred.org)
- [testnet](https://testnet.decred.org)

---

## ![](../img/dcr-icons/Blocks.svg){ .dcr-icon } Blocks

Blocks can be found by searching for their block height number, clicking on a
`Height` value from the home page, or from their `BlockHash` value. Older
blocks will have lower block numbers.

Each block is packed with information. There are two main sections inside a
block: 

1. **The Block Header**
    - This shows summary information about this specific block, as well as a
    link to the previous block in the chain.
2. **Transactions**
    - Consisting of:
        - The Proof-of-Work reward
        - The Treasury reward
        - Proof-of-Stake votes and rewards
        - Proof-of-Stake ticket purchases
        - All other regular transactions which transmit DCR across the network

---

## Block Headers

The following table should help explain what you'll see in the top section of
[dcrdata](https://dcrdata.decred.org). This is generally all information that's
also found inside a block header, although it adds some additional context.

For a more advanced description of block headers, see the Dev Docs on [Block Header Specifications](https://devdocs.decred.org/developer-guides/block-header-specifications/).

Value                    | Explanation
---                      | ---
`Block Hash`             | The unique hash of this specific block, which was found by the miner.
`Confirmations`          | The number of new blocks which follow this block in the chain.
`Size`                   | The size of the block (in kB).
`Height`                 | The height of the blockchain in which this block resides.
`Version`                | The version of the block header.
`Merkle Root`            | A hash value of all the transaction hashes and stake hashes (ticket purchases, votes, and revocations) included in this block.
`Stake Root`             | Originally, this was a hash value of all the stake related transaction hashes in this block. However, as of [DCP-0005](https://github.com/decred/dcps/blob/master/dcp-0005/dcp-0005.mediawiki), the stake hashes were moved into the Merkle Root, and the Stake Root was repurposed to house header commitments. These includes additional proofs and compact filters, which enable a more secure SPV mode for lightweight clients.
`Number of Transactions` | The number of regular transactions (DCR sent from one user to another).
`Block Reward`           | The amount of new DCR minted in this block.
`Time`                   | The time this block was created by a miner and was included in the blockchain.
`Nonce`                  | The value used by a miner to find a valid solution for this block.
`VoteBits`               | Used to signify the voting result on the previous block. This will either be 0 or 1. If 1, the previous block was approved by proof-of-stake voters. If 0, the previous block was disapproved by proof-of-stake voters and all non-stake transactions in the block were invalidated, including the newly generated block reward for the proof-of-work miner and the Decred Treasury.
`Final State`            | The hash value of the final state of the lottery used to determine which tickets were eligible to vote on the previous block, and thus be included in this block. It consists of the five winning ticket hashes, as well as the state of the pseudorandom number generator that was used to select those winning tickets from the live tickets pool.
`Voters`                 | The number of successful proof-of-stake votes cast in this block. The maximum value is 5. Tickets can fail to vote when called upon, but a minimum of 3 votes are required.
`Fresh Stake`            | The number of stake ticket purchases in this block, which will be added to the ticket pool.
`Revocations`            | The number of tickets that failed to vote and were revoked.
`PoolSize`               | The total number of active proof-of-stake tickets.
`Bits`                   | A compact version of the network difficulty at the time the block was mined.
`SBits`                  | The price of one proof-of-stake ticket.
`Stake Version`          | The stake version used for voting on the created block.
`Difficulty`             | The proof-of-work network difficulty.

## ![](../img/dcr-icons/Transactions.svg){ .dcr-icon } Transactions

This section lists all the transactions that were mined into this
block. Transactions are chosen from the network mempool in order of
highest fee first. All transactions in the block overview follow this
order: Standard transactions (peer-to-peer transfer), proof-of-stake
votes, proof-of-stake ticket purchases. The following sections will
review each type of transaction.

---

### Standard transactions

Here’s the information included in standard Decred transactions.

Value               | Explanation
---                 | ---
`Size`              | The size of the transaction in bytes.
`Fee rate`          | The rate of fees collected by the network (per kB).
`Received Time`     | The time the network confirmed the transaction.
`Mined Time`        | The time a miner included the transaction in a block.
`Included in Block` | The block number that the transaction became a part of.

Note `Received Time`, `Mined Time`, and `Included in Block` will not have a value until a miner validates the transaction and includes it in a Decred block. After being confirmed in a block, the transaction is considered complete.


---

### ![](../img/dcr-icons/TicketLive.svg){ .dcr-icon } Ticket purchases

For a ticket purchase (stake submission) there are a few differences
from a standard transaction shown.

Note the difference under details: The word `Ticket` appears above the
sender's wallet address on the left, and the words `Subsidy
Commitment` appear on the right. This particular user purchased a
stake ticket for 8.75411638 DCR and received change in the amount
of 7.15994209 DCR. The address listed on the left under `Ticket` is
the address that contains the funds used to purchase this
ticket. The first output on the right is the address that retains
voting rights for this specific ticket. The second output, `Subsidy
Commitment`, is the address where the reward will go. This is not yet
shown by the block explorer at this time. The third and final output
is the address where change for this transaction will be sent.

---

### ![](../img/dcr-icons/TicketVoted.svg){ .dcr-icon } Proof-of-stake votes

Note the identifying terms in the details section: `Vote`, `Stake
Base`, `Block Commitment`, and `Vote Bits`:

These keywords indicate that this transaction is a vote that was cast
from a proof-of-stake ticket holder. In this particular example, the
user had previously purchased a ticket for 8.99472311 DCR and was
sent 10.82959184 DCR after the vote was cast in this transaction.
