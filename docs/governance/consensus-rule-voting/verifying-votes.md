# <img class="dcr-icon" src="/img/dcr-icons/TicketVoted.svg" /> Verifying Votes

When a proof-of-stake ticket is called to vote on-chain, the voting preference of that ticket is permanently recorded on the Decred blockchain.
It is possible to verify the voting preference of a ticket using either the Decred block explorer or the Command Line Interface (CLI).

---

## Step one: Find the vote transaction ID

Every proof-of-stake vote creates an on-chain transaction which includes the details of how the ticket is voting on the available agendas.
Finding the ID of this transaction is the first step towards verifying how the ticket voted.

### Decrediton

Vote transactions can be found in Decrediton by opening the History section of the Transactions tab.
This will display a list of all transactions involving the current wallet, but it is possible to filter the list  to show only vote transactions.
Clicking on a vote transaction in this list will display detailed information about the transaction, including the transaction ID.

![Finding a vote transaction ID in Decrediton](/img/verifying-votes/decrediton-vote-transaction-id.png)

### Command Line Interface (CLI)

`dcrctl` can be used to list all of the transactions of a wallet:

```no-highlight
dcrctl --wallet listtransactions
```

This will return a JSON formatted list of all transactions.
The vote transactions can be identified by looking at the `txtype` field.
Here is an example of a vote transaction on testnet.

```json
{
  "account": "",
  "amount": -0,
  "blockhash": "0000000004e29b89d74cccc02188f9d1b5951da1d3e9808cfc69722820bac0d9",
  "blocktime": 1550273859,
  "category": "send",
  "confirmations": 30204,
  "fee": 0,
  "time": 1553855722,
  "timereceived": 1553855722,
  "txid": "a20e541bdd08badab829510e3563875ef9929a16dcb0e8c38a32cf0fe9cadbcd",
  "txtype": "vote",
  "vout": 0,
  "walletconflicts": []
}
```

`txid` is transaction ID, the value required to check voting preferences in the next section.

---

## Step two: Verifying the Vote

Once the transaction ID of the ticket vote has been found, the voting preferences of the ticket can be found using either the block explorer or the CLI.

### Block Explorer

To find the voting preferences of a ticket on [the block explorer](https://dcrdata.decred.org), simply enter the transaction ID obtained above into the search feature at the top of the homepage.
The search result should show the detailed information about the transaction, including the voting preferences.

![Verifying voting preferences in dcrdata](/img/verifying-votes/dcrdata-voting-prefs.png)

### Command Line Interface (CLI)

To verify how a ticket voted using the CLI, the transaction hex must be retreived using `gettransaction`.

```no-highlight
dcrctl --wallet gettransaction <transaction_ID>
```

The JSON object returned by this command will have a field `hex`. This needs to be copied into the `decoderawtransaction` command.

```no-highlight
dcrctl decoderawtransaction <transaction_hex>
```

This will return a JSON representation of the transaction.
The vote bits of the transaction can be found in the `vout` with the field `n` set to `1`.
To determine how this transaction has voted on a particular agenda, the vote bits must be decoded using the mask which is provided in that agenda's [DCP](https://github.com/decred/dcps).
