# <img class="dcr-icon" src="/img/dcr-icons/LockEye.svg" /> Secure Setup

Last updated for CLI release v{{ cliversion }}.

---

This document will guide how to setup a two system method for holding your Decred securely.
Some of the commands given will be specific to Debian based systems, but the principles/tools can be applied to almost any OS.

**Please note that this setup requires two computers.**

Although focused on Decred and Raspberry Pi, this guide can also be used for
more general hardware devices and almost any cryptocurrency.

---

## Scope and Limitations

The scope of this guide is to secure your cryptocurrency holdings from common malware and light threats.
If you are a normal cryptocurrency holder and follow this guide exactly, it should give a good level of security.

The guide assumes some general technical knowledge and that you can fix any hitches you come across.

**This setup will not protect you against a state-level attacker or a persistent threat.**

[General Security](general-security.md) offers more techniques to keep your system secure.

---

## The Setup

This will be a multi-system setup.

![Network diagram](/img/secure-setup.png)

* A laptop or desktop that will be running the dcrd node, referred to as `Computer A`.
* A secure system that will be running the wallet, referred as `Wallet-B`.
  This guide will use a Raspberry Pi 4, however it could also be a laptop or desktop.
  This system should be connected to an external monitor and keyboard, and it
  should also connect to the local network via ethernet.
* All details/commands that come within curly braces `{}` cannot be copy-pasted,
  you will need to remove the curly braces and edit them to suit your setup.

### Benefits of this Setup

* `Wallet-B` is kept offline and turned off most of the time.
  This greatly reduces attack surface/opportunity.
* An attacker would have to compromise dcrd on `Computer A` first, and then find a
  way to jump into `Wallet-B` using the RPC to compromise and exfiltrate data.
  This is highly unlikely and difficult to pull off.
* dcrd on `Computer A` can be used for other purposes in your local network (eg. other wallets, DEX, etc),
  so you don't need to maintain multiple dcrd instances within your local network.

### Setting up Computer A

The best way to setup Decred on your computer is to use [dcrinstall](../wallets/cli/cli-installation.md)

**Note: If you setup dcrwallet in this system, do not use the same seed and passwords for your Wallet-B.**

Once this is done it is assumed that you have dcrd binaries and the dcrd config files.

Note down the IP address of `Computer-A` on your local network.
The IP can be found using `ifconfig`.

Start dcrd on `Computer-A`, ensuring it exposes RPC to the local network.

`dcrd --rpclisten={LOCALIPOFCOMPUTERA}`

Let dcrd fully sync to the latest block.

We should now start setting up a folder that will be copied over to Wallet-B.

`mkdir ~/copytob`

Copy the certificate and config.

```no-highlight
cp ~/.dcrd/rpc.cert ~/copytob
cp ~/.dcrd/dcrd.conf ~/copytob
```

