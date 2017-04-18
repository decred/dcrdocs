# **<i class="fa fa-windows"></i> Guide d'Utilisateur Windows**

---

## **<i class="fa fa-download"></i> Télécharger et extraire cgminer**

Visitez https://github.com/decred/cgminer/releases pour trouver la dernière version de cgminer. pour 64 bit Windows, download and extract `cgminer-decred-w64_*.zip`. For 32-bit Windows, télécharger et extraire `cgminer-decred-w32_*.zip`. Extrayez tous les fichiers dans un nouveau dossier et ouvrez le nouveau dossier pour afficher les fichiers.

## **<i class="fa fa-play-circle"></i> Initialize and run cgminer**

> Première étape

Ouvrez une fenêtre d'invite de commande en tapant `cmd` dans la barre d'adresse en haut de l'explorateur de fichiers qui contient les nouveaux fichiers cgminer et en appuyant sur `Enter`. Tapez ce qui suit dans votre fenêtre d'invite de commande pour répertorier votre matériel de minage capable:

```no-highlight
C:\Decred> cgminer -n
```

Vous devriez voir vos cartes vidéo listées soit par leur nom de code GPU, soit par le nom du pilote. La dernière ligne de sortie devrait indiquer le nombre de GPU compatibles avec lesquels vous pouvez exploiter.

> Deuxième étape (facultatif)

Pour comparer votre système et découvrir le hash qu'il peut effectuer, utilisez la commande:

```no-highlight
C:\Decred> cgminer --blake256 --benchmark
```

> Troisième étape

Enregistrez-vous sur l'un des sites Web de la pool et configurez un nouveau mineur pour chacun de vos ordinateurs de minage. Reportez-vous au site Web de la pool de votre choix pour obtenir des instructions, si nécessaire. Dans votre fenêtre de ligne de commande depuis la première étape, tapez la commande suivante pour lancer cgminer (ignorez les crochets):

```no-highlight
C:\Decred> cgminer --blake256 -o <pool url>:<port number> -u <web login>.<worker name> -p <worker password>
```

Exemple:

```no-highlight
C:\Decred> cgminer --blake256 -o http://dcr.maxminers.net:7727 -u DecredMiner.miner1 -p 7@!x5L1
```

> Quatrième étape

cgminer devrait maintenant être lancé. Créez une configuration de fichier cgminer en pressant la touche suivante: `S` (Réglage), `W` (Écrire un Fichier de Configuration), `Enter` (Sauvegarder le fichier comme `cgminer.conf`). Notez que `cgminer.conf` era placé dans le même répertoire  que `cgminer.exe` Pour ajouter d'autres pools à votre fichier de configuration, ouvrez `cgminer.conf` avec le Bloc-notes ou un éditeur de texte similaire. Utilisez la syntaxe suivante pour effectuer des modifications dans la section "pools" du fichier de configuration (notez la virgule entre chaque entrée de pool individuel):

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

Suvegarder `cgminer.conf` et fermer `cgminer.exe`. Double-cliquez sur le programme cgminer et lancer et charger le fichier de configuration nouvellement créé. Ceci conclut le guide de base du pool cgminer. Pour plus d'informations sur l'utilisation de cgminer et des explications détaillées sur les fonctions du programme, reportez-vous à la [cgminer LisezMoi](https://github.com/decred/cgminer/blob/3.7/README).