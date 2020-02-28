`dcrlncli payinvoice` - Pay an invoice over lightning.

### Usage
```
   dcrlncli payinvoice [command options] pay_req
```

### Options
|Option|Info|
|--|--|
|`--pay_req value`|            A zpay32 encoded payment request to fulfill|
|`--fee_limit value`|          Maximum fee allowed in atoms when sending the payment (default: 0)|
|`--fee_limit_percent value`|  Percentage of the payment's amount used as the maximum fee allowed when sending the payment (default: 0)|
|`--cltv_limit value`|         The maximum time lock that may be used for this payment (default: 0)|
|`--outgoing_chan_id value`|   Short channel id of the outgoing channel to use for the first hop of the payment (default: 0)|
|`--force`, `-f`|               Will skip payment request confirmation|
|`--amt value`|                (Optional) Number of atoms to fulfill the invoice (default: 0)|
