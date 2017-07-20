# Démarrage basiques

Ce guide a été mis à jour pour la version v0.8.2

---

Ce guide s'applique aux utilisateurs de l'application de ligne de commande. Les utilisateurs de Paymetheus et Decrediton peuvent sans cesse ignorer l'utilisation des fichiers de configuration - Paymetheus et Decrediton gèrent tous les deux la configuration de base automatiquement. Il est également intéressant de noter que certains de nos guides montrent les paramètres du fichier de configuration et d'autres guides montrent les indicateurs de commande de démarrage. 

---

## Emplacements des fichiers de configuration

Tout le logiciel Decred, lorsqu'il est démarré, lit à partir d'un fichier de configuration pour déterminer les paramètres qu'il doit activer/désactiver/configurer pendant cette charge initiale. Tous les indicateurs de démarrage de la ligne de commande `(ex. dcrwallet --testnet)` peuvent être remplacé par des paramètres dans le fichier de configuration approprié `(ex. dcrwallet --testnet could be replaced by testnet=1 in dcrwallet.conf)`.

Ces fichiers de configuration sont situés avec le répertoire personnel de l'application de l'application. L'emplacement de ces répertoires personnel par défaut pour Windows, MacOS/OSX et Linux est répertorié ci-dessous:

Windows:

    C:\Users\<username>\AppData\Local\Dcrwallet\
    C:\Users\<username>\AppData\Local\Dcrd\
    C:\Users\<username>\AppData\Local\Dcrctl\ 
    C:\Users\<username>\AppData\Local\Decred\Paymetheus

macOS: 

    ~/Library/Application Support/Dcrwallet/
    ~/Library/Application Support/Dcrd/
    ~/Library/Application Support/Dcrctl/
    ~/Library/Application Support/decrediton/
    
Linux: 
    
    ~/.dcrwallet/
    ~/.dcrd/
    ~/.dcrctl/
    ~/.config/decrediton

Chacun de ces dossiers est autorisé à être son propre fichier `.conf` , nommé d'après la demande individuelle (`ex. dcrd uses dcrd.conf`). Notez également que les répertoire d'accueil `Dcrd` et` Dcrwallet` sont automatiquement créés lorsque chaque application est lancée pour la première fois. Vous devrez créer manuellement un répertoire personnel `Dcrctl` pour utiliser un fichier de configuration.

La méthode d'installation [dcrinstall](/getting-started/install-guide.md#dcrinstall) crée automatiquent des fichiers de configuration, avec le [minimum configuration settings](#minimum-configuration) déjà activé. 

La méthode d'installation [Binary Release](/getting-started/install-guide.md#binary-releases) inclus des exemples de fichiers de configuration dans le fichier .zip/.tar.gz. Il est recommandé de copier ces fichiers de configuration dans le répertoire approprié décrit ci-dessus, et de les renommer pour supprimer 'sample-'. Ces fichiers ont beaucoup de paramètres commentés (les commentaires ne sont pas lus par le programme pendant l'exécution) afin que tous ces paramètres soient effectivement désactivés. Vous pouvez activer ces paramètres pré-écrits en supprimant simplement le point-virgule avant la ligne.

---

## Configuration Minimum

Au minimum, pour `dcrd`,` dcrwallet` et `dcrctl` pour pouvoir communiquer entre eux, ils doivent être lancés avec la même combinaison rpcuser/rpcpass. Ceci est effectué automatiquement par la méthode [dcrinstall](/getting-started/install-guide.md#dcrinstall) . Pour la configuration manuelle, procédez comme suit:

1. Si les répertoires personnels dépendants du système d'exploitation répertoriés dans la section [configuration files](#configuration-file-locations) ci-dessus n'existent pas, créez-les pour `dcrd`, `dcrwallet`, et `dcrctl`.
2. Copiez le [sample configuration file](https://github.com/decred/dcrd/blob/master/sample-dcrd.conf) de Github, et collez-le dans un nouveau fichier texte. Enregistrez le fichier texte en tant que `dcrd.conf` dans le répertoire principal de` dcrd`.
3. Copiez le [sample configuration file](https://github.com/decred/dcrwallet/blob/master/sample-dcrwallet.conf) de Github, et collez-le dans un nouveau fichier texte. Enregistrez le fichier texte en tant que `dcrwallet.conf` dans `dcrwallet`' répertoire personnel.
4. Créez un fichier texte vide et enregistrez-le en tant que `dcrctl.conf` dans le répertoire personnel de `dcrctl`.
5. Choisissez un nom d'utilisateur et un mot de passe arbitraires, ceux-ci ne seront utilisés que pour chaque application à communiquer via un appel de procédure à distance. La configuration la plus simple est de les rendre égaux.
6. Dans `dcrd.conf`, sous `[Application Options]`, ajoutez les lignes suivantes:<br /><br />
        rpcuser=<chosen-username><br />
        rpcpass=<chosen-password><br /><br />
7. Dans `dcrwallet.conf`, sous `[Application Options]`, ajoutez les lignes suivantes:<br /><br />
        username=<chosen-username><br />
        password=<chosen-password><br /><br />
8. Dans `dcrctl.conf`, ajoutez les lignes suivantes:<br /><br />
        rpcuser=<chosen-username><br />
        rpcpass=c<hosen-password><br /><br />
9. Sauvez les trois fichiers de configuration.

---

## Drapeaux de commande de démarrage

La plupart des paramètres que vous pouvez configurer via le fichier de configuration peuvent également être transmis à l'application en tant que paramètres pendant le lancement. Par exemple, les commandes suivantes du système OS ouvriront `dcrd` pour l'utilisation de Testnet, une alternative à l'utilisation de` testnet=1` dans votre fichier de configuration:

    Windows: dcrd.exe --testnet
    macOS: ./dcrd --testnet
    Linux: ./dcrd --testnet

L'exemple ci-dessus regarderait d'abord le fichier de configuration `dcrd` pour les paramètres, puis regarde la commande exécutable pour activer le paramètre testnet.
---

## Utilisation avancée

[Enregistrement des détails de connexion dans les fichiers de configuration](/advanced/storing-login-details.md) <!-- Ceci contient la même information dans la section Configuration minimale ci-dessus. Pourrais probablement supprimer. ->

[Liste complète des options pour chaque application](/advanced/program-options.md)
