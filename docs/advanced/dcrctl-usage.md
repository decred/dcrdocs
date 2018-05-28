# <img class="dcr-icon" src="/img/dcr-icons/Dcrtl.svg" /> dcrctl Usage 

dcrctl provides a way to control both the daemon `dcrd` and the wallet
`dcrwallet` using the json rpc interface without actually writing
json.

To simplify the examples we will assume that you have all password
stored in the [config files](/advanced/storing-login-details.md).

## :fa-power-off: Stopping the programs

To cleanly shut down the programs:

```no-highlight
dcrctl --wallet stop
dcrctl stop
```

## :fa-arrow-up: Finding the current block height

```no-highlight
dcrctl getblockcount
```

## :fa-dollar: See your balance

```no-highlight
dcrctl --wallet getbalance
```

## :fa-inbox: Get a new address

```no-highlight
dcrctl --wallet getnewaddress
```

## :fa-rocket: Send funds to an address

```
dcrctl --wallet sendtoaddress <address> <amount>
```

