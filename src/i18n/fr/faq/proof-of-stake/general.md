# <i class="fa fa-ticket"></i> PdE General FAQ 

---

#### 1. Qu'est-ce que le système de preuve d'enjeu de Decred?

Le système de preuve d'enjeu (PdE) permet aux détenteurs de Decred d'avoir leur mot à dire dans la gouvernance de la monnaie. Il vise à donner aux utilisateurs une voix aux côtés des mineurs.
pour participer, les utilisateurs peuvent acheter des "tickets", qui entrent dans une pool de loterie. Chaque bloc 5 tickets sont choisis parmi le groupe de tickets PdE. Si au moins 3 de ceux qui valident le bloc précédemment extrait,
le bloc nouvellement extrait est ajouté à la chaîne, et les mineurs PdT et les stagiaires PdE sont payés. Si le bloc n'est pas validé par les stagiaires PdE, les mineurs PdT ne sont pas payés, mais les détenteurs PdE le font. C'est
 pour encourager les mineurs PoW à miner selon les souhaits des détenteurs PoS.

Ce système PdE présente plusieurs avantages qui résolvent les problèmes que rencontrent les systèmes PdT. Par exemple, parce que les détenteurs PdE doivent valider les blocs que les mineurs PdT minent, les mineurs PdT ne peuvent pas
décider eux-mêmes de changer les règles du réseau (une attaque de 51%). Ou, lorsque la Chaîne Decred hardfork, la chaîne ancienne, plus petite, se désintégrera rapidement en raison d'une validation de la composante PdE de
la chaine.

Le système PdE récompense les participants pour leur jalonnement. Chaque bloc de Decred possède un composant de récompense PdE qui sera distribué à chaque ticket choisi pour voter dans ce bloc. Le système est conçu dans un tel
de sorte que le temps moyen pour que le ticket soit sélectionné soit de 28 jours. Si un ticket n'a pas été sélectionné après 40960 blocs (un peu moins de 5 mois), il sera révoqué par le système. Les DCR utilisés pour l'achat du
ticket est retourné indépendamment du fait qu'il vote ou non.

Une autre caractéristique intéressante que ce système PdE permet est de pouvoir voter sur un agenda. Parce que la validation du bloc peut être considérée comme un vote, en ajoutant des composants de vote supplémentaires au ticket, le système peut suivre et compter les votes sur une série de blocs. Ces votes peuvent être à propos de n'importe quoi.

Dans le système de preuve d'enjeu de Decred, quiconque détient DCR peut participer en achetant un ticket.

---

#### 2. Qu'est-ce que les tickets?

Un ticket est un token que vous achetez pour participer au système PdE. Vous pouvez acheter des tickets via l'interface de ligne de commande de dcrctl, ou via une interface graphique comme Paymetheus[^1] ou Decrediton. Chaque fois que vous achetez un
ticket, vous payez le prix du billet actuel et une charge de ticket en utilisant votre DCR. Lorsqu'un billet est acheté, il passe à une "mempool" temporaire. 20 billets peuvent être inclus dans chaque bloc et les billets sont choisis
pour être exploité en fonction de leurs frais par kilo-octet. Puisqu'il y a un nombre limité de billets qui peuvent être extraits en blocs à un prix donné (2880), il peut y avoir concurrence pour obtenir des billets minés. Dans ce cas,
vous pouvez augmenter les frais que vous êtes prêt à payer pour obtenir votre (vos) billet (s) miné. Une fois que votre ticket a été extrait, il se déplacera du «allmempool» actuel vers le pool de billets «immature». Après 256 blocs
(environ 20 heures), il mûr et entrer dans la pool de tickets en direct où il est éligible d'être choisi pour voter.

---

#### 3. Dois-je être constamment connecté au réseau pour participer à PdE?

