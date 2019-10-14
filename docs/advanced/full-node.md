# <img class="dcr-icon" src="/img/dcr-icons/AtoB.svg" /> Running a Full Node

---

This guide explains everything you need to know about running a Decred full node.

## What is a full node?

A full node is a program that fully validates transactions and blocks, without having to rely on a third party. For this guide, we'll be using [dcrd](https://github.com/decred/dcrd), the most popular full node implementation for Decred. 

## Why run a full node?

There are a number of reasons to run a full node:

- **Help the network:** Full nodes are the backbone of Decred. By validating and broadcasting transactions without relying on third parties they help keep the network decentralized. Each full node added to the network adds to its security and robustness. 
- **Safety & Privacy:** Because a lightweight node cannot fully validate transactions and blocks, it must trust third parties to do so. This means that the third party will have access to information about your transactions, as well as any personal data you give to that third party. For instance, many lightweight wallets rely on a centralized server to process transactions. Even [Simplified Payment Verification (SPV)](../wallets/spv.md) wallets, which typically connect directly to full nodes in the network, still rely on those other full nodes to process and broadcast their transactions. 

## Requirements:

Below are the basic requirements for running a full node:

- \>15 GB disk space (as of September 2019). 

!!! note "Note"
    The size of the blockchain is continually increasing as new blocks are added to the chain. To support migration to new versions and future growth, a good rule of thumb is to have ~3X the [current raw blockchain size](https://dcrdata.decred.org/charts?chart=blockchain-size) in hard disk space.  

- \>2 GB of RAM
- Supported Operating System (OS) &mdash;Windows 7/8.x/10 (server preferred), macOS, Linux
- Reliable internet connection

If running a node on your own hardware (i.e. not on remote servers), you will also need:

- Ability to open a port for incoming internet traffic. If using a home wifi network, this may require changing the settings of your router.
- A safe place to leave your device running
- If you need a silent node (hard disk drives can be loud), a SSD or USB drive

## Guides

Below are some guides from the community that walk you step-by-step through setting up a full node on various hardware and operating systems. For generic high-level instructions, see the [Steps](#steps) section below. 

- [Running a Decred Raspberry Pi Node](https://medium.com/@_Checkmatey_/running-a-decred-raspberry-pi-node-ac605b70c652): A more beginner-friendly guide that uses a VNC server (remote desktop). This guide is intented to be a gentle introduction to using SSH on the command line. 
- [My experience setting up a Decred full-node](https://medium.com/crypto-rocket-blog/my-experience-setting-up-a-decred-full-node-8a9bbf55bc30): Another beginner-friendly guide that walks through setting up a full node on a Raspberry Pi using an Ubuntu terminal on a Windows PC.
- [Installing dcrd](https://stakey.club/en/installing-dcrd/): A more advanced guide to installing a full node (Mac or Debian) that also covers manual installation (from binaries or source) and configuring dcrd to run on Tor for extra security.

## Steps

Below are the basic high-level steps to install a full node on any hardware and OS. These instructions use [dcrinstall](../wallets/cli/cli-installation.md), the automatic installer and upgrader software. In addition to installing `dcrd`, it will also install `dcrwallet` (which allows you to create wallets) and `dcrctl` (which allows you to control `dcrwallet` and `dcrd` from the command line). You can also just install `dcrd` on its own from [binaries or source files](https://github.com/decred/dcrd#installing-and-updating); a full node does not require a wallet unless you want to use your full node to validate and broadcast your own transactions.

1. **Download and install dcrd**
	- Follow the instructions for your OS in the [CLI Installation guide](https://docs.decred.org/wallets/cli/cli-installation/). The `dcrd` executable will be installed in a directory named `/decred` under your OS's home directory. 
1. **Start `dcrd`**
	- Navigate to the `/decred` directory and launch `dcrd`. See the [Operating System Differences](../wallets/cli/os-differences.md) page for OS-specific commands.
	- `dcrd` will boot up, begin connecting to peers and downloading the full Decred blockchain.
1. **Enable incoming connections**
	- `dcrd` will automatically begin downloading the blockchain and connecting to peers. To maximise your positive impact on the Decred network, it is important to allow inbound peers to connect to your node. Allowing inbound peers will allow new participants in the Decred network to connect to your node, and also enable your node to serve lightweight clients such as SPV wallets. This may require changing the settings of your router (to allow outbound connections). If this is the case:
		1. Find your [Local IP address](https://www.howtogeek.com/236838/how-to-find-any-devices-ip-address-mac-address-and-other-network-connection-details/) and [External IP address](https://whatismyipaddress.com/).
		1. Edit the settings of your router to open port 9108 (port forwarding). This [process](https://www.wikihow.com/Set-Up-Port-Forwarding-on-a-Router) depends on the type of router you have. 
	- If running a firewall, you'll also need to configure it to allow inbound connections on port 9108.
1. **Wait for dcrd to sync**
	- Check a Decred block explorer such as [dcrdata](https://dcrdata.decred.org/) and wait until the block height displayed matches the block height shown locally.
1. **Restart dcrd**
	- Restart `dcrd` and pass it your external IP address using the following flag `--externalip=[your.external.ip]`
	- If you don't wish to pass your IP address every time you restart `dcrd`, you can put it in dcrd's [configuration file](../wallets/cli/startup-basics.md#configuration-file-locations). 
	- If you have configured your node to allow inbound peers, you should see inbound peers in the logs. Inbound peers can also be checked using the Remote Procedure Call (RPC) command [getpeerinfo](../wallets/cli/dcrctl-rpc-commands.md).
1. **Leave running**
	-  Leave your node running, online, in a safe space, 24/7/365.

Congratulations, you are now running a Decred full node to support the network!
