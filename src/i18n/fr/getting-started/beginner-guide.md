# Guide du débutant

Dernière mise à jour pour v1.0.1

---

## Bienvenue à Decred

Bienvenue chez Decred! Nous sommes très heureux de vous accueillir. Comme vous le pouvez ou ne le savez pas déjà, Decred est différent. Il y a beaucoup de nouvelles choses à apprendre à comprendre pleinement comment les choses fonctionnent. Cette documentation tentera de rendre les choses un peu plus faciles à comprendre.

Ce guide pour les débutants est un moyen d'utiliser le logiciel Decred. Vous pouvez choisir parmi plusieurs clients pour obtenir une node sur le réseau et Decred dans votre portefeuille. Plus précisément, vous apprendrez comment installer, configurer et utiliser les applications Decred; Comment obtenir DCR; Comment voter via la mise d'enjeu; Et comment utiliser l'explorateur de blocs.

Vous devrez suivre un [Guide d'installation] (#installation-guides), puis suivre le chemin d'accès pour l'application de votre choix ci-dessous. Une fois votre application configurée, passez par [Guides généraux] (#general-guides) au bas de cette page. Si vous avez des questions en cours de route, rejoignez-nous dans notre [Slack](/support-directory.md#join-us-on-slack).

** REMARQUE: l'utilisation de Testnet est fortement recommandée pour apprendre à utiliser le logiciel Decred sans crainte de faire une erreur et de perdre de l'argent réel. Après avoir suivi les guides pour configurer votre choix de logiciel, visitez le [Guide de Testnet] (/getting-started/using-testnet.md) pour savoir comment lancer votre application sur le testnet de Decred. **

---

## Applications

Vous trouverez ci-dessous une liste des applications actuellement disponibles, avec un graphique montrant leur compatibilité avec différents systèmes d'exploitation.

**Paymetheus**: The only Windows GUI client as of v1.1.0. <br />
**dcrd**: The node daemon, this command-line application handles block management and consensus. <br />
**dcrwallet**: The wallet daemon, this command-line application handles address and transaction management. <br />
**dcrctl**: The remote procedure call (RPC) client, this command-line application is used to control dcrd and dcrwallet via RPC commands. <br />
**Decrediton**: Cross-platform GUI client as of v1.1.0.

|           | Paymetheus | dcrd | dcrwallet | dcrctl | Decrediton |
| ---------:|:----------:|:----:|:---------:|:------:|:-----------:|
| Windows   | X          | X    | X         | X      |             |
| macOS     |            | X    | X         | X      | X           |
| Linux     |            | X    | X         | X      | X           |
| Autre UNIX|            | X    | X         | X      |             |

"Autre UNIX" comprend actuellement divers *BSD et Solaris/illumos.

Remarque: Vous devriez remarquer rapidement l'une des nombreuses différences entre Decred et autres
cryptocurrency populaires: le portefeuille daemon et la node daemon sont séparés.
de nombreuses autres coins fonctionnent ensemble dans un seul daemon.
pour ceux qui choisissent d'utiliser les interfaces de ligne de commande, cela signifie que vous devez
exécutez `dcrd` pour la fonctionnalité complète de la node, et `dcrwallet` pour stocker votre DCR,
créer des transactions et participer au minage ou au vote de preuve d'enjeu.

---

## Guides d'installation

Pour commencer, choisissez une option pour les installations disponibles pour votre système d'exploitation ci-dessous:

* [Paymetheus](/getting-started/user-guides/paymetheus.md)
* [Command Line Suite **via dcrinstall**](/getting-started/user-guides/cli-installation.md) - REMARQUE: la méthode `dcrinstall` est la manière la plus rapide et la plus simple d'obtenir une node et un portefeuille de ligne de commande fonctionnel. Il est recommandé et les guides de configuration du chemin de la ligne de commande ci-dessous supposeront que vous avez utilisé cette méthode.
* [Decrediton (ALPHA)](/getting-started/user-guides/decrediton-setup.md)

---

**REMARQUE:** Tous les guides suivants se trouvent dans le menu de navigation avec les mêmes noms.

## Chemin Paymetheus 

Les guides suivants, dans l'ordre, vous permettront de commencer avec Paymetheus:

* [Installer Paymetheus](/getting-started/user-guides/paymetheus.md)
* [Utiliser Paymetheus](/getting-started/user-guides/using-paymetheus.md)

## Chemin Decrediton 

Le guide suivant vous aidera à charger Decrediton:

* [Installer Decrediton](/getting-started/user-guides/decrediton-setup.md)

## Chemin de ligne de commande

Les guides suivants, dans l'ordre, vous permettront de commencer avec les applications de ligne de commande (`dcrd`,` dcrwallet`, `dcrctl`):

* [Différences de ligne de commande](/getting-started/cli-differences.md)
* [Principes de Base des Options de Démarrage](/getting-started/startup-basics.md)
* [Installer dcrd](/getting-started/user-guides/dcrd-setup.md)
* [Installer dcrwallet](/getting-started/user-guides/dcrwallet-setup.md)
* [Utilisation de base dcrctl](/getting-started/user-guides/dcrctl-basics.md)

## Guides généraux

Les guides suivants sont indépendants des différentes applications:

* [Utilisation de Testnet](/getting-started/using-testnet.md)
* [Obtenir DCR](/getting-started/obtaining-dcr.md)
* [Utilisation de l'Explorateur de Blocs](/getting-started/using-the-block-explorer.md)
* [Guide de Preuve-d'Enjeu](/mining/proof-of-stake.md)
* [Guide de vote de Mainnet](/getting-started/user-guides/agenda-voting.md)
