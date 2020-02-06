`dcrlncli create` - Initialize a wallet when starting dcrlnd for the first time.

### Usage
```
   dcrlncli create [command options] [arguments...]
```

### Description

The create command is used to initialize an dcrlnd wallet from scratch for
the very first time. This is an interactive command with one required
argument (the password), and one optional argument (the mnemonic
passphrase).

The first argument (the password) is required and MUST be greater than
8 characters. This will be used to encrypt the wallet within dcrlnd. This
MUST be remembered as it will be required to fully start up the daemon.

The second argument is an optional 24-word mnemonic derived from BIP
39. If provided, then the internal wallet will use the seed derived
from this mnemonic to generate all keys.

This command returns a 24-word seed in the scenario that NO mnemonic
was provided by the user. This should be written down as it can be used
to potentially recover all on-chain funds, and most off-chain funds as
well.

Finally, it's also possible to use this command and a set of static
channel backups to trigger a recover attempt for the provided [Static
Channel Backups](restorechanbackup.md). Only one of the three parameters will be accepted. See
the restorechanbackup command for further details w.r.t the format
accepted.

### Options
|Option|Info|
|--|--|
|`--single_backup value`|  a hex encoded single channel backup obtained from exportchanbackup|
|`--multi_backup value`|   a hex encoded multi-channel backup obtained from exportchanbackup|
|`--multi_file value`|     the path to a multi-channel back up file|
