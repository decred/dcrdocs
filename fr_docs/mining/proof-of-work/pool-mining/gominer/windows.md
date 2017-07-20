# **<i class="fa fa-windows"></i> *gominer* Guide d'Utilisateur Pool de Minage Windows **

Ce guide est destiné à la configuration initiale de base de gominer sur une pool de minage à l'aide d'un fichier de configuration, des options plus avancées sont disponibles.

Dernière mise à jour pour les gominers v0.8.0.

---

### **<i class="fa fa-download"></i> Télécharger et extraire *gominer* Binaraires**


> Télécharger le fichier .zip

Visitez [https://github.com/decred/decred-binaries/releases/tag/v0.8.0](https://github.com/decred/decred-binaries/releases/tag/v0.8.0) pour télécharger les binaires Gominer Windows. Dans la section "Téléchargements", vous devriez voir les fichiers suivants:

- `gominer-windows-amd64-cuda-v0.8.0.zip`,
- `gominer-windows-amd64-opencl-v0.8.0.zip`,
- `gominer-windows-amd64-opencladl-v0.8.0.zip`.

Pour les cartes graphiques NVIDIA, téléchargez le fichier `*-cuda-*.zip`. <br />
Pour les cartes graphiques AMD des lignes Radeon et FirePro, téléchargez le fichier`*-opencladl-*.zip` . <br />
Pour d'autres cartes graphiques, téléchargez le fichier `*-opencl-*.zip` .

Extraire ou copier tous les fichiers dans un nouveau dossier. N'oubliez pas le chemin d'accès à ce dossier ou ouvrez une nouvelle fenêtre de l'explorateur de fichiers pour afficher le contenu du dossier (pour le reste de ce tutoriel, nous utiliserons `C:\decred\gominer\` comme exemple). Le contenu de ce dossier devrait être `blake256.cl`, `gominer.exe`, `LICENSE`, `README.md`, et `sample-gominer.conf`.

> Notes d'invite de commande

Pour ceux qui sont nouveaux, familiarisez-vous avec certaines méthodes pour ouvrir une invite de commande dans un répertoire spécifique (dossier):

- Dans File Explorer, accédez à un dossier spécifique, tapez `cmd` dans la barre d'adresse, puis appuyez sur Entrée.
- Dans l'explorateur de fichiers, accédez à un dossier spécifique, cliquez sur le menu déroulant `Fichier`, accédez à l'option `Open command prompt` et sélectionnez `Open command prompt`.
- Cliquez sur le menu Démarrer ou appuyez sur la touche Windows de votre clavier, tapez `cmd` et ouvrez l'application de bureau `command prompt` qui devrait apparaître dans les résultats de la recherche. Modifiez le répertoire actuel dans un dossier spécifique en utilisant la commande `cd`, par exemple Cd C:\decred\gominer\ `. La commande `dir` par elle-même peut être utilisée pour voir le contenu du répertoire actuel.

### **Réglage *gominer* Fichier de Configuration**

> Première étape: choisir un groupe de minage

Avant de commencer cette étape, il est important que vous vous soyez déjà inscrit à un compte de pool de minage (si nécessaire par votre pool de minage, vous devrez créer un travailleur sur le site Web de la pool). Enregistrez le mot de passe et le login de votre travailleur, et l'adresse:port Stratum+tcp de la pool pour une utilisation ultérieure.

Si cela vous est nouveau, voici quelques guides pour créer des travailleurs sur certains des groupes de minage de Decred (AVERTISSEMENT: n'oubliez pas votre code PIN que vous avez défini lors de la création du compte - vous ne pourrez retirer aucun DCR miné sans lui):

- [https://dcr.maxminers.net/index.php?page=gettingstarted](https://dcr.maxminers.net/index.php?page=gettingstarted)
- [https://dcr.suprnova.cc/index.php?page=gettingstarted](https://dcr.suprnova.cc/index.php?page=gettingstarted)
- [https://www2.coinmine.pl/dcr/index.php?page=gettingstarted](https://www2.coinmine.pl/dcr/index.php?page=gettingstarted)
- [https://pool.mn/dcr/index.php?page=gettingstarted](https://pool.mn/dcr/index.php?page=gettingstarted)

> Seconde Étape: Vérifiez l'ID de périphérique

Avant de configurer le fichier de configuration, il est essentiel de savoir quels périphériques, identifiés par les gominers, vous souhaitez utiliser pour le mineur (surtout si vous souhaitez éviter l'extraction avec votre CPU ou IGP). Pour ce faire, ouvrez l'invite de commande à l'emplacement de `gominer.exe` (` par exemple, C: \ decred \ gominer \ `), tapez` gominer.exe -l`, appuyez sur Enter et une liste des périphériques avec lequels vous pouvez miner sera affiché. Enregistrez les ID d'appareil que vous souhaitez utiliser. Astuce: vos cartes vidéo peuvent être listées par leur nom de code.

> Troisième Étape: Modifier le fichier de configuration

Ouvrez le fichier `sample-gominer.conf`. Pour chaque paramètre que nous allons changer, supprimez simplement le point-virgule avant la variable de réglage après le signe `=`.

Dans la section "Paramètres généraux":

- Réglez `devices =` ID# au (s) enregistré en utilisant la commande `gominer.exe -l` à l'étape 2. Plusieurs périphériques doivent être séparés par des virgules, par ex. `Devices = 2,3`.

Dans la section "Paramètres d'exploitation":

- Réglez `pool=` à l'adresse stratum+tcp: port de pool de votre choix, p.ex. decredpool.org utilise `stratum+tcp://stratum.decredpool.org:3333` (AVERTISSEMENT: l'adresse http://:port ne fonctionnera pas avec gominer - stratum+tcp *doit* être utilisé).
- Réglez `pooluser=` au mot de passe de votre travailleur.
- Réglez `poolpass=` au mot de passe de votre travailleur.

Une fois ces modifications apportées, Enregistrer sous ou Enregistrer + Renommer le fichier en tant que gominer.conf.

> Quatrième Étape: copier gominer.conf dans le dossier Local AppData

Dans un nouvel explorateur de fichiers, tapez `%localappdata%\Gominer\` dans la barre d'adresse. Copiez `gominer.conf` de son emplacement original, `e.g. C:\decred\gominer\`, dans `%localappdata%\Gominer\`.

### **Lancer gominer.exe**

Retournez au répertoire qui contient `gominer.exe` et `blake256.cl`, `e.g. C:\decred\gominer\`, et lancez `gominer.exe`. Si tout a été fait correctement, les gominers doivent lire à partir du fichier de configuration, se connecter à la pool et commencer à hacher avec les périphériques spécifiés. Vous commencerez à voir les messages défilants, y compris les statistiques sur votre hash de chaque périphérique, les parties acceptées, rejetées, périmées et total envoyées.

S'il y a une erreur de connexion, il est probable que la `pool`, `pooluser` ou `poolpass` est incorrectement configuré.

Si gominer commence à se hacher sur un périphérique que vous ne vouliez pas utiliser, il est probable que le paramètre `devices` soit mal configuré.

Si les deux problèmes ci-dessus existent, il est probable que le fichier de configuration soit nommé incorrectement (doit être nommé `gominer.conf`) ou situé dans le mauvais répertoire (doit être dans `%localappdata%\Gominer\`).

### **Vous amuser avec le site Web de votre pool**

Maintenant que votre gominer est hachage pour vous, vous avez le temps de consulter le site Web de votre pool. La plupart des pools ont un tableau de bord sur leur site Web que vous pouvez utiliser pour trouver des statistiques sur le pool, le réseau et le cycle actuel (temps écoulé entre chaque bloc trouvé par le pool). De plus, une fois que vous recevez un paiement suffisamment important, vous pouvez retirer vos coin à l'aide de la page Edit Account en définissant une adresse de paiement DCR et en définissant un seuil de paiement automatique ou en choisissant de retirer votre solde total du compte.

### **Helpful Hints**

*Pour OpenCL et OpenCL ADL versions du gominer*, gominer calcule automatiquement un WorkSize qui aboutit à l'exécution de l'algorithme de travail tous les 500ms. La modification des paramètres Intensity/WorkSize dans `gominer.conf` entraînera un problème connu: l'algorithme s'exécutera à un rythme beaucoup plus rapide en raison de la taille réduite (cela n'entraînera pas l'apparition de plus d'actions), ce qui entraînera une utilisation accrue de mémoire parfois aussi élevé que 10 Mo/sec. Cela entraîne finalement que votre système ne dispose plus d'espace RAM et se termine automatiquement avec le gominer. Il est préférable de laisser ces paramètres seul et de permettre aux gominers de calculer leur propre WorkSize.