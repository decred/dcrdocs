# **<i class="fa fa-windows"></i> Windows User Guide**

---

## **<i class="fa fa-cloud"></i> Connect dcrd to the Decred network**

> Première Étape

Note que `dcrd`, `dcrwallet`, et `dcrctl` commandes doivent être exécutées dans le répertoire où se trouvent vos fichiers Decred! Démarrer `dcrd`:

```no-highlight
C:\Decred> dcrd -u <username> -P <password>
```

Démarrer dcrwallet:

```no-highlight
C:\Decred> dcrwallet -u <username> -P <password>
```

> Seconde Étape

Générer une nouvelle adresse portefeuille:

```no-highlight
C:\Decred> dcrctl -u <username> -P <password> --wallet getnewaddress
```

Copier la nouvelle adresse (sortie de la dernière commande). Fermer/Arrêter `dcrd` et `dcrwallet` en pressant `ctrl+c` dans chaque fenêtre.

> Troisième Étape

Redémarrer `dcrd` utilisant commande:

```no-highlight
C:\Decred> dcrd --miningaddr <nouvelle adresse de l'étape 2 ou de votre adresse de portefeuille client en ligne>
```

---

## **<i class="fa fa-download"></i> Télécharger et extraire cgminer**

Visitez https://github.com/decred/cgminer/releases pour trouver la dernière version de cgminer. Pour Windows 64 bit, download and extract `cgminer-decred-w64_*.zip`. For 32-bit Windows, télécharger et extraire `cgminer-decred-w32_*.zip`. Extraire tous les fichiers dans un nouveau dossier et ouvrez le nouveau dossier pour afficher les fichiers.

---

## **<i class="fa fa-play-circle"></i> Initialiser and démarrer cgminer**

> Première Étape

Clic-droit sur `start_local.bat` et clic `Edit`. Modifiez le nom d'utilisateur et le mot de passe pour correspondre aux informations d'identification utilisées à l'étape 1. Sauvez et fermez start_local.bat  Pour référence, ici est la commande dans start_local.bat:

```no-highlight
C:\Decred> cgminer --blake256 -o https://127.0.0.1:9109 -u <username> -p <password> --cert "%LOCALAPPDATA%\Dcrd\rpc.cert"
```

> Seconde Étape

Si dcrd n'est pas fini de se synchroniser avec la chaîne de blocs, attendez qu'elle soit terminée, puis passez à l'étape suivante. Quand il sera terminé, il apparaîtra:

```no-highlight
[INF] BMGR: Processed 1 block in the last 5m34.49s
```

> Troisieème Étape

Double clic sur `start_local.bat`. `cgminer` devrait ouvrir. Créer un `cgminer` fichier de configuration en pressant sur cette touche: `S` (Paramètre), `W` (Écrire le fichier de configuration), `Enter` (Sauvegarder le fichier de configuration comme `cgminer.conf`). Notez que `cgminer.conf` sera placé dans le même répertoire que cgminer. Cgminer peut maintenant être lancé simplement en double-cliquant `cgminer.exe`. Ceci conclut le guide de base solo cgminer. Pour plus d'informations sur l'utilisation de cgminer et des explications détaillées sur les fonctions du programme, consultez le responsable [cgminer Lisezmoi](https://github.com/decred/cgminer/blob/3.7/README).