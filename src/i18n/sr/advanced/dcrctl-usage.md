# <i class="fa fa-hdd-o"></i> Употреба дцрцтл-а 

Дцрцтл нуди начин за контролу и даемона `dcrd` и новчаника
`dcrwallet` користећи интерфејс јсон рпц без стварног писања
јсон.

Да поједноставимо примере, претпоставићемо да имате сву лозинку
Ускладиштене у [config files](/advanced/storing-login-details.md).

## <i class="fa fa-power-off"></i> Заустављање програма

За чишћење програма:

```no-highlight
dcrctl --wallet stop
dcrctl stop
```

## <i class="fa fa-arrow-up"></i> Проналажење тренутне висине блока

```no-highlight
dcrctl getblockcount
```

## <i class="fa fa-dollar"></i> Погледајте свој баланс

```no-highlight
dcrctl --wallet getbalance
```

## <i class="fa fa-inbox"></i> Направите нову адресу

```no-highlight
dcrctl --wallet getnewaddress
```

## <i class="fa fa-rocket"></i> Пошаљи средства на адресу

```
dcrctl --wallet sendtoaddress <address> <amount>
```

