# **<i class="fa fa-linux"></i> Guide d'Utilisateur Linux**

---

## **<i class="fa fa-cloud"></i> Connecter dcrd au réseau Decred**

> Première Étape

Note que `dcrd`, `dcrwallet`, et `dcrctl` commandes doivent être exécutées dans le répertoire où se trouvent vos fichiers Decred! Démarrer `dcrd`:

```no-highlight
~/Decred/$ ./dcrd -u <user> -P <password>
```

Démarrer dcrwallet:

```no-highlight
~/Decred/$ ./dcrwallet -u <user> -P <password>
```

> Seconde Étape

Générer une nouvelle adresse portefeuille:

```no-highlight
~/Decred/$ ./dcrctl -u <username> -P <password> --wallet getnewaddress default
```

Copier la nouvelle adresse (sortie de la dernière commande). Fermer/Arrêter `dcrd` et `dcrwallet` en pressant `ctrl+c` dans chaque fenêtre.

> Troisième Étape

Redémarrer `dcrd` utilisant la commande:

```no-highlight
~/Decred/$ ./dcrd -u <username> -P <password> --miningaddr <nouvelle adresse de l'étape 2 ou de votre adresse de portefeuille client en ligne>
```

> Quatrième Étape

Installer TLS securité en copiant rpc.cert dans /usr/share/ca-certificates:

```no-highlight
sudo cp /home/<username>/.dcrd/rpc.cert /usr/share/ca-certificates/dcrd.crt
```

Utiliser le texte éditeur pour écrire la commande "dcrd.crt" (sans guillemets) dans /etc/ca-certificates.conf:

```no-highlight
sudo gedit /etc/ca-certificates.conf
```

Mettre à jour la liste des certificats CA:

```no-highlight
sudo update-ca-certificates
```

---

## **<i class="fa fa-download"></i> Télécharger et extraire cgminer**

Visitez https://github.com/decred/cgminer/releases pour trouver la dernière version de cgminer. Pour télécharger et extraire via votre terminal Linux, utilisez les commandes suivantes:

```no-highlight
wget https://github.com/decred/decred-release/releases/download/v0.0.4_cgminer/cgminer-decred-linux-x86_64-20160208.tar.gz
tar -xvf cgminer-decred-linux-x86_64-20160208.tar.gz
```

---

## **<i class="fa fa-play-circle"></i> Initialisez et démarrer cgminer**

> Première Étape

Si `dcrd` n'a pas fini de se synchroniser avec la chaîne de blocs, attendez qu'elle soit terminée, puis passez à l'étape suivante. Quand ce sera terminé, il apparaîtra:

```no-highlight
[INF] BMGR: Processed 1 block in the last 5m34.49s
```

> Seconde Étape

Dans votre répertoire cgminer, démarrer cgminer avec la commande:

```no-highlight
~/Decred/$ ./cgminer --blake256 -o https://127.0.0.1:9109 -u <username> -p <password>
```

Créez un fichier de configuration cgminer en appuyant sur les touches suivantes: `S` (Paramètres), `W` (Écrire un fichier de configuration), `Enter` (Sauvegarder le fichier de configuration comme) `cgminer.conf`). Notez que `cgminer.conf` sera placé dans le même répertoire que cgminer. Cgminer peut maintenant être lancé en exécutant simplement la commande:

```no-highlight
~/Decred/$ ./cgminer
```

Ceci conclut le guide de base solo cgminer. Pour plus d'informations sur l'utilisation de cgminer et des explications détaillées sur les fonctions du programme, reportez-vous à la section [cgminer Lisezmoi](https://github.com/decred/cgminer/blob/3.7/README).