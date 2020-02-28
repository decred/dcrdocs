`dcrlncli closedchannels` - List all closed channels.

### Usage
```
   dcrlncli closedchannels [command options] [arguments...]
```

### Options
|Option|Info|
|--|--|
|`--cooperative`|       List channels that were closed cooperatively|
|`--local_force`|       List channels that were force-closed by the local node|
|`--remote_force`|      List channels that were force-closed by the remote node|
|`--breach`|            List channels for which the remote node attempted to broadcast a prior revoked channel state|
|`--funding_canceled`|  List channels that were never fully opened|
|`--abandoned`|         List channels that were abandoned by the local node|
