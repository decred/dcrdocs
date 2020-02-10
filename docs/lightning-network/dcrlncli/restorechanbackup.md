`dcrlncli restorechanbackup` - Restore an existing single or multi-channel static channel backup

### Usage
```
   dcrlncli restorechanbackup [command options] [--single_backup] [--multi_backup] [--multi_file=
```

### Description

Allows a user to restore a Static Channel Backup (SCB) that was
obtained either via the [exportchanbackup](exportchanbackup.md) command, or from dcrlnd's
automatically manged `channels.backup` file. This command should be used
if a user is attempting to restore a channel due to data loss on a
running node restored with the same seed as the node that created the
channel. If successful, this command will allows the user to recover
the settled funds stored in the recovered channels.

The command will accept backups in one of three forms:

* A single channel packed SCB, which can be obtained from
`exportchanbackup`. This should be passed in hex encoded format.

* A packed multi-channel SCB, which couples several individual
static channel backups in single blob.

* A file path which points to a packed multi-channel backup within a
file, using the same format that dcrlnd does in its `channels.backup`
file.
  

### Options
|Option|Info|
|--|--|
|`--single_backup value`|  A hex encoded single channel backup obtained from exportchanbackup|
|`--multi_backup value`|   A hex encoded multi-channel backup obtained from exportchanbackup|
|`--multi_file value`|     The path to a multi-channel back up file|
