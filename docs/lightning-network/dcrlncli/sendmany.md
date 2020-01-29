`dcrlncli sendmany` - Send decred on-chain to multiple addresses.

### Usage
```
   dcrlncli sendmany [command options] send-json-string [--conf_target=N] [--atoms_per_byte=P]
```

### Description
   
Create and broadcast a transaction paying the specified amount(s) to the passed address(es).

The `send-json-string` param encodes addresses and the amount to send
respectively in the following format:

`{"ExampleAddr": NumCoinsInAtoms, "SecondAddr": NumCoins}`

### Options
|Option|Info|
|--|--|
|`--conf_target value`|     (optional) the number of blocks that the transaction *should* confirm in, will be used for fee estimation (default: 0)|
|`--atoms_per_byte value`|  (optional) a manual fee expressed in atom/byte that should be used when crafting the transaction (default: 0)|
