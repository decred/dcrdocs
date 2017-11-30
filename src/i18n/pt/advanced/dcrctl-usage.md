# <i class="fa fa-hdd-o"></i> Uso da dcrctl

A dcrctl fornece uma maneira de controlar tanto o daemon `dcrd` como a carteira
`dcrwallet` usando a interface JSON-RPC sem de fato escrever
JSON.

Para simplificar os exemplos, vamos assumir que você tem todas as suas senhas 
mantidas nos [config files](/advanced/storing-login-details.md).

## <i class="fa fa-power-off"></i> Pausando os programas

Para encerrar completamente os programas:

```no-highlight
dcrctl --wallet stop
dcrctl stop
```

## <i class="fa fa-arrow-up"></i> Encontrando a altura de bloco atual

```no-highlight
dcrctl getblockcount
```

## <i class="fa fa-dollar"></i> Veja seu balanço

```no-highlight
dcrctl --wallet getbalance
```

## <i class="fa fa-inbox"></i> Obtendo um novo endereço

```no-highlight
dcrctl --wallet getnewaddress
```

## <i class="fa fa-rocket"></i> Enviar fundos para um endereço

```
dcrctl --wallet sendtoaddress <address> <amount>
```

