# Erreurs et problèmes commums

## Paymetheus 

#### 1. Je viens de commencer à utiliser Paymetheus, mais ça semble bloqué.

La première fois que vous démarrez Paymetheus, il téléchargera la chaîne de blocs. Cela peut prendre plus ou moins une heure et Paymetheus semble ne rien faire.

#### 2. Passphrase invalide pour clé privée maîtresse.

Ce n'est qu'un moyen long de dire "Mot de passe incorrect". Vous avez entré le mauvais mot de passe pour votre portefeuille.

#### 3. "Impossible d'acheter des billets: fonds insuffisants disponibles ..." mais le portefeuille dit que j'ai assez.

Il y a un bogue connu dans Paymetheus où les fonds immatures sont comptés comme disponibles. Après un vote, il y a une fenêtre de 256 blocs où les fonds sont encore verrouillés. Dans ce cas, ils sont connus comme immatures. Lorsque la période expire ils seront à nouveau utilisables.

#### 4. Paymetheus affiche une mauvaise balance.

> Ces instructions sont valables à partir de la version 0.8.x et peuvent ne pas fonctionner avec les versions ultérieures.

Si Paymetheus affiche un mauvais équilibre, vous pouvez le réparer en utilisant l'utilitaire de ligne de commande pour écraser certains fichiers.Cela peut être source de confusion si vous n'êtes pas familier avec la ligne de commande, mais suivez les instructions ligne par ligne et vous irez bien. Où vous voyez des commandes qui `resemble à ca`, il suffit de les copier et de les coller exactement comme ils sont dans la ligne de commande.N'oubliez pas d'appuyer sur <ENTER> après chaque commande. Si vous êtes coincé, rejoignez notre [Slack channel](https://decred.slack.com) et quelqu'un vous aidera,mais premièrement, vérifiez la commande et assurez-vous de l'avoir entré correctement. Vous aurez besoin de votre graine de portefeuille. Ce processus devrait durer environ 15 minutes.

1. Nous allons ouvrir trois fenêtres PowerShell. Appuyez sur la touche Fenêtre. Tapez 'powershell' (ne tapez pas les citations ici ou à l'avenir) et appuyez sur ENTRÉE.
2. Faites-le encore deux fois.
3. Déplacez les fenêtres afin que vous puissiez les voir toutes.
4. Copiez et collez la commande suivante: `cd $env:programfiles/decred/paymetheus` (Remarquez, dans powershell, pressez CTRL+V ou clic droit pour coller). Pressez ENTER.
5. Exécutez la même commande dans les deux autres fenêtres.
6. Ouvrez l'Explorateur Windows.
7. Coller `%localappdata%/decred/paymetheus` Dans la barre de localisation. Appuyez sur Entrée.
8. Supprimez le dossier 'mainnet'.
9. Accédez à l'une des fenêtres PowerShell et collez `./dcrd -u <username> -P <password>`. Pressez ENTER.
10. Accédez à l'une des autres fenêtres Powershell et collez `./dcrwallet --appdata=$env:localappdata/decred/paymetheus --create`
11. Suivez les instructions et importez votre graine. Dites non quand on vous demande une couche supplémentaire de cryptage et oui quand on vous demande si vous avez une graine.
12. À l'invite, entrez vos mots de graine et appuyez deux fois sur ENTER.
13. Collez la commande suivante dans la même fenêtre: `./dcrwallet -u <username> -P <password> --appdata=$env:localappdata/decred/paymetheus`. Pressez ENTER.
14. Entrez la phrase de passe privée que vous avez utilisée lors de la création du portefeuille.
15. Accédez à la troisième fenêtre PowerShell et collez `./dcrctl -u <username> -P <password> --wallet -c $env:localappdata/decred/paymetheus/rpc.cert getbalance`. Pressez ENTER.
16. Appuyez sur CTRL + C dans les deux premières fenêtres pour fermer les programmes (dcrd et dcrwallet).
17. Vous pouvez fermer les trois fenêtres PowerShell.
18. Retournez à la fenêtre de l'Explorateur. Supprimez les deux fichiers, rpc.cert et rpc.key.
19. Démarrez le programme Decred pour commencer à utiliser Paymetheus à nouveau.

-----

## Preuve d'Enjeu

#### 1. Certains de mes billets manqués/expirés sont toujours verrouillés après plus d'une journée.

1. Démarrez le processus de portefeuille avec le drapeau `--enablevoting`. Il ne causera pas de révocations comme cela.
2. Débloquez le portefeuille avec `dcrctl --wallet walletpassphrase <yourpassphrase> 0`. Le portefeuille doit être débloqué pour pouvoir créer les révocations et les signer.
3. Demandez à dcrd d'informer le portefeuille à propos des billets manqués de façon à en remettre les révocations `dcrctl rebroadcastmissed`.


À ce stade, vous devriez voir le journal du portefeuille avec quelques détails sur les transactions de révocation. Une fois que ces transactions de révocation sont incluses dans un bloc (qui devrait être le prochain bloc),Vous verrez les fonds passer à la catégorie des générations immatérielles dans le `dcrctl --wallet`getbalance output. Enfin, après 256 blocs, ils passeront à une catégorie dépensable et seront donc disponibles pour dépenser.
