# <img class="dcr-icon" src="/img/dcr-icons/Dcrtl.svg" /> Manual CLI Installation

Last updated for CLI release v{{ cliversion }}.

---

The newest binary releases can be found [here](https://github.com/decred/decred-binaries/releases). With the exception of the `.exe` and `.dmg` files, they are archives of the latest executable binaries for each release. Although most of this will be extract and go, instructions are provided for Windows, macOS, and Linux below.

??? info "Windows instructions (click to expand)"

    !!! note

        Windows 7/8/10 provides native support for `.zip` files, therefore it is preferable to use the `.zip` file. If you decide to download the `.tar.gz` file, it will need to be extracted using a third-party application (7-Zip, WinRAR, etc.). Instructions are provided for the `.zip` file.

    1. Download the correct file for your computer:

        | Architecture | Filename                                     |
        | ------------ | ---------------------------------------------|
        | 32-bit       | `decred-windows-386-v{{ cliversion }}.zip`   |
        | 64-bit       | `decred-windows-amd64-v{{ cliversion }}.zip` |

    1. Navigate to download location and extract the `.zip` file:

        Right click on the `.zip` file, select "Extract All..." and a prompt should open asking for the directory to use. The default will extract the `.zip` to a folder with the same name. It should include `dcrctl`, `dcrd`, `dcrwallet`, `sample-dcrctl.conf`, `sample-dcrd.conf`, and `sample-dcrwallet.conf`.

??? info "macOS instructions (click to expand)"

    1. Download the correct file for your computer:

        | Architecture | Filename                                       |
        | ------------ | ---------------------------------------------- |
        | 64-bit       | `decred-darwin-amd64-v{{ cliversion }}.tar.gz` |

    1. Navigate to download location and extract the `.tar.gz` file:

        **Finder:** simply double click on the `.tar.gz` file.

        **Terminal:** use the `tar -xvzf filename.tar.gz` command.

        Both of these should extract the `.tar.gz` file into a folder that shares the same name. (e.g. `tar -xvzf decred-darwin-amd64-v{{ cliversion }}.tar.gz` should extract to `decred-darwin-amd64-v{{ cliversion }}`). It should include `dcrctl`, `dcrd`, `dcrwallet`, `sample-dcrctl.conf`, `sample-dcrd.conf`, and `sample-dcrwallet.conf`.

    !!! note

        If you are using Safari on macOS Sierra and have the 'Open "safe" files after downloading' preference enabled, `.gz` and `.zip` files are automatically extracted after download. The `tar -xvzf filename.tar.gz` command results in this error: `tar: Error opening archive: Failed to open 'filename.tar.gz'`. Use `tar -xvzf filename.tar` instead (remove the `.gz` from the previous command).

??? info "Linux instructions (click to expand)"

    1. Download the correct file for your computer:

        | Architecture | Filename                                      |
        | ------------ | --------------------------------------------- |
        | 32-bit       | `decred-linux-386-v{{ cliversion }}.tar.gz`   |
        | 64-bit       | `decred-linux-amd64-v{{ cliversion }}.tar.gz` |
        | 32-bit ARM   | `decred-linux-arm-v{{ cliversion }}.tar.gz`   |
        | 64-bit ARM   | `decred-linux-arm64-v{{ cliversion }}.tar.gz` |

    1. Navigate to download location and extract the `.tar.gz` file:

        **Ubuntu File Browser:** simply right click on the `.tar.gz` file and select "Extract Here".

        **Terminal:** use the `tar -xvzf filename.tar.gz` command.

        Both of these should extract the `.tar.gz` file into a folder that shares the same name. (e.g. `tar -xvzf decred-linux-amd64-v{{ cliversion }}.tar.gz` should extract to `decred-linux-amd64-v{{ cliversion }}`). It should include `dcrctl`, `dcrd`, `dcrwallet`, `sample-dcrctl.conf`, `sample-dcrd.conf`, and `sample-dcrwallet.conf`.

---

## Minimum Configuration

At the very minimum, for `dcrd`, `dcrwallet`, and `dcrctl` to be able to communicate with each other, they need to be launched with the same `rpcuser`/`rpcpass` combination. For manual configuration please follow these steps:

1. If the OS-specific home directories listed in [Configuration File Locations](../wallets/cli/startup-basics.md#configuration-file-locations) do not exist, please create them for `dcrd`, `dcrwallet`, and `dcrctl`.

1. Choose an arbitrary username and password, these will only be used for each application to communicate via remote procedure call. The easiest configuration is to set them all equal.

1. Using your favorite text editor, create a new text file and add the following lines:

        [Application Options]
        rpcuser=<chosen-username>
        rpcpass=<chosen-password>

    Save it as `dcrd.conf` in `dcrd`'s home directory.

1. Create another new text file and add the following lines:

        [Application Options]
        username=<chosen-username>
        password=<chosen-password>

    Save it as `dcrwallet.conf` in `dcrwallet`'s home directory.

1. Create a third text file and add the following lines:

        [Application Options]
        rpcuser=<chosen-username>
        rpcpass=<chosen-password>

    Save it as `dcrctl.conf` in `dcrctl`'s home directory.

---

## Additional Configuration Options

All command line options can be put in the config file. The sample config files in the release package give additional options or you can run one of the programs with the `-h` flag to show a list and description of all options for the specified application.

There is also a full list of options for each application which can be found [here](../wallets/cli/dcrd-and-dcrwallet-cli-arguments.md).
