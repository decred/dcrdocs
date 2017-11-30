# Guide d'installation CLI

Cette page a été mise à jour pour la version v1.0.1.

---

## dcrinstall 

`dcrinstall` est la méthode recommandée pour installer les outils d'interface de ligne de commande Decred `dcrd`, `dcrwallet` et `dcrctl`.

`dcrinstall` is an automatic installer and upgrader for the Decred software. The newest release can be found here: [https://github.com/decred/decred-release/releases/tag/v1.1.0](https://github.com/decred/decred-release/releases/tag/v1.1.0). Binaries are provided for Windows, macOS, Linux, OpenBSD, and FreeBSD. Executing installer will install `dcrd`, `dcrwallet`, and `dcrctl`. Instructions are provided for macOS, Linux, and Windows below (assumed proficiency for *BSD users).

`Dcrinstall` téléchargera automatiquement le paquetage binaire signé et précompilé trouvé sur GitHub, vérifiez la signature de ce paquet, copiez les fichiers binaires dans le package dans un dossier spécifique dépendant du système d'exploitation, créez des fichiers de configuration avec des paramètres permettant aux 3 applications de communiquer avec l'un l'autre, et vous exécuter à travers le processus de création de portefeuille. Après avoir parcouru `dcrinstall`, vous pourrez lancer le logiciel sans configuration supplémentaire.

> macOS:

1. Téléchargez le correct fichier:

    For 32-bit computers, download the `dcrinstall-darwin-386-v1.1.0` file. <br />
    For 64-bit computers, download the `dcrinstall-darwin-amd64-v1.1.0` file.

2. Faites de dcrinstall-darwin-xxxx-vx.x.x un fichier exécutable dans votre terminal et exécutez-le:

    Accédez au répertoire où le fichier dcrinstall a été téléchargé à l'aide de la commande `cd`, exécutez chmod avec le mode u+x sur le fichier dcrinstall et exécutez l'exécutable créé. Voici un exemple des commandes (modifier les répertoires ou le nom du fichier au besoin):
    
    `cd ~/Downloads/` <br />
    `chmod u+x dcrinstall-darwin-amd64-v1.1.0` <br />
    `./dcrinstall-darwin-amd64-v1.1.0`
    
3. Les fichiers binaires exécutables pour `dcrd`, `dcrwallet` et `dcrctl` peuvent maintenant être trouvés dans le répertoire `~/decred/`. Avant de terminer le processus `dcrinstall`, vous serez pris à l'invite de création de portefeuille. Suivez les étapes dans la [Procédure de Démarrage du Portefeuille](/getting-started/user-guides/dcrwallet-setup.md#wallet-creation-walkthrough) du guide de configuration dcrwallet pour terminer.

> Linux:

1. Téléchargez le correct fichier:

    For 32-bit computers, download the `dcrinstall-linux-386-v1.1.0` file. <br />
    For 64-bit computers, download the `dcrinstall-linux-amd64-v1.1.0` file. <br />
    For 32-bit ARM computers, download the `dcrinstall-linux-arm-v1.1.0` file. <br />
    For 64-bit ARM computers, download the `dcrinstall-linux-arm64-v1.1.0` file.

2. Faites de dcrinstall-linux-xxxx-vx.x.x un fichier exécutable dans votre terminal et exécutez-le:

    Accédez au répertoire où le fichier dcrinstall a été téléchargé à l'aide de la commande `cd`, exécutez chmod avec le mode u+x sur le fichier dcrinstall et exécutez l'exécutable créé. Voici un exemple des commandes (modifier les répertoires ou le nom du fichier au besoin):
    
    `cd ~/Downloads/` <br />
    `chmod u+x dcrinstall-linux-amd64-v1.1.0` <br />
    `./dcrinstall-linux-amd64-v1.1.0`
    
3. Les fichiers binaires pour `dcrd`, `dcrwallet` et `dcrctl` peuvent maintenant être trouvés dans le répertoire `~/decred/`. Avant de terminer le processus `dcrinstall`, vous serez pris à l'invite de création de portefeuille. Suivez les étapes dans la [Procédure de démarrage du Portefeuille](/getting-started/user-guides/dcrwallet-setup.md#wallet-creation-walkthrough) du guide de configuration dcrwallet pour terminer.

> Windows:

1. Téléchargez le correct fichier:

    For 32-bit computers, download the `dcrinstall-windows-386-v1.1.0.exe` file. <br />
    For 64-bit computers, download the `dcrinstall-windows-amd64-v1.1.0.exe` file. <br />

2.  Exécutez le fichier exécutable dcrinstall.

    Vous pouvez double-cliquer ou l'exécuter à partir de l'invite de commande.
    
3. Les fichiers binaires pour `dcrd`, `dcrwallet` et `dcrctl` peuvent maintenant être trouvés dans le répertoire`%HOMEPATH%\decred\` (généralement %HOMEPATH% is `C:\Users\<username>`). Avant de terminer le processus `dcrinstall`, vous serez pris à l'invite de création de portefeuille. Suivez les étapes dans la [Procédure de démarrage du Portefeuille](/getting-started/user-guides/dcrwallet-setup.md#wallet-creation-walkthrough) du guide de configuration dcrwallet pour terminer.
