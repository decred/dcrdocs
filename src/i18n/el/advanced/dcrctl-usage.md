# <i class="fa fa-hdd-o"></i> Χρήση dcrctl

Το dcrctl παρέχει έναν τρόπο ελέγχου τόσο του daemon `dcrd` όσο και του πορτοφολιού
`dcrwallet` χρησιμοποιώντας τη διεπαφή json rpc χωρίς πραγματικά να γράφετε
json.

Για να απλοποιήσουμε τα παραδείγματα θα υποθέσουμε ότι έχετε όλους τους κωδικούς πρόσβασης
αποθηκευμένους στα [αρχεία ρυθμίσεων](/advanced/storing-login-details.md).

## <i class="fa fa-power-off"></i> Διακόπτοντας τα προγράμματα

Για να κλείσετε τα προγράμματα με τον σωστό τρόπο:

```no-highlight
dcrctl --wallet stop
dcrctl stop
```

## <i class="fa fa-arrow-up"></i> Εύρεση του τρέχοντος ύψους block

```no-highlight
dcrctl getblockcount
```

## <i class="fa fa-dollar"></i> Δείτε το υπόλοιπό σας

```no-highlight
dcrctl --wallet getbalance
```

## <i class="fa fa-inbox"></i> Λάβετε μια νέα διεύθυνση

```no-highlight
dcrctl --wallet getnewaddress
```

## <i class="fa fa-rocket"></i> Στείλτε χρηματικά ποσά σε μια διεύθυνση

```
dcrctl --wallet sendtoaddress <address> <amount>
```

