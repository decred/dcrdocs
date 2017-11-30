# <i class="fa fa-windows"></i> Guide d'Utilisateur Windows

---

## <i class="fa fa-download"></i> Télécharger et extraire cgminer

Visitez https://github.com/decred/cgminer/releases pour trouver la dernière version de cgminer. Pour Windows 64 bits, téléchargez et extrayez `cgminer-decred-w64_*.zip`. Pour Windows 32 bits, téléchargez et extrayez `cgminer-decred-w32_*.zip`. Extraire tous les fichiers dans un nouveau dossier et ouvrez le nouveau dossier pour afficher les fichiers.

## <i class="fa fa-play-circle"></i> Initialisez et exécutez cgminer

> Première étape

Ouvrez une fenêtre d'invite de commande en tapant `cmd` dans la barre d'adresse en haut de l'explorateur de fichiers qui contient les nouveaux fichiers cgminer et en appuyant sur `Entrer`. Tapez ce qui suit dans votre fenêtre d'invite de commande pour répertorier votre matériel capable d'exploitation minière:

```no-highlight
C:\Decred> cgminer -n
```

Vous devriez voir vos cartes vidéo listées soit par leur nom de code GPU, soit par le nom du pilote. La dernière ligne de sortie devrait indiquer le nombre de GPU compatibles avec lesquels vous pouvez miner.

> Deuxième étape (facultatif)

Pour comparer votre système et découvrir le hashrate qu'il peut effectuer, utilisez la commande:

```no-highlight
C:\Decred> cgminer --blake256 --benchmark
```

> Troisième étape

Enregistrez-vous sur l'un des sites Web de pool et configurez un nouveau mineur pour chacun de vos ordinateurs de minage. Reportez-vous au site Web de la pool de votre choix pour obtenir des instructions, au besoin. Dans votre fenêtre de ligne de commande depuis la première étape, tapez la commande suivante pour lancer cgminer (ignorez les crochets):

```no-highlight
C:\Decred> cgminer --blake256 -o <pool url>:<port number> -u <web login>.<worker name> -p <worker password>
```

Example:

```no-highlight
C:\Decred> cgminer --blake256 -o http://dcr.maxminers.net:7727 -u DecredMiner.miner1 -p 7@!x5L1
```

> Quatrième étape

cgminer devrait maintenant lancer. Créez un fichier de configuration de cgminer en appuyant sur les touches suivantes: `S` (Paramètres), `W` (Write Config File), `Enter` (Enregistrer le fichier de configuration comme` cgminer.conf`). Notez que `cgminer.conf` sera placé dans le même répertoire que `cgminer.exe`. Pour ajouter d'autres pools à votre fichier de configuration, ouvrez `cgminer.conf` avec le bloc-notes ou un éditeur de texte similaire. Utilisez la syntaxe suivante pour effectuer des modifications dans la section "pools" du fichier de configuration (notez la virgule entre chaque entrée de pool individuel):

```no-highlight
"pools" : [
   {
      "url" : "http://dcr.maxminers.net:7727",
      "user" : "Login.Worker",
      "pass" : "password"
   },
   {
      "url" : "http://dcr.suprnova.cc:9110",
      "user" : "Login.Worker",
      "pass" : "password"
   }
]
```

> Cinquième étape

Enregistrez `cgminer.conf` et fermez `cgminer.exe`. Double-cliquez sur le programme cgminer et lancer et charger le fichier de configuration nouvellement créé. Ceci conclut le guide de base du pool cgminer. Pour plus d'informations sur l'utilisation de cgminer et les explications détaillées sur les fonctions du programme, reportez-vous à [cgminer Lisez-Moi](https://github.com/decred/cgminer/blob/3.7/README).
