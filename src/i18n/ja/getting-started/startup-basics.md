# Startup Basics

This guide was last updated for v1.0.0

---

This guide applies to command-line application users. Paymetheus and Decrediton users can safely ignore the use of config files - Paymetheus and Decrediton both handle basic configuration automatically. It is also worth noting that some of our guides show configuration file settings and other guides show startup command flags. 

---

## Configuration File Locations

All of the Decred software, when started, reads from a configuration file to determine which settings it should enable/disable/set during that initial load. All of the command line startup flags `(e.g. dcrwallet --testnet)` can be replaced by settings within the appropriate configuration file `(e.g. dcrwallet --testnet could be replaced by testnet=1 in dcrwallet.conf)`.

These configuration files are located within the application home directory of the application. The location of these default home directories for Windows, macOS, and Linux are listed below:

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

Each of these folders is allowed its own `.conf` file, named after the individual application (`e.g. dcrd uses dcrd.conf`). Please also note that the `Dcrd` and `Dcrwallet` home directories are automatically created when each application is first launched. You will have to manually create a `Dcrctl` home directory to utilize a config file.

The [dcrinstall](/getting-started/user-guides/cli-installation.md) installation method automatically creates configuration files, with the [minimum configuration settings](/advanced/manual-cli-install.md#minimum-configuration) already enabled. 

The [Manual Installation](/advanced/manual-cli-install.md#installation) method includes sample configuration files within the .zip/.tar.gz. It is recommended to copy these config files into the appropriate directory described above, and rename them to remove 'sample-'. These files have many settings commented out (comments are not read by the program during runtime) so all of these settings are effectively disabled. You can enable these pre-written settings by simply deleting the semi-colon before the line.

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
