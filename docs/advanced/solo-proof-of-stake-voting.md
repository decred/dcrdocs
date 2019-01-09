# Solo Proof-of-Stake (PoS) Voting

## Overview
Decred’s Proof-of-Stake system requires a user to have a wallet connect to the network in order to purchase tickets so as to participate in its governance model and receive the corresponding rewards. This introduces some risks compared to other setups where a user might choose to store private keys on a paper wallet and not have to worry about a host of attack vectors introduced by being online.

If you want to do something akin to running your own pool, where "hot wallets" on virtual private servers (VPSs) will do the voting on your behalf, but a secure wallet which contains your funds will control ticket buying and receive all rewards this guide is for you.

Basically the advantage of the setup is that the VPSs will be online and ready to vote 24/7 so your machine at home (cool wallet) does not have to be. You will also have redundancy and low latency as you will be running multiple hot wallets on servers in different geographic locations (3 is recommended). Another advantage of this over using a pool is that there is no risk of a pool operator voting in a manner contrary to your wishes, it promotes decentralization, and there is no pool fee. The only additional costs will be those of maintaining the VPSs which may be significantly lower than what a pool might cost if you have a fair number of tickets.

To mitigate a great number of the risks associated with having a Decred wallet connecting to the Internet to purchase tickets a user may want to consider setting up a secure cool wallet (not quite a cold wallet). This guide will first walk you through a low cost solution that can protect the user from several common pitfalls while explaining the rationale behind the recommendations.

---

# Setting Up A Secure "Cool" Wallet
## Hardware
The first concept we will address is that of _compartmentalization_. There is really no reason that a machine which may be storing large amounts of cryptocurrency should have multiple roles. It should not be used, for gaming, word processing, web browsing, downloading torrents, etc...

