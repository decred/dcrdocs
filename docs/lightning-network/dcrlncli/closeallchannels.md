`dcrlncli closeallchannels` - Close all existing channels.

### Usage:
```
   dcrlncli closeallchannels [command options] [arguments...]
```

### Description:
   
  Close all existing channels.

  Channels will be closed either cooperatively or unilaterally, depending
  on whether the channel is active or not. If the channel is inactive, any
  settled funds within it will be time locked for a few blocks before they
  can be spent.

  One can request to close inactive channels only by using the
  --inactive_only flag.

  By default, one is prompted for confirmation every time an inactive
  channel is requested to be closed. To avoid this, one can set the
  --force flag, which will only prompt for confirmation once for all
  inactive channels and proceed to close them.

  In the case of cooperative closures, one can manually set the fee to
  be used for the closing transactions via either the --conf_target or
  --atoms_per_byte arguments. This will be the starting value used during
  fee negotiation. This is optional.

### Options:
|option|info|
|--|--|
|`--inactive_only`|        close inactive channels only|
|`--force`|                ask for confirmation once before attempting to close existing channels|
|`--conf_target value`|     (optional) the number of blocks that the closing transactions *should* confirm in, will be used for fee estimation (default: 0)|
|`--atoms_per_byte value`|  (optional) a manual fee expressed in sat/byte that should be used when crafting the closing transactions (default: 0)|
