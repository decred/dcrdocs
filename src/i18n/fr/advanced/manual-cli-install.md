# Manuel d'Installation CLI

---

The newest Binary Releases can be found here: [https://github.com/decred/decred-binaries/releases](https://github.com/decred/decred-binaries/releases). With the exception of the `.msi` and `.dmg` files, they are archives of the latest executable binaries for each release. Although most of this will be unzip and go, instructions are provided for macOS, Linux, and Windows below (assumed proficiency for *BSD users).

> macOS

1. Téléchargez le correct fichier:

    For 32-bit computers, download the `decred-darwin-386-v1.1.0.tar.gz` file. <br />
    For 64-bit computers, download the `decred-darwin-amd64-v1.1.0.tar.gz` file.

2. Naviguez pour télécharger l'emplacement et extrayez le fichier .tar.gz:

    Finder: double-cliquez simplement sur le fichier .tar.gz. <br />
    Terminal: utilisez la commande `tar -xvzf filename.tar.gz`.

    **NOTE**: Si vous utilisez Safari sur MacOS Sierra et que les préférences sont activées, les fichiers .gz et .zip sont automatiquement décompressés après le téléchargement. La commande `tar -xvzf filename.tar.gz` entraîne cette erreur:` tar: Error opening archive: Failed to open 'filename.tar.gz'`. Utilisez `tar -xvzf filename.tar` (supprimez le .gz de la commande précédente).
    
    Both of these should extract the tar into a folder that shares the same name. (`e.g. tar -xvzf decred-darwin-amd64-v1.1.0.tar.gz` should extract to `decred-darwin-amd64-v1.1.0`). It should include `dcrctl`, `dcrd`, `dcrwallet`, `sample-dcrctl.conf`, `sample-dcrd.conf`, and `sample-dcrwallet.conf`.


> Linux

1. Téléchargez le correct fichier:

    For 32-bit computers, download the `decred-linux-386-v1.1.0.tar.gz` file. <br />
    For 64-bit computers, download the `decred-darwin-amd64-v1.1.0.tar.gz` file. <br />
    For 32-bit ARM computers, download the `decred-linux-arm-v1.1.0.tar.gz` file. <br />
    For 64-bit ARM computers, download the `decred-linux-arm64-v1.1.0.tar.gz` file.

2. Naviguez pour télécharger l'emplacement et extrayez le fichier .tar.gz:

    Navigateur de fichiers Ubuntu: il suffit de cliquer avec le bouton droit de la souris sur .tar.gz et sélectionner "Extraire ici". <br />
    Terminal: utilisez la commande `tar -xvzf filename.tar.gz`.
    
    Both of these should extract the tar.gz into a folder that shares the same name. (`e.g. tar -xvzf decred-darwin-amd64-v1.1.0.tar.gz` should extract to `decred-darwin-amd64-v1.1.0`). It should include `dcrctl`, `dcrd`, `dcrwallet`, `sample-dcrctl.conf`, `sample-dcrd.conf`, and `sample-dcrwallet.conf`.

> Windows

Remarque: Windows 7/8/10 prend en charge de manière native les fichiers `.zip`, il est donc préférable d'utiliser le fichier `.zip` afin que les applications tierces ne soient pas requises pour le fichier `.tar.gz`. Des instructions sont fournies pour le fichier `.zip`.

1. Téléchargez le correct fichier:

    For 32-bit computers, download the `decred-windows-386-v1.1.0.zip` file. <br />
    For 64-bit computers, download the `decred-windows-amd64-v1.1.0.zip` file.

2. Accédez au site de téléchargement et décompressez le fichier `.zip`:

    Explorateur de fichiers: cliquez avec le bouton droit de la souris sur le fichier .zip, sélectionnez "Extraire tout ..." et une invite doit ouvrir en demandant l'utilisation du répertoire. La valeur par défaut extraira le `.zip` à un dossier portant le même nom. Il devrait inclure `dcrctl`, `dcrd`, `dcrwallet`,` sample-dcrctl.conf`, `sample-dcrd.conf` et `sample-dcrwallet.conf`.

Si vous décidez de télécharger le fichier `.tar.gz`, il faudra deux extractions séparées dans une application tierce (7-zip, winRAR, etc.) pour accéder aux binaires réels.

---

## Configuration minimale

Au minimum, pour `dcrd`, `dcrwallet` et `dcrctl` pour pouvoir communiquer entre eux, ils doivent être lancés avec la même combinaison rpcuser/rpcpass. Pour la configuration manuelle, procédez comme suit:

1. Si les répertoires personnels dépendants du système d'exploitation répertoriés dans la section [configuration files](#configuration-file-locations) n'existent plus, créez-les pour `dcrd`, `dcrwallet` et `dcrctl`.
2. Using your favourite text editor, create a new file enter the text, `[Application Options]` as the first line. Save it as `dcrd.conf` in `dcrd`'s home directory.
3. Create another new file and add the text `[Application Options]` to the first line as before. Save it as `dcrwallet.conf` in `dcrwallet`'s home directory.
4. Create a third text file and save it as `dcrctl.conf` in `dcrctl`'s home directory. You don't need to add anything to this one right now.
5. Choisissez un nom d'utilisateur et un mot de passe arbitraires, ceux-ci ne seront utilisés que pour chaque application à communiquer via un appel de procédure à distance. La configuration la plus simple est de les rendre égaux.
6. À l'intérieur de `dcrd.conf`, sous `[Options d'application] `, ajoutez les lignes suivantes: <br /> <br />
        `rpcuser=<chosen-username>`<br />
        `rpcpass=<chosen-password>`<br /><br />
7. Dans `dcrwallet.conf`, sous `[Options d'application] `, ajoutez les lignes suivantes: <br /> <br />
        `username=<chosen-username>`<br />
        `password=<chosen-password>`<br /><br />
8. Dans `dcrctl.conf`, ajoutez les lignes suivantes: <br /> <br />
        `rpcuser=<chosen-username>`<br />
        `rpcpass=<chosen-password>`<br /><br />
9. Enregistrez tous les trois fichiers de configuration.

Please see the [sample config](https://github.com/decred/dcrd/blob/master/sampleconfig/sampleconfig.go#L8-L352) for more customisation options.