Un portefeuille doit être en ligne 24 heures sur 24, 7 jours sur 7 pour répondre à un vote si l'un de vos tickets est sélectionné. Il existe deux façons principales de le faire; un porte-feuille solo que vous avez mis en place et que vous maintenez en ligne tout le temps, ou vous
pouvez utiliser une [stake pool](/mining/proof-of-stake.md#solo-mining-or-pool-mining). Une stake pool est fondamentalement un portefeuille communautaire qui vous permet d'attribuer les droits de vote de vos billets et la pool
votera en votre nom pour un petit pourcentage de la récompense PdE.

Il est important de noter que vous n'attribuez que le droit de vote à la pool et non vos fonds réels. Un pool de participation n'a pas accès à vos fonds à n'importe quel moment.

---

#### 4. Quel est le "prix du billet"?

Le prix des billets est déterminé par un algorithme qui vise à garder la taille de la pool de tickets, qui correspond à la quantité totale de tickets dans le groupe de tickets du système PdE autour d'une taille cible de billets 40960.
le prix du billet va augmenter ou diminuer en fonction de la demande de billets et du nombre de tickets actuellement dans la pool.

Chaque 144 blocs l'algorithme ajuste le prix du ticket. C'est ce qu'on appelle une fenêtre d'achat. Chaque bloc peut contenir 20 tickets nouvellement achetés. Cela signifie que dans chaque fenêtre d'achat, un maximum de 2880 tickets
peut être ajouté à la pool de tickets du système PdE.

Le prix du billet est toujours remboursé, peu importe si votre billet vote, manque ou expire.

---

#### 5. Quels sont les frais?

Le système PdE utilise deux types de frais, un txfee (également connu sous le nom de «split» fee) et un ticketfee.
	
Le txfee est une taxe que vous payez au réseau pour gérer la transaction pour acheter votre ticket. Cette taxe est par défaut définie à un montant faible (0.01 DCR/kB) et ne doit pas être modifiée.
Les frais d'inscription sont les frais que vous payez si votre billet est extrait. Cette taxe est une incitation pour les mineurs PdT à miner votre ticket et l'ajouter à la pool de tickets.

Dans le cas où la fenêtre d'achat est pleine, ce qui signifie qu'il y a plus de billets achetés que ceux qui sont disponibles pour être extraits pendant cette fenêtre, la facture sera utilisée pour déterminer les billets qui seront mis en place
dans la pool de tickets. Les tickets avec les taxes les plus élevés seront sélectionnés par les mineurs PdT.

Les frais sont calculés en DCR par kilo-octet. Étant donné qu'un ticket est d'environ 300 (solo) ou 540 octets (pool), les frais réels que vous payez seront inférieurs à ceux que vous avez définis comme montant de la taxe spécifique.

Les txfees et les tickets ne seront pas retournés lorsqu'un billet vote, expire ou manque un vote.

Renvoyer les fonds à votre porte-feuille après un vote ou être révoqué ne génère pas de frais.

---

#### 6. Qu'est-ce qu'une pool d'enjeu?

Une pool d'enjeu est l'équivalent d'une pool de minage, mais pour le système PdE. Grâce aux options de votre portefeuille Decred, vous pouvez donner vos droits de vote à une pool d'enjeu. Si votre ticket est sélectionné pour voter,
la pool d'enjeu votera pour vous et vous êtes récompensé par la récompense PdE moins les frais de participation (habituellement 4-5%). Contrairement aux pools de minage, la récompense PdE n'est pas divisée entre les utilisateurs du pool d'enjeu. La récompense complète est versée au propriétaire du billet.

Un pool d'enjeu vous permettra d'acheter des billets mais de ne pas avoir votre propre porte-feuille débloqué et toujours en ligne. Il est important de noter que vos fonds ne quittent jamais votre portefeuille. Vous n'envoyez rien à la piscine,
vous lui donnez juste le pouvoir de voter en votre nom. Une pool d'enjeu ne peut pas accéder à vos fonds.

Les pools d'enjeu impliquent généralement la redondance multi-portefeuille en ayant beaucoup de portefeuilles répartis physiquement dans le monde entier. Cela signifie qu'il y a moins de chance d'un vote manqué car un porte-monnaie est en panne.
Cela réduit également la latence entre le portefeuille et le réseau, ce qui peut réduire les chances d'un vote manqué.

---

#### 7. Qu'arrive-t-il à mes fonds lorsque j'achète un ticket?

Les fonds utilisés pour acheter des tickets sont verrouillés jusqu'à ce que le ticket soit sélectionné pour voter ou qu'il expire. Ils ne peuvent pas quitter votre portefeuille et apparaîtront dans la section "lockedbytickets" de votre portefeuille.
Si votre ticket est sélectionné pour voter, vous recevrez le montant total payé pour le billet et vous recevrez la récompense PdE.

Le seul coût pour l'utilisation de ce système sont les frais que vous avez définis. Le txfee sera facturé pour la transaction de votre ticket sur le réseau. La taxe sera facturée pour incorporation dans la
pool de ticket, et est payé aux mineurs PdT. Si votre ticket n'est pas miné, il n'y a pas de frais puisque la transaction n'a jamais été faite sur le réseau.

Dans le cas où votre ticket n'est pas sélectionné pour voter après 40960 blocs (environ 4 mois), le système révoquera votre ticket et les Decred que vous avez payé (moins les frais) seront transférés dans votre portefeuille.

---

#### 8. Quelles sont les chances de mes tickets de voter?

Le système PdE de Decred utilise une distribution de Poisson pour déterminer les chances de vote d'un billet à un moment donné. Compte tenu de la cible de la pool de 40960 tickets, tout ticket a 50% de chances de voter
dans les 28 jours et 99.5% de chances de voter avant l'expiration. Notez que ces valeurs vont changer avec la taille de la pool.


---

#### 9. Qu'est-ce que le minage de la preuve d'enjeu?

Étant donné que la validation de blocs effectuée par le système PdE se comporte comme un système de vote, elle peut également être utilisée pour voter sur d'autres questions.

Lorsqu'ils sont sélectionnés pour valider un bloc, les tickets votent sur l'approbation ou non du bloc précédemment extrait. Cela nécessite 3 des 5 billets sélectionnés pour voter oui.

En ajoutant un autre paramètre au ticket qui n'interfère pas avec l'approbation des blocs minés, le système peut suivre la quantité de tickets en utilisant ce paramètre sur plusieurs blocs. Vous pouvez définir ce paramètre dans votre portefeuille à tout moment avant que le ticket ne soit voté.

Par exemple, vous pouvez choisir la couleur de votre ticket pour être rouge ou bleu, définir cette option, et le système comptera pour les 1000 blocs suivants, combien de tickets rouges et combien de tickets bleus y a-t-il. Peut-être qu'il y a 3000 tickets rouges, 1500 tickets bleus et 500 qui n'ont pas sélectionné de couleur.

Si vous remplacez l'option rouge ou bleue par une option oui ou non, vous disposez d'un système de vote qui peut compter les votes au fil du temps. En utilisant le système de vote PdE, quiconque détient DCR peut voter sur les questions définies dans un ordre du jour.

Ce système de vote peut être utilisé pour tout problème de gouvernance. Pour Decred, l'utilisation la plus importante sera de voter sur les hardforks, qui sont des changements techniques dans la façon dont la monnaie fonctionne. Quelques exemples:

- Augmenter la taille maximale du bloc.
- Changer l'usage de l'algorithme PdE pour déterminer le prix du ticket.
- Vote on major new features for the currency (e.g. lightning network, enhanced privacy).
- Changez l'algorithme PdT.
- Pretty much anything the community decides would be in the best interest of the currency.

À l'heure actuelle, une plate-forme pour que la communauté puisse soumettre et défendre un programme de vote est en cours de développement.

---

#### 10. Qu'est-ce que le hardfork vote?

Comme toute autre cryptocurrency, Decred pourrait avoir besoin de hardfork à un moment donné.

L'un des problèmes de l'agenda mis en place pour le système de vote PdE pourrait être une tâche difficile. Si un tel problème est défini, la nouvelle version du code source Decred inclura le hardfork, mais la fork ne sera activée que lorsque le système PdE l'aura voté.

Pour q'un vote hardfork commence, deux conditions critiques doivent être remplies:

- Tout d'abord, 75% des mineurs PdT doivent passer à la dernière version de la version actuelle du bloc réseau. Cette vérification s'exécute au cours des 1000 derniers blocs.
- Deuxièmement, 75% des mineurs PdE doivent passer à la dernière version. Ce contrôle s'exécute au cours des 2016 blocs précédents.

Une fois ces vérifications vérifiées, la procédure de vote commence. Les tickets peuvent être définis avec un paramètre supplémentaire oui/non/abstention. Vous faites cela dans votre porte-feuille avant les votes. Les billets marqués comme abstentions ne seront pas comptés sur le montant total des votes.

Le système PdE commence alors à compter les tickets avec ces paramètres définis sur une quantité prédéterminée de blocs. Si au cours de cet intervalle, le montant des votes «oui» est de 75% ou plus, le vote est passé. Une période de verrouillage d'un certain nombre de blocs débutera avant que la hardfork ne se mette en directe, de sorte que tous les utilisateurs aient la possibilité de mettre à niveau et de ne pas être forcés à être rejeté du réseau.

Parce que le code de la hardfork est déjà dans la version actuelle de Decred, il n'est pas nécessaire que les développeurs interfèrent ou que la majorité des mineurs PdT et des mineurs PdE mettent à jour après qu'une décision ai été prise. Si le vote sur une hardfork passe, il sera mis en œuvre automatiquement après la période de verrouillage.

Le vote hardfork peut échouer à plusieurs points. Le vote pourrait ne pas commencer si les mineurs PdT ou les mineurs PdE ne mettent pas à jour. Après cela, le seuil de 75% des votes pourrait ne pas être atteint.

Dans le cas où un vote échouerait, un nouveau cycle débutera au début du processus. Cela signifie vérifier si les mineurs PdT ont été mis à niveau, si les mineurs PdE ont été mis à niveau, puis une autre période de comptage des votes. Cela se poursuivra pendant un certain nombre de tours, après quoi, si le vote n'a pas été adopté, la question de l'ordre du jour sera déposée.

---

#### 11. La PdE est-elle sensible aux grands échanges utilisant les Decred de ses clients?

Le nombre de Decred d'une personne (ou d'un échange) ne signifie rien pour PdE. C'est le nombre de tickets que vous avez. Les fonds utilisés pour acheter des tickets sont verrouillés jusqu'au moment où ils ont acheté des votes. Ceci veut dire que
les Decred impliqué dans PdE sont effectivement non transférables. Pour q'un échange utilise les Decred de leurs clients pour le vote, ils devraient les transférer hors du portefeuille et les verrouiller jusqu'à 5 mois. Les gens
remarquerait leur changement de solde (les Decred bloqués dans PdE ne serait pas visible comme dépensable) et ils ne seraient pas en mesure de retirer des fonds afin que l'échange subisse une forte perte de liquidité.

