# Paymetheus Guide d'Installation

Paymetheus est un portefeuille graphique simple à utiliser pour Decred. Avec cela, vous pouvez envoyer et recevoir DCR,Acheter des billets pour [PdE vote](/mining/proof-of-stake.md), Obtenez un historique de toutes vos transactions et plus encore. À propos, la seule chose que Paymetheus ne fait pas, c'est le vote de PdE.

---

## Télécharger and Installer

The Windows Installer (`.msi` file) is located here: [https://github.com/decred/decred-binaries/releases/tag/v1.1.0](https://github.com/decred/decred-binaries/releases/tag/v1.1.0). It will install Paymetheus to your computer's Program Files folder. Installation is pretty straightforward, but instructions are provided below:

1. Téléchargez le correct fichier:

    For 32-bit computers, download the `decred_1.1.0-release_x86.msi` file. <br />
    For 64-bit computers, download the `decred_1.1.0-release_x64.msi` file.

2. Accédez au site de téléchargement et double-cliquez sur le fichier `.msi`.

3. Suivez les étapes d'installation. Dans ce processus, vous serez invité à accepter un contrat de licence d'utilisateur de fin.

4. Après la configuration, les fonctionnalités doivent être installées dans votre dossier `..\Program Files\Decred\` et accessibles via le menu Démarrer (recherchez `Decred` dans la liste de Programmes)

---

## Demarrer Paymetheus
Vous êtes maintenant prêt à commencer à utiliser Decred! Demarrez le programme 'Decred'. Vous verrez maintenant l'écran de connexion:

![Paymetheus connection screen](../../img/Paymetheus-dcrd-login.png)  

> Deux programmes fonctionnent réellement lorsque vous démarrez Decred. Il y a 'Paymetheus' qui est le portefeuille graphique dont nous parlerons plus avant
> Et 'dcrd' qui est le daemon de communication (prononcé DAY-mon; un programme qui s'exécute en arrière-plan et qui n'intervient pas directement
> Avec un utilisateur) qui parle réellement au réseau de Decred. Cela signifie que vous pouvez exécuter dcrd
> Sur un autre ordinateur (tel qu'un serveur toujours sur le serveur), puis utilisez Paymetheus pour vous connecter à distance.

Nous allons utiliser un local où Paymetheus a déjà commencé, alors appuyez sur Continuer.

> La première fois que Paymetheus commence, il va télécharger la chaîne de blocs en arrière-plan. Cela peut prendre jusqu'à une heure.

---

## Créer ou restaurer un portefeuille
Vous aurez maintenant la possibilité de créer un nouveau portefeuille ou de restaurer un portefeuille à partir d'une graine. Si vous lisez ceci, vous êtes probablement nouveau et n'avez pas.
déjà créé un portefeuille, alors on en créera un nouveau. Si vous cliquez sur restaurer, vous devrez entrer vos mots de départ au lieu de recevoir une nouvelle graine.
Le reste du processus est le même. Cliquez sur "Créer un nouveau portefeuille". Vous verrez l'écran suivant:

![Paymetheus wallet creation screen](/img/Paymetheus-seed-window.png)  

<i class="fa fa-exclamation-triangle"></i> **ARRETEZ ICI !!! NE PAS CLIQIUER CONTINUER!**

**C'est la partie la plus importante de l'utilisation de Decred. Dans la boîte blanche, vos mots de graines sont affichés. Ces mots sont la clé de votre portefeuille.**
 **SANS CES MOTS OU LA REPRÉSENTATION HEX VOUS PERDRE DE FACON PERMANENTE ET POUR TOUJOURS L'ACCÈS À VOS FONDS!**

**NE LES DONNER PAS A N'IMPORTE QUI, MEME PAS AU DÉVELOPPEURS DECRED!**

Avec ces mots, quelqu'un d'autre peut recréer votre portefeuille sur un autre ordinateur et transférer tous les fonds à un autre portefeuille. Il n'est pas possible d'inverser une transaction en Decred, donc si quelqu'un vole votre Decred, il n'y a aucun moyen de le récupérer.

<i class="fa fa-exclamation-triangle"></i> **NE PAS UTILISER LA MEME GRAINE DANS DES WALLETS MULTIPLES! Visitez [Portfeuilles et Graines](/faq/wallets-and-seeds.md#3-can-i-run-multiple-wallets) pour voir pourquoi cela compte. Il est recommandé que, si possible, un nouveau portefeuille devrait générer une nouvelle graine.**

Les monnaies Decred et autres monnaies digitales sont souvent décrites comme étant un compte bancaire. Cependant, contrairement à la banque en ligne, dans le système Decred, il n'y a pas de tiers de confiance qui détient votre argent en votre nom. Vous et vous seul contrôlez votre DCR, tout comme avec de l'argent physique. Lorsque l'argent comptant ou le DCR est perdu, égaré ou volé, il est probable qu'il soit définitivement définitivement.

Si vous perdez votre portefeuille, vous perdez l'accès à tout ce que vous aviez et personne, même les développeurs de Decred ne peuvent pas le récupérer. Il est donc très important que vous preniez le temps de lire cette page et ÉCRIVEZ les mots dans un endroit sûr. Une bonne idée est de les écrire sur un morceau de papier et de les stocker dans un endroit sûr et de les stocker dans un fichier ENCRYPTED sur votre ordinateur. Le stockage en nuage comme Dropbox ou OneDrive est correct lorsque des précautions sont prises. Puisque les comptes en ligne peuvent être piratés, vous devez fortement chiffrer votre fichier portefeuille (MS Word ou Libre/OpenOffice peut le faire) avant de le télécharger dans un service de stockage en nuage.

D'accord, vous avez assuré vos mots de graine dans au moins deux endroits différents. Cliquez sur Continuer. Vous êtes invité à les taper afin de vous assurer de les avoir correctement écrits au cas où vous devriez restaurer votre portefeuille plus tard. Notez que vous ne pouvez pas les coller; Vous devrez les taper. C'est pour vous assurer que les mots sont enregistrés ailleurs que le presse-papiers. Faites-le et cliquez sur Confirmer.

---

## Choisissez une Phrase de Passe de Portefeuille Privée
Entrez une phrase secrète à utiliser chaque fois que vous créez une transaction sur le réseau. Tant que votre portefeuille est verrouillé avec cette phrase secrète, vos fonds de portefeuille sont inaccessibles à quiconque gagne le contrôle sur le fichier portefeuille. Il existe également l'option ici pour une phrase de passe publique. Il est utilisé pour chiffrer toutes les données publiques (transactions et adresses) dans votre fichier portefeuille, donc s'il est volé, un adversaire ne peut pas vous lier à vos transactions. Pour la plupart des gens, une phrase de passe publique est habituellement une overkill, donc vous pouvez la laisser sans marquage. Une fois que vous avez entré votre nouvelle phrase secrète privée (et facultative), cliquez sur Chiffrer.

Votre portefeuille va maintenant créer et synchroniser avec la chaîne de blocs. Cela peut prendre quelques minutes sur des ordinateurs plus lents. Notez que les mots de graine que vous avez rédigés
fonctionneront avec n'importe quelle application de portefeuille Decred, pas seulement Paymetheus.

Continuez vers [Using Paymetheus](using-paymetheus.md)
