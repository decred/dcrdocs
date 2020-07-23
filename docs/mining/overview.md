# <img class="dcr-icon" src="/img/dcr-icons/PoWMine.svg" /> Proof-of-Work (PoW) Mining

---

## Overview  

Proof-of-work mining, more commonly referred to as PoW mining, is the activity
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

Decred uses the [BLAKE-256](../research/blake-256-hash-function.md) hashing function. PoW mining can be done using GPUs. However, ASICs that mine DCR are now available, and since their introduction the PoW difficulty has become high enough to make GPU
mining unlikely to be profitable.

---

## Solo Mining or Pool Mining  

##### <img class="dcr-icon" src="/img/dcr-icons/Solo.svg" /> Solo Mining

:fontawesome-solid-exclamation-triangle: **Solo mining is not recommended and is not covered by this documentation!** The Decred network regularly sees a network hash rate of up to 10,000Gh/s. Solo mining is generally only done by advanced individuals or organized groups with a large cluster of GPUs so it is not addressed here.

##### <img class="dcr-icon" src="/img/dcr-icons/Pool.svg" /> Pool Mining

When you mine in a pool, your hashrate is combined with all the other pool miners’ hashrates to look for the correct solution for a block. You will receive a reward based on the amount of work your miner performs in the pool.
Pool mining distributes shares based on blocks found so you can earn a steady amount of Decred rather than the "all or none" of solo mining.

---

## <img class="dcr-icon" src="/img/dcr-icons/Receive.svg" /> Obtain a Decred Address to Receive Funds With

Follow the [dcrctl Basics](../wallets/cli/dcrctl-basics.md) guide and create an address so you can withdraw mining rewards to it.

---

## <img class="dcr-icon" src="/img/dcr-icons/SignUpForPool.svg" /> Sign up for a Mining Pool

These mining pools are known to support Decred:

* [:fontawesome-solid-external-link-square-alt: BeePool](https://beepool.org)
* [:fontawesome-solid-external-link-square-alt: F2Pool](https://www.f2pool.com)
* [:fontawesome-solid-external-link-square-alt: Poolin](https://www.poolin.com)
* [:fontawesome-solid-external-link-square-alt: UUpool](https://uupool.cn/dcr)
* [:fontawesome-solid-external-link-square-alt: Luxor](https://mining.luxor.tech/coins/decred)
* [:fontawesome-solid-external-link-square-alt: Coinmine](https://www2.coinmine.pl/dcr/)
* [:fontawesome-solid-external-link-square-alt: Suprnova](https://dcr.suprnova.cc)

Mining pools all work more or less the same but you may wish to sign up at multiple pools and see which one suits you the best.

Please choose to mine on a smaller pool so the network's hashrate can be spread out for better decentralization of mining power!

---

## <img class="dcr-icon" src="/img/dcr-icons/Servers.svg" /> GPU Drivers/Software

GPU drivers usually contain the libraries needed for mining.  If you have difficulties running the software you may wish to re-install and specifically check that the OpenCL (AMD) or CUDA (NVIDIA) libraries are selected.

---

## <img class="dcr-icon" src="/img/dcr-icons/Download.svg" /> Select and Download Mining Software

### Official Decred Miner (gominer)

Gominer is the official Decred miner developed and supported by the Decred team. It is the easiest miner to setup and start mining and so it is recommended for most users. Currently, the latest version of gominer is **:octicons-mark-github-16: [v{{ gominerversion }}](https://github.com/decred/gominer/releases/)** and the official binaries can be downloaded from **<https://github.com/decred/decred-binaries/releases/tag/v1.0.0>**

Please be certain to select the correct operating system (Windows/Linux) and the correct version for your GPU type (CUDA for NVIDIA cards, OpenCL/OpenCLADL for AMD cards). gominer is only available to 64-bit operating systems. User guides to start mining with gominer can be found here:

- [gominer Pool-Mining](../mining/proof-of-work/pool-mining/gominer.md)

### Unofficial Miners

* :octicons-mark-github-16: [cgminer](https://github.com/kR105-zz/cgminer) - cgminer is a popular miner for **AMD** GPUs that has a long history of use in many different cryptocurrencies. It is more difficult to use than the decred gominer.

* :octicons-mark-github-16: [ccminer](https://github.com/tpruvot/ccminer) - ccminer is a popular miner for **NVIDIA** GPUs that has a long history of use in many different cryptocurrencies. It is more difficult to use than the decred gominer.

* :octicons-mark-github-16: [sgminer](https://github.com/tpruvot/sgminer) - Those with an **AMD** graphics card running Windows may want to download sgminer.

---

## <img class="dcr-icon" src="/img/dcr-icons/Dcrtl.svg" /> Running the Software

* Decompress and install the software to a place of your choosing.
* Open a command prompt to that path.
* Follow your mining pools instructions for setup.
* Run the miner.
