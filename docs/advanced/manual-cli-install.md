# **Manual CLI Installation**

---

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