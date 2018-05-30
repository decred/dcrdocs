# <img class="dcr-icon" src="/img/dcr-icons/PoWMine.svg" /> Proof-of-Work (PoW) Mining

---

## Overview  

Proof-of-work mining, more commonly referred to as PoW mining, is the activity
of committing your computer’s hardware and resources to process network
transactions and build the blocks that make up the blockchain in the Decred
network. Each time a block is created (by a miner), about 30 new Decred coins
are made. These coins are then split up as follows:

Subsidy | Party
---     | ---
60%   | PoW Miners
30%   | PoS Voters
10%   | Decred development subsidy

You will, on average, receive a reward that is roughly proportional to the
hashrate of your miner and the overall hashrate of the network when you commit
your computer to PoW mining. To get started, you must have a computer with a
video card. Most video cards can be used for mining (including the "mobile"
types found in some laptops). In general, higher end video cards perform at
higher hashrates and therefore receive higher rewards.
---

## Solo Mining or Pool Mining  

> <img class="dcr-icon" src="/img/dcr-icons/Solo.svg" /> Solo Mining

:fa-exclamation-triangle: **Solo mining is not recommended and is not covered by this documentation!** The Decred network regularly sees a network hash rate of up to 10,000Gh/s. Solo mining is generally only done by advanced individuals or organized groups with a large cluster of GPUs so it is not addressed here.

> <img class="dcr-icon" src="/img/dcr-icons/Pool.svg" /> Pool Mining

When you mine in a pool, your hashrate is combined with all the other pool miners’ hashrates to look for the correct solution for a block. You will receive a reward based on the amount of work your miner performs in the pool.
Pool mining distributes shares based on blocks found so you can earn a steady amount of Decred rather than the "all or none" of solo mining.

---

## <img class="dcr-icon" src="/img/dcr-icons/Receive.svg" /> Obtain a Decred Address to Receive Funds With

Follow the [dcrctl Basics](/getting-started/user-guides/dcrctl-basics.md) guide and create an address so you can withdraw mining rewards to it.

---

## <img class="dcr-icon" src="/img/dcr-icons/SignUpForPool.svg" /> Sign up for a Mining Pool

These mining pools are known to support Decred:

* [:fa-external-link-square: https://dcr.suprnova.cc](https://dcr.suprnova.cc)
* [:fa-external-link-square: http://coinmine.pl/dcr](http://coinmine.pl/dcr)
* [:fa-external-link-square: http://mining.luxor.tech](http://mining.luxor.tech)
* [:fa-external-link-square: https://dcr.maxminers.net](https://dcr.maxminers.net)
* [:fa-external-link-square: https://pool.mn/dcr](https://pool.mn/dcr)
* [:fa-external-link-square: https://altpool.net](https://altpool.net)

Mining pools all work more or less the same but you may wish to sign up at multiple pools and see which one suits you the best.

Please choose to mine on a smaller pool so the network's hashrate can be spread out for better decentralization of mining power!

---

## <img class="dcr-icon" src="/img/dcr-icons/Servers.svg" /> GPU Drivers/Software

GPU drivers usually contain the libraries needed for mining.  If you have difficulties running the software you may wish to re-install and specifically check that the OpenCL (AMD) or CUDA (NVIDIA) libraries are selected.

---

## <img class="dcr-icon" src="/img/dcr-icons/Download.svg" /> Select and Download Mining Software

### Official Decred Miner (gominer)

Gominer is the official Decred miner developed and supported by the Decred team. It is the easiest miner to setup and start mining and so it is recommended for most users. Currently, the latest version of gominer is **:fa-github: [v1.0.0](https://github.com/decred/gominer/releases/)** and the official binaries can be downloaded from **[https://github.com/decred/decred-binaries/releases/tag/v1.0.0](https://github.com/decred/decred-binaries/releases/tag/v1.0.0)**

Please be certain to select the correct operating system (Windows/Linux) and the correct version for your GPU type (CUDA for NVIDIA cards, OpenCL/OpenCLADL for AMD cards). gominer is only available to 64-bit operating systems. User guides to start mining with gominer can be found here:

- [gominer Pool-Mining](/mining/proof-of-work/pool-mining/gominer.md)

### Unofficial Miners

* :fa-github: [cgminer](https://github.com/kR105-zz/cgminer) - cgminer is a popular miner for **AMD** GPUs that has a long history of use in many different cryptocurrencies. It is more difficult to use than the decred gominer.

* :fa-github: [ccminer](https://github.com/tpruvot/ccminer) - ccminer is a popular miner for **NVIDIA** GPUs that has a long history of use in many different cryptocurrencies. It is more difficult to use than the decred gominer.

* :fa-github: [sgminer](https://github.com/tpruvot/sgminer) - Those with an **AMD** graphics card running Windows may want to download sgminer.

---

## <img class="dcr-icon" src="/img/dcr-icons/Dcrtl.svg" /> Running the Software

* Decompress and install the software to a place of your choosing.
* Open a command prompt to that path.
* Follow your mining pools instructions for setup.
* Run the miner.

Continue to [PoW Mining FAQ](/faq/proof-of-work-mining.md)
