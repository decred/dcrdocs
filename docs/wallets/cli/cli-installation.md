# <img class="dcr-icon" src="/img/dcr-icons/Dcrtl.svg" /> CLI Installation guide

Last updated for CLI release v{{ cliversion }}.

---

`dcrinstall` is the recommended method to install the Decred command line interface tools `dcrd`, `dcrwallet`, and `dcrctl`.

`dcrinstall` is an automatic installer and upgrader for the Decred software. The newest release can be found here: <https://github.com/decred/decred-release/releases>. Binaries are provided for Windows, macOS and Linux.

`dcrinstall` will automatically download the precompiled, signed binary package found on GitHub, verify the signature of this package, copy the binaries within the package to a specific folder dependent on OS, create configuration files with settings to allow the 3 applications to communicate with each other, and run you through the wallet creation process. After running through `dcrinstall`, you will be able to launch the software with no additional configuration.

??? info "macOS instructions (click to expand)"

    1. Download the `dcrinstall-darwin-amd64-v{{ cliversion }}` file. (32 bit builds for macOS are not available):

    1. For your security, verify that your download hash matches the hash in the Decred releases manifest. For detailed instructions, read about [Verifying Binaries](https://docs.decred.org/advanced/verifying-binaries/).

    1. Make `dcrinstall-darwin-amd64-v{{ cliversion }}` an executable within your terminal, and run it:

        Navigate to the directory where the dcrinstall file was downloaded using the `cd` command, run `chmod` with `u+x` mode on the dcrinstall file, and run the executable that is created. Below is an example of the commands (change directories or filename as needed):

        `cd ~/Downloads/`

        `chmod u+x dcrinstall-darwin-amd64-v{{ cliversion }}`

        `./dcrinstall-darwin-amd64-v{{ cliversion }}`

    1. The executable binaries for `dcrd`, `dcrwallet`, and `dcrctl` can now be found in the `~/decred/` directory. Before the `dcrinstall` process completes, you will be taken to the wallet creation prompt. Follow the steps within the [Wallet Creation Walkthrough](../../wallets/cli/dcrwallet-setup.md#wallet-creation-walkthrough) of the dcrwallet Setup guide to finish.

??? info "Linux instructions (click to expand)"

    1. Download the correct file:

        For 32-bit computers, download the `dcrinstall-linux-386-v{{ cliversion }}` file.

        For 64-bit computers, download the `dcrinstall-linux-amd64-v{{ cliversion }}` file.

        For 32-bit ARM computers, download the `dcrinstall-linux-arm-v{{ cliversion }}` file.

        For 64-bit ARM computers, download the `dcrinstall-linux-arm64-v{{ cliversion }}` file.

    1. For your security, verify that your download hash matches the hash in the Decred releases manifest. For detailed instructions, read about [Verifying Binaries](https://docs.decred.org/advanced/verifying-binaries/).

    1. Make the downloaded file an executable within your terminal and run it:

        Navigate to the directory where the dcrinstall file was downloaded using the `cd` command, run `chmod` with `u+x` mode on the dcrinstall file, and run the executable that is created. Below is an example of the commands (change directories or filename as needed):

        `cd ~/Downloads/`

        `chmod u+x dcrinstall-linux-amd64-v{{ cliversion }}`

        `./dcrinstall-linux-amd64-v{{ cliversion }}`

    1. The binaries for `dcrd`, `dcrwallet`, and `dcrctl` can now be found in the `~/decred/` directory. Before the `dcrinstall` process completes, you will be taken to the wallet creation prompt. Follow the steps within the [Wallet Creation Walkthrough](../../wallets/cli/dcrwallet-setup.md#wallet-creation-walkthrough) of the dcrwallet Setup guide to finish.

??? info "Windows instructions (click to expand)"

    1. Download the correct file:

        For 32-bit computers, download the `dcrinstall-windows-386-v{{ cliversion }}.exe` file.

        For 64-bit computers, download the `dcrinstall-windows-amd64-v{{ cliversion }}.exe` file.

    1. For your security, verify that your download hash matches the hash in the Decred releases manifest. For detailed instructions, read about [Verifying Binaries](https://docs.decred.org/advanced/verifying-binaries/).

    1. Run the dcrinstall executable file. You can either double click it or run it from the Command Prompt.

    1. The binaries for `dcrd`, `dcrwallet`, and `dcrctl` can now be found in the `%HOMEPATH%\decred\` directory (usually `%HOMEPATH%` is `C:\Users\<username>\`). Before the `dcrinstall` process completes, you will be taken to the wallet creation prompt. Follow the steps within the [Wallet Creation Walkthrough](../../wallets/cli/dcrwallet-setup.md#wallet-creation-walkthrough) of the dcrwallet Setup guide to finish.
