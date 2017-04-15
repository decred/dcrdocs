# **dcrd Guide d'installation**

Dernière mise aà jour v0.8.2.

Ce guide est destiné à vous aider à configurer l'application `dcrd` utilisant [drapeaux de démarrage](/getting-started/startup-basics.md#startup-command-flags). 

**Conditions préalables:**

- Utiliser le dernier [dcrinstall](/getting-started/install-guide.md#dcrinstall) pour installer `dcrd`. Des étapes supplémentaires seront nécessaires si une autre méthode d'installation a été utilisée.
- Examinez comment les commandes de lancement pour le Command Prompt (Windows) and Bash (OSX/Linux) shells diffèrent [here](/getting-started/cli-differences.md).

---

`dcrd` est la node daemon pour Decred. Un daemon est un programme qui fonctionne en arrière-plan avec lequel vous n'interagissez pas directement. `dcrd` conserve tout le compte-rendu transactionnel passé (ou chaîne de bloc) de Decred et permet de relayer les transactions vers d'autres nodes Decred à travers le monde. Vous pouvez le considérer comme votre propre chaine de blocs serveur personnel Decred. La chaîne de blocs est enregistrée dans dossier `data` dans `dcrd` répertoire gîte.

**Utilisateurs avancés: si vous exécutez en mode sans tête via SSH,** vous devriez utiliser un multiplexeur terminal tel que [screen](http://www.howtogeek.com/howto/ubuntu/keep-your-ssh-session-running-when-you-disconnect/)
ou [tmux](https://tmux.github.io/). Où vous voyez les instructions pour passez à une autre shell, vous devrez commencer une nouvelle fenêtre dans `screen`
ou `tmux`.

---

## **<i class="fa fa-cloud"></i> Connectez-vous au Réseau Decred**

La première fois que vous lancez `dcrd`, Il se connectera au réseau Decred et commencera à télécharger la chaine de blocs. Autoriser `dcrwallet` et `dcrctl` pour communiquer avec `dcrd`, les fichiers de configuration doivent avoir `rpcuser` et `rpcpass` réglages activés. 

> Configurez le nom d'utilisateur et le mot de passe RPC

Si vous avez utilisé [`dcrinstall`](/getting-started/install-guide.md#dcrinstall), Vos fichiers de configuration sont déjà configurés avec le nom d'utilisateur/mot de passe RPC pour `dcrd`, `dcrwallet`, et `dcrctl`.

Si vous n'avez pas utilisé `dcrinstall`, Vous devrez activer les paramètres minimaux nets dans vos fichiers de configuration. Suivre [this guide](/getting-started/startup-basics.md#minimum-configuration) pour cela. 

> Démarrer dcrd 

Avec les fichiers de configuration correctement définis, ouvrez une autre fenêtre de shell dans votre répertoire Decred (ou utilisez la dernière fenêtre si vous venez de créer votre portefeuille). Tapez la commande suivante (consultez ce guide prérequis pour déterminer l'ordre exact en fonction de votre OS/Shell application):

```no-highlight
dcrd
```

> Attendez que dcrd soit synchronisé avec la Chaîne de blocs

Quand `dcrd` démarre correctement, vous devriez voir votre fenêtre shell commencer à ce remplir avec des messages que daemon se connecte au réseau et commence à traiter des blocs. Attendez que ce soit terminé - l'entière chaîne de blocs est téléchargée dans  `dcrd` répertoire de données.

Vous verrez une ligne au début comme celle-ci:

```no-highlight
22:58:04 2016-02-09 [INF] BMGR: Syncing to block height 617 from peer 104.236.167.133:9108
```

Ensuite, alors qu'il continue de télécharger des blocs, vous verrez des lignes comme celle-ci:

```no-highlight
22:58:16 2016-02-09 [INF] BMGR: Processed 321 blocks in the last 10.03s (544 transactions, height 322, 2016-02-09 09:50:34 +1000 EST)
```

La chaîne de blocs sera entièrement synchronisée une fois que le dernier bloc traité est à la hauteur actuelle du bloc. Vous pouvez indiquer en comparant la date et l'heure dans le message du journal ou en comparant la hauteur du dernier bloc traité contre la dernière hauteur de bloc sur [l'explorateur de blocs officiel](https://mainnet.decred.org/).  

Notez que cette connexion sera utilisée à l'avenir. Vous devez quitter ce `dcrd` instance en cours d'exécution pour utiliser `dcrwallet`.

---

Maintenant que vous avez configuré `dcrd`, visitez [Installer dcrwallet](/getting-started/user-guides/dcrwallet-setup.md) guide.