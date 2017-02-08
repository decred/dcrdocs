# <i class="fa fa-linux"></i> **Linux/UNIX User Guide**

---

## **<i class="fa fa-cloud"></i> Connect to the Decred network**

> Step One

Follow the steps in the following link to [Download and Install Decred](/getting-started/install-guide.md).

*If you are running in headless mode via SSH,* you
will need to use a terminal multiplexer such as [**screen**](http://www.howtogeek.com/howto/ubuntu/keep-your-ssh-session-running-when-you-disconnect/)
or [**tmux**](https://tmux.github.io/). Where you see the instruction to
move to another terminal, you'll need to start a new window in `screen`
or `tmux`.

> Step Two

Go to one of your terminals and change to the Decred directory that
you extracted the files to. They will likely be under a subdirectory
such as `~/Decred/decred-linux-amd64`. Type the following (replacing
the text in square brackets with your own values):

```no-highlight
~/Decred/$ ./dcrd --rpcuser [daemon username] --rpcpass [daemon password]
```

Choose any username and password.  You do not need to register these
anywhere and they will only be used to allow your wallet and control
tool to communicate with the daemon you are running.  Save these, you
will need them later. You can also put them in a file so you do not
need to specify them on the command line or in scripts (See:
[Storing Login Details](/advanced/storing-login-details.md)). This
program is what is known as the daemon. It works in the background and
you will not interface with it directly. It exists solely to connect
you to the network.

> Step Three

You should now get a whole lot of text as the daemon connects to the
network and starts processing blocks. Wait until it is completed. You
will see a line at the start like:

```no-highlight
22:58:04 2016-02-09 [INF] BMGR: Syncing to block height 617 from peer 104.236.167.133:9108
```

Then, as it downloads the blocks, you will see lines like:

```no-highlight
22:58:16 2016-02-09 [INF] BMGR: Processed 321 blocks in the last 10.03s (544 transactions, height 322, 2016-02-09 09:50:34 +1000 EST)
```

Once the most recent block your daemon has processed is the current
block height (you can either tell by the date and time in the log
message or by comparing the height against the
[online block explorer](https://mainnet.decred.org/).  This may take
quite some time as the block height grows larger (there is no
limit). Note that you are not mining at this point, you are just
connected to the network. This connection will be used in the future.
You must leave this cmd window open to use the wallet.

---

## **<i class="fa fa-plus-circle"></i> Create your wallet**

> Step One

Now that you are connected to the network, the next thing you need to
do is create a wallet that will hold your account addresses and DCR
balance. If you participate in mining or stake mining, this is where
your payments will go.

> **IMPORTANT**

During the creation process you will be provided with a list of 33
words that form the private key for your wallet. Treat this list in
the same way you would a physical key to a safe. If you lose your key
you lose access to your wallet and all funds within it permanently. It
cannot be recovered, not even by Decred developers. It is up to you to
keep a backup. It is recommended you write it down on paper then store
that somewhere secure. If you decide to keep it on your computer, it
would be best to keep it in an encrypted document (just do not forget
the password) in case the file or your computer is stolen which brings
us to the next point:

> **VERY IMPORTANT**

**DO NOT, UNDER ANY CIRCUMSTANCES, GIVE YOUR KEY WORDS OR THE
  ASSOCIATED HEX KEY TO ANYONE! NOT EVEN THE DEVELOPERS!**

We will go through the hex key soon. If you give someone either key,
they can use that to copy your wallet which gives them full access to
your funds. It's like cutting a copy of a key, giving it to some
random person on the train and telling him where the safe it opens
is. And that you will be out of town for a few days. So to reiterate,
keep your key words safe and do not give them to anyone else. With
that in mind follow these steps to create a wallet:

> Step Two

Make sure you have the `dcrd` daemon running (See:
[Connecting to the Decred network](#connecti-to-the-decred-network)). Open
a new terminal or screen. Navigate to the Decred
folder and type: `./dcrwallet --create` and press `Enter`.

```no-highlight
~/Decred/$ ./dcrwallet --create
Enter the private passphrase for your new wallet:
```

Enter a password that you will use for this wallet. It should be
different to the one you used for the daemon. `Enter` again to
confirm. Make sure you save this somewhere.

```no-highlight
Do you want to add an additional layer of encryption for public data? (n/no/y/yes) [no]:
```

> Step Three

As you can see above you will now be asked if you want extra
encryption for your public wallet. If you say 'yes' then you should
use a password that is different from any of the other passwords you
used in this guide.  We will have a look at putting all these
passwords in a configuration file so you do not need to remember them
in a seperate [tutorial](/advanced/storing-login-details/).


```no-highlight
Do you have an existing wallet seed you want to use? (n/no/y/yes) [no]:
```

You are now asked if you have an existing seed. This is the list of
words that make up your private key as explained above. Since this is
a new wallet, say no.  If you ever need to recreate your wallet from
the seed, this is where you would enter it.  Your key words will now
be displayed. If you have a seed, say yes and enter that instead.

> **ALSO VERY IMPORTANT**

**STOP HERE! TOUCH NOTHING!**

Read this entire step before you do anything. There are two very
important pieces of information displayed on the screen. The first,
and most important part is your key words. These words form the
private key that is used to generate your wallet. If you lose this list
(and the order they appear in) your wallet will be lost forever and
any funds it contains will be lost permanently. As was mentioned
above, no one, not even the developers can retrieve them.

The second part is your hex key. This is generated from your key
words. Write this down as well, as you will use it to confirm you
entered your seed words correctly if you need to restore your wallet.
The two forms of the key are completely equivalent although most
people find the key words easier to deal with.

> Step Four

Write down the key words and hex and store them somewhere
safe. Seriously. This is the most important step. Also remember these
words (and the hex string) are the keys to your wallet. Do not give
them to anyone else. If you do, they can restore your wallet on their
computer and steal your DCR.

```no-highlight
Your wallet generation seed is:
[list of 33 words]

Hex: [long string of letters and numbers]
IMPORTANT: Keep the seed in a safe place as you
will NOT be able to restore your wallet without it.
Please keep in mind that anyone who has access
to the seed can also restore your wallet thereby
giving them access to all your funds, so it is
imperative that you keep it in a secure location.
Once you have stored the seed in a safe and secure location, enter "OK" to continue:
```

Once you have written the key words and hex down type `OK` and press
`Enter`. It should be noted that if you did not write the words down
before continuing or somehow otherwise lost them, start this process
again (See: [How Do I Remove My Wallet?](/advanced/deleting-your-wallet)).


```no-highlight
Creating the wallet...
The wallet has been created successfully.
```

The wallet will then be created. This might take a few minutes if you
have a slow computer.

---

## **<i class="fa fa-plug"></i> Connect your wallet to the Decred network**

Now that you have [created your wallet](#create-your-wallet) and
[connected to the Decred network](#connect-to-the-decred-network),
you need to link your wallet to the network so it can send and receive
coins and participate in mining.

> Step One

Open another terminal in your Decred directory (or use the last one if
you have just created your wallet). Type the following (filling in
your own info instead of the square brackets):

```no-highlight
~/Decred/$ ./dcrwallet -u [wallet username] -P [wallet password] --dcrdusername=[daemon username] --dcrdpassword=[daemon password]
```

* First, the wallet username.  You have not used this before, so just
  make one up. It is only used to allow the control program to
  connect to the wallet.
* Second is the wallet password.  You have not used this before, so just
  make one up. It is only used to allow the control program to
  connect to the wallet.  Note the capital P, Decred is case sensitive.
* Third and fourth are the username and password you used when staring
  the daemon (Step Two in the
  [Connecting to the Decred network](#connect-to-the-decred-network)
  guide).
* Alternatively, if you use the same username/password combination for
  both dcrd and dcrwallet you can skip `--dcrdusername` and
  `--dcrdpassword` and just use `-u` and `-P`.

The wallet will now connect to the network via the daemon. It will
begin scans of the network and active addresses which can take a few
minutes on slow computers. Eventually it will start showing lines
like:


```no-highlight
[INF] WLLT: Connecting block 0000000000002004ea8fa74af334cb291a22832642b5be603995683534bbb97b, height 9990
```

This means your wallet is successfully connected to the network
through your daemon.

> Step Two

Finally, you will need to unlock your wallet to allow it to send and
receive funds. To do so we'll introduce the third program in the
Decred suite; dcrctl. This is the program you will use to control
Decred. Open a third terminal and go to your Decred directory. Type in
(once again using your values for the square brackets):

```no-highlight
~/Decred/$ ./dcrctl -u [wallet username] -P [wallet password] --wallet walletpassphrase [wallet password] 0
```

What we are doing here is authenticating with the wallet and using the
`--wallet` command to send the wallet password to unlock the
wallet. The `0` means unlock without a time limit. Do note, however,
that this only unlocks the wallet for the current session. If you
close the window the wallet is running in, you will need to unlock it
again the next time you start it. You will not get a confirmation from
`dcrctl`, but if you look at your wallet terminal/`screen` session, it
will say:

```no-highlight
[INF] RPCS: The wallet has been unlocked without a time limit.
```

> Step Three

That is it! You are now up and running. Some things you might want to try:

* [Purchase Decred from an exchange](/getting-started/obtaining-dcr/)
* [Put your credentials in a file](/advanced/storing-login-details/)
* [Proof-of-Work mining](/mining/overview/#1-proof-of-work-mining)
* [Proof-of-Stake mining](/mining/overview/#2-proof-of-stake-mining)
* [Advanced dcrctl usage](/advanced/dcrctl-usage)