=== "Raspberry Pi"

    [Download](https://github.com/decred/decred-binaries/releases/download/v{{ cliversion }}/decred-linux-arm64-v{{ cliversion }}.tar.gz) the Decred binaries for arm64 (Raspberry PI) and place them in the same folder:

    `wget -P ~/copytob https://github.com/decred/decred-binaries/releases/download/v{{ cliversion }}/decred-linux-arm64-v{{ cliversion }}.tar.gz`

=== "General systems"

    [Download](https://github.com/decred/decred-binaries/releases/download/v{{ cliversion }}/decred-linux-amd64-v{{ cliversion }}.tar.gz) the Decred binaries for linux and place them in the same folder:

    `wget -P ~/copytob https://github.com/decred/decred-binaries/releases/download/v{{ cliversion }}/decred-linux-amd64-v{{ cliversion }}.tar.gz`

Make sure you [verify](verifying-binaries.md) the tar file to ensure it has not
been tampered with.

Now you can tar the `copytob` folder for transport.

`tar -zcvf ~/copytob.tar.gz -C ~/copytob decred-linux-{arm/amd}64-v{{ cliversion }}.tar.gz dcrd.conf rpc.cert`

You can also calculate the hash to ensure that the file is not modified while moving.

`sha256sum ~/copytob.tar.gz`

Store this output on an uneditable medium. ie: paper or a photograph.

### Setting up Wallet B

Install an operating system you feel comfortable with.
Ubuntu desktop is a good choice for beginners (there is no need for a GUI).


**On a general system, you can install the OS using a Linux ISO written to a USB. I recommend [unetbootin](https://unetbootin.github.io/)**

??? note "Raspberry Pi specific (click to expand)"

    <https://www.raspberrypi.org/software/> has rpi-imager which has a nice easy to use interface and has Ubuntu Desktop listed under `Other general purpose OS` -> `Ubuntu` -> `Ubuntu Desktop`.

    Once rpi-imager is done, the disk/card with the OS installed should mount volumes.

    We will need to work with

    ```no-highlight
    writeable
    *boot
    ```

    Edit the config.txt file in *boot

    Find the text [all]

    and add the following lines below it:

    ```no-highlight
    dtoverlay=disable-wifi
    dtoverlay=disable-bt
    ```

    This will disable the WiFi and Bluetooth from being initialized when the system boots. 

You can now copy over `~/copytob.tar.gz` to a writeable volume.

For ease of use, let us make a folder called `bconfig` and copy it over.

(You might need to use an admin or sudo permissions)

eg (These will be different for LiveUSB's)
`sudo mkdir /media/{yourusername}/writable/bconfig`
`sudo cp ~/copytob.tar.gz /media/{yourusername}/writable/bconfig`

Now unmount the disk from your system.
**This will be the last time you will ever connect this disk to a system with internet access.**

Now boot `Wallet-B` with the disk inserted **(DO NOT CONNECT YOUR ETHERNET CABLE)**.
Depending on the OS it should show you a system setup and a default user creation menu, proceed with a strong password.
Then once the system is installed it should reboot.

Once logged in get familiar with the system, adjust the clock, etc, and then open a terminal.

??? note "Raspberry Pi specific (click to expand)"

    Optionally you may choose to disable WiFi and Bluetooth at the kernel level too. 

    Create a file in

    ```no-highlight
    /etc/modprobe.d/raspi-blacklist.conf
    ```

    and add the contents

    ```no-highlight
    blacklist brcmfmac
    blacklist brcmutil
    blacklist hci_uart
    blacklist btbcm
    blacklist btintel
    blacklist rfcom
    blacklist btqca
    blacklist btsdio
    blacklist bluetooth
    ```

Disable WiFi and Bluetooth using rfkill:

```no-highlight
sudo rfkill block wifi
sudo rfkill block bluetooth
```

Now to setup the ufw rules run the following commands.

```no-highlight
sudo ufw default deny outgoing
sudo ufw default deny incoming
sudo ufw allow out to {LOCALIPOFCOMPUTERA} port 9109
sudo ufw enable
```

Replace {LOCALIPOFCOMPUTERA} with the IP address of `Computer A`

Now you may connect the ethernet cable.
Wait for the connection to take place and then test if you can connect to `Computer A` on port 9109

wget {LOCALIPOFCOMPUTERA}:9109

You should get an error a 400 bad request error. This is fine and shows that a connection is possible.

Now to setup dcrwallet.

First, let us check that the tarfile is unchanged.

`sha256sum /bconfig/copytob.tar.gz`

Once the hash is matched then you can extract it.

```no-highlight
mkdir ~/decredconfigs
mkdir ~/decred
tar -xf /bconfig/copytob.tar.gz -C ~/decredconfigs
tar -xf ~/decredconfigs/decred-linux-{amd/arm}64-v{{ cliversion }}.tar.gz -C ~/decred
cp ~/decred/decred-linux-{amd/arm}64-v{{ cliversion }}/* ~/decred/
rm -rf ~/decred/decred-linux-{amd/arm}64-v{{ cliversion }}/
```

Now we have the Decred binaries in the ~/decred/decred-linux-{amd/arm}64-v{{ cliversion }} folder.

Let us setup the dcrctl and dcrwallet config files that will allow it to connect to `Computer A`.

```no-highlight
mkdir ~/.dcrwallet/
mkdir ~/.dcrctl/
```

Now, these files need to be edited.

First copy the RPC username and password from ~/decredconfigs/dcrd.conf

Let us name them {username} and {password}.
Replace these with the actual values in the configs below.

create a file with contents

 ~/.dcrwallet/dcrwallet.conf

```no-highlight
rpcconnect={LOCALIPOFCOMPUTERA}:9109
cafile=~/decredconfigs/rpc.cert
username={username}
password={password}
```

 ~/.dcrctl/dcrctl.conf

```no-highlight
rpcserver={LOCALIPOFCOMPUTERA}:9109
walletrpcserver=127.0.0.1
rpccert=~/decredconfigs/rpc.cert
rpcuser={username}
rpcpass={password}
```

That's it.

Test is out by running `~/decred/dcrctl getbestblock`

It should show the latest block.

Then you can setup a wallet as described in the [docs](../wallets/cli/dcrwallet-setup.md)

---

## Improvements

* This system can only be used to store and spend coins.
  It currently cannot be used to purchase tickets.
  This can be easily achieved by hosting a TOR instance in `Computer A` `apt-get install tor` and then connecting dcrwallet using its proxy setting.
  (You will need to add a rule to UFW accordingly eg: `sudo ufw allow out to {LOCALIPOFCOMPUTERA} port 9050`)

* A MITM proxy can be setup between `Computer A` RPC and `Wallet-B`.
  This can either be used to log traffic or can even be used to approve/disapprove all responses/requests.
* Remove WiFi/Bluetooth hardware physically.
* Use a more secure/lightweight OS.
* Setup router level firewall rules secondary to UFW.
* Use an [Ethernet crossover cable](https://en.wikipedia.org/wiki/Ethernet_crossover_cable) to connect to `Computer A`.
  This will greatly reduce the local network attack surface. (Most devices now auto cross over and you don't need a special cable)
* If your router supports it, bind the MAC of both devices to a static IP.

---

## Common Errors and Pitfalls

### Missing Software

Some operating systems might not have ufw or tar by default.
If your `Wallet-B` is missing some software, you will have to either copy it
from `Computer-A` using a removable storage device, or install it from an online
software repository.

### IP Changes

If at any point the IP of `Computer A` changes then you need to list

`sudo ufw status numbered`

 and delete the ufw rule that allows the connection.
`sudo ufw delete {NUMBER}`

And then add the new IP

`sudo ufw allow out to {LOCALIPOFCOMPUTERA} port 9109`

 You will also have to regenerate certificates for dcrd and copy them over securely.
