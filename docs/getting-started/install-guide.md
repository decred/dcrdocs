# Installation Guide

This guide was last updated for v0.8.2.

---

There are four methods for downloading and installing the Decred software. One is via dcrinstall (cross-platform), one is via the Windows Installer (Windows only of course, and the only way to get Paymetheus as of v0.8.2), another is via the precompiled binary releases (cross-platform), and the other is building the software yourself (cross-platform). The first three methods will be covered here and the fourth may be added at a later date.

---

## **Paymetheus** 

The Windows Installer (`.msi` file) is located here: [https://github.com/decred/decred-binaries/releases](https://github.com/decred/decred-binaries/releases). It will install Paymetheus to your computer's Program Files folder. Installation is pretty straightforward, but instructions are provided below:

1. Download the correct file:

    For 32-bit computers, download the `decred_0.8.2-beta_x86.msi` file. <br />
    For 64-bit computers, download the `decred_0.8.2-beta_x64.msi` file.

2. Navigate to download location and double click the `.msi` file.

3. Follow the installation steps. Within this process you'll be prompted to accept an End-User License Agreement.

4. After setup, the features should be installed to your `..\Program Files\Decred\` folder and accessible through the Start Menu (look for `Decred` in the Program list)

---

## **dcrinstall**

`dcrinstall` is an automatic installer and upgrader for the Decred software. The newest release can be found here: [https://github.com/decred/decred-release/releases](https://github.com/decred/decred-release/releases). Binaries are provided for Windows, OSX/macOS, Linux, OpenBSD, and FreeBSD. Executing installer will install `dcrd`, `dcrwallet`, and `dcrctl`. Instructions are provided for Mac, Linux, and Windows below (assumed proficiency for *BSD users).

> OSX/macOS:

1. Download the correct file:

    For 32-bit computers, download the `dcrinstall-darwin-386-v0.8.2` file. <br />
    For 64-bit computers, download the `dcrinstall-darwin-amd64-v0.8.2` file.

2. Make dcrinstall-darwin-xxxx-vx.x.x an executable within your terminal:

    Navigate to the directory where the dcrinstall file was downloaded using the `cd` command, run chmod with u+x mode on the dcrinstall file, and run the executable that is created. Below is an example of the commands (change directories or filename as needed):
    
    `cd ~/Downloads/` <br />
    `chmod u+x dcrinstall-darwin-amd64-v0.8.2` <br />
    `./dcrinstall-darwin-amd64-v0.8.2`
    
3. The binaries for `dcrd`, `dcrwallet`, and `dcrctl` can then be found in the `~/decred/` directory.

> Linux:

1. Download the correct file:

    For 32-bit computers, download the `dcrinstall-linux-386-v0.8.2` file. <br />
    For 64-bit computers, download the `dcrinstall-linux-amd64-v0.8.2` file. <br />
    For 32-bit ARM computers, download the `dcrinstall-linux-arm-v0.8.2` file. <br />
    For 64-bit ARM computers, download the `dcrinstall-linux-arm64-v0.8.2` file.

2. Make dcrinstall-darwin-xxxx-vx.x.x an executable within your terminal:

    Navigate to the directory where the dcrinstall file was downloaded using the `cd` command, run chmod with u+x mode on the dcrinstall file, and run the executable that is created. Below is an example of the commands (change directories or filename as needed):
    
    `cd ~/Downloads/` <br />
    `chmod u+x dcrinstall-darwin-amd64-v0.8.2` <br />
    `./dcrinstall-darwin-amd64-v0.8.2` 
    
3. The binaries for `dcrd`, `dcrwallet`, and `dcrctl` can then be found in the `~/decred/` directory.

> Windows:

1. Download the correct file:

    For 32-bit computers, download the `dcrinstall-windows-386-v0.8.2.exe` file. <br /> 
    For 64-bit computers, download the `dcrinstall-windows-amd64-v0.8.2.exe` file. <br />

2.  Run the dcrinstall executable file.

    You can either double click it or run it from the Command Prompt. 
    
3. The binaries for `dcrd`, `dcrwallet`, and `dcrctl` can then be found in the `%HOMEPATH%\decred\` directory (usually %HOMEPATH% is `C:\Users\username`).

---

## **Binary Releases**

The newest Binary Releases can be found here: [https://github.com/decred/decred-binaries/releases](https://github.com/decred/decred-binaries/releases). With the exception of the `.msi` and `.dmg` files, they are archives of the latest executable binaries for each release. Although most of this will be unzip and go, instructions are provided for Mac, Linux, and Windows below (assumed proficiency for *BSD users).

> OSX/macOS

1. Download the correct file:

    For 32-bit computers, download the `decred-darwin-386-v0.8.2.tar.gz` file. <br />
    For 64-bit computers, download the `decred-darwin-amd64-v0.8.2.tar.gz` file.

2. Navigate to download location and extract the .tar.gz file:

    Finder: simply double click on the .tar.gz file. <br />
    Terminal: use the `tar -xvzf filename.tar.gz` command. 

    **NOTE**: If you are using Safari on macOS Sierra and have the 'Open "safe" files after downloading' preference enabled, .gz and .zip files are automatically uncompressed after download. The `tar -xvzf filename.tar.gz` command results in this error: `tar: Error opening archive: Failed to open 'filename.tar.gz'`. Use `tar -xvzf filename.tar` instead (remove the .gz from the previous command).
    
    Both of these should extract the tar into a folder that shares the same name. (`e.g. tar -xvzf decred-darwin-amd64-v0.8.2.tar.gz` should extract to `decred-darwin-amd64-v0.8.2`). It should include `dcrctl`, `dcrd`, `dcrwallet`, `sample-dcrctl.conf`, `sample-dcrd.conf`, and `sample-dcrwallet.conf`.


> Linux

1. Download the correct file:

    For 32-bit computers, download the `decred-linux-386-v0.8.2.tar.gz` file. <br />
    For 64-bit computers, download the `decred-darwin-amd64-v0.8.2.tar.gz` file. <br />
    For 32-bit ARM computers, download the `decred-linux-arm-v0.8.2.tar.gz` file. <br />
    For 64-bit ARM computers, download the `decred-linux-arm64-v0.8.2.tar.gz` file.

2. Navigate to download location and extract the .tar.gz file:

    Finder: simply double click on the .tar.gz file. <br />
    Terminal: use the `tar -xvzf filename.tar.gz` command. 
    
    Both of these should extract the tar.gz into a folder that shares the same name. (`e.g. tar -xvzf decred-darwin-amd64-v0.8.2.tar.gz` should extract to `decred-darwin-amd64-v0.8.2`). It should include `dcrctl`, `dcrd`, `dcrwallet`, `sample-dcrctl.conf`, `sample-dcrd.conf`, and `sample-dcrwallet.conf`.

> Windows

Note: Windows 7/8/10 natively provides support for `.zip` files, therefore it is preferable to use the `.zip` file so that third-party applications aren't required for the `.tar.gz` file. Instructions are provided for the `.zip` file.

1. Download the correct file:

    For 32-bit computers, download the `decred-windows-386-v0.8.2.zip` file. <br />
    For 64-bit computers, download the `decred-windows-amd64-v0.8.2.zip` file.

2. Navigate to download location and unzip the `.zip` file:

    File Explorer: Right click on the .zip file, select "Extract All.." and a prompt should open asking for the directory to use. The default will extract the `.zip` to a folder with the same name. It should include `dcrctl`, `dcrd`, `dcrwallet`, `sample-dcrctl.conf`, `sample-dcrd.conf`, and `sample-dcrwallet.conf`.

If you decide to download the `.tar.gz` file, it will require two separate extractions in some third-party application (7-zip, winRAR, etc..) to get to the actual binaries.

-----------------------