En outre, il y a une limite de 20 tickets ajoutés par bloc, de sorte qu'aucun échange ne pourrait inonder la pool plus rapidement que cela.

Enfin, il y a un plafonnement doux sur le nombre total de tickets dans la pool. Tous les 144 blocs (2880 tickets), le prix du ticket est ajusté en fonction du nombre de tickets dans la pool et du taux de nouveaux ticket
qui ont été ajoutés dans la dernière fenêtre. Finalement, le prix du ticket serait tellement élevé que même un échange ne serait pas en mesure d'acheter de nombreux billets. Et rappelez-vous que s'ils ont fait cela, leur DCR soit verrouillé afin qu'ils
ne peut pas acheter plus lorsque le prix baisse encore.

---

#### 12. PdE est-il susceptible d'influencer les détenteurs d'un solde important comme les développeurs d'origine?

Les limites de la taille de la pool ci-dessus s'appliquent ici. Cela empêche une personne/groupe d'inonder la pool PdE avec un grand nombre de ses propres tickets. Même s'ils ont acheté la pool entière (avec des frais énormes), la plupart
qu'ils pourraient probablement obtenir est d'environ 4000 tickets (basé sur les fenêtres des tickets précédents où ceux autour de 30DCR vont généralement jusqu'à 100 pour la prochaine fenêtre, et le maximum pour l'un après est souvent plus de 300). Donc, un grand
détenteur du solde pourrait probablement acheter 2 fenêtres. Une fenêtre à 30 serait de 86,400DCR alors la suivante à 100 serait de 288 000 DCR. Donc, cela coûterait 374,400DCR pour acheter des billets 5760. Avec une taille de pool cible de billets 40960, 374400 DCR vous donnera environ 14% de tous les tickets.

