`dcrlncli closechannel` - Close an existing channel.

### Usage
```
   dcrlncli closechannel [command options] funding_txid [output_index]
```

### Description

Close an existing channel. The channel can be closed either cooperatively,
or unilaterally `--force`.

A unilateral channel closure means that the latest commitment
transaction will be broadcast to the network. As a result, any settled
funds will be time locked for a few blocks before they can be spent.

In the case of a cooperative closure, One can manually set the fee to
be used for the closing transaction via either the `--conf_target` or
`--atoms_per_byte` arguments. This will be the starting value used during
fee negotiation. This is optional.

To view which `funding_txids` or `output_indexes` can be used for a channel close,
see the `channel_point` values within the [listchannels](listchannels.md) command output.
The format for a `channel_point` is `funding_txid:output_index`.

### Options
|Option|Info|
|--|--|
|`--funding_txid value`|    The txid of the channel's funding transaction|
|`--output_index value`|    The output index for the funding output of the funding transaction (default: 0)|
|`--force`|                Attempt an uncooperative closure|
|`--block`|                Block until the channel is closed|
|`--conf_target value`|     (Optional) The number of blocks that the transaction *should* confirm in, will be used for fee estimation (default: 0)|
|`--atoms_per_byte value`|  (Optional) A manual fee expressed in atom/byte that should be used when crafting the transaction (default: 0)|
