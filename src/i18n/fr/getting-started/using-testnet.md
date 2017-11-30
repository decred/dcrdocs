# Utilisation du Guide Testnet

Dernière mise à jour pour testnet2

---

## Pourquoi utiliser Testnet?

Le testnet est un endroit merveilleux où vous pouvez expérimenter les applications de Decred sans craindre qu'une erreur vous coûte de l'argent réel. Il est recommandé aux personnes d'utiliser le testnet pour connaître les bases du logiciel Decred et de nouvelles fonctionnalités.

Decred est actuellement sur son 2ème Testnet, également appelé testnet2. Les jeux de tests sont périodiquement réinitialisés pour aider à garder une taille de fichier de blocs gérable.

---

## Comment exécuter une node Testnet

L'exécution d'une node testnet2 est incroyablement facile. Votre application de choix devra télécharger la chaîne de testnet2, et vous devrez créer un nouveau fichier de portefeuille pour l'utilisation de testnet2. Vos fichiers de blocs et de portefeuille mainstream resteront intacts. Passer entre les deux est incroyablement facile.

---

## Paymetheus

Pour lancer `Paymetheus` sur testnet2, il suffit de lancer l'application `Decred Testnet` à la place de l'application `Decred` habituelle. Vous allez ensuite parcourir la création du portefeuille (les mêmes étapes dans le [Guide de configuration Paymetheus](/start-started/user-guides/paymetheus.md)). Une fois que `dcrd` finit de se synchroniser en arrière-plan, vous pourrez alors remplir votre portefeuille `Paymetheus` avec testnet DCR et vous familiariser avec le logiciel.

---

## Decrediton 

Pour lancer `Decrediton` sur testnet2, vous devez lancer `Decrediton` à partir de la ligne de commande avec le drapeau `--testnet`. Gardez à l'esprit que l'utilisation du drapeau commence à démarrer dans ce mode jusqu'à ce que vous utilisiez le drapeau `--mainnet` pour revenir à la chaîne de blocs mainstream.

Pour Linux,

1. Ouvrez votre terminal et accédez au répertoire avec l'exécutable decrediton.
2. Émettez la commande `./decrediton --testnet`.
3. Decrediton lancera et tentera de se connecter à testnet2.

For macOS,

1. Ouvrez votre terminal et émetez la commande suivante: `/Applications/decrediton.app/Contents/MacOS/decrediton --testnet`
2. Decrediton lancera et tentera de se connecter à testnet2.

Rappelez-vous, si vous souhaitez passer Decrediton à mainnet, vous devrez émettre ces commandes avec le drapeau `--mainnet`.

___ 

## Suite de ligne de commande

Pour lancer `dcrd` et `dcrwallet` sur testnet, il suffit d'ajouter le drapeau `--testnet` à votre commande de lancement. Alternativement, vous pouvez mettre `testnet=1` dans tous vos fichiers de configuration, mais il est généralement beaucoup plus rapide d'utiliser le drapeau de démarrage.

Lors du premier lancement de `dcrd --testnet`, `dcrd` commencera à télécharger le testnet2 blockchain dans le dossier `data/testnet2` du répertoire principal de `dcrd`.

Avant de pouvoir lancer `dcrwallet` avec le drapeau` --testnet`, vous devez créer un portefeuille testnet distinct en utilisant la commande `dcrwallet --testnet --create`. Les étapes sont les mêmes que celles trouvées dans [dcrwallet Setup Guide](/start-started/user-guides/dcrwallet-setup.md).

Pour émettre des commandes à la fois `dcrwallet` et `dcrd`, vous devez également ajouter le drapeau `--testnet` à l'une des commandes` dcrctl` que vous utilisez. Par exemple. Vous étiriez la commande `dcrctl --testnet --wallet getbalance` pour vérifier votre équilibre testnet.

---

## Acquisition de coins Testnet

Vous pouvez acquérir des coins à l'aide du [Détecteur Testnet Faucet](https://faucet.decred.org). Remettez toutes les coins à l'adresse indiquée au bas de cette page lorsque vous avez terminé de jouer avec le testnet.

---

