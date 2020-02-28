# General Information on Privacy

---

This page provides a list of things you can do to improve your privacy when
working with DCR, or cryptocurrencies more generally.

This list is not meant to be comprehensive, and does not offer any guarantees,
only ideas.
Do keep in mind that nothing is bullet-proof!
If you are a person in extreme danger, for example, because you live in a
territory controlled by an oppressive regime, we advise you do more research on
the topic.

---

## Transaction Graphs

The Decred blockchain contains a public ledger of all Decred transactions,
including the amount sent in each transaction, as well as its senders and its
recipients.
The senders and recipients are not identified by any real-world personal
identity, only by cryptographic public keys.
This provides a level of *pseudonymity*, but not necessarily true *anonymity*.
It is possible to use this public information to build a transaction graph, a
representation of how Decred has been moved between the various network
participants.

If one of your personal transactions is somehow connected to your real world
identity, it may be possible to build a transaction graph which profiles more of
your personal activity.
An observer may be able to deduce other transactions which you have participated
in, or they may be able to deduce your total balance.

One possible way your personal identity could be linked to your blockchain
activity is through the use of a block explorer.
The administrator of the block explorer may be able to view your IP address and
which addresses or transactions you are browsing, and they may infer that you
own those addresses or transactions.
A possible solution for this is to use blockchain explorers exclusively over
Tor.

---

## Transaction Broadcasting

When you broadcast a transaction from your dcrd node, it is possible that other
peers on the network may deduce that the transaction belongs to you, and they
may be able to link it to your public IP address.
It is possible to route your dcrd traffic through Tor to mitigate this risk.
Another solution is to broadcast your transaction through a public website,
using Tor to provide anonymity.
For example, [dcrdata](https://github.org/decred/dcrdata) has this
functionality, and is available as a hidden service on Tor using the URL
<http://dcrdata2opeenddl.onion>.

It's also important to note that different wallets might use different [address
types](https://devdocs.decred.org/developer-guides/addresses/).
This can also give a hint about your identity, which combined with other signals
could reveal your identity.

---

## Trade-offs of Reusing vs Not Reusing Addresses

For privacy the best practice is to not reuse an address ever.
A cryptocurrency address can be thought of as a cryptocurrency invoice instead.
The term "address" does not mean, that it was designed to reuse it, like one
would do with a bank account number for example.
A privacy conscious user will use a newly generated address for every single
transaction, and never reuse an address unless absolutely necessary.
On the other hand, there may be situations where address reuse may be preferred,
or even necessary.
The Decred Treasury is a good example of this.
Transparency and auditability are more important than privacy in the context of
the treasury.

---

## Change Address

If only a fraction of an Unspent Transaction Output
([UTXO](../glossary.md#utxo)) is spent, a change output will be generated.
This can potentially lead to a compromise of privacy.
For example, the change UTXO could be merged with another UTXO in a future
transaction, thus creating a signal that both of the UTXOs belong to the same
user.

Wallet software doesn't typically expose information about individual UTXOs, for
example the fact that multiple UTXOs might be spent in a single transaction.
To ensure maximum privacy, you should exactly know which UTXOs are being spent
in each transaction.
[This article](https://medium.com/@nopara73/coin-control-is-must-learn-if-you-care-about-your-privacy-in-bitcoin-33b9a5f224a2)
is a good introduction to privacy preserving coin control.

---

## Avoid Identification when Acquiring Cryptocurrencies

Try to avoid acquiring cryptocurrencies from websites that require KYC/AML, or
any other means of identification.
Be aware that centralized exchanges can be hacked, potentially exposing the
collected information to the hacker.
It’s also possible that at some point an oppressive government will seize the
collected information.
Cryptocurrency ATMs can be equipped with cameras, fingerprint scanners, or there
could be cameras nearby the ATM which could reveal your identity.

---

## Avoid Leaving Identifiers in Public Places

Many times this is something physical, for example leaving behind a printed QR
code somewhere, writing your nickname or real name on a piece of paper.
Your name can be inprinted on the next page of the sticky notes stack, for
example.
Be careful not to leave your phone or computer unlocked in a public place with
important information displayed on screen.

---

## Using the Lightning Network for Privacy

Privacy attacks like [common-input-ownership
heuristic](https://en.bitcoin.it/wiki/Privacy#Common-input-ownership_heuristic),
[address reuse](https://en.bitcoin.it/wiki/Privacy#Address_reuse) and change
address detection fundamentally don’t work on any off-chain transaction
technology such as The Lightning Network.
One possible downside is that the operator of a lightning node could keep logs
of the pseudonymous identifiers and the balances of the network participants.
The node operator could later sell this information to governments or corporations.

---

## Hiding Cryptocurrency Usage Itself

Use VPN or Tor.
Don’t link your VPN or Tor usage with social networks, or with any other
software or website that might identify you.
Keep in mind that cookies exist.
Use a browser profile that is dedicated to your crypto-related activities only.
Quit all programs that you don’t need.
Download some random data, so the size of your downloaded data won’t be exactly
blockchain-sized.

---

## System Security

The privacy techniques above may not provide any benefit at all if the security
of your machine is compromised.
See the [General Security](../advanced/general-security.md) guide for more
information on how to keep your machine and your operating system secure.

---

## More Information

- [Coin Control](https://medium.com/@nopara73/coin-control-is-must-learn-if-you-care-about-your-privacy-in-bitcoin-33b9a5f224a2)  
- [Merge Avoidance](https://medium.com/@octskyward/merge-avoidance-7f95a386692f)  
- [Bitcoin Wiki - Privacy](https://en.bitcoin.it/wiki/Privacy#Bad_privacy_example_-_Exchange_front_running)  
- [Bitcoin Transaction Graph Analysis (University paper)](https://arxiv.org/abs/1502.01657)
