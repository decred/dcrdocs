# Proof-of-Work (PoW) Mining 

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

> <i class="fa fa-male"></i> Solo Mining

<i class="fa fa-exclamation-triangle"></i> **Solo mining is not recommended and is not covered by this documentation!** The Decred network regularly sees a network hash rate of up to 10,000Gh/s. Solo mining is generally only done by advanced individuals or organized groups with a large cluster of GPUs so it is not addressed here.

> <i class="fa fa-users"></i> Pool Mining

When you mine in a pool, your hashrate is combined with all the other pool miners’ hashrates to look for the correct solution for a block. You will receive a reward based on the amount of work your miner performs in the pool.
Pool mining distributes shares based on blocks found so you can earn a steady amount of Decred rather than the "all or none" of solo mining.

---

## Obtain a Decred Address to Receive Funds With  

Follow the [dcrctl Basics](/getting-started/user-guides/dcrctl-basics.md) guide and create an address so you can withdraw mining rewards to it.

---

## <i class="fa fa-life-ring"></i> Sign up for a Mining Pool 

These mining pools are known to support Decred:

* [<i class="fa fa-external-link-square"></i> http://decredpool.org](http://decredpool.org)
* [<i class="fa fa-external-link-square"></i> http://yiimp.ccminer.org](http://yiimp.ccminer.org)
* [<i class="fa fa-external-link-square"></i> http://coinmine.pl/dcr](http://coinmine.pl/dcr)
* [<i class="fa fa-external-link-square"></i> https://dcr.maxminers.net](https://dcr.maxminers.net)
* [<i class="fa fa-external-link-square"></i> https://dcr.suprnova.cc](https://dcr.suprnova.cc)
* [<i class="fa fa-external-link-square"></i> https://pool.mn/dcr](https://pool.mn/dcr)
* [<i class="fa fa-external-link-square"></i> https://zpool.ca](https://zpool.ca)

Mining pools all work more or less the same but you may wish to sign up at multiple pools and see which one suits you the best.

Please choose to mine on a smaller pool so the network's hashrate can be spread out for better decentralization of mining power!

---

## GPU Drivers/Software  

GPU drivers usually contain the libraries needed for mining.  If you have difficulties running the software you may wish to re-install and specifically check that the OpenCL (AMD) or CUDA (NVIDIA) libraries are selected.

---

## <i class="fa fa-download"></i> Select and Download Mining Software  

### Official Decred Miner (gominer)

Gominer is the official Decred miner developed and supported by the Decred team. It is the easiest miner to setup and start mining and so it is recommended for most users. Currently, the latest version of gominer is **<i class="fa fa-github"></i> [v1.0.0](https://github.com/decred/gominer/releases/)** and the official binaries can be downloaded from **[https://github.com/decred/decred-binaries/releases/tag/v1.0.0](https://github.com/decred/decred-binaries/releases/tag/v1.0.0)**

Please be certain to select the correct operating system (Windows/Linux) and the correct version for your GPU type (CUDA for NVIDIA cards, OpenCL/OpenCLADL for AMD cards). gominer is only available to 64-bit operating systems. User guides to start mining with gominer can be found here:

- [Windows Pool-Mining](/mining/proof-of-work/pool-mining/gominer/windows.md)

### Unofficial Miners

* <i class="fa fa-github"></i> [cgminer](https://github.com/kR105-zz/cgminer) - cgminer is a popular miner for **AMD** GPUs that has a long history of use in many different cryptocurrencies. It is more difficult to use than the decred gominer.

* <i class="fa fa-github"></i> [ccminer](https://github.com/tpruvot/ccminer) - ccminer is a popular miner for **NVIDIA** GPUs that has a long history of use in many different cryptocurrencies. It is more difficult to use than the decred gominer.

* <i class="fa fa-github"></i> [sgminer](https://github.com/tpruvot/sgminer) - Those with an **AMD** graphics card running Windows may want to download sgminer.

---

## Running the Software 

* Decompress and install the software to a place of your choosing.
* Open a command prompt to that path.
* Follow your mining pools instructions for setup.
* Run the miner.

Continue to [PoW Mining FAQ](/faq/proof-of-work-mining.md)
