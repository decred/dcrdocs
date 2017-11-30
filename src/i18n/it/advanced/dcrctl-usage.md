# <i class="fa fa-hdd-o"></i> Utilizzo dcrctl 

Dcrctl fornisce un modo per controllare sia il daemon `dcrd` che il portafoglio
`dcrwallet` usando l'interfaccia json rpc senza effettivamente scrivere
json.

Per semplificare gli esempi, supponiamo di avere tutta la password
memorizzata nei [config files](/advanced/storing-login-details.md).

## <i class="fa fa-power-off"></i> Arrestare i programmi

Per disattivare i programmi:

```no-highlight
dcrctl --wallet stop
dcrctl stop
```

## <i class="fa fa-arrow-up"></i> Trovare l'altezza del blocco corrente

```no-highlight
dcrctl getblockcount
```

## <i class="fa fa-dollar"></i> Guarda il tuo saldo

```no-highlight
dcrctl --wallet getbalance
```

## <i class="fa fa-inbox"></i> Ricevi un nuovo indirizzo

```no-highlight
dcrctl --wallet getnewaddress
```

## <i class="fa fa-rocket"></i> Invia fondi a un indirizzo

```
dcrctl --wallet sendtoaddress <address> <amount>
```

