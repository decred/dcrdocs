# <img class="dcr-icon" src="/img/dcr-icons/LockEye.svg" /> CoinShuffle++

---

## What is CoinShuffle++ and how does it work?

**CoinShuffle++ (CSPP)** is a mixing protocol used to create Decred **CoinJoin** transactions.

CSPP is a **non-custodial** process, where the output addresses are **anonymized** via a **mixnet**. When using the CSPP mixnet, note the CoinJoin leaks which inputs and change addresses belong to which peer to the server, but not the other peers. The outputs are fully anonymized, none of the peers or the server can link outputs and inputs.

Decred's implementation is based on the CoinShuffle++ protocol from ["P2P Mixing and Unlinkable Bitcoin Transactions"](https://eprint.iacr.org/2016/824.pdf) by Ruffing, Moreno-Sanchez and Kate. It uses [**DiceMix Light**](https://github.com/ElementsProject/dicemix/blob/master/doc/protocol.md), a faster iteration by Ruffing on the DiceMix process proposed in the CoinShuffle++ paper. This process allows for the creation of untraceable transactions, but the amounts are still publicly visible.  To make the outputs indistinguishable, each mix must have a fixed denomination.

CoinShuffle++ does a fine job of anonymizing the output addresses, but if the change is not handled with care, it can link mixed and unmixed UTXOs. In many cases, change outputs can be linked to their inputs by doing a partial sum analysis. To deal with this threat, **change from mixes flows to a separate wallet account**, where it is then mixed into smaller denominations until the change is less than the smallest mixer denomination.

Mixes occur episodically in **epochs**, with the mainnet epoch set to **20 minutes** (1200 seconds).

---

## Motivation

Decred has primarily focused on **governance** since its launch in February 2016. While **privacy** is certainly a separate subdomain from governance within the space, privacy connects very directly to the core tenets of Decred: **Security, Adaptability, and Sustainability**.

By giving users added privacy, Decred enhances both their and it’s **financial security**. Additional privacy features can be added with the consent of stakeholders in an incremental fashion, allowing Decred to adapt to a changing technological landscape as necessary. Giving users privacy also makes the project substantially more resilient against malicious actors, magnifying its sustainability in the longer term.

Rather than take the routes established by privacy-focused projects, e.g. ring signatures, zk-SNARKs, or Mimblewimble, developers decided to take a mixnet approach, where they have integrated the mixnet with Decred's Proof-of-Stake (“PoS”) governance system.

Implementation of the mixnet began as a search for a different privacy solution that would not break **pruning**, the capability of discarding historical transactions from full nodes. Other implementations enable higher privacy, but break pruning, making it harder to replicate the blockchain and reducing its security.

Beyond the concern about pruning, other implementations carry moderate or high complexity, making code audits costly and broadening the attack surface.

TumbleBit, from  [“TumbleBit: An Untrusted Bitcoin-Compatible Anonymous Payment Hub”](https://eprint.iacr.org/2016/575.pdf), was the first option. But the development team noticed that the mixing server would be vulnerable to Denial-of-Service ('DoS') attacks, with the countermeasures adding more complexity. Despite not integrating the TumbleBit code into Decred, the code has been [released](https://github.com/decred/tumblebit) for public benefit.

The team ended up pivoting to CoinShuffle++, a simpler and more DoS-resistant solution.

---

## Why does it use a centralized server?

The CoinShuffle++ protocol's **threat model**, the variety of attacks it takes into account, includes the scenario where the attacker owns the server, hosts the service and handles communication. CSPP ensures anonymity even while trying to join a session hosted by a malicious server. Given this conditions, the mix would not take place. This is P2P approach to coin mixing; while it requires a server to handle communication, it does not expect it to do any computation.

This enables the use of a **client-server** architecture in Decred's first CSPP implementation. It is a common approach to networks and it has two benefits: **enhanced privacy and simplicity**.

Having a P2P network would mean **every peer could see other's public IP**, which would compromise privacy. Users could **run their own servers**, but they would have **limited utility** because the goal is to get as many peers as possible in each mix.

---

## Benefits

The implementation of the CSPP mixnet did not require changing the consensus rules. It follows Decred's low-hanging fruit approach and it allowed Decred developers to work on it in a permisionless manner.

Other privacy implementations like those on **Monero** and **Zcash** provide substantial privacy, but impede the network from dropping historical transactions from their full nodes, a process also known as **pruning**. The CSPP mixnet does not have this effect on the blockchain and keeps it easier to download and replicate.

At the same time, the CSPP mixnet presents a much simpler solution that is based on common cryptographic primitives and finite field arithmetic. It is simpler and more **DoS resistant** than [TumbleBit](https://eprint.iacr.org/2016/575.pdf), which was initially planned and developed,but dropped because of its vulnerability to Denial-of-Service attacks.

---

## Limitations

The initial code only supports the CLI wallet, dcrwallet, and solo stakers. It does not work with voting service providers (VSPs), and regular transactions.

To implement CSPP beyond the CLI there are some issues that must be dealt with:

  + **dcrwallet:** Changes must be made to support **unlocking individual accounts** while other accounts keys are locked. CSPP requires hot keys to create on-demand transactions at the end of the timed process.

  + **Decrediton:** **UI/UX** must be made so that users have a **simple way** to opt-in into privacy. The UI must ensure users do not send funds from other accounts besides their mixed account, prevent receiving funds into accounts besides the change account, and use the mixed account to buy tickets.

  + **VSP API:** A **new VSP API** for buying tickets is needed. To fully support privacy, the way how users buy tickets through VSP must be substantially changed. Proposed changes are already outlined [here](https://github.com/decred/dcrstakepool/issues/574), and it entails moving from an account-based system to a **ticket-based system**, where users pay VSP **fees upfront**, and VSP tickets are indistinguishable from solo tickets.

---

## Further Information

For more technical information about CoinShuffle++, visit Decred’s [cspp](https://github.com/decred/cspp) Github repository. You can also read about CoinShuffle++ on [Decred’s blog](https://blog.decred.org/2019/08/28/Iterating-Privacy/).