I highly recommend [Qubes OS](https://www.qubes-os.org/) paired with [compatible hardware](https://www.qubes-os.org/hcl/).
For reference it runs really well on a Thinkpad X260 and even an older Thinkpad X220.

If cost is a huge factor, single-board computers such as the Raspberry Pi 3 Model B can also be tasked for this purpose however using a machine that is more powerful and can handle Qubes is preferable.

---

## Configuration
Once your staking machine is set up you will need to install the Decred CLI tools.
1. Import the Decred Release Signing Key in GnuPG.

`gpg --keyserver pgp.mit.edu --recv-keys 0x518A031D`

2. Download the installer, manifest, and signature files.

`wget https://github.com/decred/decred-release/releases/download/v1.3.0/{dcrinstall-linux-amd64-v1.3.0,manifest-dcrinstall-v1.3.0.txt,manifest-dcrinstall-v1.3.0.txt.asc}`

3. Verify the manifest.

`gpg --verify manifest-dcrinstall-v1.3.0.txt.asc`

4. Verify the SHA-256 hash in the manifest matches that of the binary.

`sha256sum dcrinstall-linux-amd64-v1.3.0`

5. Make the binary executable.

`chmod +x dcrinstall-linux-amd64-v1.3.0`

6. Run it.

`./dcrinstall-linux-amd64-v1.3.0`

**Important**

When you create your wallet, write the 33 seed words down using a pen and paper on a hard surface, and write out two copies.

* **DO NOT** take a picture of the seed words with your phone’s camera.
* **DO NOT** save the seed words in a text file on a computer.
* **DO NOT** email the seed words to yourself for "safe keeping".

The only way a person should be able to get the seed words is by acquiring one of the copies you have written out. You should store one copy offsite in case of fire or theft.

---

Once the wallet is created we can do a few things to make life easier. 

1. Create a `bash` script called `decred.sh` which will start a `tmux` session for each application, start `dcrd`, start `dcrwallet`, prompt us for the password to unlock the wallet, and start `dcrctl`. Also make sure you have `tmux` installed.

`echo "tmux new -d -s dcrd 'dcrd & tmux new -d -s dcrwallet 'dcrwallet --promptpass' & tmux attach -t dcrwallet" > ~/decred.sh"`

2. Add the pathe to the Decred binaries to your `.profile`.
`"PATH=~/decred:$PATH" >> ~/.profile && source ~/.profile`

3. Now make it executable with `chmod +x ~/decred.sh`

Now you can start `dcrd`, `dcrwallet`, and unlock it using `promptsecret` just by running `./decred.sh`.
If necessary do `tmux attach -t dcrwallet` to enter the password and then `tmux attach -t dcrctl` to enter commands

The next step will be to start buying tickets manually or using `ticketbuyer` in conjunction with a series of hot wallets you will set up later in this guide.

---

## Ticket Buying
Now from your cool wallet you can purchase tickets using the following command once your wallet is unlocked:

`dcrctl --wallet purchaseticket default 150 1 DsHotWalletAddressFromVPS 10`

Replacing `DsHotWalletAddressFromVPS` with your hot wallet voting address which you will generate when you set up your VPS for voting and using the command above will attempt to purchase `10` tickets with a max price of `150` DCR each and delegate voting rights to your VPS instances.

If you wish to automate ticket purchases using ticketbuyer you will need to add the following info in your `~/.dcrwallet/dcrwallet.conf` where `DsHotWalletAddressFromVPS` is once again the address you generated on your voting VPS.

```
enableticketbuyer=1
ticketbuyer.votingaddress=DsHotWalletAddressFromVPS
ticketbuyer.balancetomaintainabsolute=0
```

---

## Voting
Setting vote choices for on-chain votes will happen on the VPSs you will set up and we will address that process in a later section. For Politeia votes you will need to cast those from your cool wallet. I will outline the process for doing so using the `politeiavoter` CLI tool.

1. Download the Politeia archive, manifest, and signature files.

`wget https://github.com/decred/decred-binaries/releases/download/v1.3.1/{politeiavoter-linux-amd64-v1.3.1.tar.gz,manifest-politeiavoter-v1.3.1.txt,manifest-politeiavoter-v1.3.1.txt.asc}`

2. Verify the manifest.

`gpg --verify manifest-politeiavoter-v1.3.1.txt.asc`

4. Verify the SHA-256 hash in the manifest matches that of the archive.

`sha256sum politeiavoter-linux-amd64-v1.3.1.tar.gz`

5. Extract the archive.

`tar -xf politeiavoter-linux-amd64-v1.3.1.tar.gz`

6. Enter the `politeiavoter-linux-amd64-v1.3.1` directory.


Now to view the various agendas and vote on them you will need to run the following commands. Also remember that for this to work `dcrd` and `dcrwallet` must also be running.

To get a list of active proposals:

`./politeiavoter inventory`

To vote on a proposal:
`./politeiavoter vote <prop-hash> <yes|no>`

---

# Setting Up "Hot" Voting Wallets
## VPS Providers
The first thing you will need is to choose at least one VPS provider. You will find a short list of decent providers below, you may mix and match any number of providers, ideally your VPS should have at least 2 GB of RAM.

* [Scaleway](https://www.scaleway.com/)
* [Google Cloud Platform (GCP)](https://cloud.google.com/)
* [Amazon Web Services (AWS)](https://aws.amazon.com/)
* [OVH](https://www.ovh.com/)

Note: Another consideration is storage space. As you will need to store the complete Decred blockchain which is constantly growing, it is important to keep in mind that while it is currently quite small (~3 GB), it will eventually grow to the point where you may need to upgrade the storage space on your VPS instances.

---

## Configuration
Once you have set up a VPS you will need to get Decred up and running on it, so that you may generate a voting address. This will be the address which you specify when you purchase tickets, so as to grant the hot wallets voting rights. Follow the steps below to set up your hot wallet. You can then repeat the steps for each additional instance you want to run, or just clone the VPS from the control panel of your provider and select a different geographic location where you would like to host it (each hot wallet needs to use the same seed). It is highly recommended you run at least three hot wallets, one on the East coast of the US, one in Europe, and one in Asia should be adequate, adding an additional one on the West coast of the US might be desireable as welif you're into overkill.

Use SSH to connect to one of the VPS instances you set up. We will assume the OS you are running is Ubuntu as it is popular and available on all the providers listed above.
Once connected download and install the latest version of Decred using dcrinstall (https://github.com/decred/decred-release/releases).

To avoid a super long-winded section on setting up the wallets I'll just include the script I've written to set everything up:

`sudo apt update && sudo apt upgrade && sudo apt install tmux curl && v=v1.3.0; a=amd64; b=dcrinstall-linux-${a}-${v}; wget https://github.com/decred/decred-release/releases/download/${v}/${b}; chmod +x ${b}; ./${b}; ip=$(curl icanhazip.com); echo "tmux new -d -s dcrd 'dcrd --externalip=${ip}' & tmux new -d -s dcrwallet 'dcrwallet --enablevoting --promptpass' & tmux attach -t dcrwallet" > ~/decred.sh && chmod +x decred.sh && echo "PATH=~/decred:$PATH" >> ~/.profile && source ~/.profile`

You may want to change the `v=v1.3.0` to the latest version if a newer one has been relased and `a=amd64` to whatever CPU architecture your VPS is using.

Start everything:

`./decred.sh`

The first time you do this the blockchain will be downloaded, I would wait until that process is complete before continuing. You can check what the latest block is on [dcrdata](https://explorer.dcrdata.org/).
Then you can moitor the download progress by doing `tmux attach -t dcrd`.

To detach from this session press `<CTRL>` + `<B>` and then `<D>` on your keyboard.

Once the initial sync is complete do `tmux attach -t dcrwallet` and enter your password.

Now we will generate an address which we will use to delegate voting rights using: 

`dcrctl --wallet getnewaddress`

Copy that address and use it for your cool wallet instead of the example `DsHotWalletAddressFromVPS`.

You are free to close your `SSH` session and everything that is in a `tmux` session will continue running. You can reconnect and attach to the `dcrd` and `dcrwallet` sessions to verify this.

Now either clone the VPS instance to different regions or repeat the process from scratch with one change. When creating the wallet choose "restore" and reuse the seed you generated for the first voting wallet.

You will also want to open up TCP port `9108` for all your voting nodes so they have better connectivity to the Decred network. On AWS this is done in the "Security Groups" section under "Networking" in EC2. On Google Cloud you can run `gcloud compute firewall-rules create dcrd --allow tcp:9108 --source-ranges=0.0.0.0/0` in the console to achieve the same thing.

---

## Voting
In order for your hot wallets to vote as you wish when there are on-chain votes you will need to connect to each one and specify your voting choices. This is done by using the following commands:

To see what votes are available.

`dcrctl --wallet getvotechoices`

To set a vote preference.

`dcrctl --wallet setvotechoice <agendaid> <yes|no>`

So if for example you wished to vote `yes` for the proposed sdiff algo change which was the first hard fork vote you would do:

`dcrctl --wallet setvotechoice sdiffalgorithm yes`

And remember, this process will need to be repeated on each VPS instance running a hot voting wallet.

---
