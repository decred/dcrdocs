# Solo Proof-of-Stake (PoS) Voting

Last updated for CLI release v{{ cliversion }}.

---

## Overview

Decred’s Proof-of-Stake system requires participants to have a wallet permanently connected to the Internet in order to purchase tickets, participate in governance and receive voting rewards. This introduces extra risk when compared to storing coins on cold storage (e.g. paper wallets). Using a [Voting Service Provider (VSP)](../proof-of-stake/how-to-stake.md#pos-using-a-voting-service-provider-vsp) mitigates most of the risks by running multiple always-online wallets which will vote on your behalf, however this option is not viable for all users.

This page will guide you through creating a setup which is akin to running your own VSP. "Hot" wallets are permanently online to perform voting activities, while funds remain in a separate "cool" wallet which controls ticket buying, receives voting rewards, and importantly, does not need to be permanently online.

Your voting setup will have redundancy and low latency as you will be running multiple hot wallets on servers in different geographic locations (3 is recommended). Further advantages of this setup over using a VSP is that there is no risk of a VSP operator voting contrary to your wishes, there is no VSP fee to pay, and it contributes to the decentralization of the Decred network. The only additional costs will be those of maintaining the remote servers, but this may be significantly lower than paying VSP fees if you have a fair number of tickets.

To mitigate a great number of the risks associated with having a Decred wallet connecting to the Internet to purchase tickets, a user may want to consider setting up a secure cool wallet (not quite a cold wallet). This guide will walk you through a low cost solution that can protect the user from several common pitfalls while explaining the rationale behind the recommendations.

---

## Setting Up A Secure "Cool" Wallet

### Hardware and Operating System

The first concept we will address is that of _compartmentalization_. There is really no reason that a machine which may be storing large amounts of cryptocurrency should have multiple roles. It should not be used for gaming, word processing, web browsing, downloading torrents, etc. The only software installed on this machine should be the software which is absolutely necessary to manage your Decred wallet. It should never connect to a public WiFi network or any other network you do not fully trust.

The hardware requirements for running Decred software are modest, so it is not required to use a very expensive or powerful machine. 20GB storage and 2GB of RAM should be sufficient. Single-board computers such as the Raspberry Pi 3 Model B can be used, however using a machine that is more powerful will yield a better user experience.

Decred software can run on almost any operating system, but for maximum security it is recommended to install an operating system which has a focus on security and privacy. [Qubes OS](https://www.qubes-os.org/) or [OpenBSD](https://www.openbsd.org/) are good options, but there are others available. Windows and macOS are not recommended, and so they will not be covered by the rest of this guide.

---

### Installing Decred

Once your machine is set up you will need to install the Decred CLI tools.

1. Import the Decred Release Signing Key in GnuPG.

    `gpg --keyserver pgp.mit.edu --recv-keys 0x518A031D`

1. Download the installer, manifest, and signature files.

    `wget https://github.com/decred/decred-release/releases/download/v{{ cliversion }}/{dcrinstall-linux-amd64-v{{ cliversion }},manifest-dcrinstall-v{{ cliversion }}.txt,manifest-dcrinstall-v{{ cliversion }}.txt.asc}`

1. Verify the manifest. The output from this command should say "Good signature from Decred Release <release@decred.org>". Warnings about the key not being certified with a trusted signature can be ignored.

    `gpg --verify manifest-dcrinstall-v{{ cliversion }}.txt.asc`

1. Verify the SHA-256 hash in the manifest matches that of the binary - the following two commands should have the same output.

    `sha256sum dcrinstall-linux-amd64-v{{ cliversion }}`

    `grep dcrinstall-linux-amd64-v{{ cliversion }} manifest-dcrinstall-v{{ cliversion }}.txt`

1. Make the binary executable.

    `chmod +x dcrinstall-linux-amd64-v{{ cliversion }}`

1. Run it to install the Decred CLI tools and to create your wallet.

    `./dcrinstall-linux-amd64-v{{ cliversion }}`

1. Add the path to the Decred binaries to your `.profile`.

    `echo "PATH=~/decred:$PATH" >> ~/.profile && source ~/.profile`

!!! danger "Critical Information"

    {{ seedWarning1 }}

    {{ seedWarning2 }}

    {{ seedWarning3 }}

    {{ seedWarning4 }}

---

Once the wallet is created we can do a few things to make life easier.

1. Make sure you have `tmux` installed.

1. Create a `bash` script called `decred.sh` which will start a `tmux` session for each application, start `dcrd`, start `dcrwallet`, prompt us for the password to unlock the wallet, and start `dcrctl`.

    `echo "tmux new -d -s dcrd 'dcrd'; tmux new -d -s dcrwallet 'dcrwallet --promptpass'; tmux attach -t dcrwallet" > ~/decred.sh;`

1. Now make it executable with `chmod +x ~/decred.sh`

Now you can start `dcrd`, `dcrwallet`, and unlock the wallet just by running `./decred.sh`.

The next step will be to start buying tickets manually or using `ticketbuyer` in conjunction with a series of hot wallets you will set up later in this guide.

---

### Ticket Buying

Now from your cool wallet you can purchase tickets using the following command once your wallet is unlocked:

`dcrctl --wallet purchaseticket default 150 1 DsHotWalletAddressFromVotingWallet 10`

Replacing `DsHotWalletAddressFromVotingWallet` with your hot wallet voting address, which you will generate when you set up your remote servers for voting, and using the command above will attempt to purchase `10` tickets with a max price of `150` DCR each and delegate voting rights to your hot wallets.

If you wish to automate ticket purchases using ticketbuyer you will need to add the following info in your `~/.dcrwallet/dcrwallet.conf`, where `DsHotWalletAddressFromVotingWallet` is once again the address you generated on your voting VPS.

```no-highlight
enableticketbuyer=1
ticketbuyer.votingaddress=DsHotWalletAddressFromVotingWallet
ticketbuyer.balancetomaintainabsolute=0
```

Using the automated ticket buyer will require you to leave your wallet online.

---

### Politeia Voting

Setting vote choices for on-chain votes will happen on the remote servers you will set up and we will address that process in a later section. For Politeia votes you will need to cast those from your cool wallet. I will outline the process for doing so using the `politeiavoter` CLI tool.

1. Download the Politeia archive, manifest, and signature files.

    `wget https://github.com/decred/decred-binaries/releases/download/v{{ pivoterversion }}/{politeiavoter-linux-amd64-v{{ pivoterversion }}.tar.gz,manifest-politeiavoter-v{{ pivoterversion }}.txt,manifest-politeiavoter-v{{ pivoterversion }}.txt.asc}`

1. Verify the manifest. The output from this command should say "Good signature from Decred Release <release@decred.org>". Warnings about the key not being certified with a trusted signature can be ignored.

    `gpg --verify manifest-politeiavoter-v{{ pivoterversion }}.txt.asc`

1. Verify the SHA-256 hash in the manifest matches that of the archive - the following two commands should have the same output.

    `sha256sum politeiavoter-linux-amd64-v{{ pivoterversion }}.tar.gz`

    `grep politeiavoter-linux-amd64-v{{ pivoterversion }}.tar.gz manifest-politeiavoter-v{{ pivoterversion }}.txt`

1. Extract the archive.

    `tar -xf politeiavoter-linux-amd64-v{{ pivoterversion }}.tar.gz`

1. Enter the `politeiavoter-linux-amd64-v{{ pivoterversion }}` directory.

Now to view the various agendas and vote on them you will need to run the following commands. Also remember that for this to work `dcrd` and `dcrwallet` must also be running.

To get a list of active proposals: `./politeiavoter inventory`

To vote on a proposal: `./politeiavoter vote <prop-hash> <yes|no>`

---

## Setting Up "Hot" Voting Wallets

For people who do not already have access to remote servers which they own, Virtual Private Servers (VPS) are an option. The first thing you will need is to choose at least one VPS provider. You will find a short list of decent providers below, you may mix and match any number of providers, ideally your VPS should have at least 2 GB of RAM.

* [Scaleway](https://www.scaleway.com/)
* [Google Cloud Platform (GCP)](https://cloud.google.com/)
* [Amazon Web Services (AWS)](https://aws.amazon.com/)
* [OVH](https://www.ovh.com/)

Note: Another consideration is storage space. As you will need to store the complete Decred blockchain which is constantly growing, it is important to keep in mind that while it is currently quite small, it will eventually grow to the point where you may need to upgrade the storage space on your VPS instances. The current size of the blockchain can be checked using [dcrdata charts](https://dcrdata.decred.org/charts#blockchain-size).

---

### Configuration

You will need to get Decred up and running on your remote servers so that you may generate a voting address. This will be the address which you specify when you purchase tickets so as to grant the hot wallets voting rights. Follow the steps below to set up your hot wallet. You can then repeat the steps for each additional remote server, or if using a single VPS provider, you may be able to just clone the VPS from the control panel of your provider and select a different geographic location where you would like to host it (each hot wallet needs to use the same seed). It is highly recommended you run at least three hot wallets which are distributed geographically. Spreading them around the world should give you lowest latency and minimize the chance of missing votes.

Use SSH to connect to one of the remote servers you have set up. Once connected, download and install the latest version of Decred using [dcrinstall](https://github.com/decred/decred-release/releases).

To avoid a super long-winded section on setting up the wallets I'll just include the script I've written to set everything up:

```no-highlight
#!/bin/bash

sudo apt update;
sudo apt upgrade;
sudo apt install tmux curl;

v=v{{ cliversion }};
a=amd64;
b=dcrinstall-linux-${a}-${v};
wget https://github.com/decred/decred-release/releases/download/${v}/${b};
chmod +x ${b};
./${b};
ip=$(curl icanhazip.com);
echo "tmux new -d -s dcrd 'dcrd --externalip=${ip}'; tmux new -d -s dcrwallet 'dcrwallet --enablevoting --promptpass'; tmux attach -t dcrwallet" > ~/decred.sh;
chmod +x ~/decred.sh;
echo "PATH=~/decred:$PATH" >> ~/.profile;
source ~/.profile
```

You may want to change the `v=v{{ cliversion }}` to the latest version if a newer one has been released and `a=amd64` to whatever CPU architecture your VPS is using.

Start everything: `./decred.sh`

The first time you do this the blockchain will be downloaded, I would wait until that process is complete before continuing. You can check what the latest block is on [dcrdata](https://dcrdata.decred.org/).
Then you can moitor the download progress by doing `tmux attach -t dcrd`.

To detach from this session press `<CTRL>` + `<B>` and then `<D>` on your keyboard.

Once the initial sync is complete do `tmux attach -t dcrwallet` and enter your password.

Now we will generate an address which we will use to delegate voting rights using:

`dcrctl --wallet getnewaddress`

Copy that address and use it for your cool wallet instead of the example `DsHotWalletAddressFromVotingWallet`.

You are free to close your `SSH` session and everything that is in a `tmux` session will continue running. You can reconnect and attach to the `dcrd` and `dcrwallet` sessions to verify this.

If using a VSP, now is the time to clone this instance into another geographic region. Otherwise, repeat the above steps on your other remote servers with one change - when creating the wallet choose "restore" and reuse the seed you generated for the first voting wallet.

You will also want to open up TCP port `9108` for all your voting nodes so they have better connectivity to the Decred network. On AWS this is done in the "Security Groups" section under "Networking" in EC2. On Google Cloud you can run `gcloud compute firewall-rules create dcrd --allow tcp:9108 --source-ranges=0.0.0.0/0` in the console to achieve the same thing.

---

### Proof-of-Stake Voting

In order for your hot wallets to vote as you wish when there are on-chain votes you will need to connect to each one and specify your voting choices. This is done by using the following commands:

To see what votes are available.

`dcrctl --wallet getvotechoices`

To set a vote preference.

`dcrctl --wallet setvotechoice <agendaid> <yes|no>`

For example, if you wished to vote `yes` for the proposed sdiff algo change which was the first hard fork vote you would do:

`dcrctl --wallet setvotechoice sdiffalgorithm yes`

And remember, this process will need to be repeated on each VPS instance running a hot voting wallet.
