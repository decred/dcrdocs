# Guide d'installation Decrediton

Dernière mise à jour pour v1.0.0.

---

`Decrediton` est une interface utilisateur graphique pour `dcrwallet`. Lorsque cette application se lance, elle démarre automatiquement son propre exemple de `dcrd` et `dcrwallet` en arrière plan - Il ne s'ouvre pas s'il existe déjà une instance en cours d'exécution `dcrd`.

REMARQUE: à n'importe quel moment de l'utilisation de Decrediton, il risque de ne plus réagir ou de se coincer sur un écran de chargement. Cela peut généralement être corrigé avec un redémarrage de l'application.

---

## Télécharger et Installer

Decrediton is released with the Binary Releases and can be found here: [https://github.com/decred/decred-binaries/releases/tag/v1.1.0](https://github.com/decred/decred-binaries/releases/tag/v1.1.0). As of v1.1.0, Decrediton is only available for Linux and macOS.

> macOS

1. Download the `decrediton-1.1.0.dmg` file.

2. Double click the `decrediton-1.1.0.dmg` file once downloaded to mount the disk image.

3. Faites glisser le decrediton.app dans le lien vers votre dossier Applications dans l'image du disque.

> Linux

1. Download the `decrediton-1.1.0.tar.gz` file.

2. Naviguez pour télécharger l'emplacement et extrayez le fichier .tar.gz:

    Navigateur de fichiers Ubuntu: cliquez simplement avec le bouton droit sur le fichier .tar.gz et appuyez sur "Extraire ici". <br />
    Terminal: utilisez la commande `tar -xvzf filename.tar.gz`.

    Both of these should extract the tar.gz into a folder that shares the same name. (`e.g. tar -xvzf decrediton-v1.1.0.tar.gz` should extract to `decrediton-v1.1.0`). If successful, this new folder should include a `decrediton` executable.

---

## Informations essentielles

Pendant le processus de création de votre portefeuille, vous recevrez une séquence de 33 mots appelée phrase de graine. Cette phrase de graine est essentiellement la clé privée pour votre portefeuille. Vous pourrez utiliser cette phrase de graine pour restaurer vos clés privées, votre historique de transactions et vos soldes en utilisant un portefeuille Decred sur n'importe quel ordinateur.

Cela signifie finalement que *toute personne* qui connaît votre graine peut l'utiliser pour restaurer vos clés privées, votre historique de transactions et les soldes d'un portefeuille Decred sur leur ordinateur à votre insu. Pour cette raison, il est de la plus haute importance de garder votre phrase de graine en toute sécurité. Traitez cette graine de la même manière que vous traiterez une clé physique pour un coffre-fort. Si vous perdez votre phrase de graine, vous perdez en permanence l'accès à votre portefeuille et à tous les fonds. Il ne peut être récupéré par personne, y compris les développeurs Decred. Il est recommandé de l'écrire sur papier et de le stocker quelque part en toute sécurité. Si vous décidez de le conserver sur votre ordinateur, il serait préférable de le conserver dans un document chiffré (n'oubliez pas le mot de passe) dans le cas où le fichier ou votre ordinateur est volé.

**RAPPEL: NE PAS, SOUS CIRCONSTANCE, DONNER VOTRE GRAINE OU LA CLE HEX ASSOCIE A N'IMPORTE QUI! MÊME PAS LES DÉVELOPPEURS!**

---

## Création d'un nouveau portefeuille

Après avoir cliqué sur "OK, je comprends" à la clause de non-responsabilité, vous verrez la boîte de dialogue "Créer un portefeuille".

La boîte de dialogue "Créer un portefeuille" est par défaut l'option "Nouvelle Graine". Cliquez simplement sur "Graine Existante" si vous avez déjà une graine que vous avez l'intention d'utiliser, et suivez les étapes présentées ici. Ce guide suppose que vous n'avez pas de semences et continueront à utiliser l'option "Nouvelle graine". Veuillez passer en revue les [Informations critiques](#critiques-informations) sur les graines ci-dessus.

1. Enregistrez la graine affichée dans la zone de texte (vous devrez l'entrer à nouveau sur l'écran suivant).

2. Appuyez sur "Continuer"

3. Confirmez votre graine et créez une phrase de passe de portefeuille privée. Cette phrase de passe sera utilisée pour débloquer votre portefeuille lors de la création de transactions.

4. Appuyez sur "Créer un portefeuille"

5. Vous devriez alors voir un cercle bleu tournant. Cela tournera jusqu'à ce que `dcrd` ait complètement synchronisé la chaîne de bloc. Sur les ordinateurs qui n'ont pas eu `dcrd` chargés sur eux, cela devrait prendre 1-2 heures avec du matériel plus récent (cela peut prendre plus de temps avec un matériel plus ancien). Vous pouvez vérifier votre application de moniteur de processus pour une instance en cours d'exécution de `dcrd` - si elle utilise un pourcentage important de votre CPU, elle est en cours de synchronisation. Si ce n'est pas le cas, Decrediton peut nécessiter un redémarrage pour aller au-delà de cet écran.

## Ouverture du portefeuille

Une fois la chaîne de blocs synchronisée, vous devriez voir une page "Ouverture de portefeuille". Ici, vous devrez entrer votre phrase de passe privée et le portefeuille va réexaminer les blocs récents pour les transactions qui appartiennent à vos adresses. Attendez que la barre de progression soit complétée. Decrediton devrait ensuite charger la page Vue d'Ensemble avec votre Solde Disponible et Transactions Récentes affichées.

---
