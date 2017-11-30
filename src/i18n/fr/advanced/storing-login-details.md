# <i class="fa fa-hdd-o"></i>Enregistrer ses Détails de Connection

Tous les paramètres qui sont spécifiés sur la ligne de commande tout en démarrant dcrd,
dcrwallet et dcrctl peuvent également être conservés dans les fichiers de configuration. C'est
une bonne façon de stocker vos informations d'identification de connexion de sorte que vous n'avez pas besoin
pour les inclure dans les scripts ou les taper dans le terminal tous le
temps.

---

## <i class="fa fa-laptop"></i> Configuration Basique des Fichiers 

Si vous ne connaissez pas les bases des fichiers de configuration, reportez-vous aux informations trouvées dans notre page [Startup Options Intro](/getting-started/startup-basics.md#configuration-files) page.

---

## <i class="fa fa-terminal"></i> dcrd.conf 

Choisissez les noms d'utilisateur et mot de passe souhaités dans les étapes suivantes. Vous n'avez pas besoin d'enregistrer ceux-ci
n'importe où et ils ne seront utilisés que pour permettre à `dcrwallet` et` dcrctl` de communiquer avec `dcrd`.

> Utilisation du Fichier de Configuration d'Exemple

Suivez les étapes ci-dessous si vous avez déjà copié les exemples de fichiers de configuration dans leurs répertoires appropriés.

1. Accédez à votre dossier d'application `dcrd` comme décrit dans nos [Startup Options Intro](/getting-started/startup-basics.md#configuration-files).
2. Ouvrez `dcrd.conf` dans un éditeur de texte.
3. Trouvez les lignes suivantes:

    `;rpcuser=` <br />
    `;rpcpass=`

4. Remplacez les lignes en supprimant le point-virgule et ajoutez votre nom d'utilisateur et votre mot de passe choisis aux lignes appropriées.

> Création d'un Nouveau Fichier de Configuration

Suivez les étapes ci-dessous si vous n'avez **pas** copié les fichiers de configuration d'exemple dans leurs répertoires appropriés.

1. Accédez à votre dossier d'application `dcrd` comme décrit ci-dessus dans notre [Startup Options Intro] (/getting-started/startup-basics.md#configuration-files).
2. Créez un nouveau fichier texte.
3. Renommez-le `dcrd.conf`.
3. Ouvrez `dcrd.conf` dans un éditeur de texte.
4. Ajoutez les lignes suivantes:

```no-highlight
[Application Options]

rpcuser=<username>
rpcpass=<password>
```

---

## <i class="fa fa-terminal"></i> dcrwallet.conf 

La procédure pour `dcrwallet.conf` est très similaire à la procédure pour` dcrd.conf`.

Notez que si les valeurs de `username=` et `password=` dans `dcrwallet.conf` ne correspondent pas aux valeurs de `rpcuser=` et `rpcpass=` dans `dcrd.conf`, vous devez définir `dcrdusername=` et `dcrdpassword=` dans `dcrwallet.conf` aux valeurs `rpcuser`/`rpcpass` trouvées dans `dcrd.conf` (il est plus facile de définir tout le nom d'utilisateur/mot de passe le même).

> Utilisation du Fichier de Configuration d'Exemple

Suivez les étapes ci-dessous si vous avez déjà copié les exemples de fichiers de configuration dans leurs répertoires appropriés.

1. Accédez à votre dossier d'application `dcrwallet` comme décrit dans nos [Startup Options Intro](/start-in/startup-basics.md#configuration-files).
2. Ouvrez `dcrwallet.conf` dans un éditeur de texte.
3. Trouvez les lignes suivantes:

    `;username=` <br />
    `;password=`

4. Remplacez les lignes en supprimant le point-virgule et ajoutez votre nom d'utilisateur et votre mot de passe choisis aux lignes appropriées.

> Création d'un nouveau fichier de configuration

Suivez les étapes ci-dessous si vous n'avez **pas** copié les fichiers de configuration d'exemple dans leurs répertoires appropriés.

1. Accédez à votre dossier d'application `dcrwallet` comme décrit dans nos [Startup Options Intro] (/start-in/startup-basics.md#configuration-files).
2. Créez un nouveau fichier texte.
3. Renommez-le `dcrwallet.conf`.
3. Ouvrez `dcrwallet.conf` dans un éditeur de texte.
4. Ajoutez les lignes suivantes:

```no-highlight
[Application Options]

username=<username>
password=<password>
```

Si vous définissez le mot de passe public facultatif pour le portefeuille (le deuxième mot de passe
pendant la création du portefeuille), vous pouvez également l'ajouter à `dcrwallet.conf`:

```no-highlight
walletpass=<yourwalletpassword>
```

Vous ne pouvez pas spécifier votre mot de passe de portefeuille privé dans les fichiers de configuration. Cela doit être entré manuellement avec `dcrctl`.

---

## <i class="fa fa-terminal"></i> dcrctl.conf 

Il est encore plus facile de définir le nom d'utilisateur/mot de passe le même entre `dcrd.conf`,` dcrwallet.conf` et `dcrctl.conf`. Si vous avez utilisé différentes informations d'identification pour dcrwallet, vous devez spécifier une ici et l'autre sur la ligne de commande lors de l'émission de commandes.

> Utilisation du fichier de configuration d'exemple

Suivez les étapes ci-dessous si vous avez déjà copié les exemples de fichiers de configuration dans leurs répertoires appropriés.

1. Accédez à votre dossier d'application `dcrctl` comme décrit dans nos [Startup Options Intro] (/starts-started/startup-basics.md#configuration-files).
2. Ouvrez `dcrctl.conf` dans un éditeur de texte.
3. Trouvez les lignes suivantes:

    `;rpcuser=` <br />
    `;rpcpass=`

4. Remplacez les lignes en supprimant le point-virgule et ajoutez votre nom d'utilisateur et votre mot de passe choisis aux lignes appropriées.

> Création d'un nouveau fichier de configuration

Suivez les étapes ci-dessous si vous n'avez **pas** copié les fichiers de configuration d'exemple dans leurs répertoires appropriés.

1. Accédez à votre dossier d'application `dcrctl` comme décrit dans nos [Startup Options Intro] (/starts-started/startup-basics.md#configuration-files).
2. Créez un nouveau fichier texte.
3. Renommez-le `dcrctl.conf`.
3. Ouvrez `dcrctl.conf` dans un éditeur de texte.
4. Ajoutez les lignes suivantes:

```no-highlight
[Application Options]

rpcuser=<username>
rpcpass=<password>
```

---

## <i class="fa fa-tasks"></i>Options de configuration supplémentaires

Toutes les options de ligne de commande peuvent être placées dans le fichier de configuration.
Les exemples de fichiers de configuration dans le package de publication donnent additionnel
option ou vous pouvez exécuter l'un des programmes avec le drapeau `-h` pour afficher une liste et une description de toutes les options pour l'application spécifiée.

Il existe également une liste complète des options pour chaque application qui peut être trouvée [ici] (/advanced/program-options.md).