Now the holder could wait a couple of days for the price to drop then start buying back up again. Except that most of their funds will be locked in the ones they bought earlier (although some will have voted) so their buying power for the new window is greatly reduced. But let's say they have super capital and bought all the decred on all exchanges. So they are able to buy another two windows and replace those tickets that voted and were successful in buying all the tickets (at very high fees and/or prices). Let's say that takes them to about 25% of the tickets.

Les tickets pour un bloc sont choisis avec une distribution aléatoire. Pour forcer un vote pour aller d'une certaine manière, vous auriez besoin de 3 votes sur 5 pour un bloc donné qui est de 60%. Même avec cette énorme dépense de capital,
ils sont à moins de la moitié. Et un vote n'est pas décidé sur un seul bloc afin que vous ayez besoin de 60% de 75% des blocs pendant la période de vote.

Et ALORS, vous avez encore besoin des mineurs PdT pour confirmer les votes. S'ils pensent que quelqu'un essaie de jouer le système, ils peuvent choisir d'invalider les blocs.

Donc, fondamentalement, c'est presque impossible, même si une seule personne a un énorme pourcentage de DCR.

But then we come to the stake pools. Stake pools, while not having access to any of their users' funds, do have the ability to change votes on tickets assigned to them. This is why it is suggested that when joining a stake pool, people don't just go for the largest one. Decred is short for 'decentralised credit' so part of the spirit of PoS is ensuring that the PoS stake pools don't get too large in relation to the others. However, even the largest at almost 20% would still only get on average one vote per block.

Ainsi, Decred a été spécifiquement conçu pour minimiser l'impact des grandes pools PdT et PdE ainsi que des individus (y compris les développeurs) avec de grandes exploitations.

## <i class="fa fa-book"></i> Liens

[^1]: [Guide d'achats de ticket Paymetheus](/getting-started/user-guides/using-paymetheus.md#-purchase-tickets-tab)
