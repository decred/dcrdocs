# Guide d'Installation

Ce guide a été mis à jour pour v0.8.2.

---

Il existe cinq méthodes pour télécharger et installer le logiciel Decred. 

* [L'Installateur Windows](#paymetheus) (.msi) - Cela ne fonctionne que pour l'installation de Paymetheus sur Windows.
* [dcrinstall](#dcrinstall) - Installateur / programmeur automatique multiplate-forme pour les applications de ligne de commande (`dcrd`, `dcrwallet`, and `dcrctl`).
* [Decrediton](#decrediton) - Pour installer decrediton sur Linux ou Mac.
* Installation manuelle et configuration du précompilé [Délivrance binaires](#binary-releases) pour les applications de ligne de commande multiplate-forme.
* Compilation à partir de la source.

Les quatre premières méthodes seront couvertes ici et la cinquième peut être ajoutée à une date ultérieure. 

---

## **Paymetheus** 

L'Installateur Windows (`.msi` fichier) est situeé ici: [https://github.com/decred/decred-binaries/releases](https://github.com/decred/decred-binaries/releases). Il installera Paymetheus dans le dossier Program Files de votre ordinateur. L'installation est plutôt simple, mais les instructions sont fournies ci-dessous:

1. Téléchargez le fichier correct:

    Pour les ordinateurs 32 bits, téléchargez le fichier `decred_0.8.2-beta_x86.msi` . <br />
    Pour les ordinateurs 64 bits, téléchargez le fichier `decred_0.8.2-beta_x64.msi` .

2. Accédez au site de téléchargement et double-cliquez sur le fichier `.msi` .

3. Suivez les étapes d'installation. Dans ce processus, vous serez invité à accepter un contrat final de licence d'utilisateur.

4. Après la configuration, les fonctionnalités doivent être installées sur votre dossier `..\Program Files\Decred\` et accessible via le menu Démarrer (recherchez `Decred` dans la liste de programmes)

---

## **dcrinstall**

`dcrinstall` est un programme d'installation et de mise à jour automatique pour le logiciel Decred. La version la plus récente peut être trouvée ici: [https://github.com/decred/decred-release/releases](https://github.com/decred/decred-release/releases). Des fichiers binaires sont fournis pour Windows, OSX/MacOS, Linux, OpenBSD et FreeBSD. Exécuter l'installateur va installer `dcrd`, `dcrwallet`, et `dcrctl`. Des instructions sont fournies pour Mac, Linux et Windows ci-dessous (compétence supposée pour les utilisateurs *BSD).

Cette méthode est recommandée pour l'installation manuelle traditionnelle. `dcrinstall` téléchargera automatiquement le paquet binaire signé et précompilé trouvé sur Github, vérifiez la signature de ce paquet, copiez les binaires dans le paquet dans un dossier spécifique dépendant du système d'exploitation, créez des fichiers de configuration avec des paramètres permettant aux 3 applications de communiquer entre eux, et vous démarrez le processus de création de portefeuille. Après avoir traversé `dcrinstall`, vous pourrez lancer le logiciel sans configuration supplémentaire.

> OSX/macOS:

1. Téléchargez le correct fichier:

    Pour les ordinateurs 32 bits, téléchargez le fichier `dcrinstall-darwin-386-v0.8.2` . <br />
    Pour les ordinateurs 64 bits, téléchargez le fichier `dcrinstall-darwin-amd64-v0.8.2` .

2. Faites un fichier exécutable dcrinstall-darwin-xxxx-vx.x.x  dans votre terminal et exécutez-le:

    Accédez au répertoire où le fichier dcrinstall a été téléchargé à l'aide de la commande `cd`, exécutez chmod avec u+x mode sur le fichier dcrinstall et exécutez l'exécutable créé. Voici un exemple des commandes (modifier les répertoires ou le nom de fichier au besoin):
    
    `cd ~/Downloads/` <br />
    `chmod u+x dcrinstall-darwin-amd64-v0.8.2` <br />
    `./dcrinstall-darwin-amd64-v0.8.2`
    
3. Les exécutables binaires pour `dcrd`, `dcrwallet`, et `dcrctl` peuvent maintenant être trouvés dans le répertoire `~/decred/` . Avant que le processus `dcrinstall` ne se termine, vous serez amené à l'invite de création de portefeuille. Suivez les étapes [Procédure pas à pas de la création d'un  portefeuille](/getting-started/user-guides/dcrwallet-setup.md#wallet-creation-walkthrough) du guide d'installation dcrwallet pour terminer.

> Linux:

1. Téléchargez le correct fichier:

    Pour les ordinateurs 32 bits, téléchargez le fichier `dcrinstall-linux-386-v0.8.2` . <br />
    Pour les ordinateurs 64 bits, téléchargez le fichier `dcrinstall-linux-amd64-v0.8.2` . <br />
    Pour les ordinateurs 32 bits ARM, téléchargez le fichier `dcrinstall-linux-arm-v0.8.2` . <br />
    Pour les ordinateurs 64 bits ARM, téléchargez le fichier `dcrinstall-linux-arm64-v0.8.2` .

2. Faites un fichier exécutable dcrinstall-darwin-xxxx-vx.x.x  dans votre terminal et exécutez-le:

    Accédez au répertoire où le fichier dcrinstall a été téléchargé à l'aide de la commande `cd`, exécutez chmod avec u+x mode sur le fichier dcrinstall et exécutez l'exécutable créé. Voici un exemple des commandes (modifier les répertoires ou le nom de fichier au besoin):
    
    `cd ~/Downloads/` <br />
    `chmod u+x dcrinstall-linux-amd64-v0.8.2` <br />
    `./dcrinstall-linux-amd64-v0.8.2` 
    
3. Les binaires pour `dcrd`, `dcrwallet`, et `dcrctl`  `~/decred/` peuvent maintenant être trouvés dans le répertoire. Avant que le processus `dcrinstall` ne se termine, vous serez amené à l'invite de création de portefeuille. Suivez les étapes [Wallet Creation Walkthrough](/getting-started/user-guides/dcrwallet-setup.md#wallet-creation-walkthrough) du guide d'installation dcrwallet pour terminer.

> Windows:

1. Téléchargez le correct fichier:

    Pour les ordinateurs 32 bits, téléchargez le fichier `dcrinstall-windows-386-v0.8.2.exe` . <br /> 
    Pour les ordinateurs 64 bits, téléchargez le fichier `dcrinstall-windows-amd64-v0.8.2.exe` . <br />

2.  Exécutez le fichier exécutable dcrinstall.

    Vous pouvez double-cliquer ou l'exécuter à partir de l'invite de commande. 
    
3. Les binaires pour `dcrd`, `dcrwallet`, et `dcrctl` peuvent maintenant être trouvés dans le répertoire `%HOMEPATH%\decred\` (habituellement est %HOMEPATH% `C:\Users\username`). Avant que le processus `dcrinstall` ne se termine, vous serez amené à l'invite de création de portefeuille. Suivez les étapes [Wallet Creation Walkthrough](/getting-started/user-guides/dcrwallet-setup.md#wallet-creation-walkthrough) du guide d'installation dcrwallet pour terminer.

---

## **Decrediton**

Decrediton est publié avec les versions binaire et peut être trouvé ici: [https://github.com/decred/decred-binaries/releases](https://github.com/decred/decred-binaries/releases). Comme pour v0.8.2, Decrediton est uniquement disponible pour Linux et Mac et est techniquement une version alpha. Il existe des problèmes connus dans le logiciel sur lequel on travaille.

> macOS/OSX

1. Téléchargez le fichier `decrediton-0.8.2.dmg` .

2. ouble-cliquez sur le fichier `decrediton-0.8.2.dmg` une fois téléchargé pour monter l'image du disque.

3. Faites glisser le decrediton.app dans le lien vers votre dossier Applications dans l'image du disque.

> Linux

1. Téléchargez le fichier `decrediton-0.8.2.tar.gz` .

2. Naviguez à cet emplacement pour télécharger et extraire .tar.gz :

    Navigateur de fichiers Ubuntu: cliquez simplement sur le bouton droit de la souris sur le fichier .tar.gz et appuyez "Extraire ici". <br />
    Terminal: utilisez la commande `tar -xvzf filename.tar.gz` . 
    
    Les deux doivent être extrait le tar.gz dans un dossier qui partage le même nom. (`P.ex.. tar -xvzf decrediton-v0.8.2.tar.gz` devrait être extrait dans `decrediton-v0.8.2`). Si elle est réussie, ce nouveau dossier devrait inclure un éxecutable `decrediton` .


---

## **Délivrance binaires**

Les dernières délivrance binaires se trouvent ici: [https://github.com/decred/decred-binaries/releases](https://github.com/decred/decred-binaries/releases). À l'exception des fichiers `.msi` et` .dmg`, ce sont des archives des derniers binaires exécutables pour chaque version. Bien que la majeure partie sera unzip et go, des instructions sont fournies pour Mac, Linux et Windows ci-dessous (compétence supposée pour utilisateurs *BSD ).

> OSX/macOS

1. Téléchargez le correct fichier:

    Pour les ordinateurs 32 bits, téléchargez le fichier `decred-darwin-386-v0.8.2.tar.gz` . <br />
    Pour les ordinateurs 64 bits, téléchargez le fichier `decred-darwin-amd64-v0.8.2.tar.gz` .

2. Naviguez à cet emplacement pour télécharger et extraire le fichier .tar.gz :

    Finder: double-cliquez simplement sur le fichier .tar.gz. <br />
    Terminal: utilisez la commande `tar -xvzf filename.tar.gz` . 

    **NOTE**: Si vous utilisez Safari sur MacOS Sierra et que les préférences de téléchargement de fichier 'Open "safe" activées après le téléchargement, .gz and .zip les fichiers seront automatiquement décompressés après téléchargement. La commande `tar -xvzf filename.tar.gz` entraîne cette erreur: `tar: Error opening archive: Failed to open 'filename.tar.gz'`. Use `tar -xvzf filename.tar` à la place (supprimez le .gz de la commande précédente).
    
    Ces deux éléments devraient extraire le tar dans un dossier qui partage le même nom. (`e.g. tar -xvzf decred-darwin-amd64-v0.8.2.tar.gz` devraient extraire dans `decred-darwin-amd64-v0.8.2`). Il devrait inclure `dcrctl`, `dcrd`, `dcrwallet`, `sample-dcrctl.conf`, `sample-dcrd.conf`, et `sample-dcrwallet.conf`.


> Linux

1. Téléchargez le correct fichier:

    Pour les ordinateurs 32 bits, téléchargez le fichier `decred-linux-386-v0.8.2.tar.gz` . <br />
    Pour les ordinateurs 64 bits, téléchargez le fichier `decred-darwin-amd64-v0.8.2.tar.gz` . <br />
    Pour les ordinateurs 32 bits ARM, téléchargez le fichier `decred-linux-arm-v0.8.2.tar.gz` . <br />
    Pour les ordinateurs 364 bits ARM, téléchargez le fichier `decred-linux-arm64-v0.8.2.tar.gz` .

2. Naviguez à cet emplacement pour télécharger et extraire le fichier .tar.gz :

    Navigateur de fichiers Ubuntu: cliquez simplement sur le bouton droit de la souris sur le fichier .tar.gz et appuyez "Extraire ici". <br />
    Terminal: Utilisez la commande `tar -xvzf filename.tar.gz` . 
    
    Ces deux éléments devraient extraire le tar dans un dossier qui partage le même nom. (`e.g. tar -xvzf decred-darwin-amd64-v0.8.2.tar.gz` devraient extraire dans `decred-darwin-amd64-v0.8.2`). Il devrait inclure `dcrctl`, `dcrd`, `dcrwallet`, `sample-dcrctl.conf`, `sample-dcrd.conf`, et `sample-dcrwallet.conf`.

> Windows

Note: Windows 7/8/10 Apporte nativement un soutien pour les fichiers `.zip` , il est donc préférable d'utiliser le fichier `.zip` afin que les applications tierces ne soient pas requises pour le fichier` .tar.gz`. Des instructions sont fournies pour le fichier `.zip` .

1. Téléchargez le correct fichier:

    Pour les ordinateurs 32 bits, téléchargez le fichier `decred-windows-386-v0.8.2.zip` . <br />
    Pour les ordinateurs 64 bits, téléchargez le fichier `decred-windows-amd64-v0.8.2.zip` .

2. Naviguez à cet emplacement pour télécharger et extraire le fichier `.zip` :

    Explorateur de fichiers: cliquez avec le bouton droit de la souris sur le fichier `.zip`, sélectionnez "Extraire tout ..." et une invite doit s'ouvrir en demandant l'utilisation du répertoire. La valeur par défaut extraira le `.zip` dans un dossier portant le même nom. Il devrait inclure `dcrctl`, `dcrd`, `dcrwallet`, `sample-dcrctl.conf`, `sample-dcrd.conf`, et `sample-dcrwallet.conf`.

Si vous décidez de télécharger le fichier `.tar.gz`, il faudra deux extractions séparées dans une application tierce (7-zip, winRAR, etc..) pour accéder aux binaires actuelles.

---
