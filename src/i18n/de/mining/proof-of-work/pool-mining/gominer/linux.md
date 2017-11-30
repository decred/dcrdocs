# **<i class="fa fa-linux"></i> *gominer* Linux Pool Mining User Guide**

This guide is intended for basic initial setup of gominer with the mining pool of choice using a configuration file; more advanced options are available.

Last updated on April 28th, 2017.

---

### **<i class="fa fa-download"></i> Download and Extract the *gominer* Binary**


>Download .tar.gz File

Visit [https://github.com/decred/decred-binaries/releases](https://github.com/decred/decred-binaries/releases) to download the latest gominer Linux binaries. Only 64 bit versions of gominer are available. The current latest releases are:

- `gominer-linux-amd64-cuda-v1.0.0.tar.gz`,
- `gominer-linux-amd64-opencl-v1.0.0.tar.gz`,
- `gominer-linux-amd64-opencladl-v1.0.0.tar.gz`.

For NVIDIA graphics cards, download the `*-cuda-*.tar.gz` file. <br />
For AMD graphics cards from the Radeon and FirePro lines, download the `*-opencladl-*.tar.gz` file. <br />
For other graphics cards, download `*-opencl-*.tar.gz` file.

For you command line lovers, here are the direct links for v1.0.0:

```no-highlight
$ wget https://github.com/decred/decred-binaries/releases/download/v1.0.0_gominer/gominer-linux-amd64-cuda-v1.0.0.tar.gz
$ wget https://github.com/decred/decred-binaries/releases/download/v1.0.0_gominer/gominer-linux-amd64-opencl-v1.0.0.tar.gz
$ wget https://github.com/decred/decred-binaries/releases/download/v1.0.0_gominer/gominer-linux-amd64-opencladl-v1.0.0.tar.gz
```

>Extract the .tar.gz File

Extract or copy all of the files to a new directory. For this tutorial we will use `~/decred/` as our working directory. From the command line:

```no-highlight
$ tar -xzf gominer-linux-amd64-cuda-v1.0.0.tar.gz -C ~/decred/
```

When you unpack the tar, it will create a directory named `gominer-linux-amd64-opencladl-v1.0.0`. The contents of this directory should be `blake256.cl`, `blake256-old.cl`, `gominer`, `LICENSE`, `README.md`, and `sample-gominer.conf`.

For the CUDA version, the CUDA runtime library is now included.  The files in this version will also include `libcudart.so.8.0` and `rungominer.sh`. The script is used to start gominer with the included runtime library for your convenience.  You must have drivers installed for your graphics card that support CUDA 8, however.  Older drivers will cause gominer to crash on launch.

### **Set Up the *gominer* Configuration File**

> Step 1: Choose Mining Pool

Before we begin this step, it is important that you've already signed up for a mining pool account (if required by your chosen mining pool, you'll have to create a worker at the pool's website). Record your worker's login and password, and the pool's stratum+tcp address:port for later use.

If this is new to you, here are a few guides for creating workers on some of the Decred mining pools (WARNING: do not forget your PIN you set during account creation - you will be unable to withdraw any mined DCR without it):

- [https://dcr.maxminers.net/index.php?page=gettingstarted](https://dcr.maxminers.net/index.php?page=gettingstarted)
- [https://dcr.suprnova.cc/index.php?page=gettingstarted](https://dcr.suprnova.cc/index.php?page=gettingstarted)
- [https://www2.coinmine.pl/dcr/index.php?page=gettingstarted](https://www2.coinmine.pl/dcr/index.php?page=gettingstarted)
- [https://pool.mn/dcr/index.php?page=gettingstarted](https://pool.mn/dcr/index.php?page=gettingstarted)

> Step 2: Verify Device ID#

Before setting up the configuration file, it is vital you find out which devices, as identified by gominer, you wish to use to mine. To do this, open a terminal window, navigate to the location you installed gominer above (e.g. `~/decred/gominer-linux-amd64-cuda-v1.0.0`), type `./gominer -l` or `./rungominer.sh -l` if you're using the CUDA version, press Enter, and a list of the devices you can mine with will be displayed. Record which device IDs you would like to use. Hint: Your video cards may be listed by their codename.

> Step 3: Edit Configuration File

Open the `sample-gominer.conf` file with your text editor of choice. For each setting we are about to change, simple delete the semi-colon before the setting variable after the `=` sign. 

Within the "General settings" section:

- set `devices=` to the Device ID#(s) recorded by using the `./gominer -l` or `./rungominer.sh -l` command in Step 2. Multiple devices should be separated by comma, e.g. `devices=2,3`.

Within the "Mining settings" section:

- set `pool=` to the stratum+tcp address:port of the mining pool of your choice, e.g. decredpool.org uses `stratum+tcp://stratum.decredpool.org:3333` (WARNING: the http://address:port will not work with gominer - stratum+tcp *must* be used).
- set `pooluser=` to your worker's login.
- set `poolpass=` to your worker's password.

After these changes have been made, save the file.  Make a copy of it and call it gominer.conf in the gominer config directory:

```no-highlight
$ mkdir -p ~/.gominer
$ cp sample-gominer.conf ~/.gominer/gominer.conf
```

### **Launch gominer**

Navigate back to the directory that contains `gominer` and `blake256.cl`, `e.g. ~/decred/gominer-linux-amd64-cuda-v1.0.0/`, and launch it - `./gominer` or `./rungominer.sh`. If everything was done correctly, gominer should read from the configuration file, connect to the pool, and start hashing with the specified devices. You will start seeing scrolling messages, including stats about your hashrate from each device and accepted, rejected, stale, and total shares submitted.

If there is a connection error, it is likely that the `pool`, `pooluser` or `poolpass` is incorrectly configured.

If gominer begins hashing on a device you did not want to use, it is likely that the `devices` setting is incorrectly configured.

If both of the above issues exist, it is likely that the configuration file is incorrectly named (must be named`gominer.conf`) or located in the wrong directory (must be in `~/.gominer/`).

### **Familiarize Yourself with Your Pool's Website**

Now that your gominer is hashing away for you, you have time to check out your pool's website. Most pools have a dashboard on their website that you can use to find statistics about the pool, the network, and the current round (time elapsed between each block found by the pool). Also, once you receive a large enough payout, you can withdraw your coins through the Edit Account page by setting a DCR Payment Address and either setting an Automatic Payout threshold, or choosing to Cash Out your total account balance.

### **Helpful Hints**

*For OpenCL and OpenCL ADL versions of the gominer*, gominer automatically calculates a WorkSize that results in the work algorithm being executed every 500ms. Changing the Intensity/WorkSize settings within `gominer.conf` will result in a known issue - the algorithm will execute at a much quicker pace due to the lowered WorkSize (this will not result in more shares being generated), resulting in an increased usage of memory sometimes as high as 10MB/sec. This eventually leads to your system running out of RAM space and automatically terminating gominer. It is best to leave these settings alone and allow gominer to calculate it's own WorkSize.
