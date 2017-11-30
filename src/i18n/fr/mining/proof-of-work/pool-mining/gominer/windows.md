# <i class="fa fa-windows"></i> *gominer* Guide d'Utilisateur de Pool de Minage Windows

Ce guide est destiné à la configuration initiale de base de gominer sur une pool de minage de votre choix à l'aide d'un fichier de configuration, des options plus avancées sont disponibles.

Dernière mise à jour pour gominer v1.0.0.

---

### <i class="fa fa-download"></i> Télécharger et extraire *gominer* Binary


>Download .zip File

Visitez [https://github.com/decred/decred-binaries/releases/tag/v1.0.0](https://github.com/decred/decred-binaries/releases/tag/v1.0.0) pour télécharger le Binaires gominer Windows. Dans la section "Téléchargements", vous devriez voir les fichiers suivants:

- `gominer-windows-amd64-cuda-v1.0.0.zip`,
- `gominer-windows-amd64-opencl-v1.0.0.zip`,
- `gominer-windows-amd64-opencladl-v1.0.0.zip`.

Pour les cartes graphiques NVIDIA, téléchargez le fichier `*-cuda-*.zip`. <br />
Pour les cartes graphiques AMD des lignes Radeon et FirePro, téléchargez le fichier `*-opencladl-*.zip`. <br />
Pour d'autres cartes graphiques, téléchargez le fichier `*-opencl-*.zip`.

Extraire ou copier tous les fichiers dans un nouveau dossier. N'oubliez pas le chemin d'accès à ce dossier ou ouvrez une nouvelle fenêtre d'Explorateur de Fichiers pour afficher le contenu du dossier (pour le reste de ce tutoriel, nous utiliserons `C:\decred\gominer\` comme exemple). Le contenu de ce dossier doit être `blake256.cl`,` gominer.exe`, `LICENSE`, `README.md` et `sample-gominer.conf`.

> Notes d'invite de commande

Pour ceux qui sont nouveaux, familiarisez-vous avec certaines méthodes pour ouvrir une invite de commande dans un répertoire spécifique (dossier):

- Dans File Explorer, accédez à un dossier spécifique, tapez `cmd` dans la barre d'adresse, puis appuyez sur Entrée.
- Dans l'Explorateur de Fichiers, accédez à un dossier spécifique, cliquez sur le menu déroulant "Fichier", accédez à l'option "Ouvrir la commande" et sélectionnez "Ouvrir l'invite de commande".
- Cliquez sur le menu démarrer ou appuyez sur la touche Windows de votre clavier, tapez `cmd` et ouvrez l'application de bureau "Invite de Commandes" qui devrait apparaître dans les résultats de recherche. Modifiez le répertoire actuel dans un dossier spécifique en utilisant la commande `cd`, par `exemple cd C:\decred\gominer\`. La commande `dir` par elle-même peut être utilisée pour voir le contenu du répertoire actuel.

### Configurer * gominer * Fichier de Configuration

> Étape 1: Choisissez une Pool de Minage

Avant de commencer cette étape, il est important que vous vous soyez déjà inscrit à un compte de pool minier (si nécessaire par votre pool de minage, vous devrez créer un robot sur le site Web de la pool). Enregistrez le mot de passe et le mot de passe de votre travail et l'emplacement Stratum+tcp de la pool: port pour une utilisation ultérieure.

Si cela vous est nouveau, voici quelques guides pour créer des travailleurs sur certains des groupes miniers de Decred (AVERTISSEMENT: n'oubliez pas votre code PIN que vous avez défini lors de la création du compte - vous ne pourrez pas retirer un DCR miné sans celui-ci):

- [https://dcr.maxminers.net/index.php?page=gettingstarted](https://dcr.maxminers.net/index.php?page=gettingstarted)
- [https://dcr.suprnova.cc/index.php?page=gettingstarted](https://dcr.suprnova.cc/index.php?page=gettingstarted)
- [https://www2.coinmine.pl/dcr/index.php?page=gettingstarted](https://www2.coinmine.pl/dcr/index.php?page=gettingstarted)
- [https://pool.mn/dcr/index.php?page=gettingstarted](https://pool.mn/dcr/index.php?page=gettingstarted)

> Étape 2: Vérifiez l'ID du périphérique

Avant de configurer le fichier de configuration, il est essentiel de savoir quels périphériques, identifiés par gominer, vous souhaitez utiliser pour le minage (surtout si vous souhaitez éviter de miner avec votre CPU ou IGP). Pour ce faire, ouvrez l'invite de commande à l'emplacement de `gominer.exe` (` par exemple, C:\decred\gominer\`), tapez` gominer.exe -l`, appuyez sur Entrée et une liste des périphériques que vous pouvez Le mien avec sera affiché. Enregistrez les ID d'appareil que vous souhaitez utiliser. Astuce: vos cartes vidéo peuvent être listées par leur nom de code.

> Étape 3: Modifier le Fichier de Configuration

Ouvrez le fichier `sample-gominer.conf`. Pour chaque paramètre que nous allons changer, supprimez simplement le point-virgule avant la variable de réglage après le signe `=`.

Dans la section "Paramètres généraux":

- Définissez `devices =` sur le (s) ID de périphérique enregistré en utilisant la commande `gominer.exe -l` à l'étape 2. Plusieurs périphériques doivent être séparés par une virgule, par exemple `Devices=2,3`.

Dans la section "Paramètres d'exploitation":

- Définissez `pool=` sur l'adresse stratum+tcp: port de la pool de minage de votre choix, p. decredpool.org utilise `stratum+tcp://stratum.decredpool.org:3333` (AVERTISSEMENT: http://address:port ne fonctionnera pas avec gominer - stratum+tcp *doit* être utilisé).
- Définissez `pooluser=` sur la connexion de votre robot.
- Définissez `poolpass=` sur le mot de passe de votre robot.

Une fois ces modifications apportées, Enregistrer Sous ou Enregistrer + Renommer le fichier en tant que gominer.conf.

> Étape 4: Copiez gominer.conf dans le dossier Local AppData

Dans un nouvel Explorateur de Fichiers, tapez `%localappdata%\Gominer\` dans la barre d'adresse. Copiez `gominer.conf` de son emplacement original, par `exemple C:\decred\gominer\`, dans`%localappdata%\Gominer\`.

### Lancer gominer.exe

Retournez au répertoire qui contient `gominer.exe` et `blake256.cl`, par `exemple C:\decred\gominer\`, et lancer `gominer.exe`. Si tout a été fait correctement, les gominers doivent lire à partir du fichier de configuration, se connecter à la pool et commencer à hacher avec les périphériques spécifiés. Vous commencerez à voir des messages de défilement, y compris des statistiques sur votre hashrate de chaque périphérique, les pièces acceptées, rejetées, périmées et total envoyées.

S'il y a une erreur de connexion, il est probable que la `pool`, le `pooluser` ou le `poolpass` soit mal configuré.

Si le gominer commence à hacher un périphérique que vous ne vouliez pas utiliser, il est probable que le paramètre `devices` est mal configuré.

Si les deux problèmes ci-dessus existent, il est probable que le fichier de configuration est nommé incorrectement (doit être nommé `gominer.conf`) ou situé dans le mauvais répertoire (doit être dans`%localappdata%\Gominer\`).

### Familiarisez-Vous avec le Site Web de Votre Pool

Maintenant que votre gommier se débrouille pour vous, vous avez le temps de consulter le site Web de votre pool. La plupart des pools ont un tableau de bord sur leur site Web que vous pouvez utiliser pour trouver des statistiques sur la pool, le réseau et le cycle actuel (temps écoulé entre chaque bloc trouvé par le pool). De plus, une fois que vous recevez un paiement suffisamment important, vous pouvez retirer vos pièces de monnaie via la page Modifier le Compte en définissant une adresse de paiement DCR et en définissant un seuil de paiement automatique ou en choisissant de retirer votre solde total du compte.

### Astuces utiles

*Pour les versions OpenCL et OpenCL ADL du gominer*, gominer calcule automatiquement une WorkSize qui aboutit à l'exécution de l'algorithme de travail tous les 500ms. La modification des paramètres Intensity/WorkSize dans `gominer.conf` aboutira à un problème connu: l'algorithme s'exécutera à un rythme beaucoup plus rapide en raison de la WorkSize abaissée (cela n'entraînera pas l'apparition de plus d'actions), ce qui entraînera une utilisation accrue de mémoire parfois aussi élevé que 10 Mo / sec. Cela entraîne finalement l'épuisement de votre espace de RAM et la fermeture automatique de gominer. Il est préférable de laisser ces paramètres seul et de permettre aux gominers de calculer leur propre WorkSize.
