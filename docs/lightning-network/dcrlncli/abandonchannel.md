`dcrlncli abandonchannel` - Abandons an existing channel.

### Usage
```
  dcrlncli abandonchannel [command options] funding_txid [output_index]
```
### Description

Removes all channel state from the database except for a close
summary. This method can be used to get rid of permanently unusable
channels due to bugs fixed in newer versions of dcrlnd.

Only available when dcrlnd is built in debug mode.

To view which `funding_txids` or `output_indexes` can be used for this command,
see the channel_point values within the [listchannels](listchannels.md) command output.
The format for a `channel_point` is `funding_txid:output_index`.

### Options
|Option|Info|
|--|--|
|`--funding_txid value`|the txid of the channel's funding transaction|
|`--output_index value`|the output index for the funding output of the funding transaction (default: 0)|
