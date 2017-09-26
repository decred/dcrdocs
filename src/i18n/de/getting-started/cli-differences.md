# Command-Line Differences Across Operating Systems 

This page was last updated for v1.0.0.

---

The purpose of this page is to explain the key differences for running the cross-platform command-line applications on Windows, Linux, and macOS.

---

> Launch Commands

The first major difference in the command line applications (`dcrd`,`dcrwallet`,`dcrctl`) is how you launch them from the command line. This is not as much of an operating system as it is a difference in shells. Windows comes with Command Prompt and PowerShell installed. macOS uses Bash within the Terminal application, and many Linux distributions use Bash as well. Below are examples of the basic run commands for Bash and Command Prompt.

**Command Prompt:** `dcrd.exe`, `dcrwallet.exe`, `dcrctl.exe` <br />
**Bash:** `./dcrd`, `./dcrwallet`, `./dcrctl`

Some of our guides might be OS-agnostic with the launch commands. If a guide says to run `dcrctl --wallet getbalance`, it's referring to using `dcrctl.exe --wallet getbalance` for Command Prompt and `./dcrctl --wallet getbalance` for Bash.

> Application Directory Locations

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

