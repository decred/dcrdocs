# **dcrd Setup Guide**

Last updated for v0.8.2.

This guide is intended to help you setup the `dcrd` application using [startup flags](/getting-started/startup-basics.md#startup-command-flags). 

**Prerequisites:**

- Use either the latest [dcrinstall](/getting-started/install-guide.md#dcrinstall) to install `dcrd`. Additional steps will be required if another installation method was used.
- Review how the launch commands for the Command Prompt (Windows) and Bash (OSX/Linux) shells differ [here](/getting-started/cli-differences.md).

---

`dcrd` is the node daemon for Decred. A daemon is a program that works in the background that you do not interface with directly. `dcrd` maintains the entire past transactional ledger (or blockchain) of Decred and allows relaying of transactions to other Decred nodes across the world. You can think of it as your own personal Decred blockchain server. The blockchain is saved in the `data` folder within `dcrd`'s home directory.

**Advanced Users: If you are running in headless mode via SSH,** you
will need to use a terminal multiplexer such as [screen](http://www.howtogeek.com/howto/ubuntu/keep-your-ssh-session-running-when-you-disconnect/)
or [tmux](https://tmux.github.io/). Where you see the instruction to
move to another shell, you'll need to start a new window in `screen`
or `tmux`.

---

## **<i class="fa fa-cloud"></i> Connect to the Decred Network**

The first time launching `dcrd`, it will connect to the Decred network and begin downloading the blockchain. To allow `dcrwallet` and `dcrctl` to communicate with `dcrd`, the configuration files must have `rpcuser` and `rpcpass` settings enabled. 

> Configure RPC Username and Password

If you used [`dcrinstall`](/getting-started/install-guide.md#dcrinstall), your configuration files are already setup with the RPC username/password for `dcrd`, `dcrwallet`, and `dcrctl`.

If you did not use `dcrinstall`, you will need to enable the bare minimum settings in your configuration files. Follow [this guide](/getting-started/startup-basics.md#minimum-configuration) to do so. 

> Start dcrd 

With the correctly set configuration files, open another shell window in your Decred directory (or use the last window if you have just created your wallet). Type the following command (review this guides Prerequisites to determine exact command depending on your OS/Shell application):

```no-highlight
dcrd
```

> Wait for dcrd to Sync to the Decred Blockchain

When `dcrd` launches successfully, you should see your shell window begin to fill up with messages as the daemon connects to the network and starts processing blocks. Wait until it is completed - the entire blockchain is being downloaded into the `dcrd` data directory. 

You will see a line at the start like this:

```no-highlight
22:58:04 2016-02-09 [INF] BMGR: Syncing to block height 617 from peer 104.236.167.133:9108
```

Then, as it continues to download blocks, you will see lines like this:

```no-highlight
22:58:16 2016-02-09 [INF] BMGR: Processed 321 blocks in the last 10.03s (544 transactions, height 322, 2016-02-09 09:50:34 +1000 EST)
```

The blockchain will be fully synced once the most recently processed block is the current block height. You can tell by either comparing the date and time in the log message or by comparing the height of the last block processed against the last block height on [the official block explorer](https://mainnet.decred.org/).  

Note that this connection will be used in the future. You must leave this `dcrd` instance running in order to use `dcrwallet`.

---

Now that you've set up `dcrd`, visit the [dcrwallet Setup](/getting-started/user-guides/dcrwallet-setup.md) guide.