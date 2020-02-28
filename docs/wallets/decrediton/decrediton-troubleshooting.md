# <img class="dcr-icon" src="/img/dcr-icons/Wallet.svg" /> Troubleshooting Common Decrediton Problems

Last updated for Decrediton v{{ decreditonversion }}.

!!! danger "Critical Information"

    Before starting any attempt at fixing a broken wallet, ensure you have your **correct** 33 word seed written down (preferably physically, on a piece of paper) and accessible.

    If you have lost your seed, you are in serious danger of losing access to your funds permanently. See the ["I have lost my seed"](../../faq/wallets-and-seeds.md#9-i-have-lost-my-seed-what-can-i-do) section of the seed FAQ for instructions in that situation.

## Location of data and log files

The main directory for Decrediton data files is OS-dependent:

| OS      | Decrediton data directory                   |
| -------:|:-------------------------------------------:|
| Windows | `%LOCALAPPDATA%\Decrediton\`                |
| macOS   | `~/Library/Application Support/Decrediton/` |
| Linux   | `~/.config/decrediton/`                     |

There are different log files which may be reviewed when troubleshooting a problem:

| Log          | Location                                      |
| ------------:|:---------------------------------------------:|
| Main app log | `decrediton.log`                              |
| Wallet log   | `wallets/mainnet/[name of wallet]/wallet.log` |

And finally, the blockchain (dcrd) log is located in:

| OS      | Decrediton data directory                   |
| -------:|:-------------------------------------------:|
| Windows | `%LOCALAPPDATA%\dcrd\`                      |
| macOS   | `~/Library/Application Support/dcrd/`       |
| Linux   | `~/.dcrd/logs`                              |

## Running in debug mode

To ease debugging of problems, you can run in debug mode in a terminal (command line console window). You need to open a terminal (`cmd.exe` in Windows), navigate to the directory where Decrediton is installed and then execute it:

```no-highlight
# Linux/macOS:
$ ./decrediton --debug

# Windows:
c:\[...]> decrediton.exe --debug
```

## Cannot see all my coins after restoring from seed

1. Check if the blockchain is synchronized to the latest block. Look at the block height at the lower left corner of the screen and the latest block from [dcrdata.decred.org](https://dcrdata.decred.org)

    ![Block Height](/img/decrediton/troubleshooting/blockheight.png)

1. Import **all** voting service provider ("stakepool") API keys that you previously used with this wallet. If you do not perform this step for all pools, your balance **will** be incorrect.

1. Rebroadcast any pending transactions (access the transaction and click the "Rebroadcast" button) and verify in the block explorer if it has been published and mined.

1. Perform a full rescan of the transactions (click on the small refresh button besides the "Latest Block" label).

## Decrediton will not start (dcrd closed due to an error)

```no-highlight
dcrd closed due to an error. Check dcrd logs
and contact support if the issue persists.
```

There are generally three situations in which this error occurs:

- There's already an instance of `dcrd` running in your computer
- The `dcrd` process or the blockchain data is corrupt
- Something (like an antivirus or protection software) is preventing the `dcrd` process from running correctly

Check the following:

1. Look at your OS task manager if there is any process named `dcrd`, and terminate it.

1. Look at the [dcrd logs](#location-of-data-and-log-files) for any `ERR` type of messages (start at the bottom of the file for the most recent messages).

1. If the blockchain has been corrupted, remove the dcrd data folder and restart the sync.

1. Disable any antivirus or protection software and try running again.

1. Run Decrediton's dcrd version in the terminal and look for any fatal messages or panics.

## Error "Already Have Transaction..."

![Rebroadcast error](/img/decrediton/troubleshooting/rebroadcast.png)

If you receive a message similar to the one above, it means your dcrd node already has the transaction you're trying to publish. This is harmless, but if the transaction is left pending for a long time, you could try:

- Rebroadcast the transaction using the button in the Transactions tab
- Check if your transaction has been broadcast by using the [block explorer](https://dcrdata.decred.org/)  
- Perform a rescan

## Cannot Purchase Tickets

![Cannot purchase ticket](/img/decrediton/troubleshooting/purchaseticket.png)

This is usually caused by shutting down Decrediton before a ticket has been mined.

Perform the same steps as described in ["Cannot see all my coins"](#cannot-see-all-my-coins-after-restoring-from-seed)

## Debugging Other Errors

If you can start the wallet but get error messages when performing an operation, then the first thing is to verify the wallet logs from within Decrediton. Access the Help -> Logs page and look for any ERR messages:

![Logs Page](/img/decrediton/troubleshooting/logs.png)
