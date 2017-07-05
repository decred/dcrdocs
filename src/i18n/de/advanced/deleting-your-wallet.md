# <i class="fa fa-hdd-o"></i> Deleting Your Wallet 

There are a few reasons you might need to delete your wallet.

* You need to restore your wallet from seed.
* You do not have the seed anymore and want to make a new wallet.
* You want to remove the wallet from a particular computer.

First you need to find the dcrwallet application directory which varies by platform.
This is the same directory that is home for your [configuration files](/getting-started/startup-basics.md#configuration-files).

In that directory, you need to delete the file `mainnet/wallet.db`.
That will completely remove your wallet from that computer.  To access
it again you will need to restore from the original seed.

It is important to note that it is possible (but not certain) that a
deleted file may be recovered using file recovery tools.  If you are
deleting this for security reasons you probably need to use a secure
deletion tool such as
[GNU shred](https://www.gnu.org/software/coreutils/manual/html_node/shred-invocation.html).


