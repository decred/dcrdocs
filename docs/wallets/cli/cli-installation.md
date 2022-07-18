# ![](../../img/dcr-icons/Dcrtl.svg){ .dcr-icon } CLI Installation guide

Last updated for CLI release v{{ cliversion }}.

---

`dcrinstall` makes it easy to install Decred Command Line Interface (CLI) tools on a single machine. Everything is automatically configured to work right out of the box. This includes `dcrd`, `dcrwallet`, `dcrctl`, `dcrlnd`, and `dcrlncli`.

`dcrinstall` is an automatic installer and upgrader for the Decred software. The newest release can be found here: <https://github.com/decred/decred-release/releases>. Binaries are provided for Windows, macOS, Linux, and BSD.

`dcrinstall` will automatically download the precompiled, signed binary package found on GitHub, verify the signature of this package, copy the binaries within the package to a specific folder dependent on OS, create configuration files with settings to allow the 3 applications to communicate with each other, and run you through the wallet creation process. After running `dcrinstall`, you will be able to launch the software with no additional configuration.

!!! tip "Looking for a more advanced setup?"
    
    If you are interested in advanced configurations or Solo PoS Voting, consider reading the [Solo Voting](../../advanced/solo-proof-of-stake-voting.md) guide.

    If you are interested in networking between multiple devices, consider reading the [Secure Cold Wallet](../../advanced/secure-cold-wallet-setup.md) guide.

