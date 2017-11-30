# Testnet Hard Fork Guide de vote

Ce guide a été mis à jour pour v1.0.1

À partir de la version v0.8.0 du 13 février 2017, le mécanisme de vote a été mis en place pour les tests sur le Testnet de Decred. On estime que le vote d'essai débutera le 25 février 2017 vers 1 heure du CST et durera 7 jours. Si vous souhaitez participer, des guides pour Paymetheus et les applications de ligne de commande peuvent être trouvés ici. 

---

## Introduction

Il existe un processus en deux étapes pour voter pour mettre en œuvre des changements de consensus qui créeraient une fork difficile. Remarque: les intervalles de bloc suivants sont pour le testnet, ils seront différents pour mainnet.

La première étape consiste à respecter le seuil de mise à niveau sur le réseau. Une fois que le code de l' hardfork est relâchée, la majorité des nodes du réseau participant au PdT/PdE doivent commencer avant le début du vote. Pour la preuve de travail, au moins 75% des 100 blocs les plus récents doivent avoir la dernière version en bloc. Pour la preuve d'enjeu, 75% des votes exprimés dans un intervalle de bloc 2016 statique doivent avoir la dernière version du vote.

La deuxième étape de ce processus est le vote effectif. L'intervalle de bloc précédent 2016 tombe quelque part dans un intervalle de bloc plus important de 5040 et le réseau doit attendre que l'intervalle 5040 du bloc pour finir. En raison des différentes longueurs d'intervalle, il *pourrait* prendre jusqu'à 5040 blocs supplémentaires avant le début de la fenêtre de vote. Après cela, un intervalle de bloc 5040 statique se transmet pendant que les votes sont exprimés et si 75% des votes extraits dans cet intervalle signent un vote "oui" aux modifications proposées, les modifications sont entièrement mises en œuvre après un intervalle de bloc supplémentaire (pour donner aux reste nodes le temps nécessaire à la mise à jour pour éviter d'être enlevé de la chaîne de blocs). Vous trouverez ci-dessous un tableau simplifié pour expliquer chaque intervalle de bloc dans l'ordre où ils apparaissent chronologiquement.

Interval Description | Interval Type | Nombre de blocs
---------------------|-------------|---------------
Minimum 75% des blocs doivent être la version la plus récente | Roulant | 100
Un minimum de 75% des votes doit être la version la plus récente | Statique | 2016
Intervalle après les exigences de mise à niveau rencontrées | Statique | Jusqu'à 5040
Intervalle de vote actuel - 75% des votes doivent signaler un "oui" pour passer | Statique | 5040
Intervalle de pré-implantation si le vote passe | Statique | 5040

Si une proposition ne parvient pas à atteindre un seuil de 10% des votes «non» ou «oui», les parties prenantes pourront voter à nouveau lors de l'intervalle de vote suivant, jusqu'à ce que ce seuil soit atteint ou que la proposition expire. 

Ci-dessous sont des instructions pour participer à la démo de vote sur le Testnet en utilisant un projet de partage avec Paymetheus et / ou les applications de ligne de commande `dcrd`,` dcrwallet` et `dcrctl`. Le guide de ligne de commande utilise des fichiers de configuration pour transmettre des paramètres à l'application pendant le lancement. Alternativement, les drapeaux peuvent être utilisés lors du démarrage d'une application, mais ils ne seront pas couverts par ce projet.

## Paymetheus

> Step 1: Download and Install Paymetheus

If you haven't already updated your Decred binaries to v1.1.0, visit the [Installation Guide](/getting-started/user-guides/paymetheus.md) and follow the directions for the Windows Installer.

> Étape 2: Démarrer Decred Testnet

From the Start Menu, open `Decred Testnet`. This will launch `Paymetheus`, and a new Command Prompt window will open and run `dcrd.exe`. If this is the first time running the testnet daemon, it will take a while to sync to the testnet blockchain. 

In the `Paymetheus` window, you'll be greated by a "Connect to dcrd" dialog. Keep the defaults and press the continue button. The next view will have two buttons, "Create a new wallet" and "Restore wallet from seed." For this guide, it will be assumed you do not already have a seed you wish to restore.

After clicking "Create a new wallet," you'll be greeted with information regarding your new wallet seed. Record your seed, put it in a safe place, and never share it with anyone. You will also need to re-enter it once you press the CONTINUE button. 

After you've typed in your seed, the Encrypt Wallet view will be next. Enter a private passphrase as the directions explain. Press ENCRYPT. Paymetheus will then begin to create your wallet. Once it is created, it will open to your wallet overview page.

> Étape 3: Enregistrez-vous sur le site Web Stakepool

En attendant que votre node/portefeuille se synchronise, visitez [https://teststakepool.decred.org](https://teststakepool.decred.org) et inscrivez-vous pour un nouveau compte.

> Étape 4: Acquérir des Coins Testnet

Ensuite, vous devrez acquérir des coins testnet afin d'acheter des tickets Testnet. Il existe un faucet Testnet officiel situé à [https://faucet.decred.org](https://faucet.decred.org). Pour obtenir une nouvelle adresse de Paymetheus, cliquez sur l'onglet "Demande de Paiement" dans le menu de navigation. En cliquant sur le bouton "GÉNÉRER ADRESSE", une adresse commencera avec "Ts". Copiez et collez cette adresse dans le faucet et vous devriez recevoir vos coins.

> Étape 5: Achetez des tickets Testnet

Cliquez sur l'onglet "Acheter des tickets" dans le menu de navigation Paymetheus. Vous verrez 7 champs de formulaire dans la page. Tous les défauts peuvent être utilisés pour l'achat de tickets **à l'exception** de la "préférence de la pool". Cliquez sur le bouton "Gérer les pools". Vous devez entrer la clé de l'API pour votre compte au token testnet. Pour ce faire, visitez simplement [https://teststakepool.decred.org/settings](https://teststakepool.decred.org/settings) - votre token d'API devrait être le premier élément de la page. Entrez dans le champ de la touche API dans Paymetheus et appuyez sur Enregistrer. Votre script multi-sig de 1-de-2 sera généré automatiquement et vous pouvez appuyer sur Fermer.

Ensuite, sélectionnez teststakepool.decred.org dans la liste déroulante des préférences de la pool et appuyez sur le bouton Acheter pour commencer à acheter des tickets! Remarque: la difficulté du ticket est égale au coût par ticket, alors assurez-vous d'avoir suffisamment de pièces de testnet pour en acheter au moins un.

> Étape 6: définissez les Votesbits de vos tickets via Stakepool

Lors de l'utilisation d'une pool, les tickets que vous achetez ont leurs droits de vote délégués à cette pool. Par défaut, la pool votera comme il convient avec vos tickets. Bien sûr, vous voudrez peut-être modifier la façon dont vos tickets votent.

Vous pouvez définir les votebits de vos tickets via l'interface des tickets de partage. Vous trouverez ci-dessous une capture d'écran de la page [https://teststakepool.decred.org/tickets](https://teststakepool.decred.org/tickets). Au bas de la section "Live/Immature" de cette page, vous verrez les paramètres de vote. Vous ne pouvez modifier que les votebits de *tout* vos tickets à la fois via l'interface de la pool. Les tickets affichés ci-dessous ont été définis sur "Oui" pour "Précédent Bloc Valide?" et "Oui" pour "Augmenter la taille du bloc de 1.0 MiB à 1.25MB", ce qui a donné une valeur Votebit de 5.

<img src="/img/testnet-voting_votebit-setting.jpg">

Pour certaines informations de base sur les Votebits, visitez [Une Explication des Votebits](#an-explain-of-votebits).

## Instructions de ligne de commande

> Étape 1: Télécharger et installer Decred

If you haven't already updated your Decred binaries to v1.1.0, visit the [Installation Guide](/getting-started/user-guides/cli-installation.md) and follow the directions for your operating system.

> Étape 2: Créer des fichiers de configuration

Si vous connaissez déjà les fichiers `.conf`, passez à l'étape 3.

Consultez nos fichiers [Configuration Files Introduction](/starts-started/startup-basics.md#configuration-files) et créez de nouveaux fichiers de configuration ou copiez les exemples de fichiers de configuration dans les répertoires spécifiés pour votre système d'exploitation.

> Étape 3: éditer les fichiers de configuration pour lancer Testnet

Pour exécuter `dcrd`, `dcrwallet` et `dcrctl` sur le testnet, ajoutez simplement `testnet=true` ou `testnet=1` aux trois fichiers de configuration. Si vous utilisez l'un des exemples de fichiers de configuration, vous pouvez simplement trouver la ligne qui lit `; testnet=1` (le premier paramètre dans la section Paramètres réseau) et supprimer le point-virgule.

Cela doit être fait pour les trois fichiers de configuration.

> Étape 4: Créer un nouveau portefeuille Testnet

Si vous n'avez jamais effectué un portefeuille Testnet avant, vous devrez en créer un nouveau. Avec votre configuration `dcrwallet.conf` pour testnet **(voir l'étape 3)**, exécutez `dcrwallet` avec le drapeau `--create`.

Pour ceux qui ne sont pas familiers avec la façon de le faire, suivez le guide spécifique du système d'exploitation ci-dessous:

**Windows**: <br />
    1. À l'aide de l'invite de commandes ou de l'Explorateur de fichiers, accédez au répertoire de votre exécutable `dcrwallet` <br />
    2. Si vous utilisez l'Explorateur de fichiers, sélectionnez l'option "Ouvrir commande" dans le menu déroulant "Fichier". <br />
    3. Entrez la commande `dcrwallet.exe --create`

**macOS**: <br />
    1. À l'aide de Terminal ou Finder, accédez au répertoire de votre fichier `dcrwallet` <br />
    2. Si vous utilisez Finder, vous pouvez ouvrir un nouveau terminal dans un emplacement de dossier en cliquant avec le bouton droit de la souris sur un dossier et en sélectionnant Services> Nouveau terminal à la fenêtre dans le menu déroulant. <br />
    3. Entrez la commande `./dcrwallet --create`

**Linux**: <br />
    1. En utilisant tout ce que vous aimez, accédez au répertoire de votre fichier `dcrwallet` <br />
    2. Entrez la commande `./dcrwallet --create`

Cela vous guidera dans les astuces habituelles de créer un nouveau portefeuille. Suivez les instructions à l'écran. Vous devrez créer une phrase de passe privée (vous l'utiliserez plus tard pour débloquer votre portefeuille lors de la création de transactions). La couche supplémentaire de cryptage est complètement facultative. Votre graine peut être utilisée pour restaurer votre portefeuille sur n'importe quel ordinateur utilisant dcrwallet. Enregistrez votre graine, placez-le dans un endroit sûr et ne le partagez jamais avec personne. Le portefeuille se ferme une fois que tout est terminé.

> Étape 5: Démarrez dcrd sur le Testnet

Exécutez votre exécutable `dcrd` avec l'option` testnet=1` ou `testnet = true` dans le fichier de configuration pour démarrer votre node sur le testnet. Votre node commencera à se synchroniser avec le reste du réseau. La synchronisation prendra un certain temps.

> Étape 6: Démarrez dcrwallet sur le Testnet

Exécutez votre exécutable `dcrwallet` avec la commande `testnet=1` ou `testnet=true` dans le fichier de configuration pour démarrer votre portefeuille sur le testnet. Votre portefeuille se connecte à votre node et commence à synchroniser vos adresses. La synchronisation peut prendre un certain temps.

> Étape 7: Enregistrez-vous sur le site Web de Stakepool

En attendant que votre node/portefeuille se synchronise, visitez [https://teststakepool.decred.org] (https://teststakepool.decred.org) et inscrivez-vous pour un nouveau compte. Passez à l'étape 8.

> Étape 8: Attendez que la node Testnet/Portefeuille se synchronise

Prenez une pause, cela peut prendre un certain temps.

> Étape 9: Créez une adresse de clé publique pour utiliser la Stakepool

La première étape pour utiliser une stakepool est la génération d'une nouvelle adresse de clé publique à utiliser pour générer un script Multisignature 1-of-2. Suivez les instructions sur [https://teststakepool.decred.org/address](https://teststakepool.decred.org/address) pour générer et enregistrer cette adresse. Si vous avez configuré un compte sur une stakepool mainnet, c'est la même chose.

> Étape 10: Importez votre script P2SH Multi-Sig à partir de la Stakepool

Ensuite, vous devez importer un script qui vous permettra de déléguer les droits de vote à la pool. Après avoir terminé l'étape précédente, ce script devrait être disponible à [https://teststakepool.decred.org/tickets](https://teststakepool.decred.org/tickets). Encore une fois, suivez les instructions pour importer le script. Si vous avez configuré un compte sur une stakepool mainnet, c'est la même chose.

> Étape 11: Acquérir des coins Testnet

Ensuite, vous devrez acquérir des coins testnet afin d'acheter des tickets Testnet. Il existe un faucet Testnet officiel situé à [https://faucet.decred.org](https://faucet.decred.org). Entrez une adresse Testnet (on peut récupérer en exécutant la commande `getnewaddress` - des exemples pour chaque système d'exploitation ci-dessous)

    Windows: dcrctl.exe --wallet getnewaddress
    macOS/Linux: ./dcrctl --wallet getnewaddress

> Étape 12: Achetez les tickets Testnet

[Https://teststakepool.decred.org/tickets](https://teststakepool.decred.org/tickets) décrit trois options pour acheter des tickets. Votre meilleur pari est d'utiliser l'achat manuel, afin que vous puissiez acheter des tickets chaque fois que vous en avez besoin.

Exécutez une commande `dcrctl --wallet getstakeinfo` pour voir la difficulté actuelle. C'est le prix actuel du ticket. Ajustez la commande buyticket affichée sur la page des tickets de partage pour tenir compte du prix du ticket actuel.

> Étape 13: Attendez que le vote commence

Tout d'abord, un minimum de 75% de TOUS les votes exprimés dans les derniers blocs 2016 doivent provenir d'une node exécutant le dernier logiciel Decred. Ensuite, un bloc d'intervalle de 5040 blocs doit passer avant le début du vote. Cochez [https://hardforkdemo.decred.org] (https://hardforkdemo.decred.org) pour connaître le dernier état de l'ensemble du processus de vote.

> Étape 14: Définissez les votebits de vos tickets via Stakepool

Lors de l'utilisation d'une pool, les tickets que vous achetez ont leurs droits de vote délégués à cette pool. Par défaut, la pool votera comme il convient avec vos tickets. Bien sûr, vous voudrez peut-être modifier la façon dont vos tickets votent.

Vous pouvez définir les votebits de vos tickets via l'interface des tickets de partage. Vous trouverez ci-dessous une capture d'écran de la page [https://teststakepool.decred.org/tickets](https://teststakepool.decred.org/tickets). Au bas de la section "Live/Immature" de cette page, vous verrez les paramètres de vote. Vous ne pouvez modifier que les votes de *tout* vos tickets à la fois via l'interface de la pool. Les tickets affichés ci-dessous ont été définis sur "Oui" pour "Précédent Bloc Valide?" et "Oui" pour "Augmenter la taille du bloc de 1.0 MiB à 1.25MB", ce qui a donné une valeur Votebit de 5.

<img src="/img/testnet-voting_votebit-setting.jpg">

## Une Explication des Votebits

Voici une capture d'écran de toutes les valeurs significatives du votebits pour la version de vote 4:

<img alt="Graph explaining the votebit values of vote version 4." src="/img/testnet-voting_vote-version-4.jpg">

Cette capture d'écran est assez explicite. Dans l'interface de la piscine, si un utilisateur a sélectionné "Oui" pour la taille du bloc augmente et "Oui" pour le bloc précédent étant valide, leurs votes seront réglés sur "5".

Vous trouverez ci-dessous une capture d'écran affichant où les votebits et la version de vote peuvent être trouvés dans une transaction de casting de vote réelle via l'explorateur de bloc à [https://testnet.decred.org](https://testnet.decred.org). Ce crédit a été exprimé avec une valeur Votebit de 5, comme l'indique la 2ieme sortie de transaction.

<img src="/img/testnet-voting_vote-version-and-votebits.jpg">

Vous pouvez facilement vérifier vos votes en cliquant sur le Ticket Hash de la transaction de l'un de vos tickets dans la section "Tickets Votés" de [https://teststakepool.decred.org/tickets](https://teststakepool.decred.org/tickets) page. (NOTE: Votre vote *pourrait* s'afficher en tant que V0 [Version 0] en raison d'un bug dans le code Stakepool - ceci est en cours d'enquête et pourrait même être résolu au moment où ce guide est publié.)

## Site Web Demo Hard Fork

Aux fins de l'affichage de l'état de la nouvelle mise en œuvre du vote, [https://hardforkdemo.decred.org](https://hardforkdemo.decred.org) a été créé. Chaque étape est visualisée par des graphiques et des explications assez simples.
