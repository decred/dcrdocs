# CLI Installation guide  

This page was last updated for v1.0.1.

---

## dcrinstall 

`dcrinstall` is the recommended method to install the Decred command line interface tools `dcrd`, `dcrwallet`, and `dcrctl`.

`dcrinstall` is an automatic installer and upgrader for the Decred software. The newest release can be found here: [https://github.com/decred/decred-release/releases/tag/v1.1.0](https://github.com/decred/decred-release/releases/tag/v1.1.0). Binaries are provided for Windows, macOS, Linux, OpenBSD, and FreeBSD. Executing installer will install `dcrd`, `dcrwallet`, and `dcrctl`. Instructions are provided for macOS, Linux, and Windows below (assumed proficiency for *BSD users).

`dcrinstall` will automatically download the precompiled, signed binary package found on GitHub, verify the signature of this package, copy the binaries within the package to a specific folder dependent on OS, create configuration files with settings to allow the 3 applications to communicate with each other, and run you through the wallet creation process. After running through `dcrinstall`, you will be able to launch the software with no additional configuration.

> macOS:

1. Download the correct file:

    For 32-bit computers, download the `dcrinstall-darwin-386-v1.1.0` file. <br />
    For 64-bit computers, download the `dcrinstall-darwin-amd64-v1.1.0` file.

2. Make dcrinstall-darwin-xxxx-vx.x.x an executable within your terminal, and run it:

    Navigate to the directory where the dcrinstall file was downloaded using the `cd` command, run chmod with u+x mode on the dcrinstall file, and run the executable that is created. Below is an example of the commands (change directories or filename as needed):
    
    `cd ~/Downloads/` <br />
    `chmod u+x dcrinstall-darwin-amd64-v1.1.0` <br />
    `./dcrinstall-darwin-amd64-v1.1.0`
    
3. The executable binaries for `dcrd`, `dcrwallet`, and `dcrctl` can now be found in the `~/decred/` directory. Before the `dcrinstall` process completes, you will be taken to the wallet creation prompt. Follow the steps within the [Wallet Creation Walkthrough](/getting-started/user-guides/dcrwallet-setup.md#wallet-creation-walkthrough) of the dcrwallet Setup guide to finish.

> Linux:

1. Download the correct file:

    For 32-bit computers, download the `dcrinstall-linux-386-v1.1.0` file. <br />
    For 64-bit computers, download the `dcrinstall-linux-amd64-v1.1.0` file. <br />
    For 32-bit ARM computers, download the `dcrinstall-linux-arm-v1.1.0` file. <br />
    For 64-bit ARM computers, download the `dcrinstall-linux-arm64-v1.1.0` file.

2. Make dcrinstall-linux-xxxx-vx.x.x an executable within your terminal, and run it:

    Navigate to the directory where the dcrinstall file was downloaded using the `cd` command, run chmod with u+x mode on the dcrinstall file, and run the executable that is created. Below is an example of the commands (change directories or filename as needed):
    
    `cd ~/Downloads/` <br />
    `chmod u+x dcrinstall-linux-amd64-v1.1.0` <br />
    `./dcrinstall-linux-amd64-v1.1.0`
    
3. The binaries for `dcrd`, `dcrwallet`, and `dcrctl` can now be found in the `~/decred/` directory. Before the `dcrinstall` process completes, you will be taken to the wallet creation prompt. Follow the steps within the [Wallet Creation Walkthrough](/getting-started/user-guides/dcrwallet-setup.md#wallet-creation-walkthrough) of the dcrwallet Setup guide to finish.

> Windows:

1. Download the correct file:

    For 32-bit computers, download the `dcrinstall-windows-386-v1.1.0.exe` file. <br />
    For 64-bit computers, download the `dcrinstall-windows-amd64-v1.1.0.exe` file. <br />

2.  Run the dcrinstall executable file.

    You can either double click it or run it from the Command Prompt. 
    
3. The binaries for `dcrd`, `dcrwallet`, and `dcrctl` can now be found in the `%HOMEPATH%\decred\` directory (usually %HOMEPATH% is `C:\Users\<username>`). Before the `dcrinstall` process completes, you will be taken to the wallet creation prompt. Follow the steps within the [Wallet Creation Walkthrough](/getting-started/user-guides/dcrwallet-setup.md#wallet-creation-walkthrough) of the dcrwallet Setup guide to finish.
