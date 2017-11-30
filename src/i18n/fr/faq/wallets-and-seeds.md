# <i class="fa fa-money"></i> Portefeuilles et Graines

---

#### 1. Devrais-je donner mes graines de portefeuille à quelqu'un?

Non, vous ne devriez jamais[^8613] partager votre graine de portefeuille avec n'importe qui. Cela équivaut à leur donner tout vos DCR dans ce portefeuille.

---

#### 2. Comment puis-je convertir mon hex de graines de portefeuille en mots-clés?

Vous pouvez utiliser l'utilitaire [dcrseedhextowords] (https://github.com/davecgh/dcrseedhextowords)[^8660] pour convertir une graine Decred hexagonal aux mots de base requis pour l'importation dans des portefeuilles.

---

#### 3. Puis-je gérer plusieurs portefeuilles avec la même graine?

L'exécution de plusieurs portefeuilles avec la même graine peut conduire à la situation où les portefeuilles ne verront pas le même équilibre. Vous ne devez pas exécuter plusieurs portefeuilles avec la même graine.[^9731]

Le problème est simplement que les adresses sont générées de manière déterministe à partir de la graine. Donc, si vous avez deux portefeuilles fonctionnant sur la même graine, vous finissez par une situation comme celle-ci:

* Portefeuille A: Connaît toutes les adresses jusqu'à l'adresse #15
* Portefeuille B: Connaît toutes les adresses jusqu'à l'adresse #12

Ainsi, toutes les coins qui ont été envoyées aux adresses #13, #14 et #15 seront connues de Wallet A, mais pas de Wallet B.

En outre, si vous dites simplement au portefeuille B d'obtenir la prochaine adresse, il ne verra pas non plus les coins parce que, de son point de vue, cette adresse vient d'être créée et ne cherchera pas de transactions avant le moment présent. Il s'agit d'une optimisation parce que, comme vous pouvez l'imaginer, la chaîne de blocs finit par devenir extrêmement grande au fil du temps et il serait incroyablement coûteux (en termes d'utilisation des ressources) de numériser toute la chaîne chaque fois qu'une nouvelle adresse est générée.

Il y a une exception à cela et c'est pour voter des portefeuilles à chaud qui n'ont pas de fonds. Si le portefeuille est **seulement** votant et n'achète pas de billets ou ne crée aucune autre transaction, c'est sûr.[^11319]

---

#### 4. Est-ce que quelqu'un peut voler mes pièces s'ils ont accès à wallet.db?

Personne ne peut voler vos coins si ils ont accès au fichier wallet.db[^9803] à moins qu'elles n'aient également votre mot de passe privé. Si vous choisissez d'utiliser le cryptage public, ils ne peuvent pas non plus accéder à l'une de vos clés ou adresses publiques étendues.

---

#### 5. Est-ce que quelqu'un peut utiliser une attaque de force brute sur un portefeuille aléatoire pour régénérer ses mots de graines (les mots ne sont pas salés)?

Tous les mots de base sont un mappage direct des mots en anglais aux chiffres hexadécimaux. La graine n'est rien d'autre qu'un nombre aléatoire cryptographiquement sécurisé de 256 bits (32 octets). Le sel ne s'applique pas du tout. Il n'a rien à voir avec le forçage des nombres aléatoires[^10452].

En d'autres termes, puisque chaque mot peut avoir 256 possibilités et il y a 32 mots, cela donne 32^256 possibilités (ou 2^256 selon la façon dont vous voulez le regarder, mais le même nombre). Ce nombre est plus grand que le nombre total d'atomes d'hydrogène dans l'univers connu. En fait, c'est presque le nombre d'atomes total dans l'univers connus.

Pour mettre cela en perspective, en supposant qu'il y ait 7 milliards de personnes sur la planète et chaque personne possédait 10 ordinateurs et chacun de ces ordinateurs pourrait tester un milliard de possibilités par seconde et que vous pourriez trouver la solution en moyenne après avoir testé seulement 50% des Total des possibilités, il faudrait encore 26x10^48 (soit 26 trillion trillion trillion trillions) pour forcer brutalement une seule graine.

---

#### 6. Ma graine ne fonctionne pas. Que puis-je faire?

