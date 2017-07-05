# <i class="fa fa-hdd-o"></i>dcrctl Utilisation

dcrctl fournit un moyen de contrôler daemon `dcrd` et le portefeuille
`dcrwallet` utilisant l'interface json rpc sans actuellement ecrire
json.

Pour simplifier les examples nous allons assumer que vous avez tout les mots de passes
 stockés dans [fichier de config](/advanced/storing-login-details.md).

## <i class="fa fa-power-off"></i> Arrêter les programmes

Pour nettoyer proprement les programmes:

```no-highlight
dcrctl --wallet stop
dcrctl stop
```

## <i class="fa fa-arrow-up"></i>Trouver la hauteur actuelle du bloc

```no-highlight
dcrctl getblockcount
```

## <i class="fa fa-dollar"></i>Voir votre balance

```no-highlight
dcrctl --wallet getbalance
```

## <i class="fa fa-inbox"></i>Trouver une nouvelle adresse

```no-highlight
dcrctl --wallet getnewaddress
```

## <i class="fa fa-rocket"></i>Envoyer les fonds à une adresse

```
dcrctl --wallet sendtoaddress <address> <amount>
```

