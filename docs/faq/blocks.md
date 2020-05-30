# <img class="dcr-icon" src="/img/dcr-icons/Blocks.svg" /> Blocks

---

#### 1. Can a block become orphaned after being confirmed multiple times?

Only if there is a reorg that is sufficiently long. In order for that to happen,
you need more hash power working on the other side of a fork than the hash power
that is working on the current best chain.

---

#### 2. Can we remove the testnet block explorer given that one for mainnet is available?

Testnet will continue to be a testing ground for new features, so it makes sense
to keep the testnet block explorer up.

---

#### 3. What do "[INF] CHAN: Adding orphan block" messages mean?

It just means a block that you do not have the parent for was received. It
pretty much always happens when restarting `dcrd` due to the way the sync works.
You are still syncing up to the latest block, but the remote peer, that is ahead
of you, sent a notification that a new block showed up, one for which you do not
have the parent yet.

Rather than ignoring it, once you are sufficiently close to being synced, it
essentially saves them for later so once you do have the parent blocks those
newer blocks automatically get connected.

---

#### 4. Should I download the blockchain again with every new software release?

You should almost never have to download the chain again on an upgrade unless it
is just a super massive change where it makes sense to start over. Typically
though, it should migrate things so it just works.

---

#### 5. What is the genesis block number?

The genesis block is block height 0 (block number 0). Every block after that increases by 1.

---

#### 6. What do "[INF] CHAN: FORK: Block 000..." messages mean?

Here is an example message taken from `dcrd` logs:

```no-highlight
[INF] CHAN: FORK: Block 0000000000001aedcf1b82b087a1d05ef787550174da1012e473e8ee8c178937 (height 17879) forks the chain at height 17878/block 000000000000150f863186cab6ef5c433bcc155d2f683394f8e65cb037f80b16, but does not cause a reorganize
```

This typically means that two miners found a solution to a block around the same time, and both submitted their solved blocks to the network. Since it takes time for blocks to relay, nodes will see one block before another and they will accept the first one they see to be the main chain. Any blocks they see after this will be considered to be on a side chain.

This is totally normal and resolves itself whenever the next block is found. The miner who finds the next block will build it on whichever block which their node saw first, and that new block will now define the longest chain. Any other blocks which were not built upon will be orphaned.

In the case above, [block #17880](https://mainnet.decred.org/block/000000000000154c6091747245e3c2620447c71b346aed09548e74b4543d0d66) ended up building on top of [000000000000147d33cde5e9823122924fb43405418712720eb6457956d8edbb](https://mainnet.decred.org/block/000000000000147d33cde5e9823122924fb43405418712720eb6457956d8edbb), so the other solution (`0000000000001aedcf1b82b087a1d05ef787550174da1012e473e8ee8c178937`) was orphaned.
