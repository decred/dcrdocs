# <i class="fa fa-hdd-o"></i>dcrctl käyttö

dcrctl:n avulla voit kontrolloida sekä `dcrd` daemonia että `dcrwallet` lompakkoa
käyttäen json rpc interfacea ilman tarvetta kirjoittaa
jsonia.

Esimerkkien yksinkertaistamiseksi oletamme että kaikki salasanasi
ovat tallessa [konfiguraatiotiedostoissa](/advanced/storing-login-details.md).

## <i class="fa fa-power-off"></i>Ohjelmien sammuttaminen

Ohjelmien sammuttaminen turvallisesti:

```no-highlight
dcrctl --wallet stop
dcrctl stop
```

## <i class="fa fa-arrow-up"></i>Löydä tämänhetkinen lohkokorkeus

```no-highlight
dcrctl getblockcount
```

## <i class="fa fa-dollar"></i>Tarkista saldosi

```no-highlight
dcrctl --wallet getbalance
```

## <i class="fa fa-inbox"></i>Hanki uusi osoite

```no-highlight
dcrctl --wallet getnewaddress
```

## <i class="fa fa-rocket"></i>Lähetä varoja osoitteeseen

```
dcrctl --wallet sendtoaddress <address><amount>
```

