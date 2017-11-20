# Pousser des Requêtes et Contribuer à Decred

---

Tout le code de Decred est tenu sur Github. Ce document fourni quelques basiques informations à propos de comment nous tenons les contributions au code et quelques informations sur comment y contribuer. Il est basé en partie sur un document similaire de [btcsuite](https://github.com/btcsuite).

---

## Préparation Initiale

Une première bonne étape est de lire [Code Contribution Guidelines documentation](https://github.com/decred/dcrd/blob/master/docs/code_contribution_guidelines.md)pour avoir une bonne compréhension de la politique utilisée par le 
projet.  Ce document est principalement centré sur le code de base Go mais c'est toujours un bon commencement.

Les exemples suivant seront séparés en deux sections, un pour les projets Go (dcrd, dcrwallet, gominer, etc), et un autre pour les projets qui n'utilisent pas Go (decrediton, Paymetheus, dcrdocs, etc). Dans tout les cas, soyez sur de vérifier le fichier README.md dans chaque projet si vous avez besoin d'aide pour démarrer un projet en particulier.

---

## Model Général 

Avec ce procédé nous allons essayer de contribuer simplement et aussi maintenir un haut niveau de qualité du code et un historique propre. Les membres du team Decred doivent suivrent les mêmes procédures que les contributeurs externes.

Notre modèle pour modifier le code en résumé est le suivant. Si n'importe quel d'entre eux manque de clarité, ne vous inquietez pas, il sera expliqué dans plus de détails dans les prochaines sections.

1. Trouvez un problème sur lequel vous souhaitez travailler. S'il n'y en a pas, décrivez votre problème, ouvrez-en un avec ce que vous allez faire.
1. Effectuer les modifications de code sur une branche.
1. Poussez ces modifications sur votre propre compte GitHub repo.
1. Lorsque votre code est prêt à être revu ou lorsque vous souhaitez simplement recevoir une contribution d'autres développeurs ouvres une Pull Requête (PR) sur le principal repo de GitHub web page.
1. Ajoutez un commentaire sur le PR qui indique le problème que vous résolvez. Mettre le texte Closes # or Fixes # suivi du numéro du problème sur une seule ligne. Cela permettra à GitHub de lier automatiquement le PR au problème et de fermer le problème lorsque le PR est réglé.
1. Vous pouvez demander un évaluateur spécifique à partir de la page Web de GitHub ou vous pouvez demander à quelqu'un sur irc/slack pour l'examiner.
1. Tout les codes doit être revu et recevoir au moins une approbation avant qu'ils puissent entrer. Seuls les membres de l'équipe peuvent obtenir leur approbation officielle, mais les commentaires d'autres utilisateurs sont encouragés.
1. S'il y a des changements demandés, faites ces changements et engagez-les dans votre branche locale.
1. Poussez ces modifications vers la même branche sur laquelle vous avez apporté des modifications. Ils apparaîtront dans le PR de cette façon et l'évaluateur peut alors se comparer à la version précédente.
1. Once your code is approved, it can be merged into master.  To keep history clean, we only allow non-fast-forward merges (that means we want a linear history).  Most PRs also must be squashed to a single commit (although if there is reason to have it as multiple commits that can be considered on a case by case basis).
1. Si votre PR est un commit unique (ou peut être écrasé par GitHub automatiquement) et est rattrapé avec master, le critique fusionnera votre PR. Si votre branche était trop loin derrière, vous pourriez être invité à rebaser votre engagement. Une fois que c'est fait et poussé, l'évaluateur fusionnera votre engagement.

---

## Go 

Pour les projets utilisant Go, vous pouvez suivre cette procédure. dcrd sera utilisé pour cet example. Ceci assume que vous utilisez déjà go1.6 où un nouvellement installé et fonctionnel `$GOPATH`.

### Démarrer en une étape
- Fork dcrd sur GitHub
- Démarrer la commande suivante pour obtenir dcrd, toutes ses dépendences, et l'installer:

```bash
$ mkdir -p $GOPATH/src/github.com/decred/
$ git clone https://github.com/decred/dcrd $GOPATH/src/github.com/decred/dcrd
$ cd $GOPATH/src/github.com/decred/dcrd
$ go dep ensure
$ go install . ./cmd/...
```

- Ajouter une git remote pour votre fork:

```bash
$ git remote add <yourname> https://github.com/<yourname>/dcrd.git
```

## Autres Projets

Pour les projets non écrit en Go, le démarrage initial dépendra du projet. J'utiliserai dcrdocs comme example ici, mais les étapes de base restent les mêmes pour n'importe quels projets. Les démarrages spécifiques peuvent être vu sur le projet README.md (pour example comment installer mkdocs pour travailler dcrdocs ou electron pour decrediton)

### Démarrer en une étape
- Fork dcrdocs sur GitHub
- Démarrer la commande suivante pour obtenir dcrd, ou ses dépendences, et l'installer:

```bash
$ mkdir -p code/decred
$ cd code/decred
$ git clone https://github.com/decred/dcrdocs
$ cd dcrdocs
```

- Ajoutez une git remote pour votre fork:

```bash
$ git remote add <yourname> https://github.com/<yourname>/dcrdocs.git
```

## Création d'une nouvelle demande d'extraction de fonctionnalité
- Trouvez ou créez un problème sur le compte GitHub (l'original, pas votre fork) pour la fonction sur laquelle vous souhaitez travailler.
- Vérifiez une nouvelle branche de fonctionnalité pour loger les changements que vous allez faire:

```bash
$ git checkout -b <feature_branch>
```
- Faites les changements nécéssaires pour la fonctionnalité et commitez-les
- Poussez votre branche de fonctionnalité sur votre fork:

```bash
$ git push <yourname> <feature_branch>
```
- Avec l'explorateur, navigez vers https://github.com/decred/dcrd
- Créez une pull requête avec le GitHub UI. Vous pouvez faire la requête d'une pré-visualisation sur GitHub web page ou demandez à quelqu'un sur irc/slack.

## Rebasez une de votre existante pull requête

Quelques fois vous serez demandé de rebaser et écraser la requête pull sur la derniére branche maitresse.

- Soyez sur que votre branche maitresse soit à jour:

```bash
$ git checkout master
$ git pull
```
- Vérifiez la branche de fonctionnalité existante et redéfinissez-la avec le drapeau interactif:

```bash
$ git checkout <feature_branch>
$ git rebase -i master
```
- Follow the directions presented to specify 's' meaning squash for the additional commits (the first commit must remain 'p' or 'pick').
- Ecrire un simple message de commitement dans l'éditeur que vous avez réglez pour couvrir tout les commitements inclus.
- Sauvez et fermez l'éditeur et git devrait générer un simple commitement avec le message que vous avez spécifié et tout les commitements que vous avez ajoutez. Vous pouvez vérifier le commitement avec la commande ```git show```.
- Force push la branche sur votre fork:

```bash
$ git push -f <yourname> <feature_branch>
```

## Autres Considérations

Il y a quelques autres points à considérer quand vous poussez une requête. Dans le cas du code Go, il y a déjà un significant test de couverture. Si vous ajoutez un code, vous devriez ajouter tests aussi. Si vous réparez quelque chose, vous devez être sure que vous ne détruisez pas un test existant. Pour le code Go, Il y a un script ```goclean.sh``` dans chaque repo pour démmarer les tests et n'importe quels vérificateurs statiques que nous avons. Aucun code ne sera accepté sans passer tout les tests. Dans le cas de code node.js (decrediton) tout code doit passer eslint. Vous pouvez vérifier avec la commande ```npm run lint```.

Finallement, chaque repo a une LICENSE. Votre nouveau code doit être sous la même LICENSE que le code existant et copyright assigné à 'Decred Développeurs'. Dans la plupart des cas c'est la très libérale ISC license mais quelques repos sont différent. Vérifiez le repo pour être sur.

Si vous avez des questions pour contribuer, sentez vous libre de demander sur irc/slack ou GitHub. Les membres du team Decred (et probablement les membres de la communauté aussi) seront content de vous aider.
