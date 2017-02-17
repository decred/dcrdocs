# Operating System Compatibility and Differences 

This page was last updated for v0.8.2

---

The purpose of this page is describe which binaries are available for what operating systems. It will also cover the key differences for running the cross-platform command-line applications.

---

## The Applications

**Paymetheus**: The only *complete* GUI client as of v0.8.2. <br />
**dcrd**: The node daemon, this command-line application handles block management and consensus. <br />
**dcrwallet**: The wallet daemon, this command-line application handles address and transaction management. <br />
**dcrctl**: The remote procedure call (RPC) client, this command-line application is used to control dcrd and dcrwallet via RPC commands. <br />
**Decrediton**: BETA GUI client as of v0.8.2.

|           | Paymetheus | dcrd | dcrwallet | dcrctl | Decrediton |
| ---------:|:----------:|:----:|:---------:|:------:|:-----------:|
| Windows   | X          | X    | X         | X      |             |
| macOS     |            | X    | X         | X      | X           |
| Linux     |            | X    | X         | X      | X           |


---

## Command-Line Differences Across Operating Systems

The first major difference in the command line applications (`dcrd`,) is how you launch them from the command line. This is not as much of an operating system as it is a difference in shells. Windows comes with Command Prompt and PowerShell installed. macOS uses Bash within the Terminal application, and many Linux distributions use Bash as well. Below are examples of the basic run commands for Bash and Command Prompt.

**Command Prompt:** `dcrd.exe`, `dcrwallet.exe`, `dcrctl.exe` <br />
**Bash:** `./dcrd`, `./dcrwallet`, `./dcrctl`

Some of our guides might be OS-agnostic with the launch commands. If a guide says to run `dcrctl --wallet getbalance`, it's referring to using `dcrctl.exe --wallet getbalance` for Command Prompt and `./dcrctl --wallet getbalance` for Bash.

The other way the command line clients differ is the location of each application directory (blocks, wallets, configuration files are all stored within the data directory). Below is a table of the default application directories for each application. 

| OS      | dcrd, dcrwallet, dcrctl App Directories      | 
| -------:|:--------------------------------------------- |
| Windows | `C:\Users\<your-username>\AppData\Local\dcrd\`      |
|         | `C:\Users\<your-username>\AppData\Local\dcrwallet\` | 
|         | `C:\Users\<your-username>\AppData\Local\dcrctl\`    |
| macOS   | `~/Library/Application Support/dcrd/`         |
|         | `~/Library/Application Support/dcrwallet/`    |
|         | `~/Library/Application Support/dcrctl/`       |
| Linux   | `~/.dcrd/`                                    |
|         | `~/.dcrwallet/`                               |
|         | `~/.dcrctl/`                                  |

---

To continue on The Golden Path, visit the appropriate link to our guides to Download and Install the Decred Software:

Windows Users who with to use the Paymetheus GUI Client, must use the [Windows Installer](/getting-started/install-guide.md#windows-installer).

dcrd, dcrwallet, and dcrctl Command-Line Package (for Windows, macOS, and Linux) can be installed via [dcrinstall](/getting-started/install-guide.md#dcrinstall) or the [Binary Release archive](/getting-started/install-guide.md#binary-releases).

(Advanced) macOS and Linux users can install the beta Decrediton by visiting the [Decrediton Github Repo](https://github.com/decred/decrediton).
