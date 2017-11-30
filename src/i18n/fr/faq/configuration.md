# <i class="fa fa-desktop"></i> Configuration 

---

#### 1. Comment puis-je voir des informations sur les numéros de port que `dcrd` utilise?

Vous pouvez obtenir les numéros de port [^8929] depuis `-h` ou `--help` paramètres passés à `dcrd`:

```no-highlight
dcrd -h
```

Recherchez la ligne suivante:

```no-highlight
--rpclisten=  Add an interface/port to listen for RPC connections (default port: 9109, testnet: 19109)
```

Il est également enregistré lorsque vous démarrez `dcrd`:

```no-highlight
12:01:46 2016-02-08 [INF] RPCS: RPC server listening on [::1]:9109
12:01:46 2016-02-08 [INF] RPCS: RPC server listening on 127.0.0.1:9109
```

---

#### 2. Qu'entendez-vous par les fichiers de configuration pou `dcrd`, `dcrwallet`, et `dcrctl`?

Chaque application (`dcrd`, `dcrwallet`, `dcrctl`) peuvent avoir les propres fichier de configuration [^9055]. Utilises `-h` et recherche le chemin entre parenthèses de l'option de fichier de configuration (`-C`, `--configfile`) pour voir le chemin par défaut. Créez un fichier texte sur le chemin et nommé selon ce chemin que vous venez voir.

Après vous pouvez utiliser `dcrd` [sample config file](https://github.com/decred/dcrd/blob/master/sample-dcrd.conf) et `dcrwallet` [sample config file](https://github.com/decred/dcrwallet/blob/master/sample-dcrwallet.conf) pour définir les options souhaitées. Vous pouvez faire la même chose pour `dcrctl` aussi. Le format est le même. Chaque option de ligne de commande répertoriée par `-h` peut être spécifié dans les fichiers de configuration (utilisez simplement le long nom de l'option).

Une fois que ceux-ci sont créés et en place, vous ne devez pas ajouter toutes les options à la ligne de commande tout le temps. Par exemple, vous pouvez exécuter `dcrctl` sans passer de paramètres sur la ligne de commande:

```no-highlight
dcrctl getnetworkhashps
2547036949350
```

---

#### 3. Puis-je exécuter les daemons et les portefeuilles mainstream et testnet en même temps et sur la même machine?

Oui[^9264], ajoutes juste `--testnet` aux endroits appropriés (`dcrd`, `dcrwallet`, `dcrctl`) et tout fonctionnera. C'est pourquoi ils utilisent différents ports et répertoires de données/journaux!

---

#### 4. Quelles sont les implications pour la sécurité d'utiliser les mêmes mots de passe d'authentification de serveur RPC avec `dcrd` et `dcrwallet`?

Vous pouvez faire beaucoup moins avec l'accès à `dcrd` que vous ne le pouvez à` dcrwallet`. Le point clé est que l'accès RPC [^11480] à `dcrwallet`, lorsque le portefeuille est déverrouillé, peut être utilisé pour dépenser des pièces de monnaie.

Quand  `dcrd` et `dcrwallet` sont tous deux sur la même machine, cela n'a probablement pas d'importance, mais lorsque vous exécutez des configurations plus sécurisées où le porte-monnaie est sur une autre machine que `dcrd`, vous ne voudrez certainement pas utiliser les mêmes références pour les deux. Rappelez-vous que `dcrd` doit être sur une machine orientée vers l'Internet afin de rester synchronisée avec le réseau (télécharger les données de la chaîne de blocs, les transactions de diffusion, etc.).

D'autre part, le `dcrwallet` qui contient vos fonds, pour une meilleure sécurité, ne devrait pas vraiment être sur un système qui a un accès Internet, car il est beaucoup plus difficile pour quelqu'un de voler vos pièces si le portefeuille qui les contient n'est pas même sur une machine accessible via Internet. De toute évidence, si vous mettez vos coins en jeu, vous devriez avoir une instance `dcrwallet` tournée vers Internet. Ainsi, la configuration la plus sécurisée consiste à avoir une instance "cold" `dcrwallet` qui se trouve sur une machine qui n'est pas accessible à Internet, et une seconde instance "hot" `dcrwallet` (utilisant une differente graine bien sûr) à laquelle l'instance cold dcrwallet délègue les droits de vote via le `--ticketaddress` paramètre, les deux utilisent des informations d'identification différentes.

---

#### 5. Pourquoi je me connecte à seulement 8 pairs sortants?

Il existe une limite inconfigurable intentionnelle de 8 pairs sortants [^15399]. Plus de pairs sortants que cela ne vous aide d'aucune façon et est en fait pire pour vous et le réseau. Cela a été testé de manière extrêmement approfondie dans Bitcoin, y compris btcsuite (le projet en amont pour Decred). Tout ce que vous feriez en augmentant vos connexions sortantes est de gaspiller des crénaux de relativement peu de pairs publics il y a (il y a toujours un nombre beaucoup plus élevé de "leechers" qu'il n'y a de seeders).

D'autre part, l'augmentation de vos connexions maximales, qui augmente tout simplement le nombre de connexions entrantes autorisées, aide le réseau en garantissant qu'il y a plus de crénaux disponibles pour les nouvelle nodes et les clients SPV que Decred n'a pas encore, mais qu'il aura.

---

## <i class="fa fa-book"></i> Sources 

[^8929]: Decred Forum, [Post 8,929](https://forum.decred.org/threads/600/#post-8929)
[^9055]: Decred Forum, [Post 9,062](https://forum.decred.org/threads/472/page-12#post-9062)
[^9264]: Decred Forum, [Post 9,264](https://forum.decred.org/threads/626/#post-9264)
[^11480]: Decred Forum, [Post 11,480](https://forum.decred.org/threads/428/#post-11480)
[^15399]: Decred Forum, [Post 15,399](https://forum.decred.org/threads/1371/page-2#post-15399)
