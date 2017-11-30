# Guide d'installation de dcrwallet

Dernière mise à jour pour v1.0.0.

Ce guide est destiné à vous aider à configurer l'application `dcrwallet` utilisant [drapeaux de démarrage](/getting-started/startup-basics.md#startup-command-flags).

**Conditions préalables:**

- Utiliser le dernier [dcrinstall](/getting-started/install-guide.md#dcrinstall) pour installer `dcrwallet`. Des étapes supplémentaires seront nécessaires si une autre méthode d'installation a été utilisée.
- Review how the launch commands differ for the Command Prompt (Windows) and Bash (macOS/Linux) shells, and how the home directories differ [here](/getting-started/cli-differences.md).
- [Installer dcrd](/getting-started/user-guides/dcrd-setup.md) Et faites-le fonctionner en arrière-plan.

---

`dcrwallet` est le daemon qui gère la fonctionnalité de portefeuille pour un seul utilisateur. Il gère tous vos comptes, adresses et transactions; Suit les balances dans les adresses; Et permet aux parties prenantes de participer au vote par la preuve d'enjeu.

Pour `dcrwallet`, un `wallet.db` doit exister dans `dcrwallet` répertoire gîte. Pour que ce fichier existe, vous devez créer un nouveau portefeuille. `dcrinstall` Démarre automatiquement le processus de création. Si vous supprimez le wallet.db ou a utilisé un autre processus d'installation, vous devrez exécuter la [commande de création de portefeuille manuel](#manual-wallet-creation-command).

---

## Informations essentielles

Pendant le processus de création de votre portefeuille, vous recevrez une séquence de 33 mots appelée graine phrase. Cette graine phrase est essentiellement la clé privée de votre portefeuille. Vous pourrez utiliser cette graine phrase pour restaurer vos clés privées, votre historique de transactions et vos soldes en utilisant un portefeuille Decred sur n'importe quel ordinateur.

Cela signifie finalement que *celui* qui connaît votre graine peut l'utiliser pour restaurer vos clés privées, l'historique des transactions et les soldes sur un portefeuille sur leur ordinateur à votre insu. Pour cette raison, il est de la plus haute importance de garder votre graine phrase en toute sécurité. Traitez cette semence de la même façon que vous traiterez une clé physique pour un coffre-fort. Si vous perdez votre graine phrase, vous perdez en permanence l'accès à votre portefeuille et à tous les fonds. Il ne peut être récupéré par personne, y compris les développeurs de Decred. Il est recommandé de l'écrire sur papier et de la stocker quelque part en sécurité. Si vous décidez de la conserver sur votre ordinateur, il serait préférable de la garder dans un document encrypté (n'oubliez pas le mot de passe) dans le cas où le fichier ou votre ordinateur est volé.

Chaque graine phrase est également associée à un hex de graines de 64 caractères. L'hex de graine fonctionne de la même manière que la graine phrase - `dcrwallet` l'acceptera lors de la tentative de restauration de votre portefeuille. Il est également important de garder votre semence hexagonal sécurisée.

**RAPPEL: NE PAS, SOUS AUCUNES CIRCONSTANCES, DONNER VOTRE GRAINE OU LA CLÉ HEX ASSOCIÉE A QUELQU'UN! MÊME PAS LES DÉVELOPPES!**

---

## Manuel de commande de création de portefeuille

Si vous n'en n'avez déjà pas un `wallet.db` Fichier stocké dans `dcrwallet` répertoire gîte, vous devez démarrer la commande `dcrwallet --create`. Des étapes pour cela peuvent être trouvées ci-dessous.

1. Ouvrir une nouvelle fenêtre shell (Bash/Command Prompt/etc,..).
2. Accédez au répertoire de l'éxecutable `dcrwallet`.
3. Entrez la commande `dcrwallet --create` (passez en revue les conditions préalables ci-dessus si vous ne savez pas si vous devez utiliser `./dcrwallet` ou `dcrwallet.exe` pour la commande précédente). 

---

## Création de portefeuille Procédure pas à pas

Au cours de ce processus, vous définissez une phrase privée, définissez éventuellement une phrase publique et enregistrez votre graine. Pour ce faire, suivez les étapes ci-dessous:

> Définir des mots de passe pour votre portefeuille

Si la commande `dcrwallet --create` s'éxecute avec succès, vous devriez être accueilli par le texte suivant:

```no-highlight
Enter the private passphrase for your new wallet:
```

Cette première phrase de passe, la phrase de passe privée, c'est ce que vous utiliserez pour débloquer votre portefeuille lors de la création de transactions ou le vote avec Preuve d'enjeu. Utilisez un mot de passe unique et fort. Ce mot de passe protège également les clés privées du fichier de votre portefeuille, en le sécurisant du vol.

Après avoir vérifié votre phrase de passe privée, vous devriez voir la phrase de passe suivante pour votre nouveau portefeuille:

```no-highlight
Do you want to add an additional layer of encryption for public data? (n/no/y/yes) [no]:
```

La phrase de passe précédente est facultative. Elle est utilisée pour chiffrer toutes les données publiques (transactions et adresses) dans le fichier de votre portefeuille, donc, s'il est volé, un adversaire ne peut pas vous lier à vos transactions.

> Enregistrez votre graine

Avant de créer une nouvelle graine pour votre portefeuille, veuillez passer en revue la section [Informations critiques](/getting-started/user-guides/dcrwallet-setup.md#critical-information).

Après avoir défini votre phrase de passe privée et votre mot de passe public facultatif, vous verrez l'invite suivante:

```no-highlight
Do you have an existing wallet seed you want to use? (n/no/y/yes) [no]:
```

Ce guide suppose que vous n'avez pas une graine existante, alors continuez en frappant `Enter` qui répondra à l'invite par défaut `[no]`. NNOTE: si vous souhaitez restaurer votre portefeuille en utilisant votre graine, vous entrerez simplement `[yes]` Ici et suivez les instructions à l'écran.

<i class="fa fa-exclamation-triangle"></i> **N'UTILISEZ PAS LA MÊME GRAINE DANS DES WALLETS MULTIPLES! Visiter [Portefeuilles et graines FAQ](/faq/wallets-and-seeds.md#3-can-i-run-multiple-wallets) Pour voir pourquoi cela compte. Il est recommandé que, si possible, un nouveau portefeuille devrait générer une nouvelle graine.**

Après avoir répondu `[no]`, Votre graine phrase (graine de génération de portefeuille) et son hex sera affiché dans la fenêtre. Veuillez lire la section IMPORTANTE affichée immédiatement après le Hex.

On ne peut pas trop souligner combien il est important d'enregistrer votre graines phrase dans un emplacement sécurisé, donc, si vous ne vous en souvenez pas, consultez la section [Informations critiques](/getting-started/user-guides/dcrwallet-setup.md#critical-information) encore.

Une fois que vous avez écrit la graine phrase et hex type entrez `OK` Et appuyez sur `Enter`. REMARQUE: si vous n'avez pas écrit la phrase avant de continuer, vous devriez [Répeter ce processus](/getting-started/user-guides/dcrwallet-setup.md#create-a-new-wallet) after [Suppression de votre fichier portefeuille](/advanced/deleting-your-wallet.md)

Après avoir pressé `Enter`, Vous devriez voir le message suivant:

```no-highlight
Creating the wallet...
The wallet has been created successfully.
```

Le portefeuille sera alors créé. Cela peut prendre quelques minutes si vous avez un ordinateur lent.

---

## Lancement de dcrwallet

Pour lancer `dcrwallet`, vous devez premièrement [created your wallet](#wallet-creation-walkthrough) et[connecter dcrd au réseau Decred](/getting-started/user-guides/dcrd-setup.md#connect-to-the-decred-network).

> Configurez RPC Nom d'utilisateur et Mot de passe

Si vous utilisé [`dcrinstall`](/getting-started/install-guide.md#dcrinstall), vos fichiers de configuration sont déjà configurés avec le nom d'utilisateur/mot de passe RPC pour `dcrd`, `dcrwallet`, et `dcrctl`.

Si vous n'avez pas utilisé `dcrinstall`, yVous devrez activer les paramètres minimaux sur nuls dans vos fichiers de configuration. Suivez [ce guide](/getting-started/startup-basics.md#minimum-configuration) pour cela.

> Démarrer dcrwallet 

Avec les fichiers de configuration correctement configurés, ouvrez une autre fenêtre shell dans votre répertoire Decred (ou utilisez la dernière fenêtre si vous venez de créer votre portefeuille). Tapez la commande suivante (reportez-vous à ce guide Prérequis pour déterminer l'ordre exact en fonction de votre application OS/Shell):

```no-highlight
dcrwallet
```

Votre `dcrwallet` a maintenant se connecter au réseau via `dcrd`. Il commencera à scanner le réseau pour vos adresses actives cela peut prendre quelques minutes sur les ordinateurs lents. Finalement, il commencera à montrer des lignes comme:

```no-highlight
[INF] WLLT: Connecting block 0000000000002004ea8fa74af334cb291a22832642b5be603995683534bbb97b, height 9990
```

Cela signifie que votre portefeuille est correctement connecté au réseau à travers votre daemon.

---

Pour apprendre comment utiliser `dcrd` et `dcrwallet`, visitez le guide [dcrctl Basiques](/getting-started/user-guides/dcrctl-basics.md). Vous apprendrez comment débloquer votre portefeuille, envoyer et recevoir DCR en utilisant `dcrctl`, vérifiez votre solde et vérifiez les différentes statistiques du réseau.
