# **Guide du Débutant**

Dernière mise à jour pour v0.8.2

---

## **Bienvenue à Decred**

Bienvenue dans le monde de Decred! Nous savons que le démarrage de toute nouvelle cryptocurrence peut être difficile et nous voulons rendre le voyage aussi facile que possible. Decred est bien documenté, avec tout à partir d'informations de base telles que "comment puis-je envoyer Decred", à super technique comme "pourquoi avez-vous choisi une fonction de hash BLAKE-256, et comment ca se compare à la construction Merkle-Damgård? ".

Pour que vous ne soyez pas débordés par la quantité d'informations disponibles, nous avons créé
Ce guide pour débutants à travers la documentation. En suivant les liens au bas de quelques pages, vous apprendrez comment installer, configurer et utiliser les applications Decred; Comment obtenir DCR; Comment voter via la preuve d'enjeu; Comment utiliser l'explorateur de blocs; Et configurez le logiciel à utiliser sur le Testnet. 

---

## **Applications**

Ci-dessous, vous trouverez une liste des applications actuellement disponibles, avec un graphique montrant leur compatibilité avec différents systèmes d'exploitation.

**Paymetheus**: Le seul client GUI de Windows pour la v0.8.2. <br />
**dcrd**: La node daemon, cette application de ligne de commande gère la gestion et le consensus des blocs. <br />
**dcrwallet**: Le portefeuille daemon, cette application de ligne de commande gère l'adresse et la gestion des transactions. <br />
**dcrctl**: Le client d'appel de procédure à distance (RPC), cette application de ligne de commande sert à contrôler dcrd et dcrwallet via des commandes RPC. <br />
**Decrediton**: ALPHA cross-plate-forme GUI client pour la v0.8.2.

|           | Paymetheus | dcrd | dcrwallet | dcrctl | Decrediton |
| ---------:|:----------:|:----:|:---------:|:------:|:-----------:|
| Windows   | X          | X    | X         | X      |             |
| macOS     |            | X    | X         | X      | X           |
| Linux     |            | X    | X         | X      | X           |
| Other UNIX|            | X    | X         | X      |             |

"Autres UNIX" Comprend actuellement divers *BSDs anetd Solaris/illumos.

---

## **Guides d'Installation**

Pour commencer, choisissez une option pour les installations disponibles pour votre système d'exploitation ci-dessous:

* [Paymetheus](/getting-started/install-guide.md#paymetheus)

* [Ligne de commande Suite **via dcrinstall**](/getting-started/install-guide.md#dcrinstall) - NOTE: La méthode `dcrinstall` est le moyen le plus rapide et le plus facile d'obtenir une node ligne de commande et un portefeuille en cours d'exécution. Il est recommandé et les guides de configuration du chemin de ligne de commande ci-dessous supposeront que vous avez utilisé cette méthode.
* [Decrediton (ALPHA)](/getting-started/install-guide.md#decrediton)

---

**REMARQUE:** Tous les guides suivants se trouvent dans le menu de navigation avec les mêmes noms.

## **Paymetheus Path**

Les guides suivants, dans l'ordre, vous permettront de commencer avec Paymetheus:

* [Installer Paymetheus](/getting-started/user-guides/paymetheus.md)
* [Utiliser Paymetheus](/getting-started/user-guides/using-paymetheus.md)

## **Decrediton Path**

Le guide suivant vous aidera à charger Decrediton:

* [Installer Decrediton](/getting-started/user-guides/decrediton-setup.md)

## **Ligne de Commande Path**

Les guides suivants, dans l'ordre, vous permettront de commencer avec les applications de ligne de commande (`dcrd`, `dcrwallet`, `dcrctl`):

* [Différences de ligne de commande](/getting-started/cli-differences.md)
* [Principes de base des options de démarrage](/getting-started/startup-basics.md)
* [Installer dcrd](/getting-started/user-guides/dcrd-setup.md)
* [Installer dcrwallet](/getting-started/user-guides/dcrwallet-setup.md)
* [dcrctl Utilisation de base](/getting-started/user-guides/dcrctl-basics.md)

## **General Guides**

The following guides are independent of the different applications:

* [Obtenir DCR](/getting-started/obtaining-dcr.md)
* [Utiliser le Bloc Explorer](/getting-started/using-the-block-explorer.md)
* [PdE Guide](/mining/proof-of-stake.md)
