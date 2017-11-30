# <i class="fa fa-cubes"></i> Blocs

---

#### 1. Un bloc peut-il devenir orphelin après avoir été confirmé à plusieurs reprises?

Seulement s'il y a une réorganisation qui est suffisamment longue [^8918]. Pour que cela se produise, vous avez besoin de plus de puissance de hash fonctionnant de l'autre côté d'une fork que la puissance de hash qui fonctionne sur la meilleure chaîne actuelle.

---

#### 2. Peut-on supprimer l'explorateur de bloc testnet étant donné qu'un pour le mainnet est disponible?

Testnet continuera d'être un terrain d'essai pour les nouvelles fonctionnalités, il est donc logique de garder l'explorateur de bloc testnet [^9621].

---

#### 3. Que signifient les messages "[INF] CHAN: Adding orphan block"?

Cela signifie simplement qu'un bloc dont vous n'avez pas le parent a été reçu [^14660]. Il arrive presque toujours de redémarrer `dcrd` en raison de la façon dont fonctionne la synchronisation. Vous êtes toujours en train de synchroniser avec le dernier bloc, mais le pair distant, qui vous attend, a envoyé une notification selon laquelle un nouveau bloc est apparu, celui pour lequel vous n'avez pas encore le parent.

Plutôt que de l'ignorer, une fois que vous êtes suffisamment près d'être synchronisé, il les sauvegarde essentiellement pour plus tard, une fois que vous avez les blocs parents, ces nouveaux blocs se connectent automatiquement.

---

#### 4. Devrais-je télécharger la chaîne de blocs à nouveau avec chaque nouvelle version du logiciel?

Vous ne devriez presque jamais télécharger la chaîne de nouveau [^14788] lors d'une mise à niveau, à moins qu'il ne s'agisse d'un changement super massif où il est logique de recommencer. Généralement, il devrait migrer des informations, donc ça marche.

---

#### 5. Quel est le nombre de blocs de genèse?

Le bloc de genèse [^16987] est la hauteur de bloc 0 (bloc numéro 0). Chaque bloc après cela augmente de 1.

---

#### 6. Que signifient les messages "[INF] CHAN: FORK: Block 000 ..."?

Voici un exemple de message:

```no-highlight
[INF] CHAN: FORK: Block 0000000000001aedcf1b82b087a1d05ef787550174da1012e473e8ee8c178937 (height 17879) forks the chain at height 17878/block 000000000000150f863186cab6ef5c433bcc155d2f683394f8e65cb037f80b16, but does not cause a reorganize
```

Cela signifie que deux mineurs ont trouvé une solution à un bloc autour du même temps et ont tous deux soumis leurs blocs résolus au réseau [^17791]. Les deux sont également valables, mais votre node a vu l'autre solution ([000000000000147d33cde5e9823122924fb43405418712720eb6457956d8edbb](https://mainnet.decred.org/block/000000000000147d33cde5e9823122924fb43405418712720eb6457956d8edbb)) premièrement, donc du point de vue de votre node, le nouveau bloc ([0000000000001aedcf1b82b087a1d05ef787550174da1012e473e8ee8c178937](https://mainnet.decred.org/block/0000000000001aedcf1b82b087a1d05ef787550174da1012e473e8ee8c178937)) était sur une chaîne latérale.

Comme il faut du temps aux blocs pour relayer, d'autres nodes auraient pu voir 0000000000001aedcf1b82b087a1d05ef787550174da1012e473e8ee8c178937 premièrement ce qui signifie pour eux l'autre solution que votre node a vu en premier ([000000000000147d33cde5e9823122924fb43405418712720eb6457956d8edbb](https://mainnet.decred.org/block/000000000000147d33cde5e9823122924fb43405418712720eb6457956d8edbb)) était celui de la chaîne latérale.

Ceci est totalement normal et se résout à chaque fois que le prochain bloc est trouvé car il définira désormais la chaîne la plus longue et la solution ne sera pas intégrée sera orphelin.

Dans ce cas, bloc #17880 ([000000000000154c6091747245e3c2620447c71b346aed09548e74b4543d0d66](https://mainnet.decred.org/block/000000000000154c6091747245e3c2620447c71b346aed09548e74b4543d0d66)) a fini par construire sur le dessus 000000000000147d33cde5e9823122924fb43405418712720eb6457956d8edbb, alors l'autre solution ([0000000000001aedcf1b82b087a1d05ef787550174da1012e473e8ee8c178937](https://mainnet.decred.org/block/0000000000001aedcf1b82b087a1d05ef787550174da1012e473e8ee8c178937)) était orpheline.

---

## <i class="fa fa-book"></i> Sources 

[^8918]: Decred Forum, [Post 8,918](https://forum.decred.org/threads/557/#post-8918)
[^9621]: Decred Forum, [Post 9,621](https://forum.decred.org/threads/651/#post-9621)
[^14660]: Decred Forum, [Post 14,660](https://forum.decred.org/threads/1333/#post-14660)
[^14788]: Decred Forum, [Post 14,788](https://forum.decred.org/threads/1336/#post-14788)
[^16987]: Decred Forum, [Post 16,987](https://forum.decred.org/threads/1852/#post-16987)
[^17791]: Decred Forum, [Post 17,791](https://forum.decred.org/threads/2925/#post-17791)
