`dcrlncli updatechanpolicy` - Update the channel policy for all channels, or a single channel.

### Usage
```
   dcrlncli updatechanpolicy [command options] base_fee_m_atoms fee_rate time_lock_delta [--max_htlc_m_atoms=N] [channel_point]
```

### Description

Updates the channel policy for all channels, or just a particular channel
identified by its channel point. The update will be committed, and
broadcast to the rest of the network within the next batch.
Channel points are encoded as: `funding_txid:output_index`.

### Options
|Option|Info|
|--|--|
|`--base_fee_m_atoms value`|  the base fee in milli-atoms that will be charged for each forwarded HTLC, regardless of payment size (default: 0)|
|`--fee_rate value`|          the fee rate that will be charged proportionally based on the value of each forwarded HTLC, the lowest possible rate is 0 with a granularity of 0.000001 (millionths)|
|`--time_lock_delta value`|   the CLTV delta that will be applied to all forwarded HTLCs (default: 0)|
|`--max_htlc_m_atoms value`|  if set, the max HTLC size that will be applied to all forwarded HTLCs. If unset, the max HTLC is left unchanged. (default: 0)|
|`--chan_point value`|        The channel whose fee policy should be updated, if nil the policies for all channels will be updated. Takes the form of: txid:output_index|
