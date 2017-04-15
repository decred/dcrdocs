# **Paymetheus Guide d'Installation** #

Paymetheus est un portefeuille graphique simple à utiliser pour Decred. Avec cela, vous pouvez envoyer et recevoir DCR,
Acheter des billets pour [PdE vote](/mining/proof-of-stake.md), Obtenez un historique de toutes vos transactions et plus encore. À propos, la seule chose que Paymetheus ne fait pas, c'est le vote de PdE.

---

## **Télécharger and Installer** ##
Les instructions de téléchargement et d'installation sont disponibles [ici](/getting-started/install-guide.md#windows-installer)

---

## **Démarrer Paymetheus** ##
Vous êtes maintenant prêt à commencer à utiliser Decred! Commencez le programme "Decred". Vous verrez maintenant l'écran de connexion:  

![Écran de connexion Paymetheus](../../img/Paymetheus-dcrd-login.png)  

>Deux programmes sont en cours d'exécution lorsque vous démarrez Decred. Il y a 'Paymetheus' qui est le portefeuille graphique dont nous parlerons plus dans un instant
> Et 'dcrd' qui est le daemon de communication (prononcé DAY-mon); un programme qui s'exécute en arrière-plan et qui n'intervient pas directement
> Avec un utilisateur qui parle réellement au réseau de Decred. Cela signifie que vous pouvez exécuter dcrd
> Sur un autre ordinateur (tel que toujours sur le serveur), puis utilisez Paymetheus pour vous connecter à distance.

Nous allons utiliser un local que Paymetheus a déjà commencé, alors appuyez sur Continuer.

> La première fois que Paymetheus commence, il va télécharger la chaîne de blocs en arrière-plan. Cela peut prendre jusqu'à une heure.

---

## **Créer ou restaurer un portefeuille** ##
Vous aurez maintenant la possibilité de créer un nouveau portefeuille ou de restaurer un portefeuille à partir d'une graine. Si vous lisez ceci, vous êtes probablement nouveau et n'avez pas déjà un porte-monnaie alors, créons-en un nouveau. Si vous cliquez sur restaurer, vous devrez entrer vos mots de départ au lieu de recevoir une nouvelle génération.
Le reste du processus est le même. Cliquez sur "Créer un nouveau portefeuille". Vous verrez l'écran suivant:

![Écran de création de portefeuille Paymetheus](/img/Paymetheus-seed-window.png)  

<i class="fa fa-exclamation-triangle"></i> **ARRÊTEZ ICI!!! NE PAS CLIC CONTINUER! **

**C'est la partie la plus importante de l'utilisation de Decred. Dans la boîte blanche, les mots clés (ou les graines) sont affichés. Ces mots sont la clé de votre portefeuille.  **
 **SANS CES MOTS OU LA REPRÉSENTATION HEX, VOUS ALLEZ DE FACON PERMANENTE ET POUR TOUJOURS PERDRE L'ACCÈS À VOS FONDS!**  

**NE PAS LES DONNER À N'IMPORTE QUI, PAS MEME AUX DÉVELOPPEURS DECRED!**

Avec ces mots, quelqu'un d'autre peut recréer votre portefeuille sur un autre ordinateur et transférer tous les fonds à un autre portefeuille. Il n'est pas possible d'inverser une transaction en Decred, donc si quelqu'un vole vos Decred, il n'y a aucun moyen de le récupérer.  

<i class="fa fa-exclamation-triangle"></i> **N'UTILISEZ PAS LA MÊME GRAINES DANS DE MULTIPLES PORTEFEUILLES! Visiter [Portefeuilles et graines FAQ](/faq/wallets-and-seeds.md#3-can-i-run-multiple-wallets) Pour voir pourquoi cela compte. Il est recommandé que, si possible, un nouveau portefeuille devrait générer une nouvelle graine.** 

Decred et les autres monnaies numériques sont souvent décrites comme étant un compte bancaire. C'est vrai, mais votre portefeuille est comme un porte-monnaie physique réel.
Si vous perdez votre portefeuille, vous perdez l'accès à tout ce que vous aviez et personne, même les développeurs de Decred ne le récupèrent. C'est donc très important que vous prenez le temps de lire cette page et ÉCRIVEZ les mots clés dans un endroit sûr. Une bonne idée est de les écrire sur un morceau de papier et de les stocker quelque part sécurisé et les stocker dans un fichier ENCRYPTE sur votre ordinateur. Le stockage sur clouds comme Dropbox ou OneDrive est bien, mais n'oubliez pas que d'autres personnes peut y accéder, c'est pourquoi vous devez crypter le fichier (MS Word ou Libre/OpenOffice peut le faire).

D'accord, vous avez obtenu votre graine dans au moins deux endroits différents. Cliquez sur Continuer. Vous êtes invité à les taper afin de vous assurer que ce que vous avez écrit est corrects dans le cas où vous devriez restaurer votre portefeuille plus tard. Notez que vous ne pouvez pas les coller; vous devrez les écrire.
Ceci est pour vous assurer que vous avez les mots enregistrés ailleurs que le presse-papiers. Faites-le et cliquez sur Confirmer.

---

## **Choisissez une phrase de passe de portefeuille privé** ##
Entrez une phrase secrète à utiliser chaque fois que vous créez une transaction sur le réseau. Il existe également l'option ici pour une phrase de passe publique. Cela crypte le fichier de données de votre portefeuille sur votre ordinateur. Cela empêche simplement quelqu'un d'afficher vos comptes et les transactions s'ils en ont accès. Tant que la base de données est verrouillée, ils ne peuvent pas accéder à vos fonds. Pour la plupart des gens, cette étape est habituellement une overkill, donc vous pouvez la laisser non vérifié. Une fois que vous avez entré votre nouvelle phrase secrète privée (et facultative), cliquez sur Crypter.

Votre portefeuille va maintenant se créer et se synchroniser avec la chaîne de bloc. Cela peut prendre quelques minutes sur des ordinateurs plus lents. Notez que les mots clés que vous avez rédigés fonctionneront avec n'importe quelle application de portefeuille Decred, pas seulement Paymetheus.

Continuer vers [Utiliser Paymetheus](using-paymetheus.md)