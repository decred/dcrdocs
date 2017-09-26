# <i class="fa fa-windows"></i>Guide d'Utilisateur Windows

---

## <i class="fa fa-cloud"></i> Connectez dcrd au réseau Decred

> Première étape

Notez que toutes les commandes `dcrd`, `dcrwallet` et `dcrctl` doivent être exécutées dans le répertoire où se trouvent vos fichiers Decred! Démarrez `dcrd`:

```no-highlight
C:\Decred> dcrd -u <username> -P <password>
```

Démarrez dcrwallet:

```no-highlight
C:\Decred> dcrwallet -u <username> -P <password>
```

> Deuxième étape

Générer une nouvelle adresse de portefeuille:

```no-highlight
C:\Decred> dcrctl -u <username> -P <password> --wallet getnewaddress
```

Copiez la nouvelle adresse (sortie de la dernière commande). Fermer/arrêter `dcrd` et` dcrwallet` en appuyant sur `ctrl+c` dans chaque fenêtre.

> Troisième étape

Redémarrez `dcrd` en utilisant la commande:

```no-highlight
C:\Decred> dcrd --miningaddr <new address from step two or your web client wallet address>
```

---

## <i class="fa fa-download"></i> Télécharger et extraire cgminer

Visitez https://github.com/decred/cgminer/releases pour trouver la dernière version de cgminer. pour 64 bit Windows, download and extract `cgminer-decred-w64_*.zip`. For 32-bit Windows, télécharger et extraire `cgminer-decred-w32_*.zip`. Extrayez tous les fichiers dans un nouveau dossier et ouvrez le nouveau dossier pour afficher les fichiers.

---

## <i class="fa fa-play-circle"></i> Initialiser et démarrer cgminer

> Première étape

Clic-droit sur `start_local.bat` et clic `Edit`. Modifiez le nom d'utilisateur et le mot de passe pour correspondre aux informations d'identification utilisées à l'étape 1. Sauvez et fermez start_local.bat Pour référence, ici est la commande dans start_local.bat:

```no-highlight
C:\Decred> cgminer --blake256 -o https://127.0.0.1:9109 -u <username> -p <password> --cert "%LOCALAPPDATA%\Dcrd\rpc.cert"
```

> Deuxième étape

Si dcrd n'est pas fini de se synchroniser avec la chaîne de blocs, attendez qu'elle soit terminée, puis passez à l'étape suivante. Quand il sera terminé, il apparaîtra:

```no-highlight
[INF] BMGR: Processed 1 block in the last 5m34.49s
```

> Troisième étape

Double clic sur `start_local.bat`. `cgminer` devrait ouvrir. Créer un `cgminer` fichier de configuration en pressant sur cette touche: `S` (Paramètre), `W` (Écrire le fichier de configuration), `Enter` (Sauvegarder le fichier de configuration comme `cgminer.conf`). Notez que `cgminer.conf` sera placé dans le même répertoire que cgminer. Cgminer peut maintenant être lancé simplement en double-cliquant `cgminer.exe`. Ceci conclut le guide de base solo cgminer. Pour plus d'informations sur l'utilisation de cgminer et des explications détaillées sur les fonctions du programme, consultez le responsable [cgminer Lisezmoi](https://github.com/decred/cgminer/blob/3.7/README).
