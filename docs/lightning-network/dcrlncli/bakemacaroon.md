`dcrlncli bakemacaroon` - Bakes a new macaroon with the provided list of permissions and restrictions.

### Usage

```
   dcrlncli bakemacaroon [command options] [--save_to=] [--timeout=] [--ip_address=] permissions...
```

## Description

Bake a new macaroon that grants the provided permissions and
optionally adds restrictions (timeout, IP address) to it.

The new macaroon can either be shown on command line in hex serialized
format or it can be saved directly to a file using the `--save_to`
argument.

A permission is a tuple of an entity and an action, separated by a
colon. Multiple operations can be added as arguments, for example:

```
dcrlncli bakemacaroon info:read invoices:write foo:bar
```

For even more fine-grained permission control, it is also possible to
specify single RPC method URIs that are allowed to be accessed by a
macaroon. This can be achieved by specifying `"uri:<methodURI>"` pairs,
for example:

```
dcrlncli bakemacaroon uri:/lnrpc.Lightning/GetInfo uri:/verrpc.Versioner/GetVersion
```

The macaroon created by this command would only be allowed to use the
`dcrlncli getinfo` and `dcrlncli version` commands.

To get a list of all available URIs and permissions, use the
`dcrlncli listpermissions` command.

### Options

|Option|Info|
|--|--|
| `--save_to value`     | Save the created macaroon to this file using the default binary format |
| `--timeout value`     | The number of seconds the macaroon will be valid before it times out (default: 0) |
| `--ip_address value`  | The IP address the macaroon will be bound to |
| `--root_key_id value` | The numerical root key ID used to create the macaroon (default: 0) |
