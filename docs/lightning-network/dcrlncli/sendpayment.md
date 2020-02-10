`dcrlncli sendpayment` - Send a payment over lightning.

### Usage
```
   dcrlncli sendpayment [command options] dest amt payment_hash final_cltv_delta 
   or
   dcrlncli sendpayment --pay_req=[payment request]
```

### Description
 
Send a payment over Lightning. One can either specify the full
parameters of the payment, or just use a payment request which encodes
all the payment details.

If payment isn't manually specified, then only a payment request needs
to be passed using the `--pay_req` argument.

If the payment *is* manually specified, then all four alternative
arguments need to be specified in order to complete the payment:

* `--dest=N`
* `--amt=A`
* `--final_cltv_delta=T`
* `--payment_hash=H`

The `--debug_send` flag is provided for usage *purely* in test
environments. If specified, then the payment hash isn't required, as
it'll use the hash of all zeroes. This mode allows one to quickly test
payment connectivity without having to create an invoice at the
destination.

### Options
|Option|Info|
|--|--|
|`--pay_req value`|                 A zpay32 encoded payment request to fulfill|
|`--fee_limit value`|               Maximum fee allowed in atoms when sending the payment (default: 0)|
|`--fee_limit_percent value`|       Percentage of the payment's amount used as the maximum fee allowed when sending the payment (default: 0)|
|`--cltv_limit value`|              The maximum time lock that may be used for this payment (default: 0)|
|`--outgoing_chan_id value`|        Short channel id of the outgoing channel to use for the first hop of the payment (default: 0)|
|`--force`, `-f`|                     Will skip payment request confirmation|
|`--dest value`, `-d value`|          The compressed identity pubkey of the payment recipient|
|`--amt value`, `-a value`|           Number of atoms to send (default: 0)|
|`--payment_hash value`, `-r value`|  The hash to use within the payment's HTLC|
|`--debug_send`|                    Use the debug rHash when sending the HTLC|
|`--final_cltv_delta value`|        The number of blocks the last hop has to reveal the preimage (default: 0)|
