# <i class="fa fa-cubes"></i> Χρησιμοποιώντας τον Εξερευνητή Μπλοκ

---

## <i class="fa fa-info-circle"></i> Επισκόπηση 

A block explorer based on
[Insight](https://github.com/bitpay/insight-ui) is provided for the
Decred network. All blocks and transactions in the Decred blockchain
are visible through use of this block explorer, located at
[`https://mainnet.decred.org`](https://mainnet.decred.org) and
[`https://testnet.decred.org`](https://testnet.decred.org) for the
testnet wallet.  Below is a quick review of some of the information on
it.

Επιλογή         | Επεξήγηση
---            | ---
`Ύψος`       | Ο αριθμός των μπλοκ.
`Ηλικία`          | Πριν πόσο καιρό προστέθηκε το block στο blockchain.
`Συναλλαγές` | Ο αριθμός των συναλλαγών που περιλαμβάνονται στο block.
`Ψήφοι`        | Ο αριθμός των proof-of-stake ψήφων που περιλαμβάνονται στο block.
`Φρέσκο Κλείδωμα Νομισμάτων`  | Ο αριθμός των νέων εισιτηρίων που αγοράστηκαν σε αυτό το block.
`Μέγεθος`         | Το μέγεθος (σε bytes) του block.

Under `Latest Transactions`, you can see the transaction ID (txid) and
the value (in DCR) transmitted across the network.

---

## <i class="fa fa-cube"></i> Μπλοκ 

Blocks can be found by searching for their block height number,
clicking on a `Height` value from the home page, or from their
`BlockHash` value. Older blocks will have lower block numbers. The top
half of a block overview shows relevant information about this
specific block. This information includes: the block height, the block
hash, and several key network parameters, described below:

Επιλογή                   | Επεξήγηση
---                      | ---
`Αριθμός Συναλλαγών` | Ο αριθμός των τυποποιημένων συναλλαγών (απεσταλμένα DCR από έναν χρήστη σε έναν άλλον).
`Ύψος`                 | Το ύψος του blockchain στο οποίο βρίσκεται αυτό το block.
`Ανταμοιβή Μπλοκ`           | Η ποσότητα νέου DCR που κόπηκε σε αυτό το block.
`Timestamp`              | Ο χρόνος που δημιουργήθηκε αυτό το block από έναν miner και συμπεριλήφθηκε στο blockchain.
`Merkle Root`            | Μια τιμή hash όλων των hashes συναλλαγών που περιλαμβάνονται σε αυτό το block.
`Stake Root`             | A hash value of all the stake related transaction hashes in this block. This includes ticket purchases, votes, and ticket revocations.
`VoteBits`               | (1) Block was approved by proof-of-stake voters. (2) Block was vetoed by proof-of-stake voters and all non-stake transactions in the block were invalidated, along with the proof-of-work miner and development subsidy.
`Final State`            | The final state of the pseudo random number generator used for ticket selection.
`Voters`                 | The number of successful proof-of-stake votes cast in this block. The maximum value is 5.
`Fresh Stake`            | The number of stake ticket purchases confirmed in this block.
`Revocations`            | Ο αριθμός των εισιτηρίων που δεν κατάφεραν να ψηφίσουν και ανακλήθηκαν.
`PoolSize`               | Ο συνολικός αριθμός των ενεργών proof-of-stake εισιτηρίων.
`Difficulty`             | Η δυσκολία δικτύου proof-of-work.
`SBits`                  | Η τιμή ενός proof-of-stake εισιτηρίου.
`Bits`                   | A compact version of the network difficulty at the time the block was mined.
`Size`                   | Το μέγεθος του block (σε bytes).
`Version`                | Η έκδοση του block.
`Nonce`                  | Η τιμή που χρησιμοποιήθηκε από έναν miner για να βρει τη σωστή λύση για αυτό το block.

## <i class="fa fa-exchange"></i> Συναλλαγές 

This section lists all the transactions that were mined into this
block. Transactions are chosen from the network mempool in order of
highest fee first. All transactions in the block overview follow this
order: Standard transactions (peer-to-peer transfer), proof-of-stake
votes, proof-of-stake ticket purchases. The following sections will
review each type of transaction.

---

### Τυποποιημένες συναλλαγές

Ακολουθούν οι πληροφορίες που περιέχονται στις τυπικές συναλλαγές του Decred.

Επιλογή              | Επεξήγηση
---                 | ---
`Size`              | Το μέγεθος της συναλλαγής σε bytes.
`Fee rate`          | Το ποσοστό των τελών που εισπράττει το δίκτυο (ανά kB).
`Received Time`     | Ο χρόνος που το δίκτυο επιβεβαίωσε τη συναλλαγή.
`Mined Time`        | Ο χρόνος που ένας miner περιέλαβε τη συναλλαγή σε ένα block.
`Included in Block` | Ο αριθμός του block στο οποίο η συναλλαγή πήρε μέρος.

Note `Received Time`, `Mined Time`, and `Included in Block` will not have a value until a miner validates the transaction and includes it in a Decred block. After being confirmed in a block, the transaction is considered complete.


---

### Αγορές εισιτηρίου

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

### Ψήφοι proof-of-stake

Note the identifying terms in the details section: `Vote`, `Stake
Base`, `Block Commitment`, and `Vote Bits`:

These keywords indicate that this transaction is a vote that was cast
from a proof-of-stake ticket holder. In this particular example, the
user had previously purchased a ticket for 8.99472311 DCR and was
sent 10.82959184 DCR after the vote was cast in this transaction.
