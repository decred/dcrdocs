# General Information on Privacy

## About Transaction Graphs

It’s important to understand, that transactions are pseudonymous, but not anonymous. That means, a transaction graph can be built up, and there exists companies that are doing that work. If at some point one of your transactions is connected to your real world identity, it becomes easy to make assumptions based on that, for example that other transactions also belong to you, or that a specific unspent transaction belongs to you (that could give information about your balance). 
One possible way your personal identity could be linked to your blockchain activity is through the use of a block explorer. The administrator of the block explorer may be able to view your IP address and which addresses or transactions you are browsing, and they may infer that you own those addresses or transactions. A possible solution for this is to use blockchain explorers exclusively over Tor.

## Transaction Broadcasting

Broadcasting a transaction can reveal that the transaction you are broadcasting belongs to you. A solution for this is to broadcast your transaction through a website, over Tor. For example, <https://explorer.dcrdata.org/decodetx>
It's also important to note, that different wallets might use different [address types](../advanced/address-details.md). This can also give a hint about your identity, which combined with other signals can ultimately reveal your identity.

## Trade-offs of Reusing vs Not Reusing Addresses

For privacy the best practice is to not reuse an address ever. A cryptocurrency address can be thought of as a cryptocurrency invoice instead. The term "address" does not mean, that it was designed to reuse it, like one would do with a bank account number for example. A privacy conscious user will use a newly generated address for every single transaction, and never reuse an address unless absolutely necessary. 
On the other hand, there may be situations where address reuse may be preferred, or even necessary. The Decred Treasury is a good example of this. Transparency and auditability are more important than privacy in the context of the treasury.

## Change Address

If we only spend a fraction of an Unspent Transaction Output ([UTXO](https://coincentral.com/utxo-beginners-explainer/)), a change output will be generated. This is not good for privacy. For example, the change UTXO will be merged with another unspent transaction output next time when we are spending money, thus creating a signal that both of the transactions belong to us. An average wallet software won’t give us information about this, we won’t know, for example, that 2 UTXOs were merged to create the transaction. If you care about privacy, you should exactly know which UTXOs are being spent. [This](https://medium.com/@nopara73/coin-control-is-must-learn-if-you-care-about-your-privacy-in-bitcoin-33b9a5f224a2) is a good article on coin control.

## Avoid Identification when Acquiring Cryptocurrencies 

Try to avoid getting cryptocurrencies from websites that require KYC or AML, or any other means of identification. Be aware that centralized exchanges can be hacked, thus providing the collected information to the hacker, who can belong to any kind of organization. It’s also possible that at some point an oppressive government will request the collected information. ATMs can be equipped with cameras, or there can be cameras nearby the ATM. This combined with the blockchain can reveal your identity. 

## Avoid Leaving Identifiers in Public Places

Many times this is something physical, for example leaving behind a printed QR code somewhere, writing your nickname or real name on a piece of paper. Your name can be inprinted on the next page of the sticky notes stack, for example. Or that could also happen, that you leave behind your phone or computer unlocked for some minutes, with important information displayed on screen.

## Centralized Mixers

The aim of a cryptocurrency mixer is to break the transaction graph. An old version of cryptocurrency mixers is the centralized mixers (also called scrambler, thumbler, shuffler). 
Either we use a centralized mixer or the later mentioned solutions, [amount correlation](https://en.bitcoin.it/wiki/Privacy#Amount) is a problem.

## Non-custodial Coin Mixing

It is possible to mix coins without a centralized exchange. One method is [TumbleBit](https://github.com/decred/tumblebit), which allows parties to make payments through an untrusted Tumbler.
[Decred's build in coin mixing](https://blog.decred.org/2019/08/28/Iterating-Privacy/) feature is based on the [CoinShuffle++](https://github.com/decred/cspp) protocol.

## Using the Lightning Network for Privacy

Privacy attacks like [common-input-ownership heuristic](https://en.bitcoin.it/wiki/Privacy#Common-input-ownership_heuristic), [address reuse](https://en.bitcoin.it/wiki/Privacy#Address_reuse) and change address detection fundamentally don’t work on any off-chain transactions technology. The Lightning Network is an off-chain transaction technology. One possible downside is that the operator of a lightning node could keep logs of the pseudonymous identifiers, the balances, and the changes of the balances of the participants. This node could later sell this information to governments or corporations. A research paper called [BOLT](https://eprint.iacr.org/2016/701) proposes solutions for this problem.


## Hiding Cryptocurrency Usage Itself

Use VPN or Tor. Don’t link your VPN or Tor usage with social networks, or with any other software or website that might identify you. Keep in mind that cookies exist. Use a browser profile that is dedicated to your crypto-related activities only. Quit all programs that you don’t need. Download some random data, so the size of your downloaded data won’t be exactly blockchain-sized. It’s a good idea to use virtual machines.

## Platform-related Questions

Keep in mind that the platform you are using can also have vulnerabilities. A VPN does not provide any means of defense if the system itself that you are using is hacked. Try to use open-source software, and if possible, open-source hardware as well. See [General-Security](../advanced/general-security.md) for more information.

Do keep in mind that nothing is bullet-proof! If you are a person in extreme danger, for example, because you live in a territory controlled by an oppressive regime, do more research on the topic. 

## More Information

[Coin Control](https://medium.com/@nopara73/coin-control-is-must-learn-if-you-care-about-your-privacy-in-bitcoin-33b9a5f224a2)  
[Merge Avoidance](https://medium.com/@octskyward/merge-avoidance-7f95a386692f)  
[Bitcoin Wiki - Privacy](https://en.bitcoin.it/wiki/Privacy#Bad_privacy_example_-_Exchange_front_running)  
[Bitcoin Transaction Graph Analysis (University paper)](https://arxiv.org/abs/1502.01657)