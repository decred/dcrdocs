# <i class="fa fa-linux"></i> Guide d'Utilisateur Linux

---

## <i class="fa fa-download"></i> Télécharger et extraire cgminer

Visitez https://github.com/decred/cgminer/releases pour trouver la dernière version de cgminer. Pour télécharger et extraire les fichiers via le terminal, exécutez les commandes suivantes. Notez que cet exemple télécharge cgminer v0.0.4.

```no-highlight
~/Decred/$ wget "https://github.com/decred/decred-release/releases/download/v0.0.4_cgminer/cgminer-decred-linux-x86_64-20160208.tar.gz"
~/Decred/$ tar -xvf cgminer*
```

Déplacez-vous dans le nouveau répertoire cgminer:

```
~/Decred/$ cd cgminer*
```

## <i class="fa fa-play-circle"></i> Initialisez et exécutez cgminer

> Première étape

Tapez ce qui suit dans votre fenêtre de terminal pour répertorier votre matériel capable de minage:

```no-highlight
~/Decred/$ ./cgminer -n
```

Vous devriez voir vos cartes vidéo listées soit par leur nom de code GPU, soit par le nom du pilote. La dernière ligne de sortie devrait indiquer le nombre de GPU compatibles avec lesquels vous pouvez exploiter.

> Deuxième étape (facultatif)

Pour comparer votre système et découvrir le hashrate dont vos GPU sont capables, utilisez la commande:

```no-highlight
~/Decred/$ ./cgminer --blake256 --benchmark
```

> Troisième étape

Enregistrez-vous sur l'un des sites Web de la pool et configurez un nouveau mineur pour chacun de vos ordinateurs de minage. Reportez-vous au site Web de la pool de votre choix pour obtenir des instructions, au besoin. Dans la fenêtre de votre terminal depuis la première étape, tapez la commande suivante pour lancer cgminer (ignorez les crochets):

```no-highlight
~/Decred/$ ./cgminer --blake256 -o <pool url>:<port number> -u <web login>.<worker name> -p <worker password>
```

Example:

```no-highlight
~/Decred/$ ./cgminer --blake256 -o http://dcr.maxminers.net:7727 -u DecredMiner.miner1 -p 7@!x5L1
```

> Quatrième étape

cgminer devrait maintenant démarrer. Créez un fichier de configuration de cgminer en appuyant sur les touches suivantes: `S` (Paramètres), `W` (Write Config File), `Enter` (Enregistrer le fichier de configuration comme` cgminer.conf`). Notez que `cgminer.conf` sera placé dans le même répertoire que `cgminer`. Pour ajouter d'autres pools à votre fichier de configuration, ouvrez `cgminer.conf` avec Gedit (GUI) / Pico (CLI) ou un éditeur de texte similaire. Plusieurs pools peuvent être ajoutés en suivant cette syntaxe dans la section "pools" du fichier de configuration (notez la virgule entre chaque entrée de pool individuelle):

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

Enregistrez `cgminer.conf` et fermez `cgminer`. Relance cgminer en utilisant la commande:

```no-highlight
~/Decred/$ ./cgminer
```

Ceci conclut le guide de base du pool cgminer. Pour plus d'informations sur l'utilisation de cgminer et des explications détaillées sur les fonctions du programme, consultez le [Lisez-Moi] officiel (https://github.com/decred/cgminer/blob/3.7/README).
