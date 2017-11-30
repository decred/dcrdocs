# Dcrd Guide d'installation

Dernière mise à jour pour v1.0.0.

Ce guide est destiné à vous aider à configurer l'application `dcrd` à l'aide de [drapeaux de démarrage](/start-started/startup-basics.md#startup-command-flags).

**Conditions préalables:**

- Utilisez les derniers [dcrinstall](/getting-started/user-guides/cli-installation.md) pour installer `dcrd`. Des étapes supplémentaires seront nécessaires si une autre méthode d'installation a été utilisée.
- Review how the launch commands for the Command Prompt (Windows) and Bash (macOS/Linux) shells differ [here](/getting-started/cli-differences.md).

---

`dcrd` est la node daemon pour Decred. Un daemon est un programme qui fonctionne en arrière-plan avec lequel vous n'interagissez pas directement. `dcrd` conserve tout le livre de compte transactionnel passé (ou chaîne de blocs) de Decred et permet le relais des transactions vers d'autres nodes décadées à travers le monde. Vous pouvez le considérer comme votre propre serveur de chaîne de blocs personnel Decred. La chaîne de blocs est enregistré dans le dossier `data` dans le répertoire personnel `dcrd`.

**Utilisateurs Avancés: si vous exécutez en mode sans tête via SSH,** vous
devrez utiliser un multiplexeur terminal tel que [écran] (http://www.howtogeek.com/howto/ubuntu/keep-your-ssh-session-running-when-you-disconnect/)
Ou [tmux] (https://tmux.github.io/). Où vous voyez les instructions pour
passer à une autre shell, vous devrez commencer une nouvelle fenêtre dans `screen`
ou `tmux`.

---

## <i class="fa fa-cloud"></i> Connect to the Decred Network 

Le premier lancement de `dcrd`, il se connectera au réseau Decred et commencera à télécharger la chaîne de blocs. Pour permettre à `dcrwallet` et `dcrctl` de communiquer avec `dcrd`, les fichiers de configuration doivent avoir les paramètres `rpcuser` et `rpcpass` activés.

> Configurez le nom d'utilisateur et le mot de passe RPC

Si vous avez utilisé [`dcrinstall`] (/getting-started/user-guides/cli-installation.md), vos fichiers de configuration sont déjà configurés avec le nom d'utilisateur/mot de passe RPC pour `dcrd`, `dcrwallet` et` dcrctl` .

Si vous n'avez pas utilisé `dcrinstall`, vous devrez activer les paramètres minimaux nuls dans vos fichiers de configuration. Suivez [ce guide](/advanced/manual-cli-install.md#minimum-configuration) pour le faire.

> Démarrer dcrd

Avec les fichiers de configuration correctement définis, ouvrez une autre fenêtre de shell dans votre répertoire Decred (ou utilisez la dernière fenêtre si vous venez de créer votre portefeuille). Tapez la commande suivante (consultez les Prérequis de ce guide pour déterminer la bonne commande pour votre application OS/Shell):

```no-highlight
dcrd
```

> Attendez que dcrd soit synchronisé avec la Chaîne de blocs Decred

Lorsque `dcrd` se lance avec succès, vous devriez voir votre fenêtre shell commencer à remplir des messages lorsque le démon se connecte au réseau et commence à traiter les blocs. Attendez que ce soit terminé - l'ensemble de la chaîne de blocs est téléchargé dans le répertoire de données `dcrd`.

Vous verrez une ligne au début comme ceci:

```no-highlight
22:58:04 2016-02-09 [INF] BMGR: Syncing to block height 617 from peer 104.236.167.133:9108
```

Ensuite, alors qu'il continue de télécharger des blocs, vous verrez des lignes comme ceci:

```no-highlight
22:58:16 2016-02-09 [INF] BMGR: Processed 321 blocks in the last 10.03s (544 transactions, height 322, 2016-02-09 09:50:34 +1000 EST)
```

La chaîne de blocs sera entièrement synchronisée une fois que le dernier bloc traité est la hauteur actuelle du bloc. Vous pouvez indiquer en comparant la date et l'heure dans le message de journal ou en comparant la hauteur du dernier bloc traité avec la dernière hauteur de bloc sur [l'explorateur de blocs officiel] (https://mainnet.decred.org/).

Notez que cette connexion sera utilisée à l'avenir. Vous devez laisser cette instance `dcrd` en cours d'exécution pour utiliser `dcrwallet`.

---

Maintenant que vous avez configuré `dcrd`, visitez le guide [dcrwallet Setup](/get-started/user-guides/dcrwallet-setup.md).
