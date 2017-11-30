# <i class="fa fa-hdd-o"></i> Użycie dcrctl

dcrctl umożliwia kontrolę nad zarówno daemonem `dcrd` jak i portfelem
`dcrwallet` przy użyciu interfejsu json rpc bez pisania
json.

Aby uprościć przykłady zakładamy, że masz wszystkie hasła
przechowywane w plikach [config files] (/ advanced / storing-login-details.md).

## <i class="fa fa-power-off"></i> Zatrzymywanie programów

Aby na czysto zamknąć programy:

```no-highlight
dcrctl --wallet stop
dcrctl stop
```

## <i class="fa fa-arrow-up"></i>Znajdowanie aktualnej wysokości bloku

```no-highlight
dcrctl getblockcount
```

## <i class="fa fa-dollar"></i> Sprawdź saldo

```no-highlight
dcrctl --wallet getbalance
```

## <i class="fa fa-inbox"></i> Pobierz nowy adres

```no-highlight
dcrctl --wallet getnewaddress
```

## <i class="fa fa-rocket"></i> Wyślij fundusze na adres

```
dcrctl --wallet sendtoaddress <address> <amount>
```

