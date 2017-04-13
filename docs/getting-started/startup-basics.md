# Startup Basics

This guide was last updated for v0.8.2

---

This guide applies to command-line application users. Paymetheus and Decrediton users can safely ignore the use of config files - Paymetheus and Decrediton both handle basic configuration automatically. It is also worth noting that some of our guides show configuration file settings and other guides show startup command flags. 

---

## Configuration File Locations

All of the Decred software, when started, reads from a configuration file to determine which settings it should enable/disable/set during that initial load. All of the command line startup flags `(e.g. dcrwallet --testnet)` can be replaced by settings within the appropriate configuration file `(e.g. dcrwallet --testnet could be replaced by testnet=1 in dcrwallet.conf)`.

These configuration files are located with the application home directory of the application. The location of these default home directories for Windows, macOS/OSX, and Linux are listed below:

Windows:

    C:\Users\<username>\AppData\Local\Dcrwallet\
    C:\Users\<username>\AppData\Local\Dcrd\
    C:\Users\<username>\AppData\Local\Dcrctl\ 
    C:\Users\<username>\AppData\Local\Decred\Paymetheus

macOS: 

    ~/Library/Application Support/Dcrwallet/
    ~/Library/Application Support/Dcrd/
    ~/Library/Application Support/Dcrctl/
    ~/Library/Application Support/decrediton/
    
Linux: 
    
    ~/.dcrwallet/
    ~/.dcrd/
    ~/.dcrctl/
    ~/.config/decrediton

Each of these folders is allowed it's own `.conf` file, named after the individual application (`e.g. dcrd uses dcrd.conf`). Please also note that the `Dcrd` and `Dcrwallet` home directories are automatically created when each application is first launched. You will have to manually create a `Dcrctl` home directory to utilize a config file.

The [dcrinstall](/getting-started/install-guide.md#dcrinstall) installation method automatically creates configuration files, with the [minimum configuration settings](#minimum-configuration) already enabled. 

The [Binary Release](/getting-started/install-guide.md#binary-releases) installation method include sample configuration files within the .zip/.tar.gz. It is recommended to copy these config files into the appropriate directory described above, and rename them to remove 'sample-'. These files have many settings commented out (comments are not read by the program during runtime) so all of these settings are effectively disabled. You can enable these pre-written settings by simple deleting the semi-colon before the line.

---

## Minimum Configuration

At the very minimum, for `dcrd`, `dcrwallet`, and `dcrctl` to be able to communicate with each other, they need to be launched with the same rpcuser/rpcpass combination. This is done automatically by the [dcrinstall](/getting-started/install-guide.md#dcrinstall) method. For manual configuration, please follow these steps:

1. If the operating system dependant home directories listed in the [configuration files](#configuration-file-locations) section above do not exist, please create them for `dcrd`, `dcrwallet`, and `dcrctl`.
2. Copy the [sample configuration file](https://github.com/decred/dcrd/blob/master/sample-dcrd.conf) from Github, and paste it into a new text file. Save the text file as `dcrd.conf` in `dcrd`'s home directory.
3. Copy the [sample configuration file](https://github.com/decred/dcrwallet/blob/master/sample-dcrwallet.conf) from Github, and paste it into a new text file. Save the text file as `dcrwallet.conf` in `dcrwallet`'s home directory.
4. Create an empty text file and save it as `dcrctl.conf` in `dcrctl`'s home directory.
5. Choose an arbitrary username and password, these will only be used for each application to communicate via remote procedure call. The easiest configuration is to set them all equal.
6. Inside `dcrd.conf`, underneath `[Application Options]`, add the following lines:<br /><br />
        `rpcuser=<chosen-username>`<br />
        `rpcpass=<chosen-password>`<br /><br />
7. Inside `dcrwallet.conf`, underneath `[Application Options]`, add the following lines:<br /><br />
        `username=<chosen-username>`<br />
        `password=<chosen-password>`<br /><br />
8. Inside `dcrctl.conf`, add the following lines:<br /><br />
        `rpcuser=<chosen-username>`<br />
        `rpcpass=<chosen-password>`<br /><br />
9. Save all three configuration files.

---

## Startup Command Flags

A majority of the settings you are able to set via the configuration file can also be passed to the application as parameters during launch. For example, the following OS-specific commands would open `dcrd` for Testnet use, an alternative to using `testnet=1` in your config file:

    Windows: dcrd.exe --testnet
    macOS: ./dcrd --testnet
    Linux: ./dcrd --testnet

The above example would first look to the `dcrd` configuration file for settings and then look to the executable command to enable the testnet setting. 

---

## Advanced Usage

[Storing Login Details in Config Files](/advanced/storing-login-details.md) <!-- This has the same information found in the above, Minimum Configuration section. Could probably delete. -->

[Full List of Options for Each Application](/advanced/program-options.md)
