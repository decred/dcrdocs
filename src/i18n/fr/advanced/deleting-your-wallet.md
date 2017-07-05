# <i class="fa fa-hdd-o"></i>Supprimer Votre Portefeuille

Ici quelques raisons pour lequelles vous devriez effacer votre portefeuille.

* Vous devez restorer votre portefeuille depuis la graine.
* Vous n'avez plus la graine et voulez créer un nouveau portefeuille.
* Vous voulez l'enlever d'un ordinateur en particulier.

Premièrement vous devez trouver le répertoire d'application dcrwallet lequel varie selon la plate-forme.
C'est le meme répertoire qui est consacré pour votre [fichier de configuration](/getting-started/startup-basics.md#configuration-files).

Dans ce répertoire, vous devez supprimer le fichier `mainnet/wallet.db`.
Ca enlevera complètement votre portefeuille de cet ordinateur. Pour y accèder
vous devrez restorer la graine originale.

Il est important de noter qu'il est possible (mais pas certain) qu'un
fichier supprimé soit récupéré à l'aide d'un outil récupération de fichiers. Si vous le supprimez pour des raisons de sécurité, vous avez probablement besoin d'utiliser un outil de suppression sécurisé comme [GNU shred] https://www.gnu.org/software/coreutils/manual/html_node/shred-invocation.html).


