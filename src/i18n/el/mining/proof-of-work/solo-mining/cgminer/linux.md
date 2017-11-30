# <i class="fa fa-linux"></i> Οδηγός Χρήσης για Linux

---

## <i class="fa fa-cloud"></i> Συνδέστε το dcrd στο δίκτυο του Decred

> Βήμα Πρώτο

Σημειώστε ότι οι εντολές `dcrd`,` dcrwallet` και `dcrctl` θα πρέπει να εκτελεστούν στον ίδιο κατάλογο όπου είναι και τα αρχεία του Decred σας! Ξεκινήστε το `dcrd`:

```no-highlight
~/Decred/$ ./dcrd -u <username> -P <password>
```

Ξεκινήστε το dcrwallet:

```no-highlight
~/Decred/$ ./dcrwallet -u <username> -P <password>
```

> Βήμα Δεύτερο

Δημιουργία νέας διεύθυνσης πορτοφολιού:

```no-highlight
~/Decred/$ ./dcrctl -u <username> -P <password> --wallet getnewaddress default
```

Αντιγράψτε τη νέα διεύθυνση (το αποτέλεσμα από την προηγούμενη εντολή). Κλείστε/σταματήστε το `dcrd` και το ` dcrwallet` πληκτρολογώντας `ctrl+c` σε κάθε ενα παράθυρο.

> Βήμα τρίτο

Επανεκκινήστε το `dcrd` χρησιμοποιώντας την εντολή:

```no-highlight
~/Decred/$ ./dcrd -u <username> -P <password> --miningaddr <new address from step two or your web client wallet address>
```

> Βήμα τέταρτο

Ρυθμίστε την ασφάλεια TLS αντιγράφοντας το αρχείο rpc.cert στον κατάλογο /usr/share/ca-certificates:

```no-highlight
sudo cp /home/<username>/.dcrd/rpc.cert /usr/share/ca-certificates/dcrd.crt
```

Χρησιμοποιήστε έναν επεξεργαστή κειμένου για να προσθέσετε τη γραμμή "dcrd.crt" (χωρίς εισαγωγικά) στο αρχείο /etc/ca-certificates.conf:

```no-highlight
sudo gedit /etc/ca-certificates.conf
```

Ενημέρωση της λίστας πιστοποιητικών CA:

```no-highlight
sudo update-ca-certificates
```

---

## <i class="fa fa-download"></i> Λήψη και εξαγωγή του cgminer

Επισκεφθείτε τη διεύθυνση https://github.com/decred/cgminer/releases για να βρείτε την τελευταία έκδοση του cgminer. Για να κάνετε λήψη και εξαγωγή μέσω του τερματικού σας στο Linux, χρησιμοποιήστε τις ακόλουθες εντολές:

```no-highlight
wget https://github.com/decred/decred-release/releases/download/v0.0.4_cgminer/cgminer-decred-linux-x86_64-20160208.tar.gz
tar -xvf cgminer-decred-linux-x86_64-20160208.tar.gz
```

---

## <i class="fa fa-play-circle"></i> Αρχικοποίηση και εκτέλεση του cgminer

> Βήμα Πρώτο

Αν το `dcrd` δεν έχει ολοκληρώσει τον συγχρονισμό με την αλυσίδα μπλοκ, περιμένετε να τελειώσει και, στη συνέχεια, προχωρήστε στο επόμενο βήμα. Όταν ολοκληρωθεί, θα εμφανίσει:

```no-highlight
[INF] BMGR: Processed 1 block in the last 5m34.49s
```

> Βήμα Δεύτερο

Στον κατάλογο cgminer, ξεκινήστε το cgminer με την εντολή:

```no-highlight
~/Decred/$ ./cgminer --blake256 -o https://127.0.0.1:9109 -u <username> -p <password>
```

Δημιουργήστε ένα αρχείο ρυθμίσεων για το cgminer πληκτρολογώντας τα ακόλουθα πλήκτρα: `S` (Ρυθμίσεις), `W` (Εγγραφή Αρχείου Ρυθμίσεων), `Enter` (Αποθήκευση του αρχείου ρυθμίσεων ως `cgminer.conf`). Σημειώστε ότι το αρχείο `cgminer.conf` θα τοποθετηθεί στον ίδιο κατάλογο με το cgminer. Το cgminer μπορεί πλέον να ξεκινήσει απλά εκτελώντας της εντολή:

```no-highlight
~/Decred/$ ./cgminer
```

Ολοκληρώσαμε τον βασικό οδηγό ρυθμίσεων για ατομική εξόρυξη με το cgminer. Για περισσότερες πληροφορίες σχετικά με τη χρήση του cgminer και λεπτομερείς εξηγήσεις σχετικά με τις λειτουργίες του προγράμματος, ανατρέξτε στο επίσημο [cgminer README](https://github.com/decred/cgminer/blob/3.7/README).
