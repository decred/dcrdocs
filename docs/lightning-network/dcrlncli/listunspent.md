`dcrlncli listunspent` - List UTXOs available for spending.

### Usage
```
   dcrlncli listunspent [command options] [min-confs [max-confs]] [--unconfirmed_only]
```

### Description

For each spendable UTXO currently in the wallet, with at least min_confs
confirmations, and at most `max_confs` confirmations, lists the txid,
index, amount, address, address type, scriptPubkey and number of
confirmations.  Use `--min_confs=0` to include unconfirmed coins. To list
all coins with at least min_confs confirmations, omit the second
argument or flag `--max_confs`. To list all confirmed and unconfirmed
coins, no arguments are required. To see only unconfirmed coins, use
`--unconfirmed_only` with `--min_confs` and `--max_confs` set to zero or
not present.
  

### Options
|Option|Info|
|--|--|
|`--min_confs value`|   The minimum number of confirmations for a UTXO (default: 0)|
|`--max_confs value`|   The maximum number of confirmations for a UTXO (default: 0)|
|`--unconfirmed_only`|  When min_confs and max_confs are zero, setting false implicitly overrides max_confs to be MaxInt32, otherwise max_confs remains zero. An error is returned if the value is true and both min_confs and max_confs are non-zero. (default: false)|
