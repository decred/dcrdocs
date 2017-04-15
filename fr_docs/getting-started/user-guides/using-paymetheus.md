# **Le Portefeuille Windows Paymetheus** #
Ce guide suppose que vous avez déjà mis en place un portefeuille Paymetheus en utilisant [ce guide](paymetheus.md).

---

## **Vue d'Ensemble** ##
L'onglet Aperçu donne un résumé rapide de votre DCR total (dépensable et verrouillé), le nombre de comptes et les transactions ainsi qu'une liste de l'activité récente du compte.

![Onglet Aperçu](/img/Paymetheus-overview.png)  

---


## **Comptes** ##
L'onglet Comptes affiche les comptes dans votre portefeuille et vous permet d'en ajouter de nouveaux. Les comptes Decred travaillent tout comme les comptes bancaires. Ils vous permettent de conserver des enregistrements séparés de votre DCR. Cette fonctionnalité est le plus utile pour ceux qui gèrent des entreprises et souhaite conserver des comptes séparés pour les enregistrements fiscaux par exemple. Le transfert de DCR à travers les comptes créera une transaction sur la chaîne de blocs.

![Onglet Aperçu](/img/Paymetheus-accounts.png)  

---


## **Scripts** ##
Actuellement utilisé uniquement pour l'exploitation de PdE dans une pool. À partir de la version 0.8.0 la configuration du script a été automatisée. Consultez la section Tickets d'achat ci-dessous pour plus d'informations.
Il sera utilisé pour des fonctionnalités plus avancées dans le futur.

![Onglet Scripts](/img/Paymetheus-import-script.png)  

---


## **Créer Transaction** ##
Cet onglet explique comment envoyer des fonds à une autre adresse. Copiez simplement les adresses récepteurs dans la zone de texte et tapez le montant de Decred que vous souhaitez envoyer. Les frais estimés seront également répertoriés. Vous pouvez cliquer sur le bouton '+' pour envoyez Decred à plusieurs adresses dans la seule transaction, si vous le souhaitez.

![Créer un onglet de transaction](/img/Paymetheus-send.png)  

---


## **Onglet Achat des tickets** ##

