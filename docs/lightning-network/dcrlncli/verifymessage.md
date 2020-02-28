`dcrlncli verifymessage` - Verify a message signed with the signature.

### Usage
```
   dcrlncli verifymessage [command options] msg signature
```

### Description

Verify that the message was signed with a properly-formed signature
The signature must be zbase32 encoded and signed with the private key of
an active node in the resident node's channel database.

Positional arguments and flags can be used interchangeably but not at the same time!

### Options
|Option|Info|
|--|--|
|`--msg value`|  The message to verify|
|`--sig value`|  The zbase32 encoded signature of the message|
