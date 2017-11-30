# Simnet 

---

## Aperçu

Lors du développement des applications Decred ou des test des changements potentiels, il est souvent extrêmement utile d'avoir un réseau de test où les niveaux de difficulté sont suffisamment bas pour générer des blocs au besoin.

Afin de faciliter ces scénarios, dcrd fournit un réseau de simulation (`--simnet`). Voici un aperçu des propriétés les plus importantes qui les distinguent du réseau principal:

* La difficulté commence extrêmement bas pour permettre le minage rapide des blocs de CPU
* Changement de réseau:
    * All code related to peer discovery and IP address dissemination is disabled to help ensure the network remains private
    * Les ports réseau pairs et RPC sont différents
    * Une séquence d'octets de réseau unique est utilisée dans le protocole de message peer-to-peer afin que les blocs ne puissent pas être croisés accidentellement avec le réseau principal
* Tous les paramètres de l'adresse et de la chaîne de paiement sont exclusifs pour éviter toute confusion avec le réseau principal:
    * Bloc de genèse différent
    * Les adresses de paiement commencent par différents préfixes:
        * Standard pay-to-pubkeyhash (P2PKH) commence par `S` en majuscules
        * Standard pay-to-scripthash (P2SH) commence par minuscules `s`
    * Les clés étendues déterministes hiérarchiques exportées (BIP32) commencent par différents préfixes:
        * Les clés étendues publiques commencent par `spub`
        * Les clés étendues privées commencent par `sprv`
    * Le type de coins BIP44 utilisé dans les chemins de clé HD est minuscule `s`

  ---

## Commencer

L'exécution d'une node `dcrd` unique sur simnet commence simplement `dcrd` avec le drapeau `-simnet`. Cependant, afin d'être vraiment utile, vous voudrez généralement pouvoir envoyer des pièces de monnaie entre les adresses, ce qui implique que les blocs devront être minés et interfacés avec un portefeuille.

En outre, comme il n'y a pas encore de coins sur le nouveau réseau privé, une première série de blocs devra être minée qui paiera à une adresse que vous possédez, de sorte qu'il y a des coins utilisables à dépenser.

Comme mentionné précédemment, simnet utilise des adresses uniques pour éviter toute confusion avec le réseau principal. Ainsi, cela signifie qu'un portefeuille qui prend en charge le format d'adresse doit être utilisé. Pour cela, `dcrwallet` avec le drapeau `-simnet` peut être utilisé.

Ce qui suit est une référence de commande pour aller de l'avant:

**REMARQUE: Toutes ces commandes peuvent être simplifiées en créant des fichiers de configuration et en les utilisant, mais les commandes ici utilisent tout les commutateurs sur la ligne de commande pour afficher exactement ce qui est nécessaire pour chaque.**

* Démarrez dcrd sur simnet:

    `$ dcrd --simnet --rpcuser=<username> --rpcpass=<password>`

* Créez un nouveau portefeuille simnet:

    `$ dcrwallet --simnet --create`

* Démarrez dcrwallet sur simnet:

    `$ dcrwallet --simnet --username=<username> --password=<password>`

* Créez une nouvelle adresse simnet Decred:

    `$ dcrctl --simnet --wallet --rpcuser=<username> --rpcpass=<password> getnewaddress`

* Arrêtez le processus dcrd initial et redémarrez-le avec l'adresse de minage définie sur la sortie de la commande précédente:

    `$ dcrd --simnet --rpcuser=<username> --rpcpass=<password> --miningaddr=<S....>`

* Ordonner dcrd de générer suffisamment de blocs initiaux pour que la première base de données soit mature

    `$ dcrctl --simnet --rpcuser=<username> --rpcpass=<password> generate 100`

* Vérifiez le solde du portefeuille pour vous assurer que les coins sont disponibles:

    `$ dcrctl --simnet --wallet --rpcuser=<username> --rpcpass=<password> getbalance`
  
À ce stade, c'est un simnet privé entièrement fonctionnel avec des coins disponibles pour l'envoi vers d'autres adresses simnet. Chaque fois qu'une ou plusieurs transactions sont envoyées, un `generate 1` RPC doit être émis pour miner un nouveau bloc avec les transactions incluses.
