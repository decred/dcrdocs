# Command-Line Differences Across Operating Systems 

---

The purpose of this page is to explain the key differences for running the cross-platform command-line applications on Windows, Linux, and macOS.

---

> Launch Commands

The first major difference in the command line applications (`dcrd`,`dcrwallet`,`dcrctl`) is how you launch them from the command line. This is not as much of an operating system as it is a difference in shells. Windows comes with Command Prompt and PowerShell installed. macOS uses Bash within the Terminal application, and many Linux distributions use Bash as well. Below are examples of the basic run commands for Bash and Command Prompt.

**Command Prompt:** `dcrd.exe`, `dcrwallet.exe`, `dcrctl.exe` <br />
**Bash:** `./dcrd`, `./dcrwallet`, `./dcrctl`

Some of our guides might be OS-agnostic with the launch commands. If a guide says to run `dcrctl --wallet getbalance`, it's referring to using `dcrctl.exe --wallet getbalance` for Command Prompt and `./dcrctl --wallet getbalance` for Bash.

> Application Directory Locations

The other way the command line clients differ is the location of each application directory (blocks, wallets, log files, configuration files are all stored within the data directory). Below is a table of the default application directories for each application. 

| OS      | dcrd, dcrwallet, dcrctl App Directories    |
| -------:|:------------------------------------------:|
| Windows | `%LOCALAPPDATA%\Dcrd\`                     |
|         | `%LOCALAPPDATA%\Dcrwallet\`                |
|         | `%LOCALAPPDATA%\Dcrctl\`                   |
| macOS   | `~/Library/Application Support/Dcrd/`      |
|         | `~/Library/Application Support/Dcrwallet/` |
|         | `~/Library/Application Support/Dcrctl/`    |
| Linux   | `~/.dcrd/`                                 |
|         | `~/.dcrwallet/`                            |
|         | `~/.dcrctl/`                               |
