# CoinShuffle++

To enhance privacy, **Decred** has implemented a variant of **CoinShuffle++** in its wallet.

---

## What is CoinShuffle++ and how does it work?

**CoinShuffle++ (CSPP)** is a mixing protocol used to create Decred **CoinJoin** transactions.

CSPP is a **non-custodial** process, where the output addresses are **anonymized** via a **mixnet**. When using the CSPP mixnet, note the CoinJoin leaks which inputs and change addresses belong to which peer to the server, but not the other peers. The outputs are fully anonymized, none of the peers or the server can link outputs and inputs.

Decred's implementation is based on the CoinShuffle++ protocol from ["P2P Mixing and Unlinkable Bitcoin Transactions"](https://eprint.iacr.org/2016/824.pdf) by Ruffing, Moreno-Sanchez and Kate. It uses [**DiceMix Light**](https://github.com/ElementsProject/dicemix/blob/master/doc/protocol.md), a faster iteration by Ruffing on the DiceMix process proposed in the CoinShuffle++ paper. This process allows for the creation of untraceable transactions, but the amounts are still publicly visible.  To make the outputs indistinguishable, each mix must have a fixed denomination.

CoinShuffle++ does a fine job of anonymizing the output addresses, but if the change is not handled with care, it can link mixed and unmixed UTXOs. In many cases, change outputs can be linked to their inputs by doing a partial sum analysis. To deal with this threat, **change from mixes flows to a separate wallet account**, where it is then mixed into smaller denominations until the change is less than the smallest mixer denomination.

Mixes occur episodically in **epochs**, with the mainnet epoch set to **20 minutes** (1200 seconds).

---

## How do I use CSPP?

To use CSPP, several **new options** must be set in `dcrwallet`.

Regardless of the intended setup, users must create two new accounts, `mixed` and `unmixed`, and point their wallets to Decred's **CSPP servers**:

+ Mainnet:
  + Download the CSPP server [TLS certificate](https://cspp.decred.org/cspp.decred.org.pem)
  + Reference the certificate file using `--csppserver.ca=cspp.decred.org.pem`
  + Point `dcrwallet`to the CSPP mainnet server by setting  `--csppserver=cspp.decred.org:5760`
+ Testnet:
  + Testnet does **not** use the TLS certificate
  + Point `dcrwallet` to the CSPP testnet server by setting `--csppserver=cspp.decred.org:15760`

### Setting up a mixed Ticket Buyer

Mixed ticket buying uses CoinShuffle++ to anonymize outputs of split transactions, which are spent to create ticket purchases.  Voting rights and commitment outputs must be assigned to unused and unique addresses of accounts and not single addresses to prevent address reusage.

Solo stakers are recommended to use two wallets to separate ticket buying and voting, due to requirements of the voting wallet being always unlocked and highly available.  An extended public key must be exported from the voting wallet (using `getmasterpubkey`) and imported by the ticket buying wallet (using `importxpub`).

Use the following options for a **mainnet mixed solo ticket buyer** which continues to buy more tickets from the mixed account as outputs mature:

```
$ dcrwallet --csppserver=cspp.decred.org:5760 \
  --csppserver.ca=cspp.decred.org.pem \
  --enableticketbuyer --purchaseaccount=mixed --mixedaccount=mixed/1 \
  --changeaccount=unmixed --ticketbuyer.votingaccount=voting --mixchange
```

### Transitioning from an unmixed Ticket Buyer

Solo stakers wishing to **convert** from an **unmixed solo** ticket buying setup to a **mixed buyer** can use two ticket buying wallets simultaneously, with a setup to slowly mix funds from the existing buyer (buyer1) to the new mixed buyer (buyer2). Each ticket buyer must be provisioned with a unique voting xpub:

```
voter$ dcrctl --wallet createnewaccount voting1
voter$ dcrctl --wallet createnewaccount voting2
voter$ dcrctl --wallet getmasterpubkey voting1
voting1-xpub
voter$ dcrctl --wallet getmasterpubkey voting2
voting2-xpub
buyer1$ dcrctl --wallet importxpub voting voting1-xpub
buyer2$ dcrctl --wallet importxpub voting voting2-xpub
```

In addition, the mixed account xpub of the mixed ticket buyer must be imported by buyer1:

```
buyer2$ dcrctl --wallet getmasterpubkey mixed
mixed-xpub
buyer1$ dcrctl --wallet importxpub mixed mixed-xpub
```

The mixed ticket buying wallet may use the setup from the previous section. The old wallet must be configured sligtly differently:

```
buyer1$ dcrwallet --csppserver=cspp.decred.org:5760 \
  --csppserver.ca=cspp.decred.org.pem \
  --enableticketbuyer --purchaseaccount=default --mixedaccount=mixed/0 \
  --ticketsplitaccount=default --changeaccount=unmixed \
  --ticketbuyer.votingaccount=voting --mixchange
```

Note these differences:

+ `--mixedaccount=mixed/0` - The unmixed wallet must use the external (not internal) branch of the mixed account to avoid address reuseage problems arising from two wallets simultaneously deriving from the same branch.
+ `--ticketsplitaccount=default` - Unless this is set, the mixed account and branch will be used derive a fresh address for the mix. However, this would create issues when publishing a ticket, because the unmixed wallet does not have the required private key (mixed account is an imported xpub). This option must be set to a derived account with private keys, such as the purchasing source account.

It may take large stakeholders up to the full ticket expiration of roughly 4.7 months to completely migrate to the new mixed wallet. Non-stakeholders can set these options, leaving out `purchaseaccount`, and participate in the mixing without buying tickets. To receive payments, generate new addresses from the unmixed account, then those payments will be mixed into the mixed account.

Note that the **mixing process requires the wallet being unlocked for longer periods of time**, so that it can participate in a mix, which occurs every 20 minutes. Ticketbuyer wallets run unlocked already, but non-staking wallets will need to be left unlocked long enough to complete their mixes.

### Non-staking and change mixing

Change outputs in the CoinJoin are not anonymous, and can easily be traced back to the set of inputs used during the mix. A dedicated unmixed account for CoinShuffle++ change is required, and it is not safe to spend change with other outputs in any transaction, including other mixes. To remedy this, dcrwallet provides a change mixing feature to create smaller mixed outputs of standard values and never submitting more than a single change output to the mixer in a request.

These features are enabled with the following config:

```
$ dcrwallet --csppserver=cspp.decred.org:5760 \
  --csppserver.ca=cspp.decred.org.pem \
  --mixedaccount=mixed/1 --changeaccount=unmixed --mixchange
```

Alternatively, the mixaccount JSON-RPC may be used instead of the --mixchange option to mix single outputs from the account without leaving the wallet persistently unlocked.

**Non-stakers** are able to use this mechanism to mix received funds by using the unmixed account to provide **receiving addresses** and mix them as if it was CoinShuffle++ change. The wallet will participate in CoinShuffle++ sessions by submitting only one UXTO per epoch until all unmixed funds have been mixed. Depending on the current epoch, users may have to wait for a while before seeing any mixing activity.

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
