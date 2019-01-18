# <img class="dcr-icon" src="/img/dcr-icons/Solo.svg" /> Solo Voting

---

#### 1. Do I need hash power to stake mine? 

Stake "mining" is a term that is no longer used, because the actions and dynamics associated with PoS voting are very different to PoW mining.

Voting does not require any hash power[^9304]. The only requirement is having enough DCR to stake (lock) in exchange for a ticket. 

---

#### 2. Isn't one of the main reasons for Proof-of-Stake (PoS) voting to ensure there are always a sufficient amount of peers online? 

Definitely not[^9311]. Stake voting cannot possibly enforce that. An SPV-style wallet could easily perform the necessary voting by communicating with other full nodes (`dcrd` instances) on the network. It is true that the current wallet requires `dcrd` to be running, but that will not always be the case.

Even if the software did try to enforce that, you could not stop people from writing utilities and such to do it via the peer-to-peer network without needing to run their own local instance anyways.

---

#### 3. What happens if my wallet is unreachable or locked when my tickets are selected by miners? 

If your wallet is offline or locked[^9806] when your tickets are selected, you lose out on the rewards and your ticket is removed from the pool immediately. There are no "redos".

---

#### 4. Can I somehow test if my machine is reachable for voting? In other words, run the actions of a miner who would want to get my vote. 

You do not need to be reachable. Voting is deterministic on a per-block basis[^9806]. That is to say your wallet will know if your ticket is selected based on the current block and then a "vote transaction" (ssgen transaction) is broadcast to the network, just like other transactions.

---

#### 5. Can I run multiple voting-only wallets with the same seed on multiple servers? 

You can have multiple voting-only wallets because they are not creating new addresses[^12697]. The problem comes in when you have two wallets creating transactions that involve new addresses because they do not know what the other one is doing.

If you are doing a hot/cold setup, you can create multiple voting-only hot wallets without any issues so long as they both are aware of the address you give voting rights to.

Continue to [Voting Service Providers FAQ](voting-service-providers.md)

---

## <img class="dcr-icon" src="/img/dcr-icons/Sources.svg" /> Sources 

[^9304]: Decred Forum, [Post 9,304](https://forum.decred.org/threads/626/page-2#post-9304)
[^9311]: Decred Forum, [Post 9,311](https://forum.decred.org/threads/582/page-2#post-9311)
[^9806]: Decred Forum, [Post 9,806](https://forum.decred.org/threads/180/page-6#post-9806)
[^12697]: Decred Forum, [Post 12,697](https://forum.decred.org/threads/1127/#post-12697)
