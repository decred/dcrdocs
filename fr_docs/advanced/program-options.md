# **Options du programme**

---

Les options par défaut sont saines pour la plupart des utilisateurs (bien que vous devriez peut-être définir vos informations d'identification. Cela signifie que `dcrd` travail «hors de la boîte» pour la plupart des utilisateurs. Cependant, il existe également une large variété de drapeaux qui peuvent être utilisés pour contrôler son comportement. La section suivante fournit un aperçu de l'utilisation qui énumère les drapeaux. Un intéressant point est que la forme longue de toutes ces options (sauf `-C`) peut être spécifié dans un fichier de configuration automatiquement analysé lorsque dcrd démarre.
Le `-C` (`--configfile`)
drapeau, comme indiqué ci-dessous, peut être utilisé pour remplacer l'emplacement par défaut.
Vous pouvez toujours obtenir une liste de toutes les options en utilisant l'option `-h`.

---

## **Utilisation**

```
dcrd [OPTIONS]
```

---

## **Options d'Application**

Option                      | Description
---                         | ---
`-A` ou `--appdata=`        | Chemin d'accès au répertoire principal dcrd ($HOME/.dcrd)
`-V` ou `--version`         | Afficher les informations de version et quitter
`-C` ou `--configfile=`     | Chemin d'accès au fichier de configuration
`-b` ou `--datadir=`        | Répertoire pour stocker des données
`--logdir=`                 | Répertoire pour enregistrer la sortie. ($HOME/.dcrd/logs)
`-a` ou `--addpeer=`        | Ajouter un pair pour se connecter au démarrage
`--connect=`                | Connectez-vous uniquement aux pairs spécifiés lors du démarrage
`--nolisten`                | Désactiver l'écoute des connexions entrantes - REMARQUE: L'écoute est automatiquement désactivée si les options  `--connect` ou `--proxy` sont utilisées sans spécifier les interfaces d'écoute via  `--listen`
`--listen=`                 | Ajouter une interface / port pour écouter les connexions (par défaut tous les ports d'interface: `9108`, testnet: `19108`)
`--maxpeers=`               | Nombre maximum de pairs entrants et sortants (125)
`--banduration=`            | Combien de temps interdire aux pairs qui se comportent mal. Les unités de temps valides sont {s, m, h}.  Minimum 1 seconde (24h0m0s)
`-u` or `--rpcuser=`        | Nom d'utilisateur pour les connexions RPC
`-P` or `--rpcpass=`        | Mot de passe pour les connexions RPC
`--rpclimituser=`           | Nom d'utilisateur pour les connexions RPC limitées
`--rpclimitpass=`           | Mot de passe pour les connexions RPC limitées
`--rpclisten=`              | Ajouter une interface / port pour écouter les connexions RPC (par défaut port: `8334`, testnet: `18334`)
`--rpccert=`                | Fichier contenant le fichier de certificat
`--rpckey=` | Fichier contenant la clé de certificat
`--rpcmaxclients=` | Nombre maximum de clients RPC pour les connexions standard (10)
`--rpcmaxwebsockets=` | Nombre maximal de clients RPC pour les connexions standard (25)
`--norpc` | Désactiver le serveur RPC intégré - REMARQUE: le serveur RPC est désactivé par défaut si aucun rpcuser / rpcpass n'est spécifié
`--notls` | Désactiver TLS pour le serveur RPC - REMARQUE: ceci n'est autorisé que si le serveur RPC est lié à localhost
`--nodnsseed` | Désactiver le semis DNS pour les pairs
`--externalip:` | Ajouter un ip à la liste des adresses locales que nous prétendons écouter aux pairs
`--proxy=` | Connexion via le proxy SOCKS5 (par exemple, 127.0.0.1:9050)
`--proxyuser=` | Nom d'utilisateur du serveur proxy
`--proxypass=` | Mot de passe pour le serveur proxy
`--onion=` | Connectez-vous à des services cachés via le proxy SOCKS5 (par exemple, 127.0.0.1:9050)
`--onionuser=` | Nom d'utilisateur pour serveur proxy d'oignon
`--onionpass=` | Mot de passe pour le serveur proxy d'oignon
`--noonion=` | Désactiver la connexion à des services cachés
`--torisolation` | Activer l'isolement du flux tor en randomisant les informations d'identification des utilisateurs pour chaque connexion
`--testnet` | Utilisez le réseau de test
`--simnet` | Utilisez le réseau de test de simulation
`--nocheckpoints=` | Désactivez les points de contrôle intégrés. Ne faites pas cela, sauf si vous savez ce que vous faites.
`--dbtype=` | Base de données à utiliser pour la chaîne Block (leveldb)
`--profile=` | Activer le profilage HTTP sur un port donné - REMARQUE Le port doit être compris entre 1024 et 65536 (6060)
`--cpuprofile=` | Ecrire le profil du CPU au fichier spécifié
`--memprofile=` | Ecrire le profil mem au fichier spécifié
`--dumpblockchain=` | Écrivez la chaîne de blocs comme une carte codée par gob dans le fichier spécifié
`--miningtimeoffset=` | Neutralise l'horodatage de l'exploitation d'un bloc pendant ce nombre de secondes (Les valeurs positives sont dans le passé)
`-d` ou` --debuglevel: `| Niveau d'enregistrement pour tous les sous-systèmes {trace, debug, info, warn, error, critical} - Vous pouvez également spécifier &lt;subsystem&gt;=&lt;level&gt;,&lt;subsystem2&gt;=&lt;level&gt;,... Pour définir le niveau de journal pour les sous-systèmes individuels - Utiliser afficher pour répertorier les sous-systèmes disponibles (info)
`--upnp` | Utilisez UPnP pour mapper notre port d'écoute en dehors de NAT
`--limitfreerelay=` | Limiter le relais des transactions sans frais de transaction au montant donné en milliers d'octets par minute (15)
`--norelaypriority` | Ne nécessitent pas de transactions gratuites ou à faible coût pour avoir une priorité élevée pour le relais
`--maxorphantx=` | Nombre maximum de transactions orphelines à conserver dans la mémoire (1000)
`--generate=` | Générer (mine) decred en utilisant un CPU
`--miningaddr=` | Ajouter l'adresse de paiement spécifiée à la liste des adresses à utiliser pour les blocs générés - Au moins une adresse est requise si l'option de génération est définie
`--blockminsize=` | Taille de bloc Mininum en octets à utiliser lors de la création d'un bloc
`--blockmaxsize=` | Taille maximale du bloc en octets à utiliser lors de la création d'un bloc (750000)
`--blockprioritysize=` | Taille en octets pour les transactions à priorité élevée / à faible taux lors de la création d'un bloc (50000)
`--getworkkey=` | DEPRECATED - Utilisez l'option --miningaddr à la place
`--adddexdex=` | Créez et maintenez un index d'adresse complet. Actuellement uniquement pris en charge par leveldb.
`--dropaddrindex=` | Supprime l'index de transaction basé sur l'adresse à partir de la base de données au démarrage et les sorties.
`--nagagégiste '| Désactiver l'extraction du bloc parent de la chaîne de blocs s'il n'y a pas assez d'électeurs
`--nominingstatesync` | Désactiver la synchronisation de l'état de minage avec d'autres nodes

---

## ** Options d'aide **

Option | La description
--- | ---
`-h` ou` --help` | Afficher ce message d'aide

---

## **Commandes PdE**

Bien qu'il soit facile de commencer l'exploitation minière de PoS, il se passe beaucoup de choses dans l'arrière-plan. Voyons quelques-unes des informations disponible:

```
dcrctl -u <daemon username> - P <daemon password> --wallet <command>
```

```getbalance ("account" minconf=1 "balancetype")``` Obtient l'équilibre pour le compte donné (pas l'adresse). De son côté, il affichera les pièces de monnaie dépensables. Pour voir toutes les pièces, vous devez définir le type de balance à all par exemple. 'Getbalance * 0 all' affichera l'équilibre total dans le portefeuille.

```
getstakeinfo
  "poolsize": 42208,
  "difficulty": 17.4973371,
  "allmempooltix": 0,
  "ownmempooltix": 0,
  "immature": 0,
  "live": 213,
  "proportionlive": 0.005046436694465504,
  "voted": 129,
  "totalsubsidy": 239.06504718,
  "missed": 50,
  "proportionmissed": 0.0011832079132945241,
  "revoked": 50
```

La commande `getstakeinfo` Renvoie une liste de données sur vos résultats miniers PdE.

Sortie             | Description
---                |---
`poolsize`         | Le nombre de tickets actuels dans la pool de vote.
`Difficulté '| C'est le coût d'un ticket. Il monte ou baisse en fonction du nombre de tickets actuellement dans le pool ainsi que du nombre de tickets au cours des 2880 blocs en utilisant une moyenne mobile exponentielle <LINK> Source (https://github.com/decred/dcrd/blob /master/chaincfg/params.go#L336). Le réseau ajustera le prix pour essayer de garder la taille de la pool près de la cible de 40 960 tickets. Notez que cela ne signifie pas que le prix augmentera toujours si au-dessus de ce numéro, et il ne descendra pas toujours si en-dessous. Le taux auquel les tickets entrent dans la piscine affecte également le prix. Il est réglé tous les 144 blocs.
`Allmempooltix` | Seuls 20 tickets par bloc sont acceptés dans la pool de vote. Des tickets supplémentaires attendent dans le mempool. Les tickets sont acceptés dans la pool de vote selon txfee qui est de 0,05 par défaut. Pour plus d'informations, consultez la rubrique «Achats-tickets d'extraction minière PoS».
`Ownmempooltix` | Vos tickets qui attendent dans le mempool.
`Immature` | Tous les tickets ont un délai de maturité de 256 (environ un jour) pendant lequel ils ne peuvent pas être sélectionnés pour voter. Cela indique combien de vos tickets sont dans cet état.
`Live` | Les tickets dans le groupe de vote sont actifs et peuvent voter lorsqu'ils sont sélectionnés.
`Proportionlive` | Proportion de vos tickets en direct dans la pool de vote.
`Vote` | Nombre de tickets qui ont voté dans ce portefeuille.
`Totalsubsidy` | Montant total que ce portefeuille a gagné au moyen du vote.
`missed` | Les tickets qui ont été sélectionnés pour voter, mais pas, probablement parce que le portefeuille était hors ligne.
`Proportionmissed` | Proportion de tous les tickets manqués qui étaient les vôtres.
`revoked` | Nombre de tickets révoqués. Étant donné que les tickets manqués sont révoqués (retirés du groupe de vote sans vote), ce numéro sera habituellement (mais pas toujours) des tickets manquants égaux.

---

## **Paramètres réseau PdE**

Paramètre               | Valeur              | Description
---                     | ---                | ---
`MinimumStakeDiff`      | 2                  | Le prix minimum pour un ticket de participation.
`TicketPoolSize`        | 8,192              | Ceci est multiplié par TicketPerBlock pour obtenir une taille souhaitée de pool de vote (40 960).
`TicketsPerBlock` | 5 | Ces nombreux tickets seront choisis pour voter chaque bloc.
`TicketMaturity` | 256 | Temps dans les blocs (environ un jour) jusqu'à ce qu'un ticket puisse voter après avoir été acheté.
`TicketExpiry` | 40,960 | Les tickets qui n'ont pas voté après ces nombreux blocs seront révoqués (environ 142 jours).
`CoinbaseMaturity` | 256 | Historique. Avant les pièces de monnaie de ce bloc ne peuvent pas être transférées.
`SStxChangeMaturity` | 1 | Après avoir voté, ces nombreux blocs doivent passer pour la participation et récompenser en retour les mineurs PdE.
`TicketPoolSizeWeight` | 4 | Les tickets ne changeront pas le prix vers le haut ou vers le bas de plus que ce multiplicateur en une mise à jour.
`StakeDiffAlpha` | 1 | Ceci est la difficulté de l'enjeu EMA calcul alpha (lissage) de la valeur. Il est différent d'un EMA alpha normal. Plus près de 1 -> plus lisse.
`StakeDiffWindowSize` | 144 | Le nombre de blocs dans une fenêtre. Moyenne par fenêtre, utilisée ci-dessous.
`StakeDiffWindows` | 20 | Une moyenne mobile exponentielle sur ces nombreuses fenêtres est utilisée pour calculer le coût de l'investissement.
`MaxFreshStakePerBlock` | 20 | Ces nombreux nouveaux tickets seront ajoutés du mempool au bloc de vote de chaque bloc.
`StakeEnabledHeight` | 256 + 256 | Historique. C'est la hauteur dans laquelle le premier ticket pourrait mûrir. Puisque les pièces ont été verrouillées jusqu'au bloc 256, aucun ticket ne peut être acheté avant. Ensuite, il y a 256 autres blocs avant qu'ils ne deviennent matures.
`StakeValidationHeight` | 4,096 | Historique. Le minage par Preuve d'Enjeu n'a pas eu lieu avant ce bloc.
`StakeBaseSigScript` | [] Byte {0x00, 0x00} | Il s'agit du script de signature de base de consensus pour tous les votes sur le réseau. Ceci n'est pas signé de quelque façon que ce soit, alors, sans forcer cette valeur, les mineurs/daemons pourraient le changer librement. Assure que le bloc se trouve sur le bon réseau.

---

## **Paramètres de la Chaîne de blocs**

Paramètre               | Valeur        | Description
---                     | ---          | ---
Récompense de bloc initial | 31.1958 | C'était la récompense initiale pour l'extraction d'un bloc.
Multiplicateur de récompense de blocs | 100/101 | La récompense de bloc est multipliée par ceci chaque fois que le prix du bloc change. Fondamentalement, cela signifie que tout cycle de récompense (voir ci-dessous) la récompense de bloc pour l'extraction d'un bloc est réduit d'environ 1%.
Changement du bloc de récompense | 6 144 blocs | Le nombre de blocs entre les blocs de récompenses change. Cela se produit environ toutes les 3 semaines. Decred utilise un cycle de changement plus fréquent (environ 3 semaines par rapport à Bitcoins 4 ans), mais l'ampleur du changement est beaucoup moins élevée (environ 1% par cycle alors que Bitcoin est à 50%). Ceci est conçu pour réduire le choc sur les marchés lorsqu'un changement se produit.
Partage des blocs de récompense | 60/30/10 | La récompense pour un bloc est divisée entre les mineurs et l'équipe de développement de Decred comme suit: les mineurs PdT obtiennent 60% de la récompense pour les rembourser pour les dépenses d'électricité et de matériel. Les mineurs PdE obtiennent 6% de la récompense (30% pour 5 voix) <que se passe-t-il si moins de 5 votent?>. Cela encourage les gens à conserver leurs pièces et à investir dans le réseau de Decred. L'équipe de développement reçoit 10% pour assurer l'avenir de Decred en finançant le développement en cours.

---

## **dcrctl paramètres**

### Commandes du serveur de chaîne

Notez que certaines commandes ont été omises dans cette liste. Elles comprennent des commandes en double, des commandes non implémentées et celles qui ont une limite d'utilité de la base d'utilisateurs générale. Vous pouvez toujours voir toutes les commandes
avec `dcrctl -l`.

Commande              | Description
---                  | ---
`getbestblock`       | Obtenez le bloc le plus récent et le hachage dans la chaîne.
`Getbestblockhash` | Obtenez le hash du bloc le plus récent de la chaîne.
`Getblockcount` | Obtenez le nombre actuel de blocs dans la chaîne.
`Getdifficulty` | Obtenez la difficulté actuelle du minage de la PdT.
`Gethashespersec` | Obtenez le taux de hachage du réseau.
`Getinfo` | Affiche des informations de base sur le réseau, y compris le numéro de bloc actuel et la difficulté du réseau.
`Getmininginfo` | Probablement la commande PdT la plus utile. Indique le bloc, la taille et la difficulté actuels, ainsi que le taux de hachage réseau total par seconde.
`Getnettotals` | Obtient le nombre de données envoyées et reçues par daemon.
`Getpeerinfo` | Similaire à getnettotals, comprend le transfert de données réseau, le temps de connexion, la hauteur du bloc lorsque daemon a été démarré et la hauteur actuelle du bloc.
`Gettakedifficulty` | Renvoie la difficulté actuelle de PdE.
`Getticketpoolvalue` | Obtient la valeur DCR de tous les tickets dans la piscine.
`Help (" commande ")` | Montrez l'aide pour une commande.
`Missingtickets` | Montrez tous vos tickets qui ont manqué le vote.
`Gebroadcastmissed` | Rediffuser des tickets manqués au réseau. Cela se fait automatiquement lors du démarrage du portefeuille.
`Rebroadcastwinners` | Comme ci-dessus, mais pour les tickets votés.
`Stop` | Arrêtez daemon.

### Commands du Serveur de Portefeuille (\-\-wallet)

Commande                                                                         | Description
---                                                                             | ---
`addmultisigaddress nrequired ["key",...] ("account")`                          | Ajoute une adresse qui nécessite plusieurs signatures à utiliser.
`consolidate inputs (" account ")` | Nettoie les fonds dans plusieurs adresses dans un compte et le met dans une seule adresse. Notez qu'il y a des frais de transaction pour utiliser cette commande.
`Createmultisig nrequired [" key ", ...]` | Utilisé pour les portefeuilles multi-signature. `createnewaccount "account"` | Créer un nouveau compte. Notez que cela fait un nouveau compte dans le portefeuille actuel, PAS un nouveau portefeuille.
`dumpprivkey "address"` | Désactivé sur mainnet pour des raisons de sécurité.
`Encryptwallet" passphrase "` | Encrypte le portefeuille avec la phrase donnée
`getaccount "address"` | Cette commande vous indiquera à quel compte appartient l'adresse donnée.
`Getaccountaddress" account "` | Renvoie la première adresse dans le compte donné (la valeur par défaut est «par défaut»).
`Getaddressesbyaccount" account "` | Obtenez toutes les adresses dans le compte donné.
`Getbalance (" account "minconf=1 " balancetype ")` | Obtenez le solde dépensé dans le compte donné. Pour obtenir le montant total dans le portefeuille, utilisez 'getbalance * 0 all'.
`Getbalancetomaintain` | Il s'agit du solde minimum à conserver dans le portefeuille lors de l'achat d'une preuve d'enjeu automatique.
`Getmasterpubkey` | Obtenez la clé publique pour votre portefeuille. Cela permettra aux gens de voir, mais pas de dépenser les fonds de votre portefeuille. C'est suûr de la fournir aux autres.
`Getnewaddress (" account "verbose=false)` | Obtenez une nouvelle adresse dans le compte donné.
`getreceivedbyaccount "account" (minconf=1)`                                    | Obtient le montant total de DCR jamais reçu par ce portefeuille. Cela inclut les retours des enjeux, de sorte qu'il pourrait être assez important si vous êtes une mineur PdE.
`Getreceivedbyaddress" adresse "(minconf=1)` | Obtenez des fonds reçus par l'adresse indiquée.
`Getseed` | Désactivé sur mainnet pour la sécurité.
`Getstakeinfo` | Retrouver des informations utiles sur l'état actuel du pool PoS. Voir <LINK> PoS Commands.
`Getticketfee` | Obtenez les frais moyens payés pour les tickets.
`Getticketmaxprice` | Obtenez le prix maximum que votre portefeuille achètera automatiquement pour les tickets
`Gettickets includesimmature` | Obtenez tous vos tickets actuels. Le deuxième argument devrait être vrai si vous voulez voir des bilticketslets immatures aussi.
`Gettransaction" txid "(includewatchonly=false)` | Obtenez la transaction associée à l'identifiant donné.
`Listaccounts (minconf=1)` | Voir tous les comptes et leur solde dépensé dans votre portefeuille.
`Listreceivedbyaccount (minconf=1 includeempty=false includewatchonly=false)` | Obtenez une liste de tous vos comptes et le montant de DCR qui a été reçu par eux.
`Listreceivedbyaddress (minconf=1 includeempty=false includewatchonly=false)` | Obtenez une liste de toutes vos adresses et le montant de DCR qui a été reçu par elles.
`Listsinceblock (" blockhash "targetconfirmations 1 includewatchonly=false)` | Liste les transactions survenues depuis le hash de bloc donné.
`Listtransactions ("account" count=10 from=0 includewatchonly=false)` | Énumérez le nombre de transactions spécifiées par «compte» dans le compte donné.
`move "fromaccount" "toaccount" amount (minconf=1 "comment")`                   | Déplacez les fonds entre les comptes dans le même portefeuille.
`Purchaseticket" fromaccount "spendlimit (minconf=1" ticketaddress "" comment ")` | Achetez manuellement des tickets PdE. 'Fromaccount' sera habituellement "par défaut". 'Spendlimit' est le montant que vous souhaitez dépenser sur le total tickets, pas par ticket.
`Renameaccount" oldaccount "" newaccount "` | Renommez un compte dans votre portefeuille.
`Sendfrom" fromaccount "" toaddress "montant (minconf=1" comment "" commentto ")` | Envoyer DCR à partir du compte donné à l'adresse indiquée. Vous pouvez ajouter un commentaire facultatif.
`Sendtoaddress" address "amount (" comment "" commentto ")` | Semblable à ci-dessus, mais utilise le compte par défaut à envoyer.
`Setbalancetomaintain balance` | Utilisé pour la PdE automatique. Le portefeuille achètera les tickets jusqu'à ce qu'il atteigne ce seuil.
`setticketfee fee` | Réglez les frais (non remboursables) pour l'achat de tickets de participation. Voir <LINK>FAQ#Ticket fee
`Setticketmaxprice max` | Définissez le prix maximum que le portefeuille paiera lors de l'achat automatique de tickets.
`Setticketvotebits" txhash "votebits (" votebitsext ")` | Définit le ticket donné pour voter «oui» ou «non» (par défaut oui)
`Settxfee amount` | Définit les frais par kB des données de transaction que vous êtes prêt à payer. Remarquez ceci n'est PAS identique à setticketfee ci-dessus.
`Walletlock` | Verrouillez le portefeuille (aucun fonds ne peut être envoyé).
`walletpassphrase "passphrase" timeout` | Débloquez le portefeuille en utilisant la mot de passe pour la période de temps donnée en secondes. 0 déverrouillera le portefeuille jusqu'à ce qu'il soit redémarré.
`Walletpassphrasechange" oldpassphrase "" newpassphrase "` | Changez votre mot de passe de portefeuille.