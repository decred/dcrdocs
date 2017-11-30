# <i class="fa fa-linux"></i> Linux User Guide 

---

## <i class="fa fa-download"></i> Download and extract cgminer 

Visit https://github.com/decred/cgminer/releases to find the latest cgminer release. To download and extract the files through the terminal, run the following commands. Note that this example downloads cgminer v0.0.4.

```no-highlight
~/Decred/$ wget "https://github.com/decred/decred-release/releases/download/v0.0.4_cgminer/cgminer-decred-linux-x86_64-20160208.tar.gz"
~/Decred/$ tar -xvf cgminer*
```

Move into the new cgminer directory:

```
~/Decred/$ cd cgminer*
```

## <i class="fa fa-play-circle"></i> Initialize and run cgminer 

> Step One

Type the following in your terminal window to list your mining-capable hardware:

```no-highlight
~/Decred/$ ./cgminer -n
```

You should see your video cards listed either by their GPU codename or the driver name. The last line of output should show the number of compatible GPUs you can mine with.

> Step Two (Optional)

To benchmark your system and find out the hashrate your GPUs are capable of, use the command:

```no-highlight
~/Decred/$ ./cgminer --blake256 --benchmark
```

> Step Three

Register on one of the pool websites and setup a new miner for each of your mining computers. Refer to the pool website of your choice for instructions, if needed. In your terminal window from step one, type the following command to launch cgminer (ignore square brackets):

```no-highlight
~/Decred/$ ./cgminer --blake256 -o <pool url>:<port number> -u <web login>.<worker name> -p <worker password>
```

Example:

```no-highlight
~/Decred/$ ./cgminer --blake256 -o http://dcr.maxminers.net:7727 -u DecredMiner.miner1 -p 7@!x5L1
```

> Step Four

cgminer should now launch. Create a cgminer configuration file by pressing the following keys: `S` (Settings), `W` (Write Config File), `Enter` (Save config file as `cgminer.conf`). Note that `cgminer.conf` will be placed in the same directory as `cgminer`. To add any other pools to your configuration file, open `cgminer.conf` with Gedit (GUI) / Pico (CLI) or a similar text editor. Multiple pools can be added by following this syntax in the "pools" section of the configuration file (note the comma between each individual pool entry):

```no-highlight
"pools" : [
   {
      "url" : "http://dcr.maxminers.net:7727",
      "user" : "Login.Worker",
      "pass" : "password"
   },
   {
      "url" : "http://dcr.suprnova.cc:9110",
      "user" : "Login.Worker",
      "pass" : "password"
   }
]
```

> Step Five

Save `cgminer.conf` and close `cgminer`. Relaunch cgminer using the command:

```no-highlight
~/Decred/$ ./cgminer
```

This concludes the basic cgminer pool setup guide. For more information on cgminer usage and detailed explanations on program functions, refer to the official [cgminer README](https://github.com/decred/cgminer/blob/3.7/README).
