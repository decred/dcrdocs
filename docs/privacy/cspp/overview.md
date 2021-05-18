# ![](../../img/dcr-icons/LockEye.svg){ .dcr-icon } CoinShuffle++

---

## What is CoinShuffle++ and how does it work?

**CoinShuffle++ (CSPP)** is a mixing protocol used to create Decred **CoinJoin** transactions.

CSPP is a **non-custodial** process to obfuscate ownership of DCR coins, where the output addresses are anonymized via a mixnet. When using CSPP, the outputs are fully anonymized, none of the peers or the server can link outputs and inputs.

Decred's implementation is based on the CoinShuffle++ protocol from ["P2P Mixing and Unlinkable Bitcoin Transactions"](https://decred.org/research/ruffing2016.pdf) by Ruffing, Moreno-Sanchez and Kate. It uses [**DiceMix Light**](https://github.com/ElementsProject/dicemix/blob/master/doc/protocol.md), a faster iteration by Ruffing on the DiceMix process proposed in the CoinShuffle++ paper. This process allows for the creation of untraceable transactions, but the amounts are still publicly visible.  To make the outputs indistinguishable, each mix must have a fixed denomination.

CoinShuffle++ does a fine job of anonymizing the output addresses, but if the change is not handled with care, it can link mixed and unmixed UTXOs. In many cases, change outputs can be linked to their inputs by doing a partial sum analysis. To deal with this threat, change from mixes flows to a separate wallet account, where it is then mixed into smaller denominations until the change is less than the smallest mixer denomination.

Mixes occur episodically in **epochs**, with the mainnet epoch set to 20 minutes (1200 seconds).

---

## Motivation

Decred has primarily focused on governance since its launch in February 2016. While privacy is certainly a separate subdomain from governance within the space, privacy connects very directly to the core tenets of Decred: Security, Adaptability, and Sustainability.

By giving users added privacy, Decred enhances both their and it’s financial security. It makes the project substantially more resilient against malicious actors, magnifying its sustainability in the longer term.

Rather than take the routes established by privacy-focused projects, e.g. ring signatures, zk-SNARKs, or Mimblewimble, developers decided to take a mixnet approach, where they have integrated the mixnet with Decred's Proof-of-Stake (“PoS”) governance system.

Implementation of the mixnet began as a search for a different privacy solution that would not break **pruning**, the capability of discarding historical transactions from full nodes. Other implementations enable higher privacy, but break pruning, making it harder to replicate the blockchain and reducing its security.

Beyond the concern about pruning, other implementations carry moderate or high complexity, making code audits costly and broadening the attack surface.

TumbleBit, from  [“TumbleBit: An Untrusted Bitcoin-Compatible Anonymous Payment Hub”](https://decred.org/research/heilman2016.pdf), was the first option. But the development team noticed that the mixing server would be vulnerable to Denial-of-Service ('DoS') attacks, with the countermeasures adding more complexity. Despite not integrating the TumbleBit code into Decred, the code has been [released](https://github.com/decred/tumblebit) for public benefit.

The team ended up pivoting to CoinShuffle++, a simpler and more DoS-resistant solution.

---

## Why does it use a centralized server?

The original CoinShuffle++ protocol uses a P2P approach to coin mixing, while it requires a server to handle communication, it does not expect it to do any computation. 

CSPP's threat model, the variety of attacks it takes into account, includes the scenario where the attacker owns the server, hosts the service and handles communication. CSPP ensures anonymity even while trying to join a session hosted by a malicious server. 

This enables the use of a **client-server** architecture. It is a common approach to networks and it has three benefits: enhanced privacy, simplicity and mixing times.

Decred's first implementation uses a centralized server as a coordination point and a optimized polynomial factorization solver (to improve mixing times). It enhances simplicity by having a single authority responsible for timeouts and advancing the protocol states.  Having a single outbound connection also means peers do not rely on NAT or UDP hole-punching to communicate with each other.

Depending on a P2P network would mean every peer could see other's public IP, which would compromise privacy. Users could run their own servers, but they would have limited utility because the goal is to get as many peers as possible in each mix.

### Handling malicious peers

The protocol handles collisions and malicious peers using a privacy-preserving redundant messaging step. In its worst case scenario, it requires `4+2f` communication rounds for `f` malicious peers. To achieve this, each peer uses a freshly generated bitstring (verification key).

After a failed protocol run, peers can reveal session secrets to expose and exclude malicious disruptors, and move on with the mix. If a dishonest peer is excluded from the mix, all secrets so far will be discarded and new ones are generated.

---

## Benefits

The implementation of the CSPP mixnet did not require changing the consensus rules. It is an opt-in implementation that  obfuscates ownership of DCR coins with out requiring any modifications to the consensus rules.

Other privacy implementations like zk-SNARKS and Ring Signatures provide substantial privacy, but impede the network from dropping historical transactions from their full nodes, a process also known as pruning. The CSPP mixnet does not have this effect on the blockchain and pruning remains possible. Pruning the blockchain reduces its size, which makes it easier to download and replicate.

At the same time, the CSPP mixnet presents a much simpler solution that is based on common cryptographic primitives and finite field arithmetic. It is simpler and more DoS resistant than [TumbleBit](https://decred.org/research/heilman2016.pdf), which was initially planned and developed,but dropped because of its vulnerability to Denial-of-Service attacks.

---

## Limitations

The current implementation has several limitations. Mainly the use of a centralized server, to which the CoinJoin leaks which inputs and change addresses belong to each peer, and the lack of support for Voting Service Providers and regular transactions.

The anonymity provided by CoinShuffle++ can be lost if wallet addresses  are reused, or if change outputs are not handled correctly. It is imperative that addresses are never reused and that extended public keys of mixed and voting accounts are not revealed to other parties.

---

## Further Information

For more technical information about CoinShuffle++, visit Decred’s [cspp](https://github.com/decred/cspp) Github repository. You can also read about CoinShuffle++ on [Decred’s blog](https://blog.decred.org/2019/08/28/Iterating-Privacy/).
