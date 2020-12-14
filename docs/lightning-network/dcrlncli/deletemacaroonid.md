`dcrlncli deletemacaroonid` - Delete a specific macaroon ID.

### Usage

```
   dcrlncli deletemacaroonid root_key_id
```

## Description
Remove a macaroon ID using the specified root key ID. For example:

```
dcrlnlncli deletemacaroonid 1
```

**WARNING**: When the ID is deleted, all macaroons created from that root key will
be invalidated.

Note that the default root key ID 0 cannot be deleted.
