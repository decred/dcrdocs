# **<i class="fa fa-hdd-o"></i> Storing Login Details**

All parameters that are specified on the command line to dcrd,
dcrwallet and dcrctl can also be kept in configuration files. This is
a good way of storing your login credentials so that you do not need
to include them in scripts or type them into the terminal all the
time.

---

## **<i class="fa fa-laptop"></i> Operating system differences**

The files and file content are the same on all platforms. The only
difference is the file location.  Each program (`dcrd`, `dcrwallet`,
and `dcrctl` has a directory of its own to store the configuration
files.  On Windows they are located in `%LOCALAPPDATA%` (you can type
that into the Windows explorer location bar to go straight to the
folder).  On Linux and other properly behaving UNIX they are in
`~/.dcrd/`, `~/.dcrwallet/`, and `~/.dcrctl/` respectively. These are
hidden directories and will not show up with `ls`, but are accessible
using `cd .dcrd`, `cd .dcrwallet`, and `cd .dcrctl` from the home
directory.  OS X does not follow the proper UNIX way and puts them in
`~/Libraries/Application Support/Dcrd`, `~/Libraries/Application
Support/Dcrwallet`, and `~/Libraries/Application Support/Dcrctl`.

Only the `dcrd` and `dcrwallet` folders are created by default.  If
you want to store the login information for `dcrctl` you will need to
manually create the directory for it.

---

## **<i class="fa fa-terminal"></i> dcrd**

Go to your `dcrd` folder as specified above and create a text file
called `dcrd.conf`. Open it with whatever editor you like and type it
the following lines:

```no-highlight
[Application Options]

rpcuser=<username>
rpcpass=<password>
```

Choose any username and password you want. You do not need to register these
anywhere and they will only be used to allow your wallet and control
tool to communicate with the daemon you are running

---

## **<i class="fa fa-terminal"></i> dcrwallet**

The procedure for the wallet is almost the same as for `dcrd`. Go to
the `dcrwallet` folder and create a text file called
`dcrwallet.conf`. Open it and enter the following lines:

```no-highlight
[Application Options]

username=<username>
password=<password>
```

As with `dcrd` you can use any values you want here.  If you choose to
use a different set of credentials than you did for `dcrd` you will
also need to add:

```no-highlight
dcrdusername=<dcrdusername>
dcrdpassword=<dcrdpassword>
```

If you use the same credentials you can leave those values out.

If you set a public password for the wallet (the second password
during the wallet creation) you can also add that here:

```no-highlight
walletpass=<yourwalletpassword>
```

You cannot specify you wallet passphrase in the config files.  That
must be entered manually with `dcrctl`.

---

## **<i class="fa fa-terminal"></i> dcrctl**

To save the auth info for dcrctl you need to create the directory for
it (see [above](#operating-system-differences) for the location) and
open a file named `dcrctl.conf`.  Add the following info (using the
username and password you set for dcrd.  If you used different
credentials for dcrwallet you will need to specify one here and the
other on the command line but if they are the same this will work for
both.

```no-highlight
[Application Options]

rpcuser=<username>
rpcpass=<password>
```

---

## **<i class="fa fa-tasks"></i> Additional Configuration Options**

All command line options can be put in the config file.
The sample config files in the release package gives additional
options or you can run one of the programs with the `-h` option to
show the online help listed all the options.

