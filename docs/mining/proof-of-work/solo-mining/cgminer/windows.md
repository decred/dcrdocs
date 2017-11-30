# <i class="fa fa-windows"></i> Windows User Guide 

---

## <i class="fa fa-cloud"></i> Connect dcrd to the Decred network 

> Step One

Note that all `dcrd`, `dcrwallet`, and `dcrctl` commands must be executed in the directory where your Decred files are! Start `dcrd`:

```no-highlight
C:\Decred> dcrd -u <username> -P <password>
```

Start dcrwallet:

```no-highlight
C:\Decred> dcrwallet -u <username> -P <password>
```

> Step Two

Generate a new wallet address:

```no-highlight
C:\Decred> dcrctl -u <username> -P <password> --wallet getnewaddress
```

Copy the new address (output from the last command). Close/stop `dcrd` and `dcrwallet` by pressing `ctrl+c` in each window.

> Step Three

Restart `dcrd` using the command:

```no-highlight
C:\Decred> dcrd --miningaddr <new address from step two or your web client wallet address>
```

---

## <i class="fa fa-download"></i> Download and extract cgminer 

Visit https://github.com/decred/cgminer/releases to find the latest cgminer release. For 64-bit Windows, download and extract `cgminer-decred-w64_*.zip`. For 32-bit Windows, download and extract `cgminer-decred-w32_*.zip`. Extract all files to a new folder and open the new folder to view the files.

---

## <i class="fa fa-play-circle"></i> Initialize and run cgminer 

> Step One

Right-click on `start_local.bat` and click `Edit`. Change the username and password to match the credentials used in step 1. Save and close start_local.bat  For reference, here is the command in start_local.bat:

```no-highlight
C:\Decred> cgminer --blake256 -o https://127.0.0.1:9109 -u <username> -p <password> --cert "%LOCALAPPDATA%\Dcrd\rpc.cert"
```

> Step Two

If dcrd is not finished syncing to the blockchain, wait for it to finish, then proceed to the next step. When it is finished, it will show:

```no-highlight
[INF] BMGR: Processed 1 block in the last 5m34.49s
```

> Step Three

Double click on `start_local.bat`. `cgminer` should open. Create a `cgminer` configuration file by pressing the following keys: `S` (Settings), `W` (Write Config File), `Enter` (Save config file as `cgminer.conf`). Note that `cgminer.conf` will be placed in the same directory as cgminer. cgminer can now be launched by simply double clicking `cgminer.exe`. This concludes the basic solo cgminer setup guide. For more information on cgminer usage and detailed explanations on program functions, refer to the official [cgminer README](https://github.com/decred/cgminer/blob/3.7/README).
