# Introduction:

This document will guide how to setup a secure two system method for holding your Decred. I will be giving some specific commands for Debian based systems, but the principles/tools can be applied to almost any OS. 

**Please note that this requires two computers.**

Although we will be focusing on Decred and RaspberryPi this can also be used as a process guide for more general hardware devices and almost any cryptocurrency. 

## Scope and limitations: 

The scope of this document is to secure your cryptocurrency holdings from general malware and light threats. If you are a normal cryptocurrency holder and follow this exactly, it should give a good level of security.

This also assumes some general technical knowledge and that you can fix any hitches you come across. 

### **This will not protect you against a state-level attacker or a persistent threat.**

Read [this](general-security.md) before proceeding

## The setup:

This will be a multi-system setup.

![Network diagram](/img/secure-setup.png)


* A general laptop or desktop that will be running the node. Referred as (`Computer A`)
* A secure system that will be running our wallet for which we will be using a RaspberryPi4 device (It can be another laptop too).  Referred as (`Wallet-B`). This system should also be connected to an external monitor and keyboard. It should also connect to the local network via ethernet.
* All details/commands that come within curly braces `{}` cannot be copy-pasted, you will need to remove the curly braces and edit them to suit your setup.

### Benefits of this setup

* The wallet `Wallet-B` is kept offline and turned off most of the time. This allows greatly reduces attack surface/opportunity. 
* An attacker would first have to compromise the dcrd on `Computer A` and find a way to jump into `Wallet-B` using the RPC to both compromise and exfiltrate data. This is highly unlikely and difficult to pull off.
* dcrd on `Computer A` can be used for other purposes in your local network (eg. other wallets, DEX, VSPD, etc), so you don't need to maintain multiple dcrd instances within your local network.


## Setting up Computer A:

The best way to setup decred on your computer is to use [dcrinstall](../wallets/cli/cli-installation.md) 



**Note: If you setup dcrwallet in this system do not use the same seed and passwords for your Wallet-B**

Once this is done it is assumed that you have dcrd bins and the dcrd config files.

Note down the IP address of `Computer-A` on your local network.

`ifconfig`

eg:192.148.1.105

You should start dcrd `Computer-A` and let it sync to tip. You should also ensure it exposes RPC to the local network.

`dcrd --rpclisten=localip` 

eg: `dcrd --rpclisten=192.148.1.105` 



We should now start setting up a folder that will be copied over to Wallet-B

`mkdir ~/copytob`

Copy the certificate and config. 

```
cp ~/.dcrd/rpc.cert ~/copytob
cp ~/.dcrd/dcrd.conf ~/copytob
```

