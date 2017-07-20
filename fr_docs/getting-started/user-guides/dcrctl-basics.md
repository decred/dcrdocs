# **dcrctl Basiques**

Dernière mise aà jour v0.8.2.

Cette fois au lieu de créer un guide nehis c'est destiné à vous aider à apprendre les commandes de base de l'un `dcrctl` application using [startup flags](/getting-started/startup-basics.md#startup-command-flags). 

**Conditions préalables:**

- Prévoir le dernier [dcrinstall](/getting-started/install-guide.md#dcrinstall) à installer `dcrctl`. Des étapes supplémentaires seront nécessaires si une autre méthode d'installation a été utilisée.
- Examinez comment les commandes de lancement de l'invite de commandes (Windows) et Bash (OSX/Linux) shells differ [ici](/getting-started/cli-differences.md).
- [Installer dcrd](/getting-started/user-guides/dcrd-setup.md) et faites-le tourner dans le fond.
- [Installer dcrwallet](/getting-started/user-guides/dcrwallet-setup.md) et faites-le tourner dans le fond.

---

`dcrctl` est le client qui le contrôle `dcrd` et `dcrwallet` via appel de procédure aà distance (RPC). Vous pouvez utiliser `dcrctl` pour de nombreuses choses, comme la vérification de votre solde, l'achat de tickets, la création de transactions et l'affichage d'informations sur le réseau.

**RAPPEL:** Ce guide utilise des examples OS-agnostic comme commandes. Examinez les conditions préalables pour déterminer si vous devriez utiliser `./dcrctl` or `dcrctl.exe` au-lieu de `dcrctl`.

---

> Configurez le nom d'utilisateur et le mot de passe RPC

Commandes envoyées soit à `dcrd` ou `dcrwallet` Exigera que le nom / mot de passe RPC soit configuré dans les fichiers de configuration.

Si vous avez utilisé [`dcrinstall`](/getting-started/install-guide.md#dcrinstall), vos fichiers de configuration sont déjà configurés avec le nom d'utilisateur/mot de passe RPC pour `dcrd`, `dcrwallet`, et `dcrctl`.

Si vous n'avez pas utilisé `dcrinstall`, vous devrez activer les paramètres minimaux nuls dans vos fichiers de configuration. Suivre [this guide](/getting-started/startup-basics.md#minimum-configuration) to do so.

---

## dcrctl Commandes

Vous devrez exécuter des commandes dcrctl dans une fenêtre de shell distincte (Commande Prompt/Bash).

Émettre des commandes pour `dcrwallet`, vous aurez besoin d'utiliser `dcrctl --wallet <command>`.

Émettre des commandes pour `dcrd`, vous aurez besoin d'utiliser `dcrctl <command>`.

Pour voir la liste complète des commandes `dcrctl` peut envoyer à `dcrd` et `dcrwallet`, émettez la commande suivante dans votre shell:

```no-highlight
dcrctl -l
```

Cela renverra une très longue liste de commandes, séparées par une application. Les commandes de la partie supérieure sont destinées à `dcrd` Et les commandes en bas sont pour `dcrwallet`. Vous pouvez en savoir plus sur une commande individuelle en tapant ce qui suit pour `dcrwallet` commandes:

```no-highlight
dcrctl help --wallet [command]
```

ou la suivante pour `dcrd` commandes:

```no-highlight
dcrctl help <command>
```

---

## Débloquer votre portefeuille

Quelques fonctionnalités de `dcrwallet` rExige que le portefeuille soit déverrouillé.

La commande pour débloquer votre portefeuille suit: 

```no-highlight
dcrctl --wallet walletpassphrase <passphrase privée créée pendant la création de portefeuille> 0
```

Ici, nous spécifions pour `dcrctl` d'envoyer la commande `dcrwallet` en utilisant le drapeau `--wallet`. La commande actuelle est `walletpassphrase` laquelle accepte deux paramètres, votre phrase de passe privée et un temps de délai. En précisant `0` pour un déverrouillage de limité `dcrwallet` à sans limite. Notez, cependant, cela débloque uniquement le portefeuille pour la session en cours. Si vous fermez la fenêtre, le portefeuille est en cours d'exécution ou arrêtez/redémarrez le `dcrwallet`, vous devrez le débloquer à nouveau la prochaine fois que vous l'aurez démarré.

Si la commande a réussi, vous ne recevrez pas une confirmation de `dcrctl`, mais si vous regarder à la session `dcrwallet`, il dira:

```no-highlight
[INF] RPCS: The wallet has been unlocked without a time limit.
```

REMARQUE: Parce que le déverrouillage du portefeuille est requis pour de nombreuses fonctions de `dcrwallet`, `dcrwallet` peut-être démmaré avec le drapeau `--promptpass`  ou réglé `promptpass=true` dans `dcrwallet.conf` (discuté [ici](/advanced/storing-login-details.md#dcrwalletconf)).

---

## Vérifier votre Balance

Envoyer la commande `getbalance` à `dcrwallet` utilisant `dcrctl`, entrez ce qui suit dans votre shell:

```no-highlight
dcrctl --wallet getbalance
```

Cela renverra tous les soldes de tous vos comptes.

---

## Obtenir une nouvelle Adresse de Réception

Envoyer la commande `getnewaddress` à `dcrwallet` utilisant `dcrctl`, entrez ce qui suit dans votre shell:

```no-highlight
dcrctl --wallet getnewaddress
```

Cela générera et renverra une nouvelle adresse de paiement. Pour minimiser la réutilisation des adresses, utilisez cette commande pour obtenir une nouvelle adresse pour chaque transaction que vous souhaitez recevoir.

---

## Envoyer DCR

Pour envoyer DCR à une adresse, émettre la commande `sendtoaddress` à `dcrwallet` utilisant `dcrctl`. Entrez ce qui suit dans votre shell, Remplissant l'adresse de réception et le montant à envoyer:

```no-highlight
dcrctl --wallet sendtoaddress <address> <amount>
```

Si elle réussit, `dcrctl` il enverra un hash de transaction qui peut être utilisé pour regarder la transaction sur le site officiel [Decred Block Explorer](/getting-started/using-the-block-explorer.md).

---

## Vérifiez les statistiques du réseau

Il existe plusieurs commandes différentes pour vérifier les différentes statistiques du réseau. Nous couvrons l'envoi `getinfo` à `dcrd` et `getstakeinfo` à `dcrwallet`.

Pour obtenir des informations sur votre local `dcrd` node, émis par la commande `getinfo` à `dcrd` utilisant `dcrctl`. Entrez ce qui suit dans votre shell:

```no-highlight
dcrctl getinfo
```

Pour obtenir des informations sur le réseau de preuve de mise d'enjeu, émettre la commande `getstakeinfo` à `dcrwallet` utilisant `dcrctl`. Entrez ce qui suit dans votre shell:

```no-highlight
dcrctl --wallet getstakeinfo
```

---

## Commandes Additionelles

Plus de commandes peuvent également être trouvées sur la page [Options du programme](/advanced/program-options.md).

---