# <i class="fa fa-windows"></i> *gominer* Οδηγός Χρήσης Pool Mining για Windows

This guide is intended for basic initial setup of gominer on a mining pool of choice using a configuration file, more advanced options are available.

Η τελευταία ενημέρωση έγινε για την έκδοση gominer v1.0.0

---

### <i class="fa fa-download"></i> Λήψη και Εξαγωγή του Εκτελέσιμου *gominer*


>Λήψη του Αρχείου .zip

Visit [https://github.com/decred/decred-binaries/releases/tag/v1.0.0](https://github.com/decred/decred-binaries/releases/tag/v1.0.0) to download the gominer Windows binaries. Within the "Downloads" section you should see the following files:

- `gominer-windows-amd64-cuda-v1.0.0.zip`,
- `gominer-windows-amd64-opencl-v1.0.0.zip`,
- `gominer-windows-amd64-opencladl-v1.0.0.zip`.

For NVIDIA graphics cards, download the `*-cuda-*.zip` file. <br />
For AMD graphics cards from the Radeon and FirePro lines, download the `*-opencladl-*.zip` file. <br />
For other graphics cards, download `*-opencl-*.zip` file.

Extract or Copy all of the files to a new folder. Either remember the pathname to this folder, or open a new File Explorer window to view the contents of the folder (For the rest of this tutorial, we will use `C:\decred\gominer\` as an example). The contents of this folder should be `blake256.cl`, `gominer.exe`, `LICENSE`, `README.md`, and `sample-gominer.conf`.

> Σημειώσεις για την Γραμμή Εντολών

For those who are new, please familiarize yourself with some methods to open a command prompt at a specific directory (folder):

- Στον File Explorer, μεταβείτε στον συγκεκριμένο φάκελο, πληκτρολογήστε `cmd` στη γραμμή διευθύνσεων και πατήστε enter.
- In File Explorer, navigate to specific folder, click the "File" dropdown, navigate to the "Open command prompt" option, and select "Open command prompt".
- Click the start menu or press the Windows key on your keyboard, type `cmd`, and open the "Command Prompt" Desktop App that should appear in the search results. Change the current directory to a specific folder by using the `cd` command, `e.g. cd C:\decred\gominer\`. The `dir` command by itself can be used to see the contents of the current directory.

### Ρύθμιση του Αρχείου Ρυθμίσεων του *gominer*

> Βήμα 1: Επιλογή Mining Pool

Before we begin this step, it is important that you've already signed up for a mining pool account (if required by your chosen mining pool, you'll have to create a worker at the pool's website). Record your worker's login and password, and the pool's stratum+tcp address:port for later use.

If this is new to you, here are a few guides for creating workers on some of the Decred mining pools (WARNING: do not forget your PIN you set during account creation - you will be unable to withdraw any mined DCR without it):

- [https://dcr.maxminers.net/index.php?page=gettingstarted](https://dcr.maxminers.net/index.php?page=gettingstarted)
- [https://dcr.suprnova.cc/index.php?page=gettingstarted](https://dcr.suprnova.cc/index.php?page=gettingstarted)
- [https://www2.coinmine.pl/dcr/index.php?page=gettingstarted](https://www2.coinmine.pl/dcr/index.php?page=gettingstarted)
- [https://pool.mn/dcr/index.php?page=gettingstarted](https://pool.mn/dcr/index.php?page=gettingstarted)

> Βήμα 2: Επαλήθευση του Αναγνωριστικού Συσκευής#

Before setting up the configuration file, it is vital you find out which devices, as identified by gominer, you wish to use to mine (especially if you want to avoid mining with your CPU or IGP). To do this, open the Command Prompt at the location of `gominer.exe` (`e.g. C:\decred\gominer\`), type `gominer.exe -l`, press Enter, and a list of the devices you can mine with will be displayed. Record which device IDs you would like to use. Hint: Your video cards may be listed by their codename.

> Βήμα 3: Επεξεργασία του Αρχείου Ρυθμίσεων

Open the `sample-gominer.conf` file. For each setting we are about to change, simple delete the semi-colon before the setting variable after the `=` sign. 

Εντός της ενότητας "Γενικές ρυθμίσεις":

- set `devices=` to the Device ID#(s) recorded by using the `gominer.exe -l` command in the Step 2. Multiple devices should be separated by comma, e.g. `devices=2,3`.

Εντός της ενότητας "Ρυθμίσεις mining":

- set `pool=` to the stratum+tcp address:port of the mining pool of your choice, e.g. decredpool.org uses `stratum+tcp://stratum.decredpool.org:3333` (WARNING: the http://address:port will not work with gominer - stratum+tcp *must* be used).
- set `pooluser=` to your worker's login.
- set `poolpass=` to your worker's password.

After these changes have been made, Save As or Save + Rename the file as gominer.conf.

> Step 4: Copy gominer.conf to Local AppData Folder

Within a new File Explorer, type `%localappdata%\Gominer\` into the address bar. Copy `gominer.conf` from it's original location, `e.g. C:\decred\gominer\`, into `%localappdata%\Gominer\`.

### Εκκινήστε το gominer.exe

Navigate back to the directory that contains `gominer.exe` and `blake256.cl`, `e.g. C:\decred\gominer\`, and launch `gominer.exe`. If everything was done correctly, gominer should read from the configuration file, connect to the pool, and start hashing with the specified devices. You will start seeing scrolling messages, including stats about your hashrate from each device and accepted, rejected, stale, and total shares submitted.

If there is a connection error, it is likely that the `pool`, `pooluser` or `poolpass` is incorrectly configured.

If gominer begins hashing on a device you did not want to use, it is likely that the `devices` setting is incorrectly configured.

If both of the above issues exist, it is likely that the configuration file is incorrectly named (must be named`gominer.conf`) or located in the wrong directory (must be in `%localappdata%\Gominer\`).

### Εξοικειωθείτε με την Ιστοσελίδα του Pool σας

Now that your gominer is hashing away for you, you have time to check out your pool's website. Most pools have a dashboard on their website that you can use to find statistics about the pool, the network, and the current round (time elapsed between each block found by the pool). Also, once you receive a large enough payout, you can withdraw your coins through the Edit Account page by setting a DCR Payment Address and either setting an Automatic Payout threshold, or choosing to Cash Out your total account balance.

### Βοηθητικές Υποδείξεις

*For OpenCL and OpenCL ADL versions of the gominer*, gominer automatically calculates a WorkSize that results in the work algorithm being executed every 500ms. Changing the Intensity/WorkSize settings within `gominer.conf` will result in a known issue - the algorithm will execute at a much quicker pace due to the lowered WorkSize (this will not result in more shares being generated), resulting in an increased usage of memory sometimes as high as 10MB/sec. This eventually leads to your system running out of RAM space and automatically terminating gominer. It is best to leave these settings alone and allow gominer to calculate it's own WorkSize.
