`dcrlncli verifychanbackup` - Verify an existing channel backup

### Usage
```
   dcrlncli verifychanbackup [command options] [--single_backup] [--multi_backup] [--multi_file]
```

### Description

This command allows a user to verify an existing Single or Multi channel
backup for integrity. This is useful when a user has a backup, but is
unsure as to if it's valid or for the target node.

The command will accept backups in one of three forms:

* A single channel packed SCB, which can be obtained from
[exportchanbackup](exportchanbackup.md). This should be passed in hex encoded format.

* A packed multi-channel SCB, which couples several individual
static channel backups in single blob.

* A file path which points to a packed multi-channel backup within a
file, using the same format that lnd does in its channels.backup
file.
    

### Options
|Option|Info|
|--|--|
|`--single_backup value`|  a hex encoded single channel backup obtained from exportchanbackup|
|`--multi_backup value`|   a hex encoded multi-channel backup obtained from exportchanbackup|
|`--multi_file value`|     the path to a multi-channel back up file|
