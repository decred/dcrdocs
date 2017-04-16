# ** Preuve-d'Enjeu (PdE) Minage**

---

## ** Vue d'Ensemble **

Ce document explique le procédé par lequel on achéte un ticket avec DCR en envoyant une transaction SStx.  Si la transaction est minée avec succès, il apparaîtra puis passera par une période de maturation de 256 blocs. Une fois à maturité, le ticket sera sélectionnés au hasard pour voter sur les blocs PdT couverts par la [Aperçu général de l'extraction](/mining/overview.md#2-proof-of-stake-pos-mining).

---

## ** Conditions préalables **

- Une instance fonctionnelle [dcrd](/getting-started/user-guides/dcrd-setup.md)
- Une instance fonctionnelle [dcrwallet](/getting-started/user-guides/dcrwallet-setup.md)
- [dcrctl basiques](/getting-started/user-guides/dcrctl-basics.md) comme débloquer votre portefeuille.
- [Obtenir DCR](/getting-started/obtaining-dcr.md)

---

## ** HComment ça marche? ** ##

L'achat d'un ticket pour PdE est assez simple (voir ci-dessous) mais qu'est-ce qui vous arrive après l'avoir acheté?
Un ticket sur le réseau principal (test net utilise différents paramètres) passera par quelques étapes de sa vie:

1. Vous achetez un ticket en utilisant votre portefeuille.
2. Le ticket entre dans la `mempool`. Seulement 20 tickets sont extraits dans chaque bloc. C'est là que les tickets attendent d'être exploités.
3. Les tickets sont inclus dans un bloc dans l'ordre de leur `ticketfee`. Notez que les frais du ticket est fixée au prix par KB.
Une transaction de ticket est d'environ un tiers (solo) ou la moitier (pool) d'un KB, de sorte que les frais réels que vous payez seront mis à l'échelle en conséquence.
4. **A -** Si votre ticket est extrait dans un bloc, il entrera dans un état immature pour 256 blocs (environ 20 heures). Pendant ce temps, le ticket ne peut pas voter. À ce stade, les frais de ticket ne sont pas remboursables.  
**B -** Si votre ticket n'est pas extrait, le prix du ticket et les frais sont retournés.
5. Après l'échéance du ticket (256 blocs), votre ticket entre dans la pool de tickets et est éligible au vote.
6. Les chances de voter sur un ticket sont basées sur une distribution de Poisson avec une moyenne de 28 jours. Ce que cela signifie, c'est qu'après 28 jours le ticket a 50% de chances d'avoir déjà voté.
7. Compte tenu d'une cible de pool de la taille de 40960 ticket, un ticket donné a une chance de vote de 99,5% en ~ 142 jours (environ 4,7 mois). Si,
Après cette période, un ticket n'a pas voté, il expire. Le prix du ticket est retourné à l'utilisateur.
8. Un ticket peut être manqué si le portefeuille de vote ne répond pas ou deux blocs valides se trouvent à proximité immédiate l'un de l'autre. Si cela se produit, le prix du ticket est retourné à l'utilisateur.
9. Une fois qu'un ticket a voté, manqué ou a expiré, les fonds (prix du ticket et subvention, le cas échéant, moins les frais) entreront dans un statut immature pour 256 autres blocs, après quoi ils seront libérés. Si un ticket est manqué ou expiré, une transaction de révocation de tickets est soumise par le portefeuille qui libère les sorties de tickets verrouillées. *NOTE* Les révocations ne peuvent être soumises que pour un ticket échoué correspondant. Vous ne pouvez pas révoquer un ticket jusqu'à ce qu'il soit manqué.

---

## ** Minage Solo ou Pool de Minage **

> <i class="fa fa-male"></i> Minage Solo

<i class="fa fa-exclamation-triangle"></i> **Pour réussir à participez à la PdE, vous devez vous assurer que votre portefeuille est en ligne 24 heures sur 24, 7 jours sur 7. C'est parce que votre ticket peut être appelé à voter à tout moment et si votre portefeuille est incapable de répondre, vous perdrez la récompense de vote. Le montant de l'achat votre ticket sera retourné moins les frais de transaction.**

> <i class="fa fa-users"></i> Pool de Minage

L'utilisation d'une pool de pari est bénéfique car les serveurs sont géographiquement distribué et redondant, ce qui augmente considérablement les chances que votre vote soit toujours diffusé même si une panne de réseau ou de serveur se produit. Les pools de pari facturent des frais pour payer les coûts et le travail des système des serveurs administratif.

---

## **<i class="fa fa-life-ring"></i> Signez pour une Pool de Minage**

Ces pool de minage sont officielement reconnues:

* [<i class="fa fa-external-link-square"></i> https://dcr.stakepool.net](https://dcr.stakepool.net)
* [<i class="fa fa-external-link-square"></i> https://dcr.stakeminer.com](https://dcr.stakeminer.com)
* [<i class="fa fa-external-link-square"></i> https://pool.d3c.red](https://pool.d3c.red)
* [<i class="fa fa-external-link-square"></i> https://dcrstakes.com](https://dcrstakes.com)
* [<i class="fa fa-external-link-square"></i> https://stakepool.dcrstats.com](https://stakepool.dcrstats.com)
* [<i class="fa fa-external-link-square"></i> https://stake.decredbrasil.com](https://stake.decredbrasil.com)
* [<i class="fa fa-external-link-square"></i> https://stakepool.eu](https://stakepool.eu)
* [<i class="fa fa-external-link-square"></i> https://dcr.ubiqsmart.com](https://dcr.ubiqsmart.com)

Vous pouvez trouver une comparaison des frais et des statistiques de chaque pool en visitant [<i class="fa fa-external-link-square"></i> Decred website](https://decred.org)
et cliquer sur le lien 'Stakepools' en pied de page.

Chaque pool exécute le même logiciel qui vous guidera dans le processus d'achat de tickets. Les instructions sont également ci-dessous afin que vous puissiez les visualiser sans signer pour une pool.

---

## **<i class="fa fa-ticket"></i> Achat Automatique de tickets**

Vous pouvez configurer dcrwallet pour acheter automatiquement des tickets en votre nom. Nous vous recommandons de lire et comprendre les options disponibles avant d'utiliser la fonctionnalité car vous pouvez définir vos frais et le prix de votre ticket ​​supérieurs à ceux souhaités.

Toutes ces options peuvent être spécifiées sur la ligne de commande ou dans dcrwallet.conf. Notez qu'à ce moment, il n'y a aucun moyen de modifier les paramètres pendant que dcrwallet est en cours d'exécution. Vous devrez le redémarrer pour ajuster vos paramètres.

Paramètre | Description | Par défaut | Explication
:----------:|:---------------------------:|:----------:|:---------------------------:
ticketbuyer.maxpricescale|Essaye d'empêcher la difficulté d'enjeu d'aller au-dessus de ce multiplicateur (>1.0) par manipulation, 0 pour désactiver |2|Si l'achat de tickets à cette fenêtre de prix cause la prochaine fenêtre à être supérieure à ```(price * multiplier)```, n'achetez pas de tickets. Cela pourrait vous empêcher d'acheter des tickets si vous le voulez. Recommander de définir 0. Cette option a été obsolète et sera supprimée dans une future version.
Ticketbuyer.pricetarget|Une cible pour essayer de chercher à définir le prix de l'enjeu plutôt que de respecter le prix moyen, 0 pour désactiver | 0 DCR | Tenter d'acheter des tickets afin de forcer le prix futur à '''pricetarget'''. Laisser sur 0. Cette option est obsolète et sera supprimée dans une future version.
Ticketbuyer.avgpricemode|Mode à utiliser pour calculer le coût moyen si pricetarget est désactivé (vwap, pool, dual) |vwap|!
ticketbuyer.avgpricevwapdelta|Le nombre de blocs à utiliser à partir du bloc actuel pour calculer le VWAP |2880|!
ticketbuyer.maxfee|Frais maximum par KB |0.1 DCR|Les tickets sont entrés dans la mempool dans l'ordre de leurs frais par kilo-octet. Cela fixe le coût maximale que vous êtes prêt à payer.
ticketbuyer.minfee|Le coût minimale du ticket par KB|0.01 DCR|Le coût minimum par kilobyte que vous êtes prêt à payer. Cela devrait probablement être laissé à 0.01 sauf si vous savez ce que vous faites.
Ticketbuyer.feesource|La source de frais à utiliser pour le coût du ticket par KB (médiane ou moyenne)|médiane|Les frais choisi par l'acheteur du ticket sera basé soit sur la médiane (alignez tous les frais en ordre et choisissez le moyen) ou la moyenne (aussi connue sous le nom de moyenne, ajouter tous les frais et diviser par 2). Il est recommandé de laisser cela à la médiane car il y a eu des cas de manipulation de frais où les gens essaient de forcer la moyenne en achetant un ticket avec des frais très élevés.
ticketbuyer.maxperblock|tickets maximum par bloc, avec les numéros négatifs indiquant acheter un ticket tous les -n blocs |5|Ne pas acheter plus de ce nombre de tickets par bloc. Un nombre négatif signifie acheter un ticket tous les n blocs. par exemple. -2 signifie acheter un ticket à chaque deuxième bloc.
Ticketbuyer.blockstoavg|Mmoyenne du nombre de blocs pour le calcul des frais |11| Les frais sont calculés en utilisant ceci pour la plupart des blocs précédents. Vous pouvez généralement laisser ceci par défaut.
Ticketbuyer.feetargalingcaling|Facteur de mise à l'échelle pour la fixation des frais de ticket, se multiplie par la redevance moyenne |1|La redevance moyenne est multipliée par ce numéro pour payer les frais de paiement. NE PAS changer cela jusqu'à ce que vous sachiez vraiment ce que vous faites. Cela pourrait augmenter considérablement vos frais. Rappelez-vous, les frais ne sont pas remboursables!
Ticketbuyer.dontwaitfortickets|N'attendez pas jusqu'à ce que votre dernier tour de ticket soit entré dans la chaîne de blocs pour essayer d'en acheter plus| |Par défaut, l'acheteur de tickets n'achètera pas de tickets jusqu'à ce que tous les achats précédents aient été entrés dans la chaîne de blocs. Vous pouvez définir ceci pour acheter plus même si certains sont encore dans la mempool.
ticketbuyer.spreadticketpurchases|Répartissez les achats de tickets uniformément dans toute la fenêtre| |Par défaut, tous les tickets sont achetés à la fois. Ce réglage permet à l'acheteur de tickets d'étaler l'achat de tickets qui peuvent entraîner des frais plus avantageux.
Ticketbuyer.maxinmempool|Le nombre maximum de tickets autorisés dans mempool avant d'acheter plus de tickets |40|Si vous avez ces tickets dans la mempool, l'acheteur de tickets n'achètera pas tant que certains ne seront pas acceptés dans la chaîne de blocs.
Ticketbuyer.expirydelta|Nombre de blocs à l'avenir avant l'expiration du ticket |16|Vous pouvez fixer une échéance afin que, si vos tickets ne sont pas acceptés dans la chaîne de blocs en raison de frais élevés, ils s'annuleront et vous pourrez réessayer en augmentant vos frais.
Ticketbuyer.maxpriceabsolute|Prix absolu maximal pour acheter un ticket |0 DCR| Si le prix du ticket est supérieur à cette valeur, vous ne pourrez plus acheter de tickets. La valeur par défaut 0 l'éteint.
Ticketbuyer.maxpricerelative|Facteur de mise à l'échelle pour la définition du prix maximal, se multiplie par le prix moyen |1.25|Si le prix de la fenêtre actuelle est significativement plus élevé que les dernières fenêtres, n'achetez pas de tickets. Par exemple, avec la valeur par défaut de 1.25, si le prix moyen des dernières fenêtres est de 50DCR, vous n'acheterez aucun ticket si la fenêtre actuelle est supérieure à 75DCR.
Ticketbuyer.balancetomaintainabsolute|Montant des fonds à conserver dans un portefeuille lors de la preuve d'enjeu |0 DCR|Si votre balance est inférieur à ce numéro, vous n'achèterez pas de tickets. La valeur par défaut 0 utilisera tous les fonds de votre compte pour acheter des tickets.
Ticketbuyer.balancetomaintainrelative|Proportion de fonds à laisser dans le portefeuille lors de la preuve d'enjeu |0.3|Semblable à la dernière, sauf si elle est basée sur un pourcentage de vos fonds totaux.
---

## **<i class="fa fa-ticket"></i> Achat Manuel des tickets**

> Obtenir le prix des tickets et la hauteur de bloc

Premièrement obtenir le prix du ticket courant pour le champ de **difficulty** pour **getstakeinfo**:

```no-highlight
dcrctl --wallet getstakeinfo
{
  "poolsize": 42670,
  "difficulty": 22.07045882,
  "allmempooltix": 0,
  "ownmempooltix": 0,
  "immature": 0,
  "live": 0,
  "proportionlive": 0,
  "voted": 0,
  "totalsubsidy": 0,
  "missed": 0,
  "proportionmissed": 0,
  "revoked": 0
}
```

Il est également utile d'obtenir le champ **height** de **getbestblock** ainsi vous pouvez utiliser la fonctionalité expiration du ticket:

```no-highlight
dcrctl --wallet getbestblock
{
  "hash": "0000000000000d14cab9056131a0461778a7f8cd1066cb343307882bd730f2a9",
  "height": 35472
}
```

Obtenir cette information directement est plus fiable et précis, mais vous pouvez utilisez également la page officielle des statistiques à [<i class="fa fa-external-link-square"></i> stats.decred.org](https://stats.decred.org).

> Syntaxe Purchaseticket

Achetez maintenant votre ticket(s) via dcrctl. La syntaxe complète de la commande est:

```no-highlight
dcrctl --wallet help purchaseticket
purchaseticket "fromaccount" spendlimit (minconf=1 "ticketaddress" numtickets "pooladdress" poolfees expiry "comment")

Acheter des tickets à l'aide des fonds disponibles.

Arguments:
1. fromaccount   (string, required)             Le compte à utiliser pour l'achat (default="default")
2. spendlimit    (numeric, required)            La limite du montant aà dépenser par ticket
3. minconf       (numeric, optional, default=1) Nombre minimum de confirmation par bloc requise
4. ticketaddress (string, optional)             Remplacer l'adresse du ticket à laquelle les droits de vote sont donnés
5. numtickets    (numeric, optional)            Le nombre de tickets à acheter
6. pooladdress   (string, optional)             L'adresse pour payer les frais de participation de la pool
7. poolfees      (numeric, optional)            Le montant des frais à payer à la pool
8. expiry        (numeric, optional)            Hauteur à laquelle les tickets d'achat expirent
9. comment       (string, optional)             Inutilisé

Resultat:
"value" (string) Hash du ticket résultant
```

> Example d'Achat de Ticket Manuel (Solo)

```no-highlight
dcrctl --wallet purchaseticket "default" 23 1 "" 1 "" 0.0 35482
```

Cela achète un ticket du compte par défaut pour un maximum de 23 DCR qui
Expire au bloc 35482.

La commande renverra un ticket hash / id transaction s'il est réussi.

> dcrwallet Example d'Achat de Ticket Manuel (Pool)

La partie d'achat de tickets pour un pool est à peu près la même, mais il y a plus les étapes à suivre pour permettre à vous et à la pool de voter en créant un script multisignature et adresse P2SH.

Une fois que vous vous inscrivez à un groupe de participation, vous serez redirigé vers une Page de soumission d'adresse.

Pour rejoindre la pool, fournissez une adresse de clé publique qui peut être utilisée pour générer un
1-de-2 script multisignature. Le script multisignature sera généré par la pool et vous est retourné avec une adresse P2SH pour donner droit de vote.
L'adresse P2SH commence par **Dc** sur mainnet.

Il est recommandé de générer un nouveau compte lors de la participation à une pool de partages. C'est parce que les comptes sont durcis, donc dans le cas d'une participation totale échec/arrêt, il serait sécurisé de donner la clé privée à une autre pool
Tant que ce compte ne fait que voter et rien d'autre.

```no-highlight
dcrctl --wallet createnewaccount voting
```

Pour générer une adresse de clé publique, créez une nouvelle adresse de portefeuille avec **getnewaddress &lt;account&gt;**.
Puis, appellez **validateaddress &lt;yourAddress&gt;** Et récupérez l'adresse indiquée dans le
**pubkeyaddr** champs de la reéponse. C'est le préfixe avec **Dk** sur mainnet.

L'example suivant pour mainnet:

```no-highlight
dcrctl --wallet getnewaddress voting
DsExampleAddr1For2Demo3PurposesOnly
dcrctl --wallet validateaddress DsExampleAddr1For2Demo3PurposesOnly
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

Copiez et coller **pubkeyaddr** et récupérez l'adresse dans le formulaire d'adresse de soumission de la pool d'enjeu et cliquez sur le bouton soumettre. Votre script multisig et l'adresse P2SH seront générée et vous serez redirigé vers la page des tickets.

Maintenant, suivez simplement les instructions sur la page des tickets. Tout d'abord, importez le script multisig localement dans votre portefeuille en utilisant dcrctl pour raison de sécurité, afin que vous puissiez récupérer vos fonds et voter dans le cas improbable d'un échec de la pool dans:

```no-highlight
dcrctl --wallet importscript <ReallyLongScriptDisplayedOnPoolPage>
```

Maintenant **purchaseticket** avec le spécifique champs de pool réglé:

```no-highlight
dcrctl --wallet purchaseticket "default" 23 1 DcExampleAddr1For2Demo3PurposesOnly 1 DsExampleAddr1For2Demo3PurposesOnly 7.5 35482
```

Cela achète un ticket qui est délégué à l'adresse P2SH par le compte de défaut pour un maximum de 23 DCR qui expire au bloc 35482 et paie une taxe de 7,5% à l'adresse de paiement de la pool.

> Paymetheus Example d'Achat de Ticket Manuel (Pool)

S'il vous plaît voir le [Guide Paymetheus d'Utilisation](/getting-started/user-guides/using-paymetheus.md#purchase-tickets-tab)
---

## ** Information Après l'Achat D'un Ticket**

Après un achat de ticket réussis, vous devez attendre pour voir si oui ou non
la transaction est minée et incluse dans un bloc. La principale raison pour laquelle votre ticket ne soit pas miné est que le prix du ticket s'ajuste avant qu'il puisse être extrait. Cela peut se produire en raison du fait que la mempool soit pleine de concurrents à l'achat de tickets ou simplement un mauvais moment d'achat. Vous pouvez utiliser le site officiel des statistiques décédées à [<i class="fa fa-external-link-square"></i> stats.decred.org](https://stats.decred.org) pour voir quand l'ajustement du prix du ticket suivant se produit.

D'autres détails à garder à l'esprit sont les suivants:

* Le prix du ticket n'est pas dépensé, bien qu'il soit retiré de votre solde car il n'est pas dépensé. C'est juste un dépôt. Vous le récupérerez lorsque votre ticket votera, expirera ou sera révoqué en raison du non-vote.
* 20 tickets sont acceptés dans la pool de vote de chaque bloc. Les tickets qui attendent restent dans la mempool. Les tickets sont déplacés de la mempool vers la pool de vote dans l'ordre des txfee.
* Les tickets prennent 256 blocs (environ un jour) pour mûrir. Pendant ce temps, le prix d'enchère que vous avez payé ne sera pas visible dans votre solde total.
* Vous pouvez suivre l'état de vos tickets en vous mettant régulièrement en ligne:

```no-highlight
dcrctl --wallet getstakeinfo
```

  ou en inspectant l'onglet Stake Mining Paymetheus.

Continuez vers [PdE Tickets et frais FAQ](/faq/proof-of-stake/buying-tickets-and-fees.md)

---

## ** <i class="fa fa-book"></i> Voir Aussi **

[Commandes Preuve-d'Enjeu](/advanced/program-options.md#pos-commands)

[Preuve-d'Enjeu FAQ - Acheter des Tickets et Frais](/faq/proof-of-stake/buying-tickets-and-fees.md)

[Preuve-d'Enjeu FAQ - Solo Mining](/faq/proof-of-stake/solo-mining.md)

[Preuve-d'Enjeu FAQ - Stake Pools](/faq/proof-of-stake/stake-pools.md)

[Preuve-d'Enjeu FAQ - Tickets de Vote](/faq/proof-of-stake/voting-tickets.md)

[Preuve-d'Enjeu Minage Paramètres](/advanced/program-options.md#pos-network-parameters)
