# <i class="fa fa-cubes"></i> Blocks 

---

#### 1. Can a block become orphaned after being confirmed multiple times? 

Only if there is a reorg that is sufficiently long[^8918]. In order for that to happen, you need more hash power working on the other side of a fork than the hash power that is working on the current best chain.

---

#### 2. Can we remove the testnet block explorer given that one for mainnet is available? 

Testnet will continue to be a testing ground for new features, so it makes sense to keep the testnet block explorer[^9621] up.

---

#### 3. What do "[INF] CHAN: Adding orphan block" messages mean? 

It just means a block that you do not have the parent for was received[^14660]. It pretty much always happens when restarting `dcrd` due to the way the sync works. You are still syncing up to the latest block, but the remote peer, that is ahead of you, sent a notification that a new block showed up, one for which you do not have the parent yet.

Rather than ignoring it, once you are sufficiently close to being synced, it essentially saves them for later so once you do have the parent blocks those newer blocks automatically get connected.

---

#### 4. Should I download the blockchain again with every new software release? 

You should almost never have to download the chain again[^14788] on an upgrade unless it is just a super massive change where it makes sense to start over. Typically though, it should migrate things so it just works.

---

#### 5. What is the genesis block number? 

The genesis block[^16987] is block height 0 (block number 0). Every block after that increases by 1.

---

#### 6. What do "[INF] CHAN: FORK: Block 000..." messages mean? 

Here is an example message:

```no-highlight
[INF] CHAN: FORK: Block 0000000000001aedcf1b82b087a1d05ef787550174da1012e473e8ee8c178937 (height 17879) forks the chain at height 17878/block 000000000000150f863186cab6ef5c433bcc155d2f683394f8e65cb037f80b16, but does not cause a reorganize
```

It means two miners found a solution to a block around the same time and both submitted their solved blocks to the network[^17791]. Both are equally valid, however your node saw the other solution ([000000000000147d33cde5e9823122924fb43405418712720eb6457956d8edbb](https://mainnet.decred.org/block/000000000000147d33cde5e9823122924fb43405418712720eb6457956d8edbb)) first, so from your node's point of view, the new block ([0000000000001aedcf1b82b087a1d05ef787550174da1012e473e8ee8c178937](https://mainnet.decred.org/block/0000000000001aedcf1b82b087a1d05ef787550174da1012e473e8ee8c178937)) was on a side chain.

Since it takes blocks time to relay, other nodes might have seen 0000000000001aedcf1b82b087a1d05ef787550174da1012e473e8ee8c178937 first which means to them the other solution that your node saw first ([000000000000147d33cde5e9823122924fb43405418712720eb6457956d8edbb](https://mainnet.decred.org/block/000000000000147d33cde5e9823122924fb43405418712720eb6457956d8edbb)) was the one on the side chain.

This is totally normal and resolves itself whenever the next block is found since it will now define the longest chain and whichever solution was not built on will be orphaned.

In this case, block #17880 ([000000000000154c6091747245e3c2620447c71b346aed09548e74b4543d0d66](https://mainnet.decred.org/block/000000000000154c6091747245e3c2620447c71b346aed09548e74b4543d0d66)) ended up building on top of 000000000000147d33cde5e9823122924fb43405418712720eb6457956d8edbb, so the other solution ([0000000000001aedcf1b82b087a1d05ef787550174da1012e473e8ee8c178937](https://mainnet.decred.org/block/0000000000001aedcf1b82b087a1d05ef787550174da1012e473e8ee8c178937)) was orphaned.

---

## <i class="fa fa-book"></i> Sources 

[^8918]: Decred Forum, [Post 8,918](https://forum.decred.org/threads/557/#post-8918)
[^9621]: Decred Forum, [Post 9,621](https://forum.decred.org/threads/651/#post-9621)
[^14660]: Decred Forum, [Post 14,660](https://forum.decred.org/threads/1333/#post-14660)
[^14788]: Decred Forum, [Post 14,788](https://forum.decred.org/threads/1336/#post-14788)
[^16987]: Decred Forum, [Post 16,987](https://forum.decred.org/threads/1852/#post-16987)
[^17791]: Decred Forum, [Post 17,791](https://forum.decred.org/threads/2925/#post-17791)
