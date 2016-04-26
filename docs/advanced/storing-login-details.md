# **<i class="fa fa-hdd-o"></i> Storing Login Details**

Most parameters that are specified on the command line can also be kept in configuration files. This is a good way of storing your login credentials so that you do not need to include them in scripts or type them into the terminal all the time.

---

## **<i class="fa fa-laptop"></i> Operating system differences**
The files and file content are the same in both Linux and Windows. The only difference is the file location. There is one directory for two of the three Decred programs, `dcrd` and `dcrwallet`. In Windows they are located in `%LOCALAPPDATA%` (you can type that into the Windows explorer location bar to go straight to the folder), while in Linux they are in `~/.dcrd`, and `~/.dcrwallet` respectively. These are hidden directories and will not show up with `ls`, but are accessible using `cd .dcrd` and `cd .dcrwallet` from the home directory.

Only the `dcrd` and `dcrwallet` folders are created by default. Since `dcrctl` interfaces with the daemon on localhost, no extra authentication is needed.

---

## **<i class="fa fa-terminal"></i> dcrd**
Go to your `dcrd` folder as specified above and create a text file called `dcrd.conf`. Open it and type it the following lines:

```no-highlight
rpcuser=<username>
rpcpass=<password>
```

Where the username and password are ones you can make up on the spot. You do not need to register anywhere. They just secure your connection to the network. Save the file and exit the editor.

---

## **<i class="fa fa-terminal"></i> dcrwallet**
The procedure for the wallet is almost the same as for `dcrd`. Go to the `dcrwallet` folder and create a text file called `dcrwallet.conf`. Open it and enter the following lines:

```no-highlight
username=<username>
password=<password>
```

You can make up the username, but the password must be the one you used to create your wallet (that is the password you were asked to enter, not the seed key words).

---

## **<i class="fa fa-terminal"></i> dcrctl**
As mentioned above, `dcrctl` uses the daemon already active on the local machine and so does not require extra authentication. As long as you are using config files for `dcrd` and `dcrwallet`, you do not need a config file for `dcrctl`.

---

## **<i class="fa fa-tasks"></i> Other uses for the config file**
Almost any command that you specify on the command line can be put into a config file. Have a look at the three sample files that came in the Decred download package for all the options available. To use the `dcrctl` config file, you will need to create a `dcrctl` folder next to the other two folders and put the file there.