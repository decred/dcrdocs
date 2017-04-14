# **<i class="fa fa-hdd-o"></i> Enregistrement des détails de connexion**

Tous les paramètres qui sont spécifiés sur la ligne de commande pendant que vous démarrez dcrd,
Dcrwallet et dcrctl peuvent également être conservés dans les fichiers de configuration. C'est une bonne façon de stocker vos informations d'identification de connexion afin que vous n'ayez pas besoin de les inclure dans les scripts ou les taper dans le terminal tous les
temps.

---

## **<i class="fa fa-laptop"></i> Principes de base du fichier de configuration**

Si vous ne connaissez pas les bases des fichiers de configuration, consultez les informations trouvées dans notre [Introduction aux options de démarrage](/getting-started/startup-basics.md#configuration-files) page.

---

## **<i class="fa fa-terminal"></i> dcrd.conf**

Choisissez le nom d'utilisateur et le mot de passe souhaité dans les étapes suivantes. Vous n'avez pas besoin de les enregistrer et ils ne seront utilisés que pour permettre à `dcrwallet` et` dcrctl` de communiquer avec `dcrd`.

> Utiliser du fichier de configuration d'exemple

Suivez les étapes ci-dessous si vous avez déjà copié les exemples de fichiers de configuration dans leurs répertoires appropriés.

1. Accédez à votre dossier d'application `dcrd` comme décrit dans notre [Introduction aux options de démarrage](/getting-started/startup-basics.md#configuration-files). 
2. Ouvrir `dcrd.conf` dans l'éditeur de texte.
3. Trouver les lignes suivantes:

    `;rpcuser=` <br />
    `;rpcpass=`

4. Décomment les lignes en supprimant le point-virgule et ajoutez le nom d'utilisateur et le mot de passe choisis aux lignes appropriées.

> Création d'un nouveau fichier de configuration

Suivez les étapes ci-dessous si vous n'avez *pas* copié les example de fichiers de configuration dans leurs répertoires appropriés.

1. Accédez à votre dossier d'application `dcrd` comme décrit ci-dessus dans notre [Introduction aux options de démarrage](/getting-started/startup-basics.md#configuration-files).
2. Créez un nouveau fichier texte.
3. Renommez-le `dcrd.conf`.
3. Ouvrez `dcrd.conf` dans un éditeur de texte.
4. Ajoutez les lignes suivantes:

```no-highlight
[Options de l'application]

rpcuser=<username>
rpcpass=<password>
```

---

## **<i class="fa fa-terminal"></i> dcrwallet.conf**

La procédure pour `dcrwallet.conf` est très similaire à la procédure pour` dcrd.conf`.

Veuillez noter que si les valeurs de `username=` et `password=` dans `dcrwallet.conf` Ne correspondent pas aux valeurs de `rpcuser=` et `rpcpass=` dans  `dcrd.conf`, voud devrez régler `dcrdusername=` et `dcrdpassword=`  dans `dcrwallet.conf` aux `rpcuser`/`rpcpass` valeurs trouvées dans `dcrd.conf` (Il est plus facile de définir le même nom d'utilisateur / mot de passe).

> Utiliser les exemple du fichier de configuration

Suivez les étapes ci-dessous si vous avez déjà copié les exemples de fichiers de configuration dans leurs répertoires appropriés.

1. Accédez à votre dossier d'application `dcrwallet` comme décrit dans notre [Introduction aux options de démarrage](/getting-started/startup-basics.md#configuration-files). 
2. Ouvrir `dcrwallet.conf` dans un éditeur de texte.
3. Trouver les lignes suivantes:

    `;username=` <br />
    `;password=`

4. Décomment les lignes en supprimant le point-virgule et ajoutez le nom d'utilisateur et le mot de passe choisis aux lignes appropriées.

> Création d'un nouveau fichier de configuration

Suivez les étapes ci-dessous si vous n'avez ** pas ** copié les exemples de fichiers de configuration dans leurs répertoires appropriés.

1. Accédez à votre dossier d'application `dcrwallet` comme décrit dans notre [Intro d'options de démarrage](/getting-started/startup-basics.md#configuration-files).
2. Créez un nouveau fichier texte.
3. Renommez-le `dcrwallet.conf`.
3. Ouvrez `dcrwallet.conf` dans un éditeur de texte.
4. Ajoutez les lignes suivantes:

```no-highlight
[Options de l'application]

username=<username>
password=<password>
```

Si vous définissez le mot de passe public facultatif pour le portefeuille (le deuxième mot de passe pendant la création du portefeuille), vous pouvez également ajouter cela à `dcrwallet.conf`:

```no-highlight
walletpass=<yourwalletpassword>
```

Vous ne pouvez pas spécifier votre mot de passe de portefeuille privé dans les fichiers de configuration. Cela doit être saisi manuellement avec `dcrctl`. 

---

## **<i class="fa fa-terminal"></i> dcrctl.conf**

Il est encore plus facile de définir le nom d'utilisateur / mot de passe le même entre `dcrd.conf`,` dcrwallet.conf` et `dcrctl.conf`. Si vous avez utilisé différentes informations d'identification pour dcrwallet, vous devez en spécifier un ici et l'autre sur la ligne de commande lors de l'émission de commandes.

> Utiliser les exemple du fichier de configuration

Suivez les étapes ci-dessous si vous avez déjà copié les exemples de fichiers de configuration dans leurs répertoires appropriés.

1. Naviguez vers votre dossier d'application `dcrctl` comme décrit dans notre [Introduction aux options de démarrage](/getting-started/startup-basics.md#configuration-files). 
2. Ouvrir `dcrctl.conf` dans un éditeur de texte.
3. Trouver les lignes suivantes:

    `;rpcuser=` <br />
    `;rpcpass=`

4. Décomment les lignes en supprimant le point-virgule et ajoutez le nom d'utilisateur et le mot de passe choisis aux lignes appropriées.

> Création d'un nouveau fichier de configuration

Suivez les étapes ci-dessous si vous n'avez *pas* copié les fichiers de configuration d'échantillons dans leurs répertoires appropriés.

1. Naviguez vers votre dossier `dcrctl` comme décrit dans notre [Introduction aux options de démarrage](/getting-started/startup-basics.md#configuration-files).
2. Créez un nouveau fichier texte.
3. Renommez-le `dcrctl.conf`.
3. Ouvrez `dcrctl.conf` dans un éditeur de texte.
4. Ajoutez les lignes suivantes:

```no-highlight
[Options de l'application]

rpcuser=<username>
rpcpass=<password>
```

---

## **<i class="fa fa-tasks"></i> Options de configuration supplémentaires**

Toutes les options de ligne de commande peuvent être placées dans le fichier de configuration.
Les exemples de fichiers de configuration dans le package de publication donnent des options supplémentaires ou vous pouvez exécuter l'un des programmes avec l'option `-h` pour afficher une liste et une description de toutes les options pour l'application spécifiée.

Il existe également une liste complète d'options pour chaque application qui peut être trouvée [ici](/advanced/storing-login-details.md).
