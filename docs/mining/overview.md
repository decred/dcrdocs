# ![](../img/dcr-icons/PoWMine.svg){ .dcr-icon } Proof-of-Work (PoW) Mining

---

Proof-of-Work mining, more commonly referred to as PoW mining, is the activity
of committing your computer’s hardware and resources to process network
transactions and build the blocks that make up the Decred blockchain.

Each time a valid block is created by a miner, the miner receives the fees from
all of the transactions included in the block, as well as a block reward (newly
created DCR).

The block reward reduces by a factor of 100/101 every 6,144 blocks
(approximately 21.33 days).
For more details on the block reward and growth of the coin supply, see the
[Issuance](../advanced/issuance.md) page.

When proof-of-stake tickets are called to vote on a block, they have the ability
to the strip the reward from the miner of the previous block.
This power may be used if the miner has constructed a block contrary to the best
interests of the network. For example, an empty block when there are
transactions waiting to be processed in the mempool.

Decred mining uses the [BLAKE3](https://github.com/BLAKE3-team/BLAKE3-specs/blob/ac78a717924dd9e6f16f547baa916c6f71470b1a/blake3.pdf)
hashing function.
Note that BLAKE3 is only used in the *Proof-of-Work hash* while the *block hash*
still uses [BLAKE-256](../research/blake-256-hash-function.md) 14 rounds.
See [DCP-0011](https://github.com/decred/dcps/blob/master/dcp-0011/dcp-0011.mediawiki#user-content-Block_Hash_vs_Proof_of_Work_Hash)
for more details.

At time of writing (August 2023) there are no known BLAKE3 ASICs in production,
and there is no GPU mining software available to mine Decred.

To solo mine with a CPU, start dcrd and provide an address for mining rewards to
be paid to:

```no-highlight
$ dcrd --miningaddr <address>
```

Mining can then be initiated using the `setgenerate` RPC:

```no-highlight
$ dcrctl setgenerate true <num_threads>
```

The hashrate and other mining statistics can be monitored using the
`getmininginfo` RPC:

```no-highlight
$ dcrctl getmininginfo
{
  "blocks": 789713,
  "currentblocksize": 29006,
  "currentblocktx": 39,
  "difficulty": 3132289666.7448616,
  "stakedifficulty": 23898311433,
  "errors": "",
  "generate": true,
  "genproclimit": 1,
  "hashespersec": 648796,
  "networkhashps": 39285830859642476,
  "pooledtx": 8,
  "testnet": false
}
```

A successfully mined block will be indicated in the dcrd log file with a line similar to the following:

```no-highlight
Block submitted via CPU miner accepted (hash ..., height ..., pow hash 000...)
```

The coinbase maturity is [256 blocks](https://github.com/decred/dcrd/blob/b6d8ccdedf78536e1d085b725388def2ba76f6b8/chaincfg/mainnetparams.go#L331),
which means that mining rewards will not show up as spendable for that many blocks.
