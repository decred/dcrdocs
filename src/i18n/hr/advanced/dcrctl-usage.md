# <i class="fa fa-hdd-o"></i> dcrctl Upotreba 

Dcrctl pruža način kontrole i servisa `dcrd` i računa
`dcrwallet` koristeći sučelje json rpc bez konkretnog pisanja json.

Da bismo pojednostavili primjere, pretpostavit ćemo da imate sve zaporke pohranjene u [konfiguracijskim datotekama](/advanced/storing-login-details.md).

## <i class="fa fa-power-off"></i> Zaustavljanje programa

Za čisto gašenje programa:

```no-highlight
dcrctl --wallet stop
dcrctl stop
```

## <i class="fa fa-arrow-up"></i> Pronalaženje trenutačne visine bloka

```no-highlight
dcrctl getblockcount
```

## <i class="fa fa-dollar"></i> Dobijte novu adresu

```no-highlight
dcrctl --wallet getbalance
```

## <i class="fa fa-inbox"></i> Pošaljite sredstva na adresu

```no-highlight
dcrctl --wallet getnewaddress
```

## <i class="fa fa-rocket"></i> Send funds to an address

```
dcrctl --wallet sendtoaddress <address> <amount>
```

