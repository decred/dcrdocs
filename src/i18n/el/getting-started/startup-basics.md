# Βασικά Εκκίνησης

Ο οδηγός αυτός ενημερώθηκε για τελευταία φορά για την έκδοση v1.0.0

---

This guide applies to command-line application users. Paymetheus and Decrediton users can safely ignore the use of config files - Paymetheus and Decrediton both handle basic configuration automatically. It is also worth noting that some of our guides show configuration file settings and other guides show startup command flags. 

---

## Τοποθεσίες Αρχείων Ρυθμίσεων

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

## Flags Εντολών Εκκίνησης

A majority of the settings you are able to set via the configuration file can also be passed to the application as parameters during launch. For example, the following OS-specific commands would open `dcrd` for Testnet use, an alternative to using `testnet=1` in your config file:

    Windows: dcrd.exe --testnet
    macOS: ./dcrd --testnet
    Linux: ./dcrd --testnet

Το παραπάνω παράδειγμα θα εξετάσει πρώτα το αρχείο ρυθμίσεων `dcrd` για ρυθμίσεις και στη συνέχεια θα εξετάσει την εκτελέσιμη εντολή για να ενεργοποιήσει τη ρύθμιση του testnet.

---

## Χρήση για Προχωρημένους

[Αποθήκευση των Στοιχείων Σύνδεσης στα Αρχεία Ρυθμίσεων](/advanced/storing-login-details.md) <!-- Εδώ θα βρείτε τις ίδιες πληροφορίες που υπάρχουν και στην παραπάνω ενότητα Ελάχιστη Ρύθμιση. Πιθανώς θα μπορούσε να διαγραφεί. -->

[Πλήρης Λίστα Επιλογών για Κάθε Εφαρμογή](/advanced/program-options.md)
