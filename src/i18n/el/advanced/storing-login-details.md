# <i class="fa fa-hdd-o"></i> Αποθήκευση Λεπτομερειών Σύνδεσης

All parameters that are specified on the command line while starting dcrd,
dcrwallet and dcrctl can also be kept in configuration files. This is
a good way of storing your login credentials so that you do not need
to include them in scripts or type them into the terminal all the
time.

---

## <i class="fa fa-laptop"></i> Τα Βασικά του Αρχείου Ρυθμίσεων

If unfamiliar with the basics of configuration files, please review the information found in our [Startup Options Intro](/getting-started/startup-basics.md#configuration-files) page.

---

## <i class="fa fa-terminal"></i> dcrd.conf 

Choose any username and password you want in the following steps. You do not need to register these
anywhere and they will only be used to allow `dcrwallet` and `dcrctl` to communicate with `dcrd`.

> Χρήση του Δειγματικού Αρχείου Ρυθμίσεων

Please follow the steps below if you've already copied the sample configuration files into their appropriate directories.

1. Navigate to your `dcrd` application folder as described in our [Startup Options Intro](/getting-started/startup-basics.md#configuration-files). 
2. Ανοίξτε το `dcrd.conf` σε ένα πρόγραμμα επεξεργασίας κειμένου.
3. Βρείτε τις ακόλουθες γραμμές:

    `;rpcuser=` <br />
    `;rpcpass=`

4. Uncomment the lines by removing the semi-colon and add your chosen username and password to the appropriate lines.

> Δημιουργία Ενός Νέου Αρχείου Ρύθμισεων

Please follow the steps below if you have **not** copied the sample configuration files into their appropriate directories.

1. Navigate to your `dcrd` application folder as described above in our [Startup Options Intro](/getting-started/startup-basics.md#configuration-files).
2. Δημιουργήστε ένα νέο αρχείο κειμένου.
3. Μετονομάστε το σε `dcrd.conf`.
3. Ανοίξτε το `dcrd.conf` σε ένα πρόγραμμα επεξεργασίας κειμένου.
4. Προσθέστε τις ακόλουθες γραμμές:

```no-highlight
[Application Options]

rpcuser=<username>
rpcpass=<password>
```

---

## <i class="fa fa-terminal"></i> dcrwallet.conf 

Η διαδικασία για το `dcrwallet.conf` είναι παρόμοια με τη διαδικασία για το` dcrd.conf`.

Please note that if the values of `username=` and `password=` in `dcrwallet.conf` do not match the values of `rpcuser=` and `rpcpass=` in  `dcrd.conf`, you will need to set `dcrdusername=` and `dcrdpassword=`  in `dcrwallet.conf` to the `rpcuser`/`rpcpass` values found in `dcrd.conf` (it is easiest to set all of the username/passwords the same).

> Χρήση του Δειγματικού Αρχείου Ρυθμίσεων

Please follow the steps below if you've already copied the sample configuration files into their appropriate directories.

1. Navigate to your `dcrwallet` application folder as described in our [Startup Options Intro](/getting-started/startup-basics.md#configuration-files). 
2. Ανοίξτε το `dcrwallet.conf` σε ένα πρόγραμμα επεξεργασίας κειμένου.
3. Βρείτε τις ακόλουθες γραμμές:

    `;username=` <br />
    `;password=`

4. Uncomment the lines by removing the semi-colon and add your chosen username and password to the appropriate lines.

> Δημιουργία Ενός Νέου Αρχείου Ρυθμίσεων

Please follow the steps below if you have **not** copied the sample configuration files into their appropriate directories.

1. Navigate to your `dcrwallet` application folder as described in our [Startup Options Intro](/getting-started/startup-basics.md#configuration-files).
2. Δημιουργήστε ένα νέο αρχείο κειμένου.
3. Μετονομάστε το σε `dcrwallet.conf`.
3. Ανοίξτε το `dcrwallet.conf` σε ένα πρόγραμμα επεξεργασίας κειμένου.
4. Προσθέστε τις ακόλουθες γραμμές:

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

> Χρήση του Δειγματικού Αρχείου Ρυθμίσεων

Please follow the steps below if you've already copied the sample configuration files into their appropriate directories.

1. Navigate to your `dcrctl` application folder as described in our [Startup Options Intro](/getting-started/startup-basics.md#configuration-files). 
2. Ανοίξτε το `dcrctl.conf` σε ένα πρόγραμμα επεξεργασίας κειμένου.
3. Βρείτε τις ακόλουθες γραμμές:

    `;rpcuser=` <br />
    `;rpcpass=`

4. Uncomment the lines by removing the semi-colon and add your chosen username and password to the appropriate lines.

> Δημιουργία Ενός Νέου Αρχείου Ρυθμίσεων

Please follow the steps below if you have **not** copied the sample configuration files into their appropriate directories.

1. Navigate to your `dcrctl` application folder as described in our [Startup Options Intro](/getting-started/startup-basics.md#configuration-files).
2. Δημιουργήστε ένα νέο αρχείο κειμένου.
3. Μετονομάστε το σε `dcrctl.conf`.
3. Ανοίξτε το `dcrctl.conf` σε ένα πρόγραμμα επεξεργασίας κειμένου.
4. Προσθέστε τις ακόλουθες γραμμές:

```no-highlight
[Application Options]

rpcuser=<username>
rpcpass=<password>
```

---

## <i class="fa fa-tasks"></i> Πρόσθετες Επιλογές Ρύθμισης

All command line options can be put in the config file.
The sample config files in the release package give additional
options or you can run one of the programs with the `-h` flag to show a list and description of all options for the specified application.

There is also a full list of options for each application which can be found [here](/advanced/program-options.md).
