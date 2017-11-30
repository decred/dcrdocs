# <i class="fa fa-linux"></i> Guide d'uUtilisateur Linux

---

## <i class="fa fa-cloud"></i> Connectez dcrd au réseau Decred

> Première étape

Notez que toutes les commandes `dcrd`, `dcrwallet` et `dcrctl` doivent être exécutées dans le répertoire où se trouvent vos fichiers Decred! Démarrez `dcrd`:

```no-highlight
~/Decred/$ ./dcrd -u <username> -P <password>
```

Démarrez dcrwallet:

```no-highlight
~/Decred/$ ./dcrwallet -u <username> -P <password>
```

> Deuxième étape

Générer une nouvelle adresse de portefeuille:

```no-highlight
~/Decred/$ ./dcrctl -u <username> -P <password> --wallet getnewaddress default
```

Copiez la nouvelle adresse (sortie de la dernière commande). Fermez/arrêtez `dcrd` et `dcrwallet` en appuyant sur `ctrl+c` dans chaque fenêtre.

> Troisième étape

Redémarrez `dcrd` en utilisant la commande:

```no-highlight
~/Decred/$ ./dcrd -u <username> -P <password> --miningaddr <new address from step two or your web client wallet address>
```

> Quatrième étape

Configurez la sécurité TLS en copiant rpc.cert vers /usr/share/ca-certificates:

```no-highlight
sudo cp /home/<username>/.dcrd/rpc.cert /usr/share/ca-certificates/dcrd.crt
```

Utilisez un éditeur de texte pour ajouter la ligne "dcrd.crt" (sans guillemets) à /etc/ca-certificates.conf:

```no-highlight
sudo gedit /etc/ca-certificates.conf
```

Mettre à jour la liste des certificats CA:

```no-highlight
sudo update-ca-certificates
```

---

## <i class="fa fa-download"></i>Télécharger et extraire cgminer

Visitez https://github.com/decred/cgminer/releases pour trouver la dernière version de cgminer. Pour télécharger et extraire via votre terminal Linux, utilisez les commandes suivantes:

```no-highlight
wget https://github.com/decred/decred-release/releases/download/v0.0.4_cgminer/cgminer-decred-linux-x86_64-20160208.tar.gz
tar -xvf cgminer-decred-linux-x86_64-20160208.tar.gz
```

---

## <i class="fa fa-play-circle"></i> Initialisez et exécutez cgminer

> Première étape

Si `dcrd` n'est pas fini de se synchroniser avec la chaîne de bloc, attendez qu'il soit terminé, puis passez à l'étape suivante. Quand il est terminé, il montrera:

```no-highlight
[INF] BMGR: Processed 1 block in the last 5m34.49s
```

> Deuxième étape

Dans votre répertoire cgminer, démarrez cgminer avec la commande:

```no-highlight
~/Decred/$ ./cgminer --blake256 -o https://127.0.0.1:9109 -u <username> -p <password>
```

Créez un fichier de configuration de cgminer en appuyant sur les touches suivantes: `S` (Paramètres), `W` (Write Config File), `Enter` (Enregistrer le fichier de configuration comme` cgminer.conf`). Notez que `cgminer.conf` sera placé dans le même répertoire que cgminer. Cgminer peut maintenant être lancé en exécutant simplement la commande:

```no-highlight
~/Decred/$ ./cgminer
```

Ceci conclut le guide de base solo cgminer. Pour plus d'informations sur l'utilisation de cgminer et des explications détaillées sur les fonctions du programme, consultez le [LISEZ-MOI] officiel (https://github.com/decred/cgminer/blob/3.7/README).
