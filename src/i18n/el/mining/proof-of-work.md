# Εξόρυξη Απόδειξης-Εργασίας (Α.Ε.)

---

## Σφαιρική Εικόνα

Proof-of-work mining, more commonly referred to as PoW mining, is the activity
of committing your computer’s hardware and resources to process network
transactions and build the blocks that make up the blockchain in the Decred
network. Each time a block is created (by a miner), about 30 new Decred coins
are made. These coins are then split up as follows:

Επιχορήγηση | Μέλος
---     | ---
60%   | Εξορυκτές Α.Ε.
30%   | Ψηφοφόροι PoS
10%   | Επιχορήγηση ανάπτυξης του Decred

You will, on average, receive a reward that is roughly proportional to the
hashrate of your miner and the overall hashrate of the network when you commit
your computer to PoW mining. To get started, you must have a computer with a
video card. Most video cards can be used for mining (including the "mobile"
types found in some laptops). In general, higher end video cards perform at
υψηλότερους ρυθμούς hash και συνεπώς απολαβή υψηλότερων οφελών.
---

## Ατομική Εξόρυξη ή Εξόρυξη Συγκέντρωσης

> <i class="fa fa-male"></i> Ατομική Εξόρυξη

<i class="fa fa-exclamation-triangle"></i> **Solo mining is not recommended and is not covered by this documentation!** The Decred network regularly sees a network hash rate of up to 10,000Gh/s. Solo mining is generally only done by advanced individuals or organized groups with a large cluster of GPUs so it is not addressed here.

> <i class="fa fa-users"></i> Εξόρυξη σε Συγκέντρωση

When you mine in a pool, your hashrate is combined with all the other pool miners’ hashrates to look for the correct solution for a block. You will receive a reward based on the amount of work your miner performs in the pool.
Pool mining distributes shares based on blocks found so you can earn a steady amount of Decred rather than the "all or none" of solo mining.

---

## Αποκτήστε μια Διεύθυνση Decred για να Λάβετε Χρήματα με

Ακολουθήστε τον οδηγό [Τα Βασικά του dcrctl](/getting-started/user-guides/dcrctl-basics.md) και δημιουργήστε μια διεύθυνση ώστε να μπορέσετε να κάνετε ανάληψη των ανταμοιβών εξόρυξης σε αυτή.

---

## <i class="fa fa-life-ring"></i> Εγγραφείτε σε μια Συγκέντρωση Εξόρυξης

Αυτές οι συγκεντρώσεις εξόρυξης είναι γνωστό ότι υποστηρίζουν το Decred:

* [<i class="fa fa-external-link-square"></i> http://decredpool.org](http://decredpool.org)
* [<i class="fa fa-external-link-square"></i> http://yiimp.ccminer.org](http://yiimp.ccminer.org)
* [<i class="fa fa-external-link-square"></i> http://coinmine.pl/dcr](http://coinmine.pl/dcr)
* [<i class="fa fa-external-link-square"></i> https://dcr.maxminers.net](https://dcr.maxminers.net)
* [<i class="fa fa-external-link-square"></i> https://dcr.suprnova.cc](https://dcr.suprnova.cc)
* [<i class="fa fa-external-link-square"></i> https://pool.mn/dcr](https://pool.mn/dcr)
* [<i class="fa fa-external-link-square"></i> https://zpool.ca](https://zpool.ca)

Mining pools all work more or less the same but you may wish to sign up at multiple pools and see which one suits you the best.

Please choose to mine on a smaller pool so the network's hashrate can be spread out for better decentralization of mining power!

---

## Οδηγοί/Λογισμικό για GPU

GPU drivers usually contain the libraries needed for mining.  If you have difficulties running the software you may wish to re-install and specifically check that the OpenCL (AMD) or CUDA (NVIDIA) libraries are selected.

---

## <i class="fa fa-download"></i> Επιλογή και Λήψη Λογισμικού Εξόρυξης

### Επίσημη Εφαρμογή Εξόρυξης (gominer)

Gominer is the official Decred miner developed and supported by the Decred team. It is the easiest miner to setup and start mining and so it is recommended for most users. Currently, the latest version of gominer is **<i class="fa fa-github"></i> [v1.0.0](https://github.com/decred/gominer/releases/)** and the official binaries can be downloaded from **[https://github.com/decred/decred-binaries/releases/tag/v1.0.0](https://github.com/decred/decred-binaries/releases/tag/v1.0.0)**

Please be certain to select the correct operating system (Windows/Linux) and the correct version for your GPU type (CUDA for NVIDIA cards, OpenCL/OpenCLADL for AMD cards). gominer is only available to 64-bit operating systems. User guides to start mining with gominer can be found here:

- [Εξόρυξη-Συγκέντρωσης για Windows](/mining/proof-of-work/pool-mining/gominer/windows.md)

### Ανεπίσημες Εφαρμογές Εξόρυξης

* <i class="fa fa-github"></i> [cgminer](https://github.com/kR105-zz/cgminer) - Το cgminer είναι μια δημοφιλής εφαρμογή εξόρυξης για κάρτες γραφικών **AMD** με μεγάλο ιστορικό χρήσης σε πολλά διαφορετικά κρυπτονομίσματα. Είναι πιο δύσκολος στην χρήση του από το πρόγραμμα εξόρυξης gominer του Decred.

* <i class="fa fa-github"></i> [ccminer](https://github.com/tpruvot/ccminer) - ccminer is a popular miner for **NVIDIA** GPUs that has a long history of use in many different cryptocurrencies. It is more difficult to use than the decred gominer.

* <i class="fa fa-github"></i> [sgminer](https://github.com/tpruvot/sgminer) - Όσοι διαθέτουν κάρτα γραφικών **AMD** σε λειτουργικό σύστημα Windows ενδέχεται να θέλουν να κάνουν λήψη το sgminer.

---

## undefined

* Αποσυμπιέστε και εγκαταστήστε το λογισμικό σε έναν φάκελο/κατάλογο της επιλογής σας.
* Ανοίξτε μια γραμμή εντολών σε αυτό το μονοπάτι.
* Ακολουθήστε τις οδηγίες ρύθμισης της συγκέντρωσης εξόρυξης σας.
* Εκτελέστε τον εξορυκτή.

Συνεχίστε στις [Συχνές Ερωτήσεις Εξόρυξης Α.Ε.](/faq/proof-of-work-mining.md)
