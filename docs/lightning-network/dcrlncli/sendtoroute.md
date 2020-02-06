`dcrlncli sendtoroute` - Send a payment over a predefined route.

### Usage
```
   dcrlncli sendtoroute [command options] [arguments...]
```

### Description

Send a payment over Lightning using a specific route. One must specify
the route to attempt and the payment hash. This command can even
be chained with the response to [queryroutes](queryroutes.md) or buildroute. This command
can be used to implement channel rebalancing by crafting a self-route, 
or even atomic swaps using a self-route that crosses multiple chains.

There are three ways to specify a route:
* using the `--routes` parameter to manually specify a JSON encoded
route in the format of the return value of queryroutes or
buildroute:
```
   dcrlncli sendtoroute --payment_hash=<pay_hash> --routes=<route>
```
* passing the route as a positional argument:
```
   dcrlncli sendtoroute --payment_hash=pay_hash <route>
```

* or reading in the route from stdin, which can allow chaining the
response from queryroutes or buildroute, or even read in a file
with a pre-computed route:
```
   dcrlncli queryroutes --args.. | dcrlncli sendtoroute --payment_hash= -
```
notice the '-' at the end, which signals that dcrlncli should read
the route in from stdin.

### Options
|Option|Info|
|--|--|
|`--payment_hash value`, `--pay_hash value`|  the hash to use within the payment's HTLC|
|`--routes value`, `-r value`|                a json array string in the format of the response of queryroutes that denotes which routes to use|
