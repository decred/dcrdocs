# Démarrage basiques

This guide was last updated for v1.0.0

---

Ce guide s'applique aux utilisateurs de l'application de ligne de commande. Les utilisateurs de Paymetheus et Decrediton peuvent sans cesse ignorer l'utilisation des fichiers de configuration - Paymetheus et Decrediton gèrent tous les deux la configuration de base automatiquement. Il est également intéressant de noter que certains de nos guides montrent les paramètres du fichier de configuration et d'autres guides montrent les indicateurs de commande de démarrage. 

---

## Emplacements des fichiers de configuration

Tout le logiciel Decred, lorsqu'il est démarré, lit à partir d'un fichier de configuration pour déterminer les paramètres qu'il doit activer/désactiver/configurer pendant cette charge initiale. Tous les indicateurs de démarrage de la ligne de commande `(ex. dcrwallet --testnet)` peuvent être remplacé par des paramètres dans le fichier de configuration approprié `(ex. dcrwallet --testnet could be replaced by testnet=1 in dcrwallet.conf)`.

These configuration files are located within the application home directory of the application. The location of these default home directories for Windows, macOS, and Linux are listed below:

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

## Drapeaux de commande de démarrage

La majorité des paramètres que vous pouvez configurer via le fichier de configuration peuvent également être transmis à l'application en tant que paramètres pendant le lancement. Par exemple, les commandes suivantes du système OS ouvriront `dcrd` pour l'utilisation de Testnet, une alternative à l'utilisation de` testnet=1` dans votre fichier de configuration:

    Windows: dcrd.exe --testnet
    macOS: ./dcrd --testnet
    Linux: ./dcrd --testnet

L'exemple ci-dessus chercherait d'abord le fichier de configuration `dcrd` pour les paramètres, puis regarderait la commande exécutable pour activer le paramètre testnet.

---

## Utilisation avancée

[Storing Login Details in Config Files](/advanced/storing-login-details.md) <!-- Ceci contient les mêmes informations que celles ci-dessus, Section de Configuration Minimale ci-dessus. Peut-être probablement supprimée. -->

[Liste Complète des Options pour Chaque Application](/advanced/program-options.md)
