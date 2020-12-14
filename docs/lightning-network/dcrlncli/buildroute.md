`dcrlncli buildroute` - Build a route from a list of hop pubkeys.

### Usage

```
   dcrlncli buildroute [command options] [arguments...]
```

### Options

|Option|Info|
|--|--|
| `--amt value`              | The amount to send expressed in atoms. If not set, the minimum routable amount is used (default: 0) |
| `--final_cltv_delta value` | Number of blocks the last hop has to reveal the preimage (default: 80) |
| `--hops value`             | Comma separated hex pubkeys |
| `--outgoing_chan_id value` | Short channel id of the outgoing channel to use for the first hop of the payment (default: 0) |
