# Buying Tickets With dcrwallet

Dernière mise à jour pour v1.0.0

Ce guide est destiné à parcourir l'achat de tickets en utilisant `dcrwallet`. Il couvrira à la fois les achats manuels de tickets et les achats automatiques de tickets pour les configurations de vote solo et en pool de minage.

**Conditions préalables:**

-   Utilisez les dernières [dcrinstall](/start-started/user-guides/cli-installation.md) pour installer `dcrd`, `dcrwallet, `et `dcrctl`. Des étapes supplémentaires seront nécessaires si une autre méthode d'installation a été utilisée.
-   Review how the launch commands for the Command Prompt (Windows) and Bash (macOS/Linux) shells differ [here](/getting-started/cli-differences.md).
-   [Setup dcrd](/getting-started/user-guides/dcrd-setup.md) et l'exécute en arrière-plan.
-   [Setup dcrwallet](/getting-started/user-guides/dcrwallet-setup.md)  et l'exécuter en arrière-plan.
-   Familiarisez-vous avec les [basics of using dcrctl](/getting-started/user-guides/dcrctl-basics.md).
-   Familiarisez-vous avec le [staking process](/mining/proof-of-stake.md#staking-101) et le [ticket lifecycle](/mining/proof-of-stake.md#ticket-lifecycle)

This guide assumes you have set up `dcrd` and `dcrwallet` using configuration files. If you used `dcrinstall`, you have configuration files already. Using configuration files is highly recommended - it makes for an easier time issuing commands to `dcrwallet` and `dcrd` through `dcrctl`. A guide for minimum configuration (saving your RPC username and RPC password) can be found [here](/advanced/manual-cli-install.md#minimum-configuration).

NOTE: `dcrwallet.conf` is split into two sections labeled `[Application Options]` and `[Ticket Buyer Options]`. Any setting prefixed by 'ticketbuyer.' must be placed within the lower `[Ticket Buyer Options]` section. All other settings go within `[Application Options]`.

---

## Decisions

Il y a quelques décisions à prendre avant de s'aventurer dans ce guide. D'abord, utilisez-vous un projet de partage pour déléguer les droits de vote de votre ticket? Deuxièmement, allez-vous acheter des tickets manuellement ou automatiquement via la fonction de l'acheteur?

L'achat de tickets Stakepool permet à un intervenant de déléguer les droits de vote à une stakepool. Ces stakepool sont en ligne en tout temps (24/7) et manquent très rarement un vote. Ils utilisent des transactions multi-sig pour qu'ils ne puissent toucher aucun de vos DCR. À titre de baisse, la plupart exigent un petit pourcentage de votre récompense de vote en tant que frais de pool. Les tickets délégués Stakepool exigent également une taille de transaction plus grande (~540 octets vs ~300 octets pour les tickets de vote en solo) pour l'achat, ce qui entraîne un tarif de ticket absolu légèrement plus élevé puisque les frais sont calculés par DCR/kB.

Le vote solo vous oblige à avoir un portefeuille déverrouillé en tout temps (24 heures sur 24, 7 jours sur 7), sinon vous risquez de voter et de perdre votre récompense du vote. Vous ne devez pas payer de frais de pool et vos achats de ticket sont plus susceptibles d'être exploités avec un prix plus petit (en raison du fait que les mineurs choisissent des tickets en fonction des tarifs des tickets de DCR/kB et des tickets solo ayant une taille TXN plus petite).

Les achats manuels de tickets et les achats automatisés d'acheteurs de tickets sont principalement mis à la disposition des particuliers. Les avantages normaux de l'automatisation s'appliquent à l'acheteur de tickets, mais beaucoup peuvent être submergés par le montant des variables qui peuvent être configurées. En outre, le calcul des frais d'achat de tickets n'aboutit parfois pas aux frais les plus économiques pour un intervenant. Certaines personnes apprécient également l'achat manuel de tickets tous les quelques jours et tentent d'offrir les frais les plus économiques. Les deux méthodes n'achèteront de tickets que lorsque votre portefeuille sera débloqué.

---

## Solo-voting

RAPPEL: Le vote solo avec un portefeuille de vote qui ne reste pas en ligne 24 heures sur 24 et 7 jours sur 7 peut entraîner des votes manqués et des récompenses de participation perdues.

Pour voter en solo, vous devez simplement définir l'option de validation lors du démarrage de `dcrwallet`, débloquer le portefeuille avec votre mot de passe privé et acheter des tickets. Avec enablevoting activé et `dcrwallet` déverrouillé, votre portefeuille prend automatiquement en charge le vote.

Pour configurer votre `dcrwallet` pour le minage en solo, ajoutez la ligne suivante à votre fichier de configuration `dcrwallet.conf` dans la section `[Options de l'application]`:

    enablevoting=1

Une fois redémarré avec cette ligne dans `dcrwallet.conf`, votre portefeuille sera configuré pour le vote en solo et vous pouvez maintenant commencer [acheter des tickets](#ticket-purchase).

---

## Stakepool-voting

Pour permettre à une pool de voter pour vous, vous devez d'abord vous inscrire à une pool de minage. Une liste peut être trouvée [ici](/mining/proof-of-stake.md#list-of-stakepools). Après s'être inscrit, il devrait y avoir des instructions pour créer une nouvelle adresse P2SH et importer votre script de vote multi-sig. Un bref aperçu est fourni ici:

1.  Lorsque votre portefeuille est ouvert, émettre la commande `dcrctl --wallet getnewaddress` pour récupérer une adresse.
2.  En utilisant cette adresse, émettre la commande `dcrctl --wallet validateaddress <address from step 1>`. Cela devrait renvoyer un objet JSON qui sera affiché comme suit:

```
{
  "isvalid": true,
  "address": "DsExampleAddr1For2Demo3PurposesOnly",
  "ismine": true,
  "pubkeyaddr": "DkExample0Addr1For2Demo4Purposes5Only6Do7Not8Use9Pls0",
  "pubkey": "022801337beefc0ffee1dab8d4ffa898a782466c9a1fc00ca8863de5438dc07dcc",
  "iscompressed": true,
  "account": "voting"
}
```

3.  Copiez le `pubkeyaddr` dans le formulaire "Submit Address" de la stakepool et appuyez sur le bouton de soumission. La page devrait vous rediriger vers la page des tickets, qui affichera plus d'instructions.
4.  En haut de la page des tickets, vous devriez voir une section "Informations sur les tickets". Copiez votre "Échanger le script" et utilisez-le pour émettre la commande `dcrctl --wallet importscript<Insert Redeem Script Here>`.

Avec la pool de minage configurée et votre script multi-sig importé sur votre portefeuille, vous pouvez maintenant commencer [acheter des tickets](#ticket-purchase).

---

## Ticket Purchasing

Les achats manuels et automatiques de tickets exigent que votre portefeuille soit déverrouillé via la commande `dcrctl - wallet walletpassphrase <private passphrase> <time limit>`.

Il y a trois choses que vous pourriez vouloir comprendre avant d'acheter des tickets: la commande `purchaseticket`, quand/pourquoi une `ticketfee` est importante et l'importance du `ticket price`.

> Purchaseticket Commande

La commande `purchaseticket` sera utilisée pour acheter des tickets, qu'ils soient manuels ou automatiques. Examinons de plus près la commande et ses arguments:

```
purchaseticket "fromaccount" spendlimit (minconf=1 "ticketaddress" numtickets "pooladdress" poolfees expiry "comment")
```

1.  `Fromaccount` = Required String: Le compte à partir duquel acheter des tickets (par exemple, "par défaut").
2.  `Spendlimit`    =  Numéro requis: Limite du montant à dépenser sur le ticket (par exemple, 50).
3.  `Minconf`         =  Numéro optionnel: nombre minimum de confirmations de bloc requises (par exemple, 1).
4.  `Ticketaddress`   =  Chaîne Facultative: l'adresse du ticket à laquelle les droits de vote sont donnés
5.  `Numtickets`     =  Numéro optionnel: le nombre de tickets à acheter à la fois (par exemple, 1)
6.  `Pooladdress`    =  Chaîne Optionnelle: L'adresse pour payer les frais de pool de participation
7.  `Poolfees`        =  Numéro facultatif: le pourcentage de frais à verser au pool de participation (par exemple, 5)
8.  `Expiration`     =  Numéro optionnel: la hauteur du bloc où les tickets non déminés expirent à partir du mempool, renvoyant le DCR original à votre "fromaccount". Si elles sont laissées vierges, les tickets ne seront valides que dans le mempool lorsque le prix du ticket changera.
9.  `comment`        =  Optional String: This argument is unused and has no significance.

> Frais de Tickets

Votre `ticketfee` est le taux DCR/kB que vous payerez pour que votre achat de tickets soit inclus dans un bloc par un mineur. Vous remarquerez que la commande `purchaseticket` ci-dessus n'inclut pas les arguments` ticketfee`. L'argument `ticketfee` peut être défini de deux façons.

1.  Pendant le démarrage en ajoutant `ticketfee = <tarif tarifé>` à `[Options d'Application]` de votre `dcrwallet.conf`.
2.  Pendant que votre portefeuille est en cours d'exécution, utilisez la commande `dcrctl --wallet setticketfee <fee rate>`. Ce n'est pas un paramètre permanent et sera par défaut à 0.01 chaque fois que votre portefeuille sera redémarré sauf si une facture de ticket est spécifiée dans `dcrwallet.conf`.

Pourquoi les ticketfees sont-elles importantes? Généralement, les frais par défaut de 0,01 sont suffisants pour que vos tickets soient extraits. L'exception est lors d'un événement de guerre des frais. Lorsque le prix du ticket tombe très bas, la demande dépasse l'offre (il n'y a qu'un maximum de 2880 tickets disponibles à chaque intervalle de prix). Cela crée une guerre de frais, les parties prenantes comptant pour obtenir leurs tickets minés avant que le prix ne change.

Avec ces deux points à l'esprit, continuons les deux méthodes d'achat de tickets.

> Prix du Ticket

Pour obtenir le prix du ticket actuel, émettre la commande `dcrctl --wallet getstakeinfo` et rechercher la valeur `difficulty`. C'est le prix de chaque ticket dans la fenêtre de prix actuelle. Vous voudrez ajuster votre argument `spendlimit` dans la commande `buyticket` pour être supérieur à cette valeur de `difficulty` lors de l'achat de tickets manuel.

---

### Manual Ticket Purchase

Before manually purchasing tickets, it is recommended to check for a ticketfee war and adjust your ticketfee before purchase by issuing the `dcrctl --wallet setticketfee <fee rate>` command. Third party sites such as [https://dcrstats.com](https://dcrstats.com) and [https://posmaster.info](http://posmaster.info) can be used to find the average ticketfee in the mempool, although you may oftentimes be able to purchase a ticket with a ticketfee lower than the average.

> Tickets Solo

Pour acheter des tickets utilisés pour le minage solo, il suffit de spécifier les arguments `fromaccount` et `spendlimit` lors de l'utilisation de la commande `buyticket`. Par exemple: `dcrctl --wallet purchaseticket "par défaut" 50` utiliserait DCR à partir de votre compte `default` pour acheter un ticket si le prix actuel du ticket était un maximum de 50 DCR.

Si vous souhaitez spécifier les arguments `numtickets` ou `expiry`, vous spécifiez un `minconf` de 1, un `ticketaddress` vide (""), un  `pooladdress` (""), et un `poolfees` vide (0). Deux exemples suivent:

-  `Dcrctl --wallet purchaseticket "par défaut" 50 1 "" 5` achèterait 5 tickets, le 5ème argument (`numtickets`) étant fixé à 5.
-  `Dcrctl --wallet purchaseticket "par défaut" 50 1 "" 5 "" 0 100000` achèterait 5 tickets qui expireraient du mempool si ce n'est pas extrait par le bloc 100 000, car le 8ème argument (`expiration`) est défini sur 100000.

Assurez-vous de vérifier un événement de guerre des frais et ajustez votre facture de ticket avant d'acheter en émettant la commande `dcrctl --wallet setticketfee <fee rate>`.

> Tickets de pool

Pour acheter des tickets avec leurs droits de vote délégués à une pool de minage, nous devons utiliser la commande complète `purchaseticket`.

-  Votre `ticketaddress` est l'adresse P2SH trouvée au sommet de la page "Tickets" de votre mise en commun dans la section "Informations sur les tickets".
-  Votre adresse `pooladdress` est l'adresse des frais de votre pool de minage. Cela se trouve dans la section "Instructions de ticket" de la page "Tickets" de votre pool de minage.
-  Your `poolfees` is the percentage of the stake reward that will go to the `pooladdress` when a ticket votes. It is important to match your pool's advertised fee.

A quick example:

`Dcrctl --wallet purchaseticket par "défaut" 23 1 DcExampleAddr1For2Demo3PurposesOnly 1 DsExampleAddr1For2Demo3PurposesOnly 7.5` utiliserait DCR à partir de votre compte `default` pour acheter 1 ticket si le prix actuel du ticket est un maximum de 23 DCR. L'adresse P2SH reçue de la mise en commun est `DcExampleAddr1For2Demo3PurposesOnly` et leur adresse tarifaire est `DsExampleAddr1For2Demo3PurposesOnly`. Ils percevront une taxe de 7,5% si ce billet réussit avec succès. Ce ticket n'échappera pas au mempool jusqu'à ce que le prix du ticket change, car seulement 7 arguments ont été spécifiés (pas de `expiration`).

---

#### Ticketbuyer Configuration

To set up your `dcrwallet` to enable its built-in `ticketbuyer` feature, add the following line to your `dcrwallet.conf` config file in the `[Application Options]` section:

    enableticketbuyer=1

Si vous utilisez une pool de minage, vous devez également ajouter les lignes suivantes (toutes ces informations se trouvent sur la page "Tickets" de votre pool de minage):

    ticketaddress=<P2SH Address shared with Stakepool>
    pooladdress=<Stakepool's Fee Collection Address>
    poolfees=<Stakepool's Required Reward Fee>

With this configuration `ticketbuyer` will start running with it's default settings. You may want to modify the `ticketbuyer` configuration to tweak its behaviour - the full set of configuration options and their default values can be found in the chart [below](#full-ticketbuyer-options).

With `ticketbuyer` running and your wallet unlocked, you can watch your `dcrwallet` console to see whether or not tickets are being purchased. It will even display an explanation if tickets weren't purchased.

---

## Full Ticketbuyer Options

We recommended you read
and understand the options available before using the feature as you may set your fees and ticket
prices higher than desired.

All of these options can be specified on the command line or in dcrwallet.conf in the `[Ticket Buyer Options]` section. Note that at
this time there is no way to change settings while dcrwallet is running: you will need to restart it to
adjust your settings.

Parameter|Description|Default|Explanation
:----------:|:---------------------------:|:----------:|:---------------------------:
ticketbuyer.avgpricemode|The mode to use for calculating the average price if pricetarget is disabled (vwap, pool, dual) |vwap|!
ticketbuyer.avgpricevwapdelta|The number of blocks to use from the current block to calculate the VWAP |2880|!
ticketbuyer.maxfee|Maximum ticket fee per KB |0.1 DCR|Tickets are entered into the mempool in order of their fee per kilobyte. This sets the maximum fee you are willing to pay.
ticketbuyer.minfee|Minimum ticket fee per KB |0.01 DCR|The minimum fee per kilobyte you are willing to pay. This should probably be left at 0.01 unless you know what you're doing.
ticketbuyer.feesource|The fee source to use for ticket fee per KB (median or mean) |median|The fee chosen by the ticket buyer will be based off either the median (line all the fees up in order and choose the middle one) or the mean (also known as the average; add all the fees up and divide by 2). It's recommended to leave this at median as there have been instances of fee manipulation where people try to force up the average by buying one ticket with a very high fee.
ticketbuyer.maxperblock|Maximum tickets per block, with negative numbers indicating buy one ticket every 1-in-n blocks |5|Do not buy more than this number of tickets per block. A negative number means buy one ticket every n blocks. e.g. -2 would mean buy a ticket every second block.
ticketbuyer.blockstoavg|Number of blocks to average for fees calculation |11| Fees are calculated using this many previous blocks. You can usually leave this at the default.
ticketbuyer.feetargetscaling|Scaling factor for setting the ticket fee, multiplies by the average fee |1|The average fee is multiplied by this number to give the fee to pay. DO NOT change this until you really know what you're doing. It could raise your fees very high. Remember, fees are non-refundable!
ticketbuyer.dontwaitfortickets|Don't wait until your last round of tickets have entered the blockchain to attempt to purchase more| |By default, the ticket buyer will not buy more tickets until all the previous ones purchased have been entered into the blockchain. You can set this to purchase more even if some are still in the mempool.
ticketbuyer.nospreadticketpurchases|Do not spread ticket purchases evenly throughout the window| | By default `ticketbuyer` spreads out the purchase of tickets which may result in more favourable fees. This setting tells `ticketbuyer` to purchase all tickets at once.
ticketbuyer.maxinmempool|The maximum number of your tickets allowed in mempool before purchasing more tickets |40|If you have this many tickets in the mempool, the ticket buyer will not buy more until some are accepted into the blockchain.
ticketbuyer.expirydelta|Number of blocks in the future before the ticket expires |16|You can set an expiry so that if your tickets are not accepted into the blockchain due to high fees, they will cancel and you can try again by raising your fees.
ticketbuyer.maxpriceabsolute|Maximum absolute price to purchase a ticket |0 DCR| If the ticket price is above this value, you will not buy more tickets. The default of 0 turns this off.
ticketbuyer.maxpricerelative|Scaling factor for setting the maximum price, multiplies by the average price |1.25|If the current window price is significantly higher than the last few windows, do not buy any tickets. E.g. With the default value of 1.25, if the average price of the last few windows is 50DCR, you won't buy any tickets if the current window is over 75DCR.
ticketbuyer.balancetomaintainabsolute|Amount of funds to keep in wallet when stake mining |0 DCR| If your balance is lower than this number, you will not buy tickets. The default of 0 will use all the funds in your account to buy tickets.
ticketbuyer.balancetomaintainrelative|Proportion of funds to leave in wallet when stake mining |0.3|Similar to the last one, except it's based on a percentage of your total funds.

---
