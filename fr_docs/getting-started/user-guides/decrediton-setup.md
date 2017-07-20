# **Guide d'installation Decrediton**

Dernière mise à jour v0.8.2.

Ce guide est destiné à vous aider à configurer l'application `Decrediton`. 

**Conditions préalables:**

- Utiliser [le Guide d'Installation Decrediton](/getting-started/install-guide.md#decrediton) pour `Decrediton`.

---

`Decrediton` est une interface utilisateur graphique pour `dcrwallet`. Lorsque cette application se lance, elle démarre automatiquement son propre exemple de `dcrd` et `dcrwallet` en arrière plan - Il ne s'ouvre pas s'il existe déjà une instance en cours d'exécution `dcrd`. Notez qu'à partir de 0.8.2, cette application est une version alpha - il existe des bugs connus dans le logiciel sur lequel on travaille.

REMARQUE: à n'importe quel moment de l'utilisation de Decrediton, il risque de ne plus réagir ou de se coincer sur un écran de chargement. Cela peut généralement être corrigé avec un redémarrage de l'application.

---

## **Informations essentielles**

Pendant le processus de création de votre portefeuille, vous recevrez une séquence de 33 mots appelée graine phrase. Cette graine phrase est essentiellement la clé privée de votre portefeuille. Vous pourrez utiliser cette graine phrase pour restaurer vos clés privées, votre historique de transactions et vos soldes en utilisant un portefeuille Decred sur n'importe quel ordinateur.

Cela signifie finalement que *celui* qui connaît votre semence peut l'utiliser pour restaurer vos clés privées, l'historique des transactions et les soldes d'un portefeuille sur le leur sans votre connaissance. Pour cette raison, il est de la plus haute importance de garder votre graines phrase en toute sécurité. Traitez cette graine de la même façon que vous traiterez une clé physique pour un coffre-fort. Si vous perdez votre graine phrase, vous perdez en permanence l'accès à votre portefeuille et à tous les fonds. Il ne peut être récupéré par personne, y compris les développeurs de Decred. Il est recommandé de l'écrire sur papier et de stocker quelque part sécurisé. Si vous décidez de le conserver sur votre ordinateur, il serait préférable de le garder dans un document chiffré (n'oubliez pas le mot de passe) dans le cas où le fichier ou votre ordinateur est volé.

**RAPPEL: NE PAS, SOUS CERTAINES CIRCONSTANCES, DONNER VOTRE GRAINE OU LA CLÉ HEX ASSOCIEE A QUELQU'UN! NON MÊME LES DÉVELOPPES!**

---

Chaque fois que vous ouvrez `Decrediton`, Vous serez accueilli par la clause de non-responsabilité suivante:

    Decrediton est actuellement en développement lourd et dans un état alpha. Bien que nous ayons testé le code à fond, nous vous suggérons d'être prudent sur Mainnet. À utiliser à vos risques et périls!

## **Créer un nouveau Portefeuille**

Après avoir cliqué sur "OK, je comprends" à la clause de non-responsabilité, vous verrez la boîte de dialogue "Créer un portefeuille".

De la boîte de dialogue "Créer un portefeuille" à l'option par défaut "NEW SEED". Cliquez simplement sur «Existing Seed» si vous avez déjà une graine que vous avez l'intention d'utiliser et suivez les étapes présentées ici. Ce guide suppose que vous ne possédez pas de graine et continuera à utiliser l'option "NEW SEED". Veuillez passer en revue l' [Informations critiques](#critical-information) à propos de la graine, ci-dessus.

1. Enregistrez la graine qui s'affiche dans la zone de texte (vous devrez l'entrer à nouveau sur l'écran suivant).

2. Appuyez sur "Continuer"

3. Confirmez votre graine et créez une graine phrase de porte-monnaie privée. Cette graine phrase servira à débloquer votre portefeuille lors de la création de transactions.

4. Appuyez sur "Créer un porte-monnaie"

5. Vous devriez alors voir un cercle bleu tournant. Cela tournera jusqu'à `dcrd` a complètement synchronisé la chaîne de blocs. Sur les ordinateurs qui n'ont pas eu `dcrd` chargé sur eux, cela devrait prendre 1-2 heures avec du matériel plus récent (cela peut prendre plusieurs heures avec un matériel plus ancien). Vous pouvez vérifier votre application de moniteur de processus pour une instance en cours d'exécution `dcrd` - si elle utilise un pourcentage important de votre CPU, elle se synchronise. Si ce n'est pas le cas, Decrediton peut nécessiter un redémarrage pour aller au-delà de cet écran.

## **Ouverture du Portefeuille**

Une fois la chaîne de blocs synchronisée, vous devriez voir une page "Opening Wallet". Ici, vous devrez entrer votre phrase de passe privée et le portefeuille va réexaminer les blocs récents pour les transactions qui appartiennent à vos adresses. Attendez que la barre de progression soit complétée. Decrediton devrait ensuite charger la page Vue d'ensemble avec votre Solde disponible et Transactions récentes affichées.

---

