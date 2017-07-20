# **Différences de ligne de commande à travers le système d'exploitations**

Cette page a été mise à jour pour v0.8.2.

---

Le but de cette page est d'expliquer les principales différences pour l'exécution des applications de ligne de commande multiplate-forme sur Windows, Linux, and macOS/OSX.

---

> Lancer une Commande

La première grande différence dans les applications de ligne de commande (`dcrd`,) C'est la façon dont vous les lancez à partir de la ligne de commande. Ce n'est pas si différent d'un système d'exploitation que de shells. Windows est livré avec Invite de commandes et PowerShell installé. MacOS utilise Bash dans l'application Terminal, et de nombreuses distributions Linux utilisent Bash. Voici des exemples des commandes d'exécution de base pour Bash et Invite de commandes.

**Invite de commandes:** `dcrd.exe`, `dcrwallet.exe`, `dcrctl.exe` <br/>
**Bash:** `./dcrd`, `./dcrwallet`, `./dcrctl`

Certains de nos guides peuvent être OS-agnostiques avec les commandes de lancement. Si un guide dit demarrer `dcrctl --wallet getbalance`, Il s'agit d'utiliser `dcrctl.exe --wallet getbalance` pour Invite de commandes `./dcrctl --wallet getbalance` pour Bash.

> Emplacement des répertoires

L'autre façon dont les clients de la ligne de commande diffèrent est l'emplacement de chaque répertoire d'application (les blocs, les portefeuilles, les fichiers de configuration sont tous stockés dans le répertoire de données). Vous trouverez ci-dessous un tableau des répertoires d'application par défaut pour chaque application.

| OS      | dcrd, dcrwallet, dcrctl App Directories      | 
| -------:|:--------------------------------------------- |
| Windows | `C:\Users\<your-username>\AppData\Local\dcrd\`      |
|         | `C:\Users\<your-username>\AppData\Local\dcrwallet\` | 
|         | `C:\Users\<your-username>\AppData\Local\dcrctl\`    |
| macOS   | `~/Library/Application Support/dcrd/`         |
|         | `~/Library/Application Support/dcrwallet/`    |
|         | `~/Library/Application Support/dcrctl/`       |
| Linux   | `~/.dcrd/`                                    |
|         | `~/.dcrwallet/`                               |
|         | `~/.dcrctl/`                                  |

