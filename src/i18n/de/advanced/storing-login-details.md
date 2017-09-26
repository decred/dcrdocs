# <i class="fa fa-hdd-o"></i> Storing Login Details 

All parameters that are specified on the command line while starting dcrd,
dcrwallet and dcrctl can also be kept in configuration files. This is
a good way of storing your login credentials so that you do not need
to include them in scripts or type them into the terminal all the
time.

---

## <i class="fa fa-laptop"></i> Configuration File Basics 

If unfamiliar with the basics of configuration files, please review the information found in our [Startup Options Intro](/getting-started/startup-basics.md#configuration-files) page.

---

## <i class="fa fa-terminal"></i> dcrd.conf 

Choose any username and password you want in the following steps. You do not need to register these
anywhere and they will only be used to allow `dcrwallet` and `dcrctl` to communicate with `dcrd`.

> Using the Sample Config File

Please follow the steps below if you've already copied the sample configuration files into their appropriate directories.

1. Navigate to your `dcrd` application folder as described in our [Startup Options Intro](/getting-started/startup-basics.md#configuration-files). 
2. Open `dcrd.conf` in a text editor.
3. Find the following lines:

    `;rpcuser=` <br />
    `;rpcpass=`

4. Uncomment the lines by removing the semi-colon and add your chosen username and password to the appropriate lines.

> Creating a New Config File

Please follow the steps below if you have **not** copied the sample configuration files into their appropriate directories.

1. Navigate to your `dcrd` application folder as described above in our [Startup Options Intro](/getting-started/startup-basics.md#configuration-files).
2. Create a new text file.
3. Rename it `dcrd.conf`.
3. Open `dcrd.conf` in a text editor.
4. Add the following lines:

```no-highlight
[Application Options]

rpcuser=<username>
rpcpass=<password>
```

---

## <i class="fa fa-terminal"></i> dcrwallet.conf 

The procedure for `dcrwallet.conf` is very similar to the procedure for `dcrd.conf`. 

Please note that if the values of `username=` and `password=` in `dcrwallet.conf` do not match the values of `rpcuser=` and `rpcpass=` in  `dcrd.conf`, you will need to set `dcrdusername=` and `dcrdpassword=`  in `dcrwallet.conf` to the `rpcuser`/`rpcpass` values found in `dcrd.conf` (it is easiest to set all of the username/passwords the same).

> Using the Sample Config File

Please follow the steps below if you've already copied the sample configuration files into their appropriate directories.

1. Navigate to your `dcrwallet` application folder as described in our [Startup Options Intro](/getting-started/startup-basics.md#configuration-files). 
2. Open `dcrwallet.conf` in a text editor.
3. Find the following lines:

    `;username=` <br />
    `;password=`

4. Uncomment the lines by removing the semi-colon and add your chosen username and password to the appropriate lines.

> Creating a New Config File

Please follow the steps below if you have **not** copied the sample configuration files into their appropriate directories.

1. Navigate to your `dcrwallet` application folder as described in our [Startup Options Intro](/getting-started/startup-basics.md#configuration-files).
2. Create a new text file.
3. Rename it `dcrwallet.conf`.
3. Open `dcrwallet.conf` in a text editor.
4. Add the following lines:

```no-highlight
[Application Options]

username=<username>
password=<password>
```

If you set the optional public password for the wallet (the second password
during the wallet creation) you can also add that to `dcrwallet.conf`:

```no-highlight
walletpass=<yourwalletpassword>
```

You cannot specify your private wallet passphrase in the config files. That must be entered manually with `dcrctl`. 

---

## <i class="fa fa-terminal"></i> dcrctl.conf 

It is again easiest to set the username/passwords the same amongst `dcrd.conf`, `dcrwallet.conf`, and `dcrctl.conf`. If you used different credentials for dcrwallet you will need to specify one here and the other on the command line when issuing commands.

> Using the Sample Config File

Please follow the steps below if you've already copied the sample configuration files into their appropriate directories.

1. Navigate to your `dcrctl` application folder as described in our [Startup Options Intro](/getting-started/startup-basics.md#configuration-files). 
2. Open `dcrctl.conf` in a text editor.
3. Find the following lines:

    `;rpcuser=` <br />
    `;rpcpass=`

4. Uncomment the lines by removing the semi-colon and add your chosen username and password to the appropriate lines.

> Creating a New Config File

Please follow the steps below if you have **not** copied the sample configuration files into their appropriate directories.

1. Navigate to your `dcrctl` application folder as described in our [Startup Options Intro](/getting-started/startup-basics.md#configuration-files).
2. Create a new text file.
3. Rename it `dcrctl.conf`.
3. Open `dcrctl.conf` in a text editor.
4. Add the following lines:

```no-highlight
[Application Options]

rpcuser=<username>
rpcpass=<password>
```

---

## <i class="fa fa-tasks"></i> Additional Configuration Options 

All command line options can be put in the config file.
The sample config files in the release package give additional
options or you can run one of the programs with the `-h` flag to show a list and description of all options for the specified application.

There is also a full list of options for each application which can be found [here](/advanced/program-options.md).