**Windows users can follow along by using the relevant folders from [here](../wallets/cli/os-differences.md#application-directory-locations) and using 7z for tar.**

---

=== "RaspberryPi"

    [Download](https://github.com/decred/decred-binaries/releases/download/v{{ cliversion }}/decred-linux-arm64-v{{ cliversion }}.tar.gz) the decred bins for arm64 (RaspberryPI) and place them in the same folder :


    `wget -P ~/copytob https://github.com/decred/decred-binaries/releases/download/v{{ cliversion }}/decred-linux-arm64-v{{ cliversion }}.tar.gz`

=== "General systems"

    [Download](https://github.com/decred/decred-binaries/releases/download/v{{ cliversion }}/decred-linux-amd64-v{{ cliversion }}.tar.gz) the decred bins for linux and place them in the same folder :

    `wget -P ~/copytob https://github.com/decred/decred-binaries/releases/download/v{{ cliversion }}/decred-linux-amd64-v{{ cliversion }}.tar.gz`

---

Make sure you [verify](verifying-binaries.md) the tar file.


Now you can tar the  `copytob` folder for transport.

`tar -zcvf ~/copytob.tar.gz -C ~/copytob decred-linux-{arm/amd}64-v{{ cliversion }}.tar.gz dcrd.conf rpc.cert`

You can also calculate the hash to ensure that the file is not modified while moving. 

`sha256sum ~/copytob.tar.gz` 

Store this output on an uneditable medium. ie: paper or a photograph.




## Setting up Wallet-B:

Install an operating system you feel comfortable with. I would recommend Ubuntu desktop for beginners (There is no need for a GUI). 

**Note: Some systems might not have ufw or tar by default. You might have to copy them over and compile or install them online via the software repository and then proceed with this install.**  

**On a general system, you can install the OS using a Linux ISO written to a USB. I recommend [unetbootin](https://unetbootin.github.io/)**
<br>
<details>
<summary> RaspberryPi specific:</summary>

https://www.raspberrypi.org/software/  has rpi-imager which has a nice easy to use interface and has Ubuntu Desktop listed under  

Other general purpose OS -> Ubuntu -> Ubuntu Desktop

Once rpi-imager is done the disk/card with the OS installed should mount volumes.

We will need to work with

```
writeable
*boot
```

Edit the config.txt file in *boot

Find the text [all]

and add the following lines below it:

```
dtoverlay=disable-wifi
dtoverlay=disable-bt
```


This will disable the wifi and Bluetooth from booting. 
</details>
<br>


You can now copy over `~/copytob.tar.gz` to a writeable volume.

For ease of use, let us make a folder called `bconfig` and copy it over. 

(You might need to use an admin or sudo permissions)

eg (These will be different for LiveUSB's)
`sudo mkdir /media/{yourusername}/writable/bconfig`
`sudo cp ~/copytob.tar.gz /media/{yourusername}/writable/bconfig`

Now unmount the disk from your system. **This will be the last time you will ever connect this disk to a system with internet access.** 

Now boot `Wallet-B` with the disk inserted **(DO NOT CONNECT YOUR ETHERNET CABLE)**. Depending on the OS it should show you a system setup and a default user creation menu, proceed with a strong password. Then once the system is installed it should reboot.


Once logged in get familiar with the system, adjust the clock, etc, and then open a terminal.
<br>

<details>
<summary> RaspberryPi specific:</summary>
Optionally you may choose to disable Wifi and Bluetooth at the kernel level too. 

Create a file in
```
/etc/modprobe.d/raspi-blacklist.conf
```

and add the contents

```
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
</details>
<br>


Disable Wifi and Bluetooth using rfkill:

```
sudo rfkill block wifi
sudo rfkill block bluetooth
```

Now to setup the ufw rules run the following commands. 

```
sudo ufw default deny outgoing
sudo ufw default deny incoming
sudo ufw allow out to [LOCALIPOFCOMPUTERA] port 9109
sudo ufw enable
```
Replace [LOCALIPOFCOMPUTERA] with the IP address of `Computer A`


Now you may connect the ethernet cable. Wait for the connection to take place and then test if you can connect to `Computer A` on port 9109

wget [LOCALIPOFCOMPUTERA]:9109

You should get an error a 400 bad request error. This is fine and shows that a connection is possible.

Now to setup dcrwallet.

First, let us check that the tarfile is unchanged.

`sha256sum /bconfig/copytob.tar.gz`

Once the hash is matched then you can extract it. 

```
mkdir ~/decredconfigs
mkdir ~/decred
tar -xf /bconfig/copytob.tar.gz -C ~/decredconfigs
tar -xf ~/decredconfigs/decred-linux-{amd/arm}64-v{{ cliversion }}.tar.gz -C ~/decred
cp ~/decred/decred-linux-{amd/arm}64-v{{ cliversion }}/* ~/decred/
rm -rf ~/decred/decred-linux-{amd/arm}64-v{{ cliversion }}/
```

Now we have the decred bins in the ~/decred/decred-linux-{amd/arm}64-v{{ cliversion }} folder. 

Let us setup the dcrctl and dcrwallet config files that will allow it to connect to `Computer A`.

`
mkdir ~/.dcrwallet/
mkdir ~/.dcrctl/
`

Now, these files need to be edited. 

First copy the RPC username and password from ~/decredconfigs/dcrd.conf

Let us name them {username} and {password}. Replace these with the actual values in the configs below.

create a file with contents

 ~/.dcrwallet/dcrwallet.conf

```
rpcconnect={LOCALIPOFCOMPUTERA}:9109
cafile=~/decredconfigs/rpc.cert
username={username}
password={password}
```


 ~/.dcrctl/dcrctl.conf

```
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


## Improvements:

* This system can only be used to store and spend coins. It currently cannot be used to purchase tickets. This can be easily achieved by hosting a TOR instance in `Computer A` `apt-get install tor` and then connecting dcrwallet using its proxy setting. (You will need to add a rule to UFW accordingly eg: `sudo ufw allow out to [LOCALIPOFCOMPUTERA] port 9050`)

* A MITM proxy can be setup between `Computer A` RPC and `Wallet-B`. This can either be used to log traffic or can even be used to approve/disapprove all responses/requests.
* Remove wifi/Bluetooth hardware physically.
* Use a more secure/lightweight OS.
* Setup router level firewall rules secondary to UFW.
* Use an [Ethernet crossover cable](https://en.wikipedia.org/wiki/Ethernet_crossover_cable) to connect to `Computer A`. This will greatly reduce the local network attack surface. (Most devices now auto cross over and you don't need a special cable)
*  If your router supports it, bind the MAC of both devices to a static IP.



## Common errors and pitfalls. 

### 1)

If at any point the IP of `Computer A` changes then you need to list

`sudo ufw status numbered`

 and delete the ufw rule that allows the connection.
`sudo ufw delete [NUMBER]`

And then add the new IP

`sudo ufw allow out to [LOCALIPOFCOMPUTERA] port 9109`

 You will also have to regenerate certificates for dcrd and copy them over securely.
