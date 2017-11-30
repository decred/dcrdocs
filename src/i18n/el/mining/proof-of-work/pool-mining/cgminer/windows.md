# <i class="fa fa-windows"></i> Οδηγός Χρήσης για Windows

---

## <i class="fa fa-download"></i> Λήψη και εξαγωγή του cgminer

Visit https://github.com/decred/cgminer/releases to find the latest cgminer release. For 64-bit Windows, download and extract `cgminer-decred-w64_*.zip`. For 32-bit Windows, download and extract `cgminer-decred-w32_*.zip`. Extract all files to a new folder and open the new folder to view the files.

## <i class="fa fa-play-circle"></i> Αρχικοποίηση και εκτέλεση του cgminer

> Βήμα Ένα

Open a command prompt window by typing `cmd` into the address bar at the top of the file explorer that has the new cgminer files and pressing `Enter`. Type the following in your command prompt window to list your mining-capable hardware:

```no-highlight
C:\Decred> cgminer -n
```

You should see your video cards listed either by their GPU codename or the driver name. The last line of output should show the number of compatible GPUs you can mine with.

> Βήμα Δύο (Προαιρετικό)

To benchmark your system and find out the hashrate it can perform at, use the command:

```no-highlight
C:\Decred> cgminer --blake256 --benchmark
```

> Βήμα Τρία

Register on one of the pool websites and setup a new miner for each of your mining computers. Refer to the pool website of your choice for instructions, if needed. In your command line window from step one, type the following command to launch cgminer (ignore square brackets):

```no-highlight
C:\Decred> cgminer --blake256 -o <pool url>:<port number> -u <web login>.<worker name> -p <worker password>
```

Παράδειγμα:

```no-highlight
C:\Decred> cgminer --blake256 -o http://dcr.maxminers.net:7727 -u DecredMiner.miner1 -p 7@!x5L1
```

> Βήμα Τέσσερα

cgminer should now launch. Create a cgminer configuration file by pressing the following keys: `S` (Settings), `W` (Write Config File), `Enter` (Save config file as `cgminer.conf`). Note that `cgminer.conf` will be placed in the same directory as `cgminer.exe` To add any other pools to your configuration file, open `cgminer.conf` with Notepad or a similar text editor. Use the following syntax to make changes in the "pools" section of the configuration file (note the comma between each individual pool entry):

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

> Βήμα Πέντε

Save `cgminer.conf` and close `cgminer.exe`. Double-click on the cgminer program and it will launch and load the newly created configuration file. This concludes the basic cgminer pool setup guide. For more information on cgminer usage and detailed explanations on program functions, refer to the [cgminer README](https://github.com/decred/cgminer/blob/3.7/README).
