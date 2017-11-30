# <i class="fa fa-cubes"></i> Using the Block Explorer 

---

## <i class="fa fa-info-circle"></i> Overview 

A block explorer based on
[Insight](https://github.com/bitpay/insight-ui) is provided for the
Decred network. All blocks and transactions in the Decred blockchain
are visible through use of this block explorer, located at
[`https://mainnet.decred.org`](https://mainnet.decred.org) and
[`https://testnet.decred.org`](https://testnet.decred.org) for the
testnet wallet.  Below is a quick review of some of the information on
it.

Option         | Explanation
---            | ---
`Height`       | The block number.
`Age`          | How long ago the block was added to the blockchain.
`Transactions` | The number of transactions included in the block.
`Votes`        | The number of proof-of-stake votes included in the block.
`Fresh Stake`  | The number of new tickets purchased in this block.
`Size`         | The size (in bytes) of the block.

Under `Latest Transactions`, you can see the transaction ID (txid) and
the value (in DCR) transmitted across the network.

---

## <i class="fa fa-cube"></i> Blocks 

Blocks can be found by searching for their block height number,
clicking on a `Height` value from the home page, or from their
`BlockHash` value. Older blocks will have lower block numbers. The top
half of a block overview shows relevant information about this
specific block. This information includes: the block height, the block
hash, and several key network parameters, described below:

Option                   | Explanation
---                      | ---
`Number of Transactions` | The number of standard transactions (DCR sent from one user to another).
`Height`                 | The height of the blockchain in which this block resides.
`Block Reward`           | The amount of new DCR minted in this block.
`Timestamp`              | The time this block was created by a miner and was included in the blockchain.
`Merkle Root`            | A hash value of all the transaction hashes included in this block.
`Stake Root`             | A hash value of all the stake related transaction hashes in this block. This includes ticket purchases, votes, and ticket revocations.
`VoteBits`               | (1) Block was approved by proof-of-stake voters. (2) Block was vetoed by proof-of-stake voters and all non-stake transactions in the block were invalidated, along with the proof-of-work miner and development subsidy.
`Final State`            | The final state of the pseudo random number generator used for ticket selection.
`Voters`                 | The number of successful proof-of-stake votes cast in this block. The maximum value is 5.
`Fresh Stake`            | The number of stake ticket purchases confirmed in this block.
`Revocations`            | The number of tickets that failed to vote and were revoked.
`PoolSize`               | The total number of active proof-of-stake tickets.
`Difficulty`             | The proof-of-work network difficulty.
`SBits`                  | The price of one proof-of-stake ticket.
`Bits`                   | A compact version of the network difficulty at the time the block was mined.
`Size`                   | The size of the block (in bytes).
`Version`                | The version of the block.
`Nonce`                  | The value used by a miner to find the correct solution for this block.

## <i class="fa fa-exchange"></i> Transactions 

This section lists all the transactions that were mined into this
block. Transactions are chosen from the network mempool in order of
highest fee first. All transactions in the block overview follow this
order: Standard transactions (peer-to-peer transfer), proof-of-stake
votes, proof-of-stake ticket purchases. The following sections will
review each type of transaction.

---

### Standard transactions

Here’s the information included in standard Decred transactions.

Option              | Explanation
---                 | ---
`Size`              | The size of the transaction in bytes.
`Fee rate`          | The rate of fees collected by the network (per kB).
`Received Time`     | The time the network confirmed the transaction.
`Mined Time`        | The time a miner included the transaction in a block.
`Included in Block` | The block number that the transaction became a part of.

Note `Received Time`, `Mined Time`, and `Included in Block` will not have a value until a miner validates the transaction and includes it in a Decred block. After being confirmed in a block, the transaction is considered complete.


---

### Ticket purchases

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

### Proof-of-stake votes

Note the identifying terms in the details section: `Vote`, `Stake
Base`, `Block Commitment`, and `Vote Bits`:

These keywords indicate that this transaction is a vote that was cast
from a proof-of-stake ticket holder. In this particular example, the
user had previously purchased a ticket for 8.99472311 DCR and was
sent 10.82959184 DCR after the vote was cast in this transaction.
