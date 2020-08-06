# LN Watchtowers

---

!!! danger "Critical information to prevent theft of funds"
    
    LN nodes should remain online for as long as possible to monitor for on-chain breaches of a channel. The best alternative for _episodic_ nodes (ones that don't remain online continuously) is to use _watchtower_ services to monitor the chain for them.
    
!!! info "Watchtower Limitations"
    
    The current implementation of watchtowers is only able to recover funds already committed to in the channel, **not** from in-flight payments, thus it's a good practice not to have a large number of outstanding payments at any one time when relying on watchtowers.
    

LN operates under the assumption that nodes can respond in a timely manner in case of _channel breaches_ by broadcasting a so called _justice transaction_ on-chain if the counter-party of a channel is (or becomes) malicious. 

For many end-users however that isn't feasible: it would mean leaving their computer running 24 hours a day and their wallet unlocked so that `dcrlnd` can perform its operations.

This document reviews the motivation for the existence of Watchtower services, how they work and how to interact with them.
    
## Overview of Channel Breaches    

This section can be skipped if you know what it means to _breach_ an LN channel.

Lightning Network channels are realized on the blockchain as multisig, 2-of-2 outputs. This means both parties of a channel must cooperate in order to advance its _state_, which reflects the relative balances of the two participants and any outstanding (in-flight) payments:


![Channel States](/img/lightning-network/channel-states.svg)

Each state corresponds to a _commitment transaction_: a transaction signed by both parties that spends the multisig channel output and that pays the correct relative amount to each party.

Any commitment transaction is publishable by any of the two parties once a state is "locked in" (also referred as "irrevocably committed" to). This means _any point of the entire state history_ is, in principle, publishable at any time. 

The "any point of the entire state history" is key: even _old_ states, ones that no longer reflect the most recent situation for the relative balances in the channel can be broadcast at any time by any of the parties.

This means that a malicious counter-party of one of your channels could attempt to cheat and steal funds from you by publishing an old commitment transaction that is more favorable to them.

For example, in the above picture, even though according to the correct accounting and the most recent state Alice has 0.3 DCR and Bob has 4.7 DCR, Alice could publish the commitment transaction corresponding to state number #13 on-chain and fetch 4.5 DCR to herself.

This event (publishing an old, revoked state) is called a _channel breach_: Alice breached her channel with Bob and is attempting to steal funds that actually belong to him.

### Responding to Channel Breaches

Whenever a party detects their counter-party published an old commitment transaction that has been mined on the underlying blockchain, they can trigger a mechanism called a _justice transaction_ (also sometimes called the _penalty_ transaction). This is a transaction that fetches back the funds of the wrongly published commitment transaction, effectively penalizing the other participant for their incorrect behavior by giving the entire funds of the channel to the affected party.

This behavior is a part of the technical specification of the Lightning Network since it was [first proposed](https://lightning.network/lightning-network-paper.pdf).

However, it crucially depends on the capacity of nodes to _timely_ observe the underlying blockchain for detecting these channel breaches and to respond to them by creating and signing appropriate justice transactions.

This implies the nodes need to remain online, they need to remain connected to the blockchain's P2P network and they need to keep their wallet unlocked in order to sign the required transactions.

For routing nodes - that is, nodes that are meant to remain online routing payments between distant participants of the network - that is not an issue since remaining online and well-connected is part of their standard operating procedure.

However, for _ephemeral_ or _episodic_ nodes - ones that come online simply to make or receive an eventual payment and then go offline again - this is a harder requirement to achieve.

In fact, a large amount of end-users fall exactly into this category: users that open a channel and make a few payments a month. For these users, keeping their wallets online and unlocked for a significant amount of time is infeasible.

The solution for these users is to use a Watchtower Service.

## Watchtower Basics

A Watchtower is an LN node that can watch the chain on behalf of a third party and can send an appropriate justice transaction if it detects a relevant breach of contract.

Every time a channel state is updated, the client node contacts the Watchtower and provides it information about the just _revoked_ state: the relevant keys, signatures for the justice transaction and a partial copy of the hash of commitment transaction. The keys and signatures are encrypted using the full hash of the commitment transaction as key.

The Watchtower will then take that information as a hint and will begin to watch the chain for any signs that the provided transaction is mined. If it detects the partial tx hash on a block, it will find out the full hash of the revoked commitment transaction and will be able to decrypt the justice data.

At this moment it will re-assemble the justice tx and publish it on the network, returning any funds locked in the delayed output of the breached commitment (the so-called `to_local` output) to its rightful owner.

### Limitations

The current implementation of the Watchtower feature can only redeem funds from the actually committed channel funds (that is, from the outputs that determine the relative balances of the channel participants). 

In-flight payments (i.e. HTLCs) aren't supported by the current watchtower protocol, therefore in case of breaches those funds will still be available for the breacher to redeem.

For nodes relying on Watchtowers, it is therefore recommended not to have individual states with many outstanding payments. In other words, users that are relying on watchtowers should generally wait until most of their in-flight payments are completed before they attempt a new one.

## Using Watchtowers

CLI users may use the [`wtclient`](dcrlncli/wtclient.md) command to add, remove and query the state of the watchtowers in their `dcrlnd` node.

Note that `dcrlnd` must be started with the `--wtclient.active` flag in order to enable the use of the `wtclient` command via `dcrlncli`.

Decrediton users may use the "Watchtowers" tab to add a watchtower to their corresponding LN wallet.

In order to add a Watchtower to your node, you'll need to find its public key (their Node Id in the lightning network) and the public IP address and port of their watchtower functionality.