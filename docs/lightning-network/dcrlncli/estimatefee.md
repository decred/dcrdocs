`dcrlncli estimatefee` - Get fee estimates for sending decred on-chain to multiple addresses.

### Usage
```
   dcrlncli estimatefee [command options] send-json-string [--conf_target=N]
```

### Description

Get fee estimates for sending a transaction paying the specified amount(s) to the passed address(es).

The `send-json-string` param encodes addresses and the amount to send respectively in the following format:

`{"ExampleAddr": NumCoinsInAtoms, "SecondAddr": NumCoins}`

### Options
|Option|Info|
|--|--|
|`--conf_target value`|  (optional) the number of blocks that the transaction *should* confirm in (default: 0)|
