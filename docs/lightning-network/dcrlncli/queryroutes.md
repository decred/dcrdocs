`dcrlncli queryroutes` - Query a route to a destination.

### Usage:
```
   dcrlncli queryroutes [command options] dest amt
```

### Description:
   Queries the channel router for a potential path to the destination that has sufficient flow for the amount including fees

### Options:
|option|info|
|--|--|
|`--dest value`|               the 33-byte hex-encoded public key for the payment destination|
|`--amt value`|                the amount to send expressed in atoms (default: 0)|
|`--fee_limit value`|          maximum fee allowed in atoms when sending the payment (default: 0)|
|`--fee_limit_percent value`|  percentage of the payment's amount used as the maximum fee allowed when sending the payment (default: 0)|
|`--final_cltv_delta value`|   (optional) number of blocks the last hop has to reveal the preimage (default: 0)|
|`--use_mc`|                   use mission control probabilities|
|`--cltv_limit value`|         the maximum time lock that may be used for this payment (default: 0)|