Paymetheus est en mesure d'acheter des tickets pour la preuve d'enjeu en utilisant sa caractéristiques d'achat de ticket manuel. Notez que Paymetheus peut *uniquement* acheter des tickets, il ne peut pas faire le vote effectif. Pour cela, vous devrez installer [solo PdE](/mining/proof-of-stake)
ou utiliser a PdE [stake pool](/mining/proof-of-stake.md#sign-up-for-a-stake-pool).

> Pour rejoindre la pool, fournissez une adresse de clé publique qui peut être utilisée pour générer un
> 1-of-2 multisignature script. Le script multisignature sera généré par
> La pool et vous retourné aà vous avec une adresse P2SH pour donner droit de vote.

Ne vous inquiétez pas si vous ne comprenez pas cette citation. Ce que cela signifie, c'est que vous créez une adresse à laquelle on peut accéder par deux portefeuilles. Un seul portefeuille doit être disponible pour utiliser l'adresse. Cela signifie que la pool peut voter en votre nom et vous pouvez voter en utilisant votre propre portefeuille si la pool cesse de fonctionner.

Il ne donne PAS à la pool l'accès à vos fonds. Tout ce que vous faites, c'est accorder le droit de vote à la pool. La pool ne touche pas vos fonds.

Il est recommandé de générer un nouveau compte lors de la participation à une pool de partages. Parce que les comptes sont durcis, donc dans le cas d'une participation totale
Échec/arrêt, il serait sécurisé de donner la clé privée à une autre participation tant que ce compte ne fait que voter et rien d'autre.

Les pools de participation officiels sont [listés ici](/mining/proof-of-stake#sign-up-for-a-stake-pool).
Toutes les pools de participation affichent le même code de base, mais peuvent différer de la quantité de redondance disponible. Plus de redondance équivaut à moins de chances de manqués des votes (bien que tous les pools aient des votes manqués, autant de votes manqués sont causés par les mineurs PdT (parfois ils trouveront une solution aux blocs si vite que les votes n'avaient pas eu le temps de se propager dans le réseau). Afin d'assurer qu'une pool ne devient pas trop grande, il est recommandé de rejoindre un groupe plus petit. Alors qu'une pool ne peut pas accéder à vos fonds, ils peuvent choisir de voter contre vos souhaits. Si ils font ca, ils seront listés sur une liste noire très rapidement, mais garder les tailles des pools individuelles minimes signifie que tous les opérateurs voyous ont du mal à avoir un effet sur le résultat de tout vote. En diffusant des tickets autour des pools, il rend le réseau encore plus décentralisé.

![Créer un compte de vote](/img/Paymetheus-create-voting-account.png)  

Il y a un peu d'information ici, alors nous allons passer à travers chacune des options.

* **Ticket difficulty** - Le prix actuel d'un ticket.
* **Blocks until retarget** - Lorsque cela atteint 0, un nouveau prix du ticket est calculé.
* **Source account** - C'est le compte qui achètera les ticket et recevra la récompense.
* **Tickets to purchase** - Le nombre de ticket acheté.
* **Ticket fee (DCR/kB)** - Les tickets sont inscrits au groupe de vote par ordre de leurs frais. Au moment de la demande, vous devrez augmenter cette valeur pour que vos tickets soient acceptés. Vous pouvez consulter les tarifs actuels des tickets [ici](https://www.dcrstats.com).
* **Split fee (DCR/kB)** - Paymetheus utilise une transaction "divisée" pour éviter de bloquer votre solde, divisant le montant exact nécessaire pour le ticket du solde de votre portefeuille. La transaction "split" doit être confirmée au moins une fois avant de pouvoir réutiliser votre solde. Cela peut bloquer votre équilibre complet pendant plusieurs minutes alors que cette confirmation se produit. Sans la scission, vous devriez attendre la confirmation de la transaction du ticket, ce qui pourrait prendre plusieurs heures. Cela peut être laissé à 0.01. Cela n'affecte pas vos chances d'acheter des ticktes ou de voter avec eux.
* **Expiration (blocs)** - Souvent, les frais de ticket augmenteront au cours d'une fenêtre et vous pourriez être arrêté par des frais plus élevés. En définissant une expiration, les tickets qui ne sont pas extraits dans le nombre de blocs donné sont annulés afin que vous puissiez réessayer avec des frais plus élevés si vous le souhaitez. Si cela est vide, ils n'expireront pas jusqu'à la fin de la fenêtre.
* **Préférence Pool d'Enjeu** - Automatisez la configuration avec des pools PdE. Voir ci-dessous pour plus d'informations.
* **Adresse de Vote** - L'adresse Decred qui fera le vote. Les mineurs des pool individuels et personnalisés seulement.
* **Adresse de frais de Pool** - Pour ceux qui utilisent une pool personnalisée.
* **Frais (%) Pool** - Pour ceux utilisant une pool personnalisée.

![Acheter des tickets](/img/Paymetheus-ticket-purchasing.png)  

Pour configurer facilement l'achat de tickets pour une pool d'enjeu, cliquez sur le bouton 'Gérer les pools'. Si vous ne l'avez pas encore, vous devrez vous inscrire à une pool de participation (voir ci-dessus). Une fois que vous vous êtes enregistré, connectez-vous, recherchez votre clé API et copiez-la. Sélectionnez la pool que vous venez d'enregistrer avec le menu déroulant. Collez la clé dans la zone «API» et cliquez sur «Enregistrer». Vous devriez voir apparaître un tas de lettres et de chiffres dans la case inférieure. Cliquez sur 'Fermer'. Vous pouvez maintenant acheter en cliquant sur le bouton "Acheter"!

![Gérer les pools de participation](/img/Paymetheus-manage-stake-pool.png)
			
REMARQUE: Lorsque vous pouvez acheter des tickets en utilisant Paymetheus, il ne peut pas voter pour vous, donc vous devez utiliser une pool ou exécutez votre propre portefeuille de vote qui doit être en ligne 24 heures sur 24, 7 jours sur 7. Si vous préférez le minage solo, vérifiez le [dcrd Guide d'Installation](/getting-started/user-guides/dcrd-setup.md), [dcrwallet Guide d'Installation](/getting-started/user-guides/dcrd-setup.md) et [Guide de minage PdE](/mining/proof-of-stake.md) for more information.

---

## **Demander un paiement** ##
C'est là que vous pouvez générer des adresses de portefeuille pour donner aux autres personnes afin qu'ils puissent vous envoyer DCR. Il suffit de choisir le compte dans lequel vous souhaitez obtenir des fonds et appuyez sur Générer l'adresse. Copiez l'adresse (c'est la ligne supérieure qui commence par Ds) et partagez-la avec d'autre personne Les adresses Decred peuvent être utilisées autant de fois que vous le souhaitez, mais pour des raisons de confidentialité, c'est mieux d'en générer une nouvelle pour chaque transaction. Il y a environ 1.4E48 (c'est 14 suivi de 47 zéros) adresses disponibles afin que vous n'ayez pas à vous soucier d'en manquer.

![Demander un paiement](/img/Paymetheus-receive.png)  

---


## **Historique de Transaction** ##
Cet onglet affiche une liste de toutes les transactions qui ont eu lieu. Le hash de transaction peut être utilisé avec le
[Block explorer](/getting-started/using-the-block-explorer.md) pour en savoir plus à propos des transactions

![Historique des Transaction](/img/Paymetheus-transactions.png)  

---


## **Minage d'Enjeu** ##
Cet onglet présente certaines statistiques sur le réseau PdE:

Article                         | Description
:------------------------------:|:------------------------------------------------------------:
Nombre de ticket live           | Le nombre total de tickets pouvant être votés sur le réseau
Nombre de tickets dans mempool  | The total number of tickets waiting to enter the voting pool
Difficulté des tickets          | Le coût d'un ticket (remboursé au vote/expiration du ticket)
Tickets appartenant à la mempool| Le nombre de vos tickets dans le mempool
Tickets live possédés           | Le nombre de vos tickets admissibles au vote
Tickets immature possédés       | Nombre de tickets en attente de maturation avant d'être en direct (256 blocs, ~ 17 heures)
Tickets manqués                 | Les tickets qui ont manqué un vote, soit parce que le portefeuille de vote ou la pool de participation était hors-ligne ou le mineur PdT ne l'a pas mal mené correctement
Tickets revokés                 | Les tickets qui ont manqué un vote et ont eu le prix du ticket remboursé (moins les frais de ticket), devraient être les mêmes que les tickets manqués
Tickets votés                   | Tickets à vie votés par ce portefeuille
Subvention totale gagnée        | Subvention DCR gagnée à vie par ce portefeuille
