# <i class="fa fa-hdd-o"></i> Использование dcrctl 

Dcrctl обеспечивает способ управления как daemon `dcrd` так и кошельком
`dcrwallet` используя интерфейс json rpc, без фактической записи
json.

Чтобы упростить приведение примеров, мы предположим, что у Вас есть весь пароль, сохраненный в [config files](/advanced/storing-login-details.md).

## <i class="fa fa-power-off"></i> Остановка программ

Чистая остановка программ:

```no-highlight
dcrctl --wallet stop
dcrctl stop
```

## <i class="fa fa-arrow-up"></i> Нахождение текущей высоты блока

```no-highlight
dcrctl getblockcount
```

## <i class="fa fa-dollar"></i> Посмотреть свой баланс

```no-highlight
dcrctl --wallet getbalance
```

## <i class="fa fa-inbox"></i> Получить новый адрес

```no-highlight
dcrctl --wallet getnewaddress
```

## <i class="fa fa-rocket"></i> Отправить средства на адрес

```
dcrctl --wallet sendtoaddress <address> <amount>
```

