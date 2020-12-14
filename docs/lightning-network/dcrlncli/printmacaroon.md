`dcrlncli printmacaroon` - Print the content of a macaroon in a human readable format.

### Usage

```
   dcrlncli printmacaroon [command options] [macaroon_content_hex]
```

## Description

Decode a macaroon and show its content in a more human readable format.
The macaroon can either be passed as a hex encoded positional parameter
or loaded from a file.

### Options

|Option|Info|
|--|--|
|`--macaroon_file value` | Load the macaroon from a file instead of the command line directly |
