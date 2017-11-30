# <i class="fa fa-hdd-o"></i> Використання dcrctl 

Dcrctl забезпечує спосіб керування як daemon `dcrd` так і гаманцем
`dcrwallet` використовуючи інтерфейс json rpc без фактичного написання
json.

Щоб спростити приклади, ми припустимо, що Ви маєте всі паролі
збереженими у [config files](/advanced/storing-login-details.md).

## <i class="fa fa-power-off"></i> Припинення роботи програм

Щоб чисто закрити програми:

```no-highlight
dcrctl --wallet stop
dcrctl stop
```

## <i class="fa fa-arrow-up"></i> Знаходження поточної висоти блоку

```no-highlight
dcrctl getblockcount
```

## <i class="fa fa-dollar"></i> Переглянути свій баланс

```no-highlight
dcrctl --wallet getbalance
```

## <i class="fa fa-inbox"></i> Отримати нову адресу

```no-highlight
dcrctl --wallet getnewaddress
```

## <i class="fa fa-rocket"></i> Надіслати кошти на адресу

```
dcrctl --wallet sendtoaddress <address> <amount>
```

