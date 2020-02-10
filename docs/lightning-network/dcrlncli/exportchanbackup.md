`dcrlncli exportchanbackup` - Obtain a static channel back up for a selected channels, or all known channels

### Usage
```
   dcrlncli exportchanbackup [command options] [chan_point] [--all] [--output_file]
```

### Description

This command allows a user to export a Static Channel Backup (SCB) for
a selected channel. SCB's are encrypted backups of a channel's initial
state that are encrypted with a key derived from the seed of a user. In
the case of partial or complete data loss, the SCB will allow the user
to reclaim settled funds in the channel at its final state. The
exported channel backups can be restored at a later time using the
[`restorechanbackup`](restorechanbackup.md) command.

This command will return one of two types of channel backups depending
on the set of passed arguments:

* If a target channel point is specified, then a single channel
backup containing only the information for that channel will be
returned.

* If the `--all` flag is passed, then a multi-channel backup will be
returned. A multi backup is a single encrypted blob (displayed in
hex encoding) that contains several channels in a single cipher
text.

Both of the backup types can be restored using the `restorechanbackup`
command.

### Options
|Option|Info|
|--|--|
|`--chan_point value`|   The target channel to obtain an SCB for|
|`--all`|                If specified, then a multi backup of all active channels will be returned|
|`--output_file value`|  If specified, then rather than printing a JSON output of the static channel backup, a serialized version of the backup (either Single or Multi) will be written to the target file, this is the same format used by dcrlnd in its `channels.backup` file|
