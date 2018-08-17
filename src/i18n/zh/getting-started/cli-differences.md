# 命令行在不同系统之间的区别

本页最新更新对应版本为v1.0.0

---

本页的目的是为了说明命令行在不同系统（windows,Linux,和macOS）上的关键差别。

---

> 启动命令

命令行程序(`dcrd`,`dcrwallet`,`dcrctl`)的第一个主要差别是调用命令行的程序的方式不同。这与操作系统没太大关系，主要是shell区别，widows使用命令行提示符和PowerShell。macOS使用bash和终端程序，很多Linux发行版也使用Bash，下面给出了一些基础的例子，用于说明如何在Bash和命令行提示窗口上执行命令行。

**命令提示符:** `dcrd.exe`, `dcrwallet.exe`, `dcrctl.exe` <br />
**Bash:** `./dcrd`, `./dcrwallet`, `./dcrctl`

指导中的启动命令行可能没有特别指定操作系统，如果让你执行命令`dcrctl --wallet getbalance`，这既指在命令提示符中使用命令`dcrctl.exe --wallet getbalance`，也是在Bash中执行命令`./dcrctl --wallet getbalance`。

> 应用程序目录位置

命令行程序在不同系统间的另一个区别是各自的程序目录不一样（块数据，钱包数据，配置文件，日志等），下面给出一个表格，列出了所有应用程序的默认程序路径

| 系统     | dcrd, dcrwallet, dcrctl App Directories      | 
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