Assurez-vous que tous les mots se trouvent sur une seule ligne séparée par des espaces[^10657]. Même s'ils sont imprimés sur plusieurs lignes pour la lisibilité, ils doivent être entrés sur une seule ligne. Vérifiez également que vos mots n'aient pas de fautes de frappe en les comparant aux mots dans [la liste des mots PGP] (https://en.wikipedia.org/wiki/PGP_word_list).

---

#### 7. Comment puis-je importer une clé en format d'importation de portefeuille (WIF)?

Il est possible d'importer une clé privée autonome[^10724] dans `dcrwallet`. Notez que ce n'est que pour les adresses `--noseed` et que vous ne devriez pas l'exécuter, sauf si vous savez ce que vous faites.

Débloquer le portefeuille (ignorer les crochets):

```no-highlight
dcrctl --wallet walletpassphrase <private encryption passphrase> 60
```

Importez la clé privée autonome (`--noseed`) (ignorez les brackets angulaires):

```no-highlight
dcrctl --wallet importprivkey <put WIF private key here>
```

Afficher le solde du compte importé (donnez-lui un peu de temps pour rescanner et regarder le journal dans dcrwallet pour voir le progrès du scan):

```no-highlight
dcrctl --wallet getbalance "imported" 0 all
```

---

#### 8. Quelle est la différence entre une adresse testnet et mainnet?

Une adresse de clé publique testnet[^11507] commence par les lettres `Tk`. Une adresse mainnet commence par les lettres `Dk`. `T` = Testnet,` D` = (Decred) Mainnet.

---

#### 9. Quels sont les différents types d'adresses?

Une adresse Decred[^14995] n'est en fait qu'une représentation d'une clé publique (qui pourrait être un hachage de script) avec un préfixe de 2 octets qui identifie le réseau et le type et un suffixe de somme de contrôle afin de détecter les adresses incorrectement entrées.

Par conséquent, vous pouvez toujours indiquer quel type d'adresse est basé sur le préfixe de 2 octets.

Le premier octet du préfixe identifie le réseau. C'est pourquoi toutes les adresses mainnet commencent par "D", les adresses testnet commencent par "T", et les adresses simnet commencent par "S". Le deuxième octet du préfixe identifie le type d'adresse qu'il est.

Les adresses les plus couramment utilisées pour le moment sont seck256k1 hashes pubkey, qui sont identifiés par une minuscule "s". Il représente une seule clé publique et n'a donc qu'une seule clé privée associée qui peut être utilisée pour la sauver.

Le pool de mise d'enjeu, cependant, utilise une adresse de paiement-script-hash, qui est identifiée par le second octet comme une minuscule "c" (encore une fois qui est illustrée dans les params liés). La saveur spécifique du script qu'il génère est une multi-signature 1-de-2, qui permet à la pool, ou à vous, de voter. Vous et la pool de vote avez vos propres clés privées et puisque le script ne nécessite qu'une signature des deux possibles, c'est ainsi qu'il permet de déléguer des droits de vote au pool sans que vous renoncez complètement à vos droits de vote.

---

## <i class="fa fa-book"></i> Sources 

[^8613]: Decred Forum, [Post 8,613](https://forum.decred.org/threads/576/#post-8613)
[^8660]: Decred Forum, [Post 8,660](https://forum.decred.org/threads/534/page-3#post-8660)
[^9731]: Decred Forum, [Post 9,731](https://forum.decred.org/threads/657/#post-9731)
[^11319]: Decred Forum, [Post 11,319](https://forum.decred.org/threads/531/page-3#post-11319)
[^9803]: Decred Forum, [Post 9,803](https://forum.decred.org/threads/686/#post-9803)
[^10452]: Decred Forum, [Post 10,452](https://forum.decred.org/threads/734/#post-10452)
[^10657]: Decred Forum, [Post 10,657](https://forum.decred.org/threads/483/#post-10657)
[^10724]: Decred Forum, [Post 10,724](https://forum.decred.org/threads/643/page-3#post-10724)
[^11507]: Decred Forum, [Post 11,507](https://forum.decred.org/threads/792/#post-11507)
[^14995]: Decred Forum, [Post 14,995](https://forum.decred.org/threads/1321/page-2#post-14995)
