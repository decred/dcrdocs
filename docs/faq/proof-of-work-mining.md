# :fa-fire: Proof-of-Work (PoW) Mining

---

#### 1. How long does it take for mined coins to get to my wallet?

The coinbase maturity is [256 blocks](https://github.com/decred/dcrd/blob/b6d8ccdedf78536e1d085b725388def2ba76f6b8/chaincfg/mainnetparams.go#L331).
That means the coins will not show up as spendable for that many blocks.

---

#### 2. How do I find out which block I mined?

There will be an entry in the `dcrd` log that looks something like:

```no-highlight
Accepted block 000... via getwork.
```
