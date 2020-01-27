`dcrlncli payinvoice` - Pay an invoice over lightning.

### Usage:
```
   dcrlncli payinvoice [command options] pay_req
```

### Options:
|option|info|
|--|--|
|`--pay_req value`|            a zpay32 encoded payment request to fulfill|
|`--fee_limit value`|          maximum fee allowed in satoshis when sending the payment (default: 0)|
|`--fee_limit_percent value`|  percentage of the payment's amount used as the maximum fee allowed when sending the payment (default: 0)|
|`--cltv_limit value`|         the maximum time lock that may be used for this payment (default: 0)|
|`--outgoing_chan_id value`|   short channel id of the outgoing channel to use for the first hop of the payment (default: 0)|
|`--force`, `-f`|               will skip payment request confirmation|
|`--amt value`|                (optional) number of atoms to fulfill the invoice (default: 0)|
   
