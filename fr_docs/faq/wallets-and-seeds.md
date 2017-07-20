# **<i class="fa fa-money"></i> Portefeuille et Graine**

---

#### **1. Devrais-je donner ma graine de portefeuille à quelqu'un?**

Non, vous ne devriez jamais [^8613] partager votre semence de portefeuille avec n'importe qui. Cela équivaut à leur donner tout votre DCR dans ce portefeuille.

---

#### **2. Comment puis-je convertir ma grain de portefeuille hex en graine de portefeuille mots?**

Vous pouvez utiliser le [dcrseedhextowords](https://github.com/davecgh/dcrseedhextowords)[^8660] utilitaire pour convertir la graine de Decred de hex à une graine de mots nécéssaire pour importer vos portefeuilles.

---

#### **3. Puis-je gérer plusieurs portefeuilles avec la même graine?**

L'exécution de plusieurs portefeuilles avec la même graine peut conduire à la situation où les portefeuilles ne verront pas le même équilibre. Vous ne devez pas exécuter plusieurs portefeuilles avec la même graine.[^9731]

Le problème est simplement que les adresses sont générées de manière déterministe à partir de la graine. Donc, si vous avez deux portefeuilles fonctionnant sur la même graine, vous finissez par une situation comme celle-ci:

* Portefeuille A: connaît toutes les adresses jusqu'à l'adresse #15
* Portefeuille B: connaît toutes les adresses jusqu'à l'adresse #12

Ainsi, toutes les pièces qui ont été envoyées aux adresses #13, #14 et #15 seront connues de Portefeuille A, mais pas Portefeuille B.

En outre, si vous dites simplement à Portefeuille B d'obtenir la prochaine adresse, il ne verra pas non plus les pièces de monnaie parce que, de son point de vue, cette adresse vient d'être créée et ne cherchera pas de transactions avant le moment présent. Il s'agit d'une optimisation parce que, comme vous pouvez l'imaginer, la chaîne de blocs finit par devenir extrêmement grande au fil du temps et il serait incroyablement coûteux (en termes d'utilisation des ressources) de numériser toute la chaîne chaque fois qu'une nouvelle adresse est générée.

Il y a une exception à cela et c'est pour le vote de Hotwallet qui n'ont pas de fonds. Si le portefeuille vote **seulement**  et n'achete pas de billets ou ne crée aucune autre transaction, c'est en sécurité.[^11319]

---

#### **4. Est-ce que quelqu'un peut voler mes pièces s'ils ont accès à wallet.db?**

Personne ne peut voler vos pièces de monnaie s'ils ont accès au fichier wallet.db [^9803] à moins qu'ils n'aient également votre mot de passe privé. Si vous choisissez d'utiliser le cryptage public, ils ne peuvent pas non plus accéder à l'une de vos clés ou adresses publiques étendues.

---

#### **5. Quelqu'un peut-il utiliser une attaque de force brute sur un portefeuille aléatoire pour régénérer ses mots de graine (les mots ne sont pas salés)?**

Toutes les graines sont en mappage direct de mots en anglais aux chiffres hexadécimaux. La graine n'est rien de plus qu'un nombre cryptographiquement aléatoire de 256 bits (32 octets). Le sel ne s'applique pas du tout. Il n'a rien à voir avec les nombres cryptographiques aléatoires forcés [^ 10452].

En d'autres termes, puisque chaque mot peut être 256 possibilités et il y a 32 mots, cela donne des possibilités de 256 ^ 32 (ou 2 ^ 256 selon la façon dont vous voulez le regarder, mais le même nombre). Ce nombre est plus grand que le nombre entier d'atomes d'hydrogène dans l'univers connu. En fait, c'est presque le nombre d'atomes total dans l'univers connu.

Pour mettre cela en perspective, en supposant qu'il y ait 7 milliards de personnes sur la planète et chaque personne possédait 10 ordinateurs et chacun de ces ordinateurs pourrait tester un milliard de possibilités par seconde et que vous pourriez trouver la solution en moyenne après avoir testé seulement 50% des possibilités totales, il faudrait encore 26x10 ^ 48 (soit 26 trillion trillion trillions) pour forcer brutalement une seule graine.

---

#### **6. Ma graine ne fonctionne pas. Que puis-je faire?**

Assurez-vous que tous les mots se trouvent sur une seule ligne séparée par des espaces [^10657]. Même si elles sont imprimées sur plusieurs lignes pour leur lisibilité, elles doivent être entrées sur une seule ligne. Vérifiez également que vos mots n'ont pas de fautes de frappe en les comparant aux mots dans le [Liste des mots PGP (https://en.wikipedia.org/wiki/PGP_word_list).

---

#### **7. Comment puis-je importer une clé dans ce format d'importation de portefeuille (WIF)?**

Il est possible d'importer une clé privée autonome [^10724] dans `dcrwallet`. Notez que ce n'est que pour `--noseed` adresses et vous ne devriez pas exécuter ceci sauf si vous savez ce que vous faites!

Débloquez le portefeuille (Ignorer les brackets angulaires):

```no-highlight
dcrctl --wallet walletpassphrase <private encryption passphrase> 60
```

Importez la clé privée autonome (`--noseed`) (Ignorer les brackets angulaires):

```no-highlight
dcrctl --wallet importprivkey <put WIF private key here>
```

Afficher le solde du compte importé (donnez-lui un peu de temps pour remanier et regarder le journal dans dcrwallet pour pouvoir rescanner le progrès):

```no-highlight
dcrctl --wallet getbalance "imported" 0 all
```

---

#### **8. Quel est la differnence entre l'adresse testnet et mainnet?**

Une adresse de clé publique testnet[^11507] commence avec Tk. Une adresse mainnet avec Dk. T = Testnet, D = (Decred) Mainnet.

---

#### **9. Quels sont les différents type d'adresses?**

Une adresses Decred n'est en fait qu'une représentation d'une clé publique (qui pourrait être un hash de script) avec un préfixe de 2 octets qui identifie le réseau et le type et un suffixe de somme de contrôle afin de détecter les adresses incorrectes.

Par conséquent, vous pouvez toujours indiquer quel type d'adresse est basé sur le prefixe 2 octets.

Le premier octet du préfixe identifie le réseau. C'est pourquoi toutes les adresses mainnet commencent par "D", les adresses testnet commencent par "T", et les adresses simnet commencent par "S". Le second octet du préfixe identifie le type d'adresse qu'il est.

Les adresses les plus couramment utilisées pour le moment sont seck256k1 hashes pubkey, qui sont identifiés par une minuscule "s". Il représente une seule clé publique et n'a donc qu'une seule clé privée associée qui peut être utilisée pour la réparer.

Le pool de mise d'enjeu, cependant, utilise une adresse de paiement-script-hash, qui est identifiée par le second octet comme étant une minuscule "c" (encore une fois qui est affichée dans les params liés). La saveur spécifique du script qu'il génère est une signature multi-1-de-2, qui permet à la pool, ou à vous, de voter. Vous et le groupe de participation ont vos propres clés privées et puisque le script nécessite seulement une signature des deux possibles, c'est ainsi qu'il permet de déléguer des droits de vote au pool sans que vous renoncez complètement à vos droits de vote.

---

## **<i class="fa fa-book"></i> Sources**

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
