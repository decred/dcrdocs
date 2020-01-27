`dcrlncli getnodeinfo` - Get information on a specific node.

### Usage:
```
   dcrlncli getnodeinfo [command options] [arguments...]
```

### Description:
   Prints out the latest authenticated node state for an advertised node

### Options:
|option|info|
|--|--|
|`--pub_key value`|     the 33-byte hex-encoded compressed public of the target node|
|`--include_channels`|  if true, will return all known channels associated with the node|
