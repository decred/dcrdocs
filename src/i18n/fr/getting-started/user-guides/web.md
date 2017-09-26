# <i class="fa fa-firefox"></i> Guide d'Utilisateur pour le Client en Ligne

---

Un portefeuille en ligne simple est disponible pour les utilisateurs qui ne veulent pas installer de logiciels supplémentaires sur leur ordinateur. C'est basé sur[Copay](https://github.com/bitpay/copay) avec des changements Decred spécifiques ajoutés et peuvent être trouvé ici[https://wallet.decred.org](https://wallet.decred.org)

Il y a quelques choses que vous devez savoir sur le client Web avant de l'utiliser:

* Vous ne pouvez pas
  [minage d'enjeu](/mining/proof-of-stake.md)
  Avec ça.
* Votre portefeuille est entièrement conservé dans le stockage local de votre site Web
  navigateur. Cela signifie que si vous supprimez votre stockage local, vous allez
  supprimez votre portefeuille et devez le recréer à partir de la graine.
* La sécurité de votre portefeuille dépend entièrement de la sécurité de votre
  Navigateur web.
* Vous pouvez mettre une épingle sur votre porte-monnaie pour éviter d'envoyer des fonds, mais tout
  autre accès dépend entièrement des contrôles d'accès de votre
  ordinateur, pas sur le serveur ni aucun détail de connexion.

---

## <i class="fa fa-plus-circle"></i> Créez votre portefeuille de clients Web

> Première étape

Accédez à [https://wallet.decred.org](https://wallet.decred.org). Vous serez
être présenté avec l'écran `Termes et conditions`. Payer 
attention à ce qui suit:

Tout comme le portefeuille de ligne de commande, si vous perdez vos mots de graine ou votreMot de passe pour l'envoi de fonds, vous perdrez l'accès à votre portefeuille. Il n'y a pas de réinitialisation de mot de passe. Notez également que toutes les transactions sur Decred sont irréversible par la conception. Si vous envoyez accidentellement des fonds sur une fausse adresse, vous devrez demander au destinataire de les renvoyer. les développeurs ne peuvent pas inverser les transactions.

Cliquez `I Agree` dès que vous les avez lu le `Terms and Conditions`. Vous verrez maintenant l'écran d'accueil. Si c'est la première fois que vous avez utilisé Decred, cliquez sur `Get Started`. Si vous souhaitez restaurer un portefeuille utilisé précédemment, cliquez sur `Import Backup`. Ce guide supposera que vous commencez simplement, alors cliquez sur `Get Started`.

> Deuxième étape

Click the dropdown in the top left, then click `Add wallet`. Click
`Create New Wallet`. Give your wallet a name then click `Create New Wallet`.

A wallet will be generated for you.


> Troisième étape

Votre portefeuille est maintenant créé et prêt à l'emploi. Cependant, avant de faire autre chose, vous devez ajouter un mot de passe pour l'envoi de fonds et une sauvegarde des mots de base utilisés pour créer votre portefeuille. C'est doublement vrai pour le client en ligne qui ne stocke pas un enregistrement permanent. Les données de votre portefeuille sont stockées dans le cache du navigateur et peuvent être supprimées tout à fait facilement. Si vous exécutez en mode anonyme, il sera supprimé dès que vous fermez le navigateur. **SANS CES MOTS CLÉS QUE VOUS PERDEZ ACCÈS À TOUS LES FONDS DE VOTRE MARCHANDISME** si les données du portefeuille sont supprimées. Les fonds eux-mêmes existent encore dans la chaîne de bloc, cependant, sans la clé, vous ne pouvez pas y accéder.

<i class="fa fa-exclamation-triangle"></i> **NE PAS UTILISER LA MEME SEMENCE DANS DES WALLETS MULTIPLES! Visitez [Portfeuilles et Graines FAQ](/faq/wallets-and-seeds.md#3-can-i-run-multiple-wallets) pour voir pourquoi cela compte. Il est recommandé que, si possible, un nouveau portefeuille devrait générer une nouvelle graine.**

Cliquez sur le bouton `Préférences` à droite en face de votre nom de portefeuille. Il n'y a vraiment que trois choses dont vous serez intéressé ici:

Option                                | Description
---                                   | ---
`Alias ​​de portefeuille`                        | Vous pouvez renommer le portefeuille si vous le souhaitez.
`Demander un mot de passe pour dépenser des fonds` | Comme votre portefeuille est enregistré dans le cache du navigateur, il n'y a pas de mot de passe supplémentaire requis pour y accéder. En établissant un mot de passe ici, vous vous assurez que vous pouvez simplement envoyer des fonds si quelqu'un d'autre accède à votre navigateur. Tapez un mot de passe et cliquez sur `Set`. Notez l'alerte indiquant que les mots de passe ne peuvent pas être récupérés. Il n'y a pas de fonction de réinitialisation du mot de passe sur le portefeuille. Si vous perdez le mot de passe, vous ne pourrez jamais déplacer vos pièces de monnaie du portefeuille ou les utiliser pour le vote de la preuve d'enjeu.
`Backup`                              | C'est là que vous trouverez vos mots de graine.

> Quatrième étape

Cliquez sur `Backup`. Vous verrez cet écran:

Tout d'abord, lisez la note. Utilisez uniquement un portefeuille à la fois avec une graine donnée (voir: [FAQ](#)). Vous pouvez avoir plusieurs portefeuilles installés sur différentes machines, mais un seul d'entre elles devrait fonctionner à n'importe queltemps donné. Cliquez sur `Montrer la graine du portefeuille`. Écrivez ceci dans un endroit sûr, ou le mettre dans un document encrypté auquel vous n'oublierez pas lemot de passe. Cette liste de mots est utilisée pour générer la clé d'authentification pour votre portefeuille. Toute personne possédant cette liste peut accéder aux fonds dans votre portefeuille.

> **TRÈS IMPORTANT**

**NE PAS, SOUS AUCUNE CIRCONSTANCE, DONNEZ VOS MOTS CLÉS À N'IMPORTE QUI! NON MÊME PAS AUX DÉVELOPPEURS!**

Une fois que vous avez écrit les mots (et que vous avez vérifié trois fois qu'ils sont corrects, la capitalisation est importante), passez à l'étape suivante.

> Cinquième étape

Maintenant que vous avez écrit vos mots clés et les avez vérifiés, faites-leencore. Sérieusement. Cette étape est critique. Sans cette liste, votre portefeuilleNe peut pas être reconstruit et personne, même pas les développeurs, ne peutle rétablir. Maintenant que vous êtes sûr que la liste est stockée correctement, cliquez sur`Effacer les Mots`. Cliquez sur `Retour` deux fois pour accéder à l'écran principal du portefeuille.

---

## <i class="fa fa-long-arrow-right"></i> Envoyer des fonds avec le client Web

> Première étape

Sur la page du portefeuille de la page Web principale, cliquez sur le bouton `Envoyer` en bas. Vous serez emmené sur cette page. Notez la section d' `Options Advancées` a déjà été développée. Dans le champ `To`, mettez l'adresse décrite du destinataire.

> Deuxième étape

Dans `Montant`, entrez la valeur dans DCR pour envoyer au destinataire. Si vous le souhaitez vous pouvez saisir un message facultatif dans le champ `Note`. Pressez`Envoyer`. Les `Utiliser non-confirmé Fonds` option vous permet d'utiliser des fonds que le réseau sait que vous vous êtes fait envoyé mais qui n'ont pas encore été confirmé par[PdT minage](/mining/overview.md#1-proof-of-work-mining). Si cela est activé et que le montant spécifié ne peut être couvert qu'en utilisant des fonds non confirmés, la transaction ne s'effectuera pas avant que les fonds requis ont été confirmés.

---

## <i class="fa fa-long-arrow-left"></i> Recevez des fonds avec le client Web

> Première étape

Cliquez sur le bouton `Recevoir` en bas de la fenêtre. Vous verrez cet écran:

Donnez à la personne qui vous envoie DCR l'adresse affichée (elle commenceraavec `Ds`) Ou ils peuvent utiliser le code QR si leur portefeuille ou service les accepte. Vous pouvez utiliser la même adresse aussi souvent que vous le souhaitez, mais pour la confidentialité, il est recommandé de générer une nouvelle adresse chaquefois. Ne vous inquiétez pas d'avoir reçu une adresse en double. Il y aautour `2.08x10^93` possible addresses, donc nous allons probablement atteindre la mort thermique de l'Univers avant de manquer d'adresses Decred.

