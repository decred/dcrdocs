# 入门指南

更新版本为v1.0.1

---

## 欢迎来到Decred

欢迎来到Decred! 很开心你能来到这里。 你或许已经知道，Decred是不同的。这里有很多新的东西需要学习才能充分掌握它的工作方式。 本文档将尝试使事情变得更容易理解。

这份初学者指南是一条启动运行Decread软件的线路。您可以从多个客户端选择，以得到一个网络中节点以及将Decred币放到您的钱包中。具体来说，您将学习如何安装，设置和使用Decred应用程序; 如何获得DCR; 如何通过权益证明投票; 以及如何使用区块浏览器。

首先你需要认真阅读[安装引导](#安装指导),然后可以根据需要再看相应的应用，应用运行起来之后，通读页面下方[通用指南](#通用指导)。如果你有什么问题，可以加入我们的[Slack](/support-directory.md#join-us-on-slack)以寻求帮助。

**注意: 在学习使用Decred程序的过程中，我们强烈建议你使用测试网络，这可以减少出错的可能以及资产的丢失。 启动你所需要程序之后, 请阅读[测试指南](/getting-started/using-testnet.md)以进一步学习如何让你的程序访问Decred的测试网络。**
---

## 应用 

下面以表格的形式列出了当前可用的应用，同时也给出了应用的操作系统兼容情况。

**Paymetheus**: v1.1.0. windows独占可视化钱包客户端  <br />
**dcrd**: 节点程序，命令行程序，负责区块管理及共识 <br />
**dcrwallet**: 钱包程序，命令行程序，负责管理地址及交易 <br />
**dcrctl**: RPC客户端,命令行程序，通过Rpc命令控制dcrd及dcrwallet <br />
**Decrediton**: v1.1.0 可视化钱包客户端 .

|           | Paymetheus | dcrd | dcrwallet | dcrctl | Decrediton |
| ---------:|:----------:|:----:|:---------:|:------:|:-----------:|
| Windows   | X          | X    | X         | X      |             |
| macOS     |            | X    | X         | X      | X           |
| Linux     |            | X    | X         | X      | X           |
| Other UNIX|            | X    | X         | X      |             |

UNIX类似系统当前还支持了*BSDs和Solaris/illumos.

注意: 你可能已经注意到Decred和其他主流加密货币的区别指出：钱包和节点程序是分离的，许多其他加密货币把这些功能
集中在一个进程之中。因而，对于使用命令行接口的人来说，必须运行`dcrd` 来获取节点功能，运行`dcrwallet`来管理DCR，创建交易以及参与POS，挖矿/投票。

---

## 安装指导

开始之前，请选择一个适合你当前操作系统的安装程序

* [Paymetheus](/getting-started/user-guides/paymetheus.md)
* [Command Line Suite **via dcrinstall**](/getting-started/user-guides/cli-installation.md) - 注意:  
`dcrinstall` 是运行命令行节点和钱包最快、最简单的方式，推荐使用这种方式并且下面的命令行启动引导也会假定你曾经使用过这种方法
* [Decrediton (ALPHA)](/getting-started/user-guides/decrediton-setup.md)

---

**注意:** 下文所有的指导都可以在导航菜单中找到同名的选项

## windows独占可视化钱包（Paymetheus） 

按下面指导的顺序阅读，你会启动你的钱包程序：

* [启动Paymetheus](/getting-started/user-guides/paymetheus.md)
* [使用Paymetheus](/getting-started/user-guides/using-paymetheus.md)

## 跨平台可视化钱包 （Decrediton  ） 

下面的指导能帮你载入Decrediton：

* [启动Decrediton](/getting-started/user-guides/decrediton-setup.md)

## 命令行方式（Command-Line Path） 

按顺序阅读下面的指导，你将能够运行命令行程序（`dcrd`, `dcrwallet`, `dcrctl`）:

* [命令行方式的区别](/getting-started/cli-differences.md)
* [基础启动选项](/getting-started/startup-basics.md)
* [启动dcrd](/getting-started/user-guides/dcrd-setup.md)
* [启动dcrwallet](/getting-started/user-guides/dcrwallet-setup.md)
* [dcrctl基础用法](/getting-started/user-guides/dcrctl-basics.md)

## 通用指导

以下指南与你使用何种方式启动decred程序无关:

* [如何使用测试网络](/getting-started/using-testnet.md)
* [如何获取DCR](/getting-started/obtaining-dcr.md)
* [如何使用区块链浏览器](/getting-started/using-the-block-explorer.md)
* [POS指南](/mining/proof-of-stake.md)
* [主网投票指南](/getting-started/user-guides/agenda-voting.md)
