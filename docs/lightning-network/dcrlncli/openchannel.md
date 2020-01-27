`dcrlncli openchannel` - Open a channel to a node or an existing peer.

### Usage:
```
   dcrlncli openchannel [command options] node-key local-amt push-amt
```

### Description:
   
  Attempt to open a new channel to an existing peer with the key node-key
  optionally blocking until the channel is 'open'.

  One can also connect to a node before opening a new channel to it by
  setting its host:port via the --connect argument. For this to work,
  the node_key must be provided, rather than the peer_id. This is optional.

  The channel will be initialized with local-amt atoms local and push-amt
  atoms for the remote node. Note that specifying push-amt means you give that
  amount to the remote node as part of the channel opening. Once the channel is open,
  a channelPoint (txid:vout) of the funding output is returned.

  One can manually set the fee to be used for the funding transaction via either
  the --conf_target or --atoms_per_byte arguments. This is optional.

### Options:
|option|info|
|--|--|
|`--node_key value`|          the identity public key of the target node/peer serialized in compressed format|
|`--connect value`|           (optional) the host:port of the target node|
|`--local_amt value`|         the number of atoms the wallet should commit to the channel (default: 0)|
|`--push_amt value`|          the number of atoms to give the remote side as part of the initial commitment state, this is equivalent to first opening a channel and sending the remote party funds, but done all in one step (default: 0)|
|`--block`|                   block and wait until the channel is fully open|
|`--conf_target value`|       (optional) the number of blocks that the transaction *should* confirm in, will be used for fee estimation (default: 0)|
|`--atoms_per_byte value`|    (optional) a manual fee expressed in atom/byte that should be used when crafting the transaction (default: 0)|
|`--private`|                 make the channel private, such that it won't be announced to the greater network, and nodes other than the two channel endpoints must be explicitly told about it to be able to route through it|
|`--min_htlc_m_atoms value`|  (optional) the minimum value we will require for incoming HTLCs on the channel (default: 0)|
|`--remote_csv_delay value`|  (optional) the number of blocks we will require our channel counterparty to wait before accessing its funds in case of unilateral close. If this is not set, we will scale the value according to the channel size (default: 0)|
|`--min_confs value`|         (optional) the minimum number of confirmations each one of your outputs used for the funding transaction must satisfy (default: 1)|
