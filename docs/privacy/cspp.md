# CoinShuffle++

To enhance privacy, Decred has implemented a variant of CoinShuffle++ in its wallet.

---

## What is CoinShuffle++ and how does it work?

**CoinShuffle++ (CSPP)** is a mixing protocol used to create Decred CoinJoin transactions.

CSPP is a **non-custodial** process, where the output addresses are **anonymized** via a **mixnet**. When using the CSPP mixnet, note the CoinJoin leaks which inputs and change addresses belong to which peer to the server, but not the other peers. The outputs are fully anonymized, none of the peers or the server can link outputs and inputs.

Decred's implementation is based on the CoinShuffle++ protocol from ["P2P Mixing and Unlinkable Bitcoin Transactions"](https://eprint.iacr.org/2016/824.pdf) by Ruffing, Moreno-Sanchez and Kate. It uses [**DiceMix Light**](https://github.com/ElementsProject/dicemix/blob/master/doc/protocol.md), a faster iteration by Ruffing on the DiceMix process proposed in the CoinShuffle++ paper. This process allows to create untraceable transactions, but the amounts are still publicly available.  To make the outputs indistinguishable, they must have a fixed denomination for each mix.

CoinShuffle++ does a fine job of anonymizing the output addresses, but if the change is not handled with care, it can link mixed and unmixed UTXOs. In many cases, change outputs can be linked to their inputs by doing a partial sum analysis. To deal with this threat, **change from mixes flows to a separate wallet account**, where it is then mixed into smaller denominations until the change is less than the smallest mixer denomination.

Mixes occur episodically in **epochs**, with the mainnet epoch set to **20 minutes** (1200 seconds).

---

## How do I use CSPP?

To use CSPP, several new options must be set in `dcrwallet.conf`:

    - csppserver=cspp.decred.org:15760 - This is the FQDN and port csppserver is listening on.
    - csppserver.ca=cspp.decred.org.pem - This is the CA certificate for the csppserver.
    - purchaseaccount=mixed - This sets the account from which you will buy tickets.
    - mixaccount=mixed/1 - As mixes occur, mixed output addresses will come from the internal branch this account.
    - changeaccount=unmixed - Each set of mix inputs uses a change address from this account.
    - mixchange=1 - This tells dcrwallet to mix payments to changeaccount into the mixedaccount.
    - ticketbuyer.votingaccount=voting - This tells the wallet which account to use when setting voting ticket voting addresses.

In addition to setting these new options in `dcrwallet.conf`, **two new accounts must be created: mixed and unmixed.** The voting account can either be created locally, if your `ticketbuyer` wallet also votes, or you can import an extended pubkey for a voting account from an external voting wallet.

Stakeholders running a ticketbuyer will want to setup a **2nd ticketbuyer** that will run in **parallel**, where the configurations are such that newly bought tickets in the 1st wallet have the 2nd wallet’s mixed account branch 0 set as their mixed account.

It may take large stakeholders up to the full ticket expiration of roughly 4.7 months to completely migrate to the new mixed wallet. Non-stakeholders can set these options, leaving out `purchaseaccount`, and participate in the mixing without buying tickets. To receive payments, generate new addresses from the unmixed account, then those payments will be mixed into the mixed account.

Note that the **mixing process requires the wallet being unlocked for longer periods of time**, so that it can participate in a mix, which occurs every 20 minutes. Ticketbuyer wallets run unlocked already, but non-staking wallets will need to be left unlocked long enough to complete their mixes.

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

For more technical information about CoinShuffle++, visit Decred’s [cspp](https://github.com/decred/cspp) Github repo. You can also read about CoinShuffle++ on [Decred’s blog](https://blog.decred.org/2019/08/28/Iterating-Privacy/).
