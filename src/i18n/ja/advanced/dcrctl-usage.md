# <i class="fa fa-hdd-o"></i> dcrctl Usage 

dcrctl provides a way to control both the daemon `dcrd` and the wallet
`dcrwallet` using the json rpc interface without actually writing
json.

To simplify the examples we will assume that you have all password
stored in the [config files](/advanced/storing-login-details.md).

## <i class="fa fa-power-off"></i> Stopping the programs

To cleanly shut down the programs:

```no-highlight
dcrctl --wallet stop
dcrctl stop
```

## <i class="fa fa-arrow-up"></i> Finding the current block height

```no-highlight
dcrctl getblockcount
```

## <i class="fa fa-dollar"></i> See your balance

```no-highlight
dcrctl --wallet getbalance
```

## <i class="fa fa-inbox"></i> Get a new address

```no-highlight
dcrctl --wallet getnewaddress
```

## <i class="fa fa-rocket"></i> Send funds to an address

```
dcrctl --wallet sendtoaddress <address> <amount>
```

