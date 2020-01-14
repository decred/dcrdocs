# Lightning Network (LN)

---

## What is Lightning (LN)?

The Lightning Network (LN) is a "Layer 2" [protocol](https://en.wikipedia.org/wiki/Lightning_Network) that runs on top of the base layer ("Layer 1") of a blockchain-based cryptocurrency (like Decred). It enables fast, low cost transactions and higher throughput than possible on Layer 1. 

## Decred Lightning Implemetation

Decred's Lightning Network implementation ([dcrlnd](https://github.com/decred/dcrlnd)) is based on the [lnd](https://github.com/lightningnetwork/lnd) implementation for Bitcoin, and is under active development. While the Lightning Network was activated on the Decred mainnet with the activation of [DCP-0004](../../governance/consensus-rule-voting/consensus-vote-archive/#update-sequence-lock-rules) at block [342784](https://dcrdata.decred.org/block/342784) (May 9th, 2019), and is operational on mainnet, it is not recommended to put any significant amounts of DCR into LND nodes until the implementation is more mature. For more on the technical details of LN, see the [dcrlnd](https://github.com/decred/dcrlnd) repo. 

## How Lightning Network works?

Let's imagine a scenario. Alice has a coffee shop and Bob is her best customer, who comes three times a day. Alice would open a payment channel and sign it with an opening transaction generate a multi-sig address. Bob sent funds to this address and signed the transaction. Alice will receive the transaction, but will not transmit it to the Decred main network. Bob returned later and twice more spent transactions to this address. At the end of the day, Alice would sign all transactions and trasmit them to the Decred main network for final settlement. Alice can open more payment channels with other customers, rleave it open as long as she wants. Once she wishes to recieve all the transactions of the day, she can just sign all the transactions of the day,sign all and broadcast them to the Decred main network.

## Routing

In the Lightning Network, every user is a node and everyone is connected to other nodes. If you want to send a lightning payment to someone but you don't have an payment channel with them, you can just use other nodes to find an already opened channel and make the transaction instantly.

Think in this situation, that Carol is a new customer at Alice's Coffee Shop. Carol is the Bob's best friend and they already have an open payment channel together. With this, Alice don't needs to open another channel to recieve from Carol, in LN she just needs to find the nearest hop for the transaction and the network handles the rest.

(image with hops on channels Alice <> Bob <> Carol)
