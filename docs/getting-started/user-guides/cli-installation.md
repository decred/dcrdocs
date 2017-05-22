# ** CLI Installation guide **

This page was last updated for v1.0.1.

---

There are two methods to install Decred CLI (command line interface) tools `dcrd`, `dcrwallet`, and `dcrctl`.

* [dcrinstall](#dcrinstall) - The recommended method. `dcrinstall` is a cross-platform, automatic installer/updater for the all of the command-line applications. It is the quickest and easiest option to get a wallet running.
* [Binary Releases](#binary-releases) - This option is recommended for advanced users only; manually download, install and configure precompiled binaries.

---

## **dcrinstall**

`dcrinstall` is an automatic installer and upgrader for the Decred software. The newest release can be found here: [https://github.com/decred/decred-release/releases/tag/v1.0.1](https://github.com/decred/decred-release/releases/tag/v1.0.1). Binaries are provided for Windows, OSX/macOS, Linux, OpenBSD, and FreeBSD. Executing installer will install `dcrd`, `dcrwallet`, and `dcrctl`. Instructions are provided for Mac, Linux, and Windows below (assumed proficiency for *BSD users).

This method is recommended over the traditional manual installation. `dcrinstall` will automatically download the precompiled, signed binary package found on GitHub, verify the signature of this package, copy the binaries within the package to a specific folder dependant on OS, create configuration files with settings to allow the 3 applications to communicate with each other, and run you through the wallet creation process. After running through `dcrinstall`, you will be able to launch the software with no additional configuration.

> OSX/macOS:

1. Download the correct file:

    For 32-bit computers, download the `dcrinstall-darwin-386-v1.0.1` file. <br />
    For 64-bit computers, download the `dcrinstall-darwin-amd64-v1.0.1` file.

2. Make dcrinstall-darwin-xxxx-vx.x.x an executable within your terminal, and run it:

    Navigate to the directory where the dcrinstall file was downloaded using the `cd` command, run chmod with u+x mode on the dcrinstall file, and run the executable that is created. Below is an example of the commands (change directories or filename as needed):
    
    `cd ~/Downloads/` <br />
    `chmod u+x dcrinstall-darwin-amd64-v1.0.1` <br />
    `./dcrinstall-darwin-amd64-v1.0.1`
    
3. The executable binaries for `dcrd`, `dcrwallet`, and `dcrctl` can now be found in the `~/decred/` directory. Before the `dcrinstall` process completes, you will be taken to the wallet creation prompt. Follow the steps within the [Wallet Creation Walkthrough](/getting-started/user-guides/dcrwallet-setup.md#wallet-creation-walkthrough) of the dcrwallet Setup guide to finish.

> Linux:

1. Download the correct file:

    For 32-bit computers, download the `dcrinstall-linux-386-v1.0.1` file. <br />
    For 64-bit computers, download the `dcrinstall-linux-amd64-v1.0.1` file. <br />
    For 32-bit ARM computers, download the `dcrinstall-linux-arm-v1.0.1` file. <br />
    For 64-bit ARM computers, download the `dcrinstall-linux-arm64-v1.0.1` file.

2. Make dcrinstall-linux-xxxx-vx.x.x an executable within your terminal, and run it:

    Navigate to the directory where the dcrinstall file was downloaded using the `cd` command, run chmod with u+x mode on the dcrinstall file, and run the executable that is created. Below is an example of the commands (change directories or filename as needed):
    
    `cd ~/Downloads/` <br />
    `chmod u+x dcrinstall-linux-amd64-v1.0.1` <br />
    `./dcrinstall-linux-amd64-v1.0.1` 
    
3. The binaries for `dcrd`, `dcrwallet`, and `dcrctl` can now be found in the `~/decred/` directory. Before the `dcrinstall` process completes, you will be taken to the wallet creation prompt. Follow the steps within the [Wallet Creation Walkthrough](/getting-started/user-guides/dcrwallet-setup.md#wallet-creation-walkthrough) of the dcrwallet Setup guide to finish.

> Windows:

1. Download the correct file:

    For 32-bit computers, download the `dcrinstall-windows-386-v1.0.1.exe` file. <br /> 
    For 64-bit computers, download the `dcrinstall-windows-amd64-v1.0.1.exe` file. <br />

2.  Run the dcrinstall executable file.

    You can either double click it or run it from the Command Prompt. 
    
3. The binaries for `dcrd`, `dcrwallet`, and `dcrctl` can now be found in the `%HOMEPATH%\decred\` directory (usually %HOMEPATH% is `C:\Users\<username>`). Before the `dcrinstall` process completes, you will be taken to the wallet creation prompt. Follow the steps within the [Wallet Creation Walkthrough](/getting-started/user-guides/dcrwallet-setup.md#wallet-creation-walkthrough) of the dcrwallet Setup guide to finish.


---

## **Binary Releases**

The newest Binary Releases can be found here: [https://github.com/decred/decred-binaries/releases](https://github.com/decred/decred-binaries/releases). With the exception of the `.msi` and `.dmg` files, they are archives of the latest executable binaries for each release. Although most of this will be unzip and go, instructions are provided for Mac, Linux, and Windows below (assumed proficiency for *BSD users).

> OSX/macOS

1. Download the correct file:

    For 32-bit computers, download the `decred-darwin-386-v1.0.1.tar.gz` file. <br />
    For 64-bit computers, download the `decred-darwin-amd64-v1.0.1.tar.gz` file.

2. Navigate to download location and extract the .tar.gz file:

    Finder: simply double click on the .tar.gz file. <br />
    Terminal: use the `tar -xvzf filename.tar.gz` command. 

    **NOTE**: If you are using Safari on macOS Sierra and have the 'Open "safe" files after downloading' preference enabled, .gz and .zip files are automatically uncompressed after download. The `tar -xvzf filename.tar.gz` command results in this error: `tar: Error opening archive: Failed to open 'filename.tar.gz'`. Use `tar -xvzf filename.tar` instead (remove the .gz from the previous command).
    
    Both of these should extract the tar into a folder that shares the same name. (`e.g. tar -xvzf decred-darwin-amd64-v1.0.1.tar.gz` should extract to `decred-darwin-amd64-v1.0.1`). It should include `dcrctl`, `dcrd`, `dcrwallet`, `sample-dcrctl.conf`, `sample-dcrd.conf`, and `sample-dcrwallet.conf`.


> Linux

1. Download the correct file:

    For 32-bit computers, download the `decred-linux-386-v1.0.1.tar.gz` file. <br />
    For 64-bit computers, download the `decred-darwin-amd64-v1.0.1.tar.gz` file. <br />
    For 32-bit ARM computers, download the `decred-linux-arm-v1.0.1.tar.gz` file. <br />
    For 64-bit ARM computers, download the `decred-linux-arm64-v1.0.1.tar.gz` file.

2. Navigate to download location and extract the .tar.gz file:

    Ubuntu File Browser: simply right click on the .tar.gz and select "Extract Here". <br />
    Terminal: use the `tar -xvzf filename.tar.gz` command. 
    
    Both of these should extract the tar.gz into a folder that shares the same name. (`e.g. tar -xvzf decred-darwin-amd64-v1.0.1.tar.gz` should extract to `decred-darwin-amd64-v1.0.1`). It should include `dcrctl`, `dcrd`, `dcrwallet`, `sample-dcrctl.conf`, `sample-dcrd.conf`, and `sample-dcrwallet.conf`.

> Windows

Note: Windows 7/8/10 natively provides support for `.zip` files, therefore it is preferable to use the `.zip` file so that third-party applications aren't required for the `.tar.gz` file. Instructions are provided for the `.zip` file.

1. Download the correct file:

    For 32-bit computers, download the `decred-windows-386-v1.0.1.zip` file. <br />
    For 64-bit computers, download the `decred-windows-amd64-v1.0.1.zip` file.

2. Navigate to download location and unzip the `.zip` file:

    File Explorer: Right click on the .zip file, select "Extract All.." and a prompt should open asking for the directory to use. The default will extract the `.zip` to a folder with the same name. It should include `dcrctl`, `dcrd`, `dcrwallet`, `sample-dcrctl.conf`, `sample-dcrd.conf`, and `sample-dcrwallet.conf`.

If you decide to download the `.tar.gz` file, it will require two separate extractions in some third-party application (7-zip, winRAR, etc..) to get to the actual binaries.