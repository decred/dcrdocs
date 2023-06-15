# ![](../../img/dcr-icons/Dcrtl.svg){ .dcr-icon } CLI Installation guide

Last updated for CLI release v{{ cliversion }}.

---

`dcrinstall` is an automatic installer and upgrader for the Decred software.
It makes it easy to install Decred Command Line Interface (CLI) tools on a single machine.
Everything is automatically configured to work right out of the box.
This includes `dcrd`, `dcrwallet`, `dcrctl`, `dcrlnd`, and `dcrlncli`.

The newest release can be found here: <https://github.com/decred/decred-release/releases>.
Binaries are provided for Windows, macOS, Linux, and BSD.

`dcrinstall` will...

1. Automatically download the precompiled, signed binary package found on GitHub
1. Verify the signature of the downloaded package
1. Copy the binaries within the package to a specific folder dependent on OS
1. Create configuration files with settings to allow the applications to communicate with each other
1. Run you through the wallet creation process.

After running `dcrinstall`, you will be able to launch the software with no additional configuration.

!!! tip "Looking for a more advanced setup?"

    If you are interested in advanced configurations or Solo PoS Voting, consider reading the [Solo Voting](../../advanced/solo-proof-of-stake-voting.md) guide.

    If you are interested in networking between multiple devices, consider reading the [Secure Cold Wallet](../../advanced/secure-cold-wallet-setup.md) guide.

=== "macOS"

    1. Download the correct file for your computer:

        | Architecture  | Filename                                    |
        | ------------- | ------------------------------------------- |
        | Intel         | `dcrinstall-darwin-amd64-v{{ cliversion }}` |
        | Apple Silicon | `dcrinstall-darwin-arm64-v{{ cliversion }}` |
    
    1. For your security, verify that your download hash matches the hash in the Decred releases manifest. For detailed instructions, read about [Verifying Binaries](../../advanced/verifying-binaries.md).

    1. Make the downloaded file an executable within your terminal and run it:

        Navigate to the directory where the dcrinstall file was downloaded using the `cd` command, run `chmod` with `u+x` mode on the dcrinstall file, and run the executable that is created. Below is an example of the commands (change directories or filename as needed):

        `cd ~/Downloads/`

        `chmod u+x dcrinstall-darwin-amd64-v{{ cliversion }}`

        `./dcrinstall-darwin-amd64-v{{ cliversion }}`

    1. The executable binaries for `dcrd`, `dcrwallet`, and `dcrctl` can now be found in the `~/decred/` directory. Before the `dcrinstall` process completes, you will be taken to the wallet creation prompt. Follow the steps within the [Wallet Creation Walkthrough](../../wallets/cli/dcrwallet-setup.md#wallet-creation-walkthrough) of the dcrwallet Setup guide to finish.

=== "Linux"

    1. Download the correct file for your computer:

        | Architecture | Filename                                   |
        | ------------ | ------------------------------------------ |
        | 32-bit       | `dcrinstall-linux-386-v{{ cliversion }}`   |
        | 64-bit       | `dcrinstall-linux-amd64-v{{ cliversion }}` |
        | 32-bit ARM   | `dcrinstall-linux-arm-v{{ cliversion }}`   |
        | 64-bit ARM   | `dcrinstall-linux-arm64-v{{ cliversion }}` |

    1. For your security, verify that your download hash matches the hash in the Decred releases manifest. For detailed instructions, read about [Verifying Binaries](../../advanced/verifying-binaries.md).

    1. Make the downloaded file an executable within your terminal and run it:

        Navigate to the directory where the dcrinstall file was downloaded using the `cd` command, run `chmod` with `u+x` mode on the dcrinstall file, and run the executable that is created. Below is an example of the commands (change directories or filename as needed):

        `cd ~/Downloads/`

        `chmod u+x dcrinstall-linux-amd64-v{{ cliversion }}`

        `./dcrinstall-linux-amd64-v{{ cliversion }}`

    1. The binaries for `dcrd`, `dcrwallet`, and `dcrctl` can now be found in the `~/decred/` directory. Before the `dcrinstall` process completes, you will be taken to the wallet creation prompt. Follow the steps within the [Wallet Creation Walkthrough](../../wallets/cli/dcrwallet-setup.md#wallet-creation-walkthrough) of the dcrwallet Setup guide to finish.

=== "Windows"

    1. Download the correct file for your computer:

        | Architecture | Filename                                         |
        | ------------ | -------------------------------------------------|
        | 32-bit       | `dcrinstall-windows-386-v{{ cliversion }}.exe`   |
        | 64-bit       | `dcrinstall-windows-amd64-v{{ cliversion }}.exe` |

    1. For your security, verify that your download hash matches the hash in the Decred releases manifest. For detailed instructions, read about [Verifying Binaries](../../advanced/verifying-binaries.md).

    1. Run the dcrinstall executable file. You can either double click it or run it from the Command Prompt.

    1. The binaries for `dcrd`, `dcrwallet`, and `dcrctl` can now be found in the `%HOMEPATH%\decred\` directory (usually `%HOMEPATH%` is `C:\Users\<username>\`). Before the `dcrinstall` process completes, you will be taken to the wallet creation prompt. Follow the steps within the [Wallet Creation Walkthrough](../../wallets/cli/dcrwallet-setup.md#wallet-creation-walkthrough) of the dcrwallet Setup guide to finish.

=== "BSD"

    1. Download the correct file for your computer:

        | Architecture  | Filename                                     |
        | ------------- | -------------------------------------------- |
        | FreeBSD amd64 | `dcrinstall-freebsd-amd64-v{{ cliversion }}` |
        | OpenBSD amd64 | `dcrinstall-openbsd-amd64-v{{ cliversion }}` |

    1. For your security, verify that your download hash matches the hash in the Decred releases manifest. For detailed instructions, read about [Verifying Binaries](../../advanced/verifying-binaries.md).

    1. Make the downloaded file an executable within your terminal and run it:

        Navigate to the directory where the dcrinstall file was downloaded using the `cd` command, run `chmod` with `u+x` mode on the dcrinstall file, and run the executable that is created. Below is an example of the commands (change directories or filename as needed):

        `cd ~/Downloads/`

        `chmod u+x dcrinstall-openbsd-amd64-v{{ cliversion }}`

        `./dcrinstall-openbsd-amd64-v{{ cliversion }}`

    1. The binaries for `dcrd`, `dcrwallet`, and `dcrctl` can now be found in the `~/decred/` directory. Before the `dcrinstall` process completes, you will be taken to the wallet creation prompt. Follow the steps within the [Wallet Creation Walkthrough](../../wallets/cli/dcrwallet-setup.md#wallet-creation-walkthrough) of the dcrwallet Setup guide to finish.
