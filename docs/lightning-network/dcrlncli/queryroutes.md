`dcrlncli queryroutes` - Query a route to a destination.

### Usage
```
   dcrlncli queryroutes [command options] dest amt
```

### Description
Queries the channel router for a potential path to the destination that has sufficient flow for the amount including fees

### Options
|Option|Info|
|--|--|
|`--dest value`|               The 33-byte hex-encoded public key for the payment destination|
|`--amt value`|                The amount to send expressed in atoms (default: 0)|
|`--fee_limit value`|          Maximum fee allowed in atoms when sending the payment (default: 0)|
|`--fee_limit_percent value`|  Percentage of the payment's amount used as the maximum fee allowed when sending the payment (default: 0)|
|`--final_cltv_delta value`|   (Optional) Number of blocks the last hop has to reveal the preimage (default: 0)|
|`--use_mc`|                   Use mission control probabilities|
|`--cltv_limit value`|         The maximum time lock that may be used for this payment (default: 0)|
