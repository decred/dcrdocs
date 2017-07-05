# dcrctl Basiques

Dernière mise à jour pour v1.0.0.

Ce guide est destiné à vous aider à apprendre les commandes de base de l'application `dcrctl` en utilisant un [fichier de configuration minimal](/advanced/manual-cli-install.md#minimum-configuration).

**Conditions préalables:**

- Utiliser la dernière version de[dcrinstall](/getting-started/install-guide.md#dcrinstall) afin d'installer `dcrctl`. Des étapes supplémentaires seront nécessaires si une autre méthode d'installation a été utilisée.
- Examinez  [ici](/getting-started/cli-differences.md) les différences entre les interpréteurs de commandes de Windows (Command Prompt) et de macOS/Linux (Bash shell).
- [Installer dcrd](/getting-started/user-guides/dcrd-setup.md) et faites-le tourner en tâche de fond.
- [Installer dcrwallet](/getting-started/user-guides/dcrwallet-setup.md) et faites-le tourner en tâche de fond.

---

`dcrctl` est le client qui contrôle `dcrd` et `dcrwallet` via des appels de procédure à distance (RPC). Vous pouvez utiliser `dcrctl` pour de nombreuses choses, comme la vérification de votre solde, l'achat de tickets, la création de transactions et l'affichage d'informations à propos du réseau.

**RAPPEL:** Ce guide utilise des examples de commandes indépendantes du système d'exploitation. Veuillez examiner les conditions préalables afin de déterminer si vous devez utiliser `./dcrctl` ou `dcrctl.exe` au-lieu de `dcrctl`.

---

> Configurez le nom d'utilisateur et le mot de passe RPC

Les commandes envoyées tant à `dcrd` qu'à `dcrwallet` exigeront que le nom / mot de passe RPC soient configurés dans les fichiers de configuration.

Si vous avez utilisé [`dcrinstall`](/getting-started/install-guide.md#dcrinstall), vos fichiers de configuration auront déjà été configurés avec le nom d'utilisateur/mot de passe RPC pour `dcrd`, `dcrwallet`, et `dcrctl`.

Si vous n'avez pas utilisé `dcrinstall`, vous devrez activer les paramètres minimaux nuls dans vos fichiers de configuration. Suivre [this guide](/getting-started/startup-basics.md#minimum-configuration) pour cela.

---

## Commandes dcrctl

Vous devrez exécuter des commandes dcrctl dans une fenêtre de shell distincte (Commande Prompt/Bash).

Afin d'envoyer des commandes vers `dcrwallet`, vous aurez besoin d'utiliser `dcrctl --wallet <command>`.

Afin d'envoyer des commandes vers `dcrd`, vous aurez besoin d'utiliser `dcrctl <command>`.

Afin d'afficher la liste complète des commandes que `dcrctl` peut envoyer à `dcrd` et `dcrwallet`, utilisez la commande suivante dans votre shell:

```no-highlight
dcrctl -l
```

Cela renverra une très longue liste de commandes, discriminées par applications. Les commandes de la partie supérieure sont celles destinées à `dcrd` tandis que celles de la partie inférieure sont destinées à `dcrwallet`. Vous pouvez en savoir plus sur une commande individuelle en tapant ce qui suit (commandes `dcrwallet`):

```no-highlight
dcrctl help --wallet <command>
```

ou la suivante pour les commandes `dcrd` :

```no-highlight
dcrctl help <command>
```

---

## Débloquer votre Portefeuille

Quelques fonctionnalités de `dcrwallet`  exigent que le portefeuille soit déverrouillé.

La commande pour débloquer votre portefeuille est la suivante: 

```no-highlight
dcrctl --wallet walletpassphrase <private passphrase set during wallet creation> 0
```

Ici, nous spécifions pour `dcrctl` d'envoyer la commande `dcrwallet` en utilisant le drapeau `--wallet`. La commande actuelle est `walletpassphrase` laquelle accepte deux paramètres: votre phrase de passe privée et un temps de délai. Spécifier `0` pour un temps de délai déverrouille `dcrwallet`  sans limite de temps. Il est important de noter que  cela débloque le portefeuille uniquement pour la session en cours. Si vous fermez la fenêtre dans laquelle le portefeuille est en cours d'exécution ou si vous arrêtez/redémarrez le `dcrwallet`, vous devrez le débloquer à nouveau la prochaine fois que vous le démarrerez.

Si la commande a réussi, vous ne recevrez pas de confirmation de la part de `dcrctl`, mais si vous regardez votre session `dcrwallet`, vous obtiendrez:

```no-highlight
[INF] RPCS: The wallet has been unlocked without a time limit.
```

REMARQUE: Parce que le déverrouillage du portefeuille est requis pour de nombreuses fonctions de `dcrwallet`, `dcrwallet` peut-être démarré avec le drapeau `--promptpass` ou encore avec `promptpass=true` dans `dcrwallet.conf` (comme discuté [ici](/advanced/storing-login-details.md#dcrwalletconf)).

---

## Vérification de votre solde

Afin d'envoyer la commande `getbalance` à `dcrwallet` utilisant `dcrctl`, entrez ce qui suit dans votre shell:

```no-highlight
dcrctl --wallet getbalance
```

Cela renverra tous les soldes de tous vos comptes.

---

## Obtention d'une nouvelle adresse de réception

Afin d'envoyer la commande `getnewaddress` à `dcrwallet` en utilisant `dcrctl`, entrez ce qui suit dans votre shell:

```no-highlight
dcrctl --wallet getnewaddress
```

Cela générera et renverra une nouvelle adresse de paiement. Pour minimiser la réutilisation d'adresses, utilisez cette commande pour obtenir une nouvelle adresse pour chaque transaction que vous souhaitez recevoir.

---

## Envoi de DCR

Pour envoyer DCR à une adresse, utilisez la commande `sendtoaddress` à `dcrwallet` en utilisant `dcrctl`. Entrez ce qui suit dans votre shell, en remplissant l'adresse de réception et le montant à envoyer:

```no-highlight
dcrctl --wallet sendtoaddress <address> <amount>
```

Si elle réussit, `dcrctl` renverra un hash de transaction qui peut être utilisé pour observer la transaction sur le site officiel [Decred Block Explorer](/getting-started/using-the-block-explorer.md).

---

## Vérifiez les statistiques du réseau

Il existe pulse nombreuse commandes différentes pour vérifier les différentes statistiques du réseau. Nous décrirons ici l'envoi `getinfo` à `dcrd` et `getstakeinfo` à `dcrwallet`.

Pour obtenir des informations sur votre local `dcrd` node, envoyer la commande `getinfo` à `dcrd` en utilisant `dcrctl`. Entrez ce qui suit dans votre shell:

```no-highlight
dcrctl getinfo
```

Pour obtenir des informations sur le réseau de preuve de mise d'enjeu, envoyer la commande `getstakeinfo` à `dcrwallet` en utilisant `dcrctl`. Entrez ce qui suit dans votre shell:

```no-highlight
dcrctl --wallet getstakeinfo
```

---

## Commandes supplémentaires

Plus de commandes sont décrites sur la page [Options du programme](/advanced/program-options.md).

---