=== "macOS"

    1. Download the correct file for your computer:

        | Architecture | Filename                                       |
        | ------------ | ---------------------------------------------- |
        | 64-bit       | `decred-darwin-amd64-v{{ cliversion }}.tar.gz` |
        | M1 Chip      | `decred-darwin-arm64-v{{ cliversion }}.tar.gz` |
    
    1. For your security, verify that your download hash matches the hash in the Decred releases manifest. For detailed instructions, read about [Verifying Binaries](../../advanced/verifying-binaries.md).

    1. Navigate to download location and extract the `.tar.gz` file:

        **Finder:** simply double click on the `.tar.gz` file.

        **Terminal:** use the `tar -xvzf filename.tar.gz` command.

        Both of these should extract the `.tar.gz` file into a folder that shares the same name. (e.g. `tar -xvzf decred-darwin-amd64-v{{ cliversion }}.tar.gz` should extract to `decred-darwin-amd64-v{{ cliversion }}`).

    1. Make the downloaded file an executable within your terminal and run it:

        Navigate to the directory where the dcrinstall file was downloaded using the `cd` command, run `chmod` with `u+x` mode on the dcrinstall file, and run the executable that is created. Below is an example of the commands (change directories or filename as needed):

        `cd ~/Downloads/`

        `chmod u+x dcrinstall-darwin-amd64-v{{ cliversion }}`

        `./dcrinstall-darwin-amd64-v{{ cliversion }}`

    1. The executable binaries for `dcrd`, `dcrwallet`, and `dcrctl` can now be found in the `~/decred/` directory. Before the `dcrinstall` process completes, you will be taken to the wallet creation prompt. Follow the steps within the [Wallet Creation Walkthrough](../../wallets/cli/dcrwallet-setup.md#wallet-creation-walkthrough) of the dcrwallet Setup guide to finish.

=== "Linux"

    1. Download the correct file for your computer:

        | Architecture | Filename                                      |
        | ------------ | --------------------------------------------- |
        | 32-bit       | `decred-linux-386-v{{ cliversion }}.tar.gz`   |
        | 64-bit       | `decred-linux-amd64-v{{ cliversion }}.tar.gz` |
        | 32-bit ARM   | `decred-linux-arm-v{{ cliversion }}.tar.gz`   |
        | 64-bit ARM   | `decred-linux-arm64-v{{ cliversion }}.tar.gz` |

    1. For your security, verify that your download hash matches the hash in the Decred releases manifest. For detailed instructions, read about [Verifying Binaries](../../advanced/verifying-binaries.md).

    1. Navigate to download location and extract the `.tar.gz` file:

        **Ubuntu File Browser:** simply right click on the `.tar.gz` file and select "Extract Here".

        **Terminal:** use the `tar -xvzf filename.tar.gz` command.

        Both of these should extract the `.tar.gz` file into a folder that shares the same name. (e.g. `tar -xvzf decred-linux-amd64-v{{ cliversion }}.tar.gz` should extract to `decred-linux-amd64-v{{ cliversion }}`).

    1. Make the downloaded file an executable within your terminal and run it:

        Navigate to the directory where the dcrinstall file was downloaded using the `cd` command, run `chmod` with `u+x` mode on the dcrinstall file, and run the executable that is created. Below is an example of the commands (change directories or filename as needed):

        `cd ~/Downloads/`

        `chmod u+x dcrinstall-linux-amd64-v{{ cliversion }}`

        `./dcrinstall-linux-amd64-v{{ cliversion }}`

    1. The binaries for `dcrd`, `dcrwallet`, and `dcrctl` can now be found in the `~/decred/` directory. Before the `dcrinstall` process completes, you will be taken to the wallet creation prompt. Follow the steps within the [Wallet Creation Walkthrough](../../wallets/cli/dcrwallet-setup.md#wallet-creation-walkthrough) of the dcrwallet Setup guide to finish.

=== "Windows"

    1. Download the correct file for your computer:

        | Architecture | Filename                                     |
        | ------------ | ---------------------------------------------|
        | 32-bit       | `decred-windows-386-v{{ cliversion }}.zip`   |
        | 64-bit       | `decred-windows-amd64-v{{ cliversion }}.zip` |

    1. For your security, verify that your download hash matches the hash in the Decred releases manifest. For detailed instructions, read about [Verifying Binaries](../../advanced/verifying-binaries.md).

    1. Navigate to download location and extract the `.zip` file:

        Right click on the `.zip` file, select "Extract All..." and a prompt should open asking for the directory to use. The default will extract the `.zip` to a folder with the same name.

    1. Run the dcrinstall executable file. You can either double click it or run it from the Command Prompt.

    1. The binaries for `dcrd`, `dcrwallet`, and `dcrctl` can now be found in the `%HOMEPATH%\decred\` directory (usually `%HOMEPATH%` is `C:\Users\<username>\`). Before the `dcrinstall` process completes, you will be taken to the wallet creation prompt. Follow the steps within the [Wallet Creation Walkthrough](../../wallets/cli/dcrwallet-setup.md#wallet-creation-walkthrough) of the dcrwallet Setup guide to finish.

=== "BSD"

    1. Download the correct file for your computer:

        | Architecture  | Filename                                        |
        | ------------- | ----------------------------------------------- |
        | FreeBSD amd64 | `decred-freebsd-amd64-v{{ cliversion }}.tar.gz` |
        | OpenBSD amd64 | `decred-openbsd-amd64-v{{ cliversion }}.tar.gz` |

    1. For your security, verify that your download hash matches the hash in the Decred releases manifest. For detailed instructions, read about [Verifying Binaries](../../advanced/verifying-binaries.md).

    1. Navigate to download location and extract the `.tar.gz` file:

        **Terminal:** use the `tar -xvzf filename.tar.gz` command.

        The `.tar.gz` file will be extracted into a folder that shares the same name. (e.g. `tar -xvzf decred-openbsd-amd64-v{{ cliversion }}.tar.gz` should extract to `decred-openbsd-amd64-v{{ cliversion }}`).

    1. Make the downloaded file an executable within your terminal and run it:

        Navigate to the directory where the dcrinstall file was downloaded using the `cd` command, run `chmod` with `u+x` mode on the dcrinstall file, and run the executable that is created. Below is an example of the commands (change directories or filename as needed):

        `cd ~/Downloads/`

        `chmod u+x dcrinstall-linux-amd64-v{{ cliversion }}`

        `./dcrinstall-linux-amd64-v{{ cliversion }}`

    1. The binaries for `dcrd`, `dcrwallet`, and `dcrctl` can now be found in the `~/decred/` directory. Before the `dcrinstall` process completes, you will be taken to the wallet creation prompt. Follow the steps within the [Wallet Creation Walkthrough](../../wallets/cli/dcrwallet-setup.md#wallet-creation-walkthrough) of the dcrwallet Setup guide to finish.