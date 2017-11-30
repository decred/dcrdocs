# <i class="fa fa-hdd-o"></i>dcrctl Uso

Dcrctl proporciona una forma de controlar tanto el daemon `dcrd` como la billetera
`dcrwallet` utilizando la interfaz json rpc sin escribir
Json

Para simplificar los ejemplos vamos a suponer que usted tiene todas las contraseñas
Almacenados en los [archivos de configuración] (/ advanced / storing-login-details.md).

## <i class="fa fa-power-off"></i> Detener los programas

Para cerrar los programas de forma limpia:

```no-highlight
dcrctl --wallet stop
dcrctl stop
```

## <i class="fa fa-arrow-up"></i> Búsqueda de la altura actual del bloque

```no-highlight
dcrctl getblockcount
```

## <i class="fa fa-dollar"></i>Ver su balance

```no-highlight
dcrctl --wallet getbalance
```

## <i class="fa fa-inbox"></i> Obtener una nueva dirección

```no-highlight
dcrctl --wallet getnewaddress
```

## <i class="fa fa-rocket"></i> Enviar fondos a una dirección

```
dcrctl --wallet sendtoaddress <address> <amount>
```

