# **入门指南**

Last updated for v1.0.1

---

## **欢迎来到Decred**
欢迎来到Decred! 很开心你能来到这里。 你或许已经知道，Decred是不同的。这里有很多新的东西需要学习才能充分掌握它的工作方式。 本文档将尝试使事情变得更容易理解。

这份初学者指南是一条启动运行Decread软件的线路。您可以从多个客户端选择，以得到一个网络中节点以及将Decred币放到您的钱包中。具体来说，您将学习如何安装，设置和使用Decred应用程序; 如何获得DCR; 如何通过权益证明投票; 以及如何使用区块浏览器。

您需要遵循[安装指南](#安装指南)，然后按照你接下来选择的应用来Z路径。在设置完应用程序后，请浏览本页底部的 [General Guides](#general-guide)。 如果您有任何问题，请加入我们的[Slack](/support-directory.md#join-us-on-slack)。

**注意: 强烈推荐使用Testnet来学习如何使用Decred应用程序，而无需担心犯错导致的钱损失。在跟随本指南搭建好你所选择的软件后，请访问[使用Testnet指南](/getting-started/using-testnet.md) 来学习如何在Decred的Testnet中运行您的程序。**

---

## **应用程序**

您可以在下面找到当前可用的应用程序列表，其中列出了在不同操作系统中的兼容性。

**Paymetheus**: Windows独占图形界面客户端，目前版本为v1.0.8. <br />
**dcrd**: 结点守护进程, 该命令行程序处理块管理和一致性。<br />
**dcrwallet**: 钱包守护进程, 该命令行程序处理地址和事务的管理。<br />
**dcrctl**: 远程进程调用(RPC)客户端, 该命令行程序用于通过RPC命令来控制dcrd和dcrwallet。 <br />
**Decrediton**: 跨平台图形界面客户端，目前版本为v1.0.8.

|            | Paymetheus   | dcrd   | dcrwallet   | dcrctl   | Decrediton    |
| ---------: | :----------: | :----: | :---------: | :------: | :-----------: |
| Windows    | X            | X      | X           | X        |               |
| macOS      |              | X      | X           | X        | X             |
| Linux      |              | X      | X           | X        | X             |
| 其他UNIX   |              | X      | X           | X        |               |

"其他UNIX" 目前包括多种 *BSDs 和Solaris/illumos.

注意: 你或许将很快注意到Decred和其他流行的加密货币中间的诸多不同中的一个: 钱包守护进程和结点守护进程是分离的。
许多别的币将二者运行在同一个守护进程中。对于这些选择使用命令行接口的人，这意味这你必须执行`dcrd`来获取所有结点的功能，并且运行`dcrwallet`来存储您的DCR、
创建事务以及参与权益证明挖矿/投票。

---

## **安装指南**

请选择以下适用于您的操作系统的安装选项来开始：

* [Paymetheus](/getting-started/user-guides/paymetheus.md)
* [命令行程序组合 **通过dcrinstall**](/getting-started/user-guides/cli-installation.md) - 注意: `dcrinstall` 方法是使得命令行结点和钱包跑起来最快最方便的方式。它被推荐使用，并且在以下的命令行路线设置向导中假设您已经执行过该命令。
* [Decrediton (ALPHA)](/getting-started/user-guides/decrediton-setup.md)

---

**注意:** 以下所有的向导都可以在导航菜单中使用相同的名字找到。

## **Paymetheus 路线**

以下指南将按顺序帮助你熟悉Paymetheus：

* [Paymetheus设置](/getting-started/user-guides/paymetheus.md)
* [使用Paymetheus](/getting-started/user-guides/using-paymetheus.md)

## **Decrediton 路线**

以下指南将帮助你载入Decrediton:

* [Decrediton设置](/getting-started/user-guides/decrediton-setup.md)

## **命令行路线**

以下指南将按顺序帮助你熟悉命令行应用程序（`dcrd`，`dcrwallet`，`dcrctl`）：

* [命令行程序的差异](/getting-started/cli-differences.md)
* [启动选项基础](/getting-started/startup-basics.md)
* [dcrd设置](/getting-started/user-guides/dcrd-setup.md)
* [dcrwallet设置](/getting-started/user-guides/dcrwallet-setup.md)
* [dcrctl基本使用](/getting-started/user-guides/dcrctl-basics.md)

## **一般指引**

以下指南独立于不同的应用程序：

* [使用Testnet](/getting-started/using-testnet.md)
* [获取DCR](/getting-started/obtaining-dcr.md)
* [使用区块浏览器](/getting-started/using-the-block-explorer.md)
* [权益证明指南](/mining/proof-of-stake.md)
* [Mainnet投票指南](/getting-started/user-guides/agenda-voting.md)
