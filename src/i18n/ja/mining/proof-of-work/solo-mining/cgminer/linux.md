# <i class="fa fa-linux"></i> Linux User Guide 

---

## <i class="fa fa-cloud"></i> Connect dcrd to the Decred network 

> Step One

Note that all `dcrd`, `dcrwallet`, and `dcrctl` commands must be executed in the directory where your Decred files are! Start `dcrd`:

```no-highlight
~/Decred/$ ./dcrd -u <username> -P <password>
```

Start dcrwallet:

```no-highlight
~/Decred/$ ./dcrwallet -u <username> -P <password>
```

> Step Two

Generate a new wallet address:

```no-highlight
~/Decred/$ ./dcrctl -u <username> -P <password> --wallet getnewaddress default
```

Copy the new address (output from the last command). Close/stop `dcrd` and `dcrwallet` by pressing `ctrl+c` in each window.

> Step Three

Restart `dcrd` using the command:

```no-highlight
~/Decred/$ ./dcrd -u <username> -P <password> --miningaddr <new address from step two or your web client wallet address>
```

> Step Four

Setup TLS security by copying rpc.cert to /usr/share/ca-certificates:

```no-highlight
sudo cp /home/<username>/.dcrd/rpc.cert /usr/share/ca-certificates/dcrd.crt
```

Use a text editor to add the line "dcrd.crt" (no quotes) to /etc/ca-certificates.conf:

```no-highlight
sudo gedit /etc/ca-certificates.conf
```

Update the CA certificate list:

```no-highlight
sudo update-ca-certificates
```

---

## <i class="fa fa-download"></i> Download and extract cgminer 

Visit https://github.com/decred/cgminer/releases to find the latest cgminer release. To download and extract via your Linux terminal, use the following commands:

```no-highlight
wget https://github.com/decred/decred-release/releases/download/v0.0.4_cgminer/cgminer-decred-linux-x86_64-20160208.tar.gz
tar -xvf cgminer-decred-linux-x86_64-20160208.tar.gz
```

---

## <i class="fa fa-play-circle"></i> Initialize and run cgminer 

> Step One

If `dcrd` is not finished syncing to the blockchain, wait for it to finish, then proceed to the next step. When it is finished, it will show:

```no-highlight
[INF] BMGR: Processed 1 block in the last 5m34.49s
```

> Step Two

In your cgminer directory, start cgminer with the command:

```no-highlight
~/Decred/$ ./cgminer --blake256 -o https://127.0.0.1:9109 -u <username> -p <password>
```

Create a cgminer configuration file by pressing the following keys: `S` (Settings), `W` (Write Config File), `Enter` (Save config file as `cgminer.conf`). Note that `cgminer.conf` will be placed in the same directory as cgminer. cgminer can now be launched by simply running the command:

```no-highlight
~/Decred/$ ./cgminer
```

This concludes the basic solo cgminer setup guide. For more information on cgminer usage and detailed explanations on program functions, refer to the official [cgminer README](https://github.com/decred/cgminer/blob/3.7/README).
