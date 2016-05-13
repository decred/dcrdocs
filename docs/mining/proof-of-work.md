# ** Proof-of-work (PoW) Mining**

---

## ** Solo Mining or Pool Mining **

> <i class="fa fa-male"></i> Solo Mining

<i class="fa fa-exclamation-triangle"></i> **Solo mining is not recommended and is not covered by this documentation!** The Decred network regularly sees a network hash rate of upto 10000Gh/s. Solo mining is generally only done by advanced individuals or organized groups with a large cluster of GPUs so it is not addressed here.

> <i class="fa fa-users"></i> Pool Mining

When you mine in a pool, your hashrate is combined with all the other pool miners’ hashrates to look for the correct solution for a block. You will receive a reward based on the amount of work your miner performs in the pool.
Pool mining distributes shares based on blocks found so you can earn a steady amount of Decred rather than the "all or none" of solo mining.

---

## Obtain a Decred address to receive funds to

Follow the [Getting Started](/getting-started/overview.md) guide and create an address so you can withdraw mining rewards to it.

---

## **<i class="fa fa-life-ring"></i> Sign up for a mining pool**

These mining pools are known to support Decred:

* [http://yiimp.ccminer.org](http://yiimp.ccminer.org)
* [http://coinmine.pl/dcr](http://coinmine.pl/dcr)
* [https://dcr.maxminers.net](https://dcr.maxminers.net)
* [https://dcr.suprnova.cc](https://dcr.suprnova.cc)
* [https://pool.mn/dcr](https://pool.mn/dcr)
* [https://zpool.ca](https://zpool.ca)

Mining pools all work more or less the same but you may wish to sign up at multiple pools and see which one suits you the best.

---

## ** GPU drivers/software **

GPU drivers usually contain the libraries needed for mining.  If you have difficulties running the software you may wish to re-install and specifically check that the OpenCL (AMD) or CUDA (NVIDIA) libraries are selected.

---

## **<i class="fa fa-download"></i> Select and download mining software **

> Official Decred Mining Software Builds

Official builds of ccminer and cgminer are available on GitHub at the following URL:

[https://github.com/decred/decred-release/releases/tag/v0.1.0_miners](https://github.com/decred/decred-release/releases/tag/v0.1.0_miners)

Those with an **AMD** graphics card should download **cgminer** for their operating system.

Those with an **NVIDIA** graphics card should download **ccminer** for their operating system.

> Unofficial Miners

Those with an **AMD** graphics card running Windows may want to download [sgminer](https://github.com/tpruvot/sgminer/releases).

---

## **Running the software**

* Decompress and install the software to a place of your choosing.
* Open a command prompt to that path.
* Follow your mining pools instructions for setup.
* Run the miner.  Here are some examples:

ccminer + coinmine:

```no-highlight
ccminer -a decred -o stratum+tcp://dcr.coinmine.pl:2222 -u username.workerid -p pass --show-diff -q
```

sgminer + yiimp:

```no-highlight
./sgminer -I 31 -k decred -u DsThisIsJustAnExampleAddr -p x -o stratum+tcp://yiimp.ccminer.org:4252 --gpu-powertune 20
```
