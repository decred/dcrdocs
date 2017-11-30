# <i class="fa fa-cubes"></i> Utiliser le Block Explorer

---

## <i class="fa fa-info-circle"></i> Vue d'ensemble

Un block explorer basé sur[Insight](https://github.com/bitpay/insight-ui) est prévu pour le réseau Decred. Tous les blocs et les transactions dans la chaîne de blocs de Decredsont visibles grâce à l'utilisation de cet explorateur de blocs, situé à[`https://mainnet.decred.org`](https://mainnet.decred.org) et[`https://testnet.decred.org`](https://testnet.decred.org) pour lePortefeuille testnet. Voici une analyse rapide de certaines informations sur lui.

Option         | Explication
---            | ---
`Hauteur`       | Le numéro de bloc.
`Age`          | Il y a combien de temps que le bloc a été ajouté à la chaîne de bloc.
`Transactions` | Le nombre de transactions incluses dans le bloc.
`Votes`        | Le nombre de votes de la preuve d'enjeu inclus dans le bloc.
`Fresh Stake`  | Le nombre de nouveaux tickets achetés dans ce bloc.
`Taille`         | La taille (en octets) du bloc.

Sous `Dernières Transactions`, vous pouvez voir l'ID de transaction (txid) et
La valeur (en DCR) transmise à travers le réseau.

---

## <i class="fa fa-cube"></i> Blocs 

On peut trouver des blocs en recherchant leur numéro de hauteur de bloc,
en cliquant sur une valeur `Hauteur` à partir de la page d'accueil ou de leur
valeur `BlockHash`. Les blocs plus anciens auront des blocs inférieurs. La moitié
haute d'un aperçu des blocs présente des informations pertinentes à ce
bloc spécifique. Cette information comprend: la hauteur du bloc, le bloc
hash et plusieurs paramètres clés du réseau, décrits ci-dessous:

Option                   | Explication
---                      | ---
`Nombre de Transactions` | Le nombre de transactions standard (DCR envoyé d'un utilisateur à l'autre).
`Hauteur`                 | La hauteur de la chaîne de blocs dans laquelle se trouve ce bloc.
`Block Reward`           | La quantité de nouveau DCR imité dans ce bloc.
`Timestamp`              | Le moment où ce bloc a été créé par un mineur et a été inclus dans la chaîne de blocs.
`Racine Merkle`            | Une valeur de hachage de tous les hachages de transaction inclus dans ce bloc.
`Racine Stake`             | Une valeur de hachage de tous les hashes de transaction liés à la mise d'enjeu dans ce bloc. Cela comprend les achats de tickets, les votes et les révocations de tickets.
`VoteBits`               | (1) Block a été approuvé par les électeurs de la preuve d'enjeu. (2) Block a été veto par les électeurs de la preuve d'enjeu et toutes les transactions sans enjeu dans le bloc ont été invalidées, ainsi que la subvention pour le mineur et le développement de la preuve de travail.
`Final State`            | L'état final du générateur de nombres pseudo-aléatoires utilisé pour la sélection des tickets.
`Voteurs`                 | Le nombre de votes réussis de la preuve d'enjeu dans ce bloc. La valeur maximale est 5.
`Fresh Stake`            | Le nombre d'achats de tickets d'enjeu confirmés dans ce bloc.
`Révocations`            | Le nombre de tickets qui n'ont pas voté et ont été révoqués.
`PoolSize`               | Le nombre total de tickets de preuve d'enjeu actifs.
`Difficulté`             | La difficulté du réseau de preuve de travail.
`SBits`                  | Le prix d'un ticket de preuve d'enjeu.
`Bits`                   | Une version compacte de la difficulté du réseau au moment où le bloc a été extrait.
`Size`                   | La taille du bloc (en octets).
`Version`                | La version du bloc.
`Valeur de circonstance`                  | La valeur utilisée par un mineur pour trouver la solution correcte pour ce bloc.

## <i class="fa fa-exchange"></i> Transactions 

Cette section répertorie toutes les transactions qui ont été extraites dans ce
bloc. Les transactions sont choisies dans le réseau mempool dans l'ordre 
des frais les plus élevés d'abord. Toutes les transactions dans la synthèse des blocs suivent cet
ordre: transactions standard (transfert par pair), preuve d'enjeu
votes, les achats de tickets de preuve d'enjeu. Les sections suivantes
examinent chaque type de transaction.

---

### Transactions Standard

Voici les informations incluses dans les transactions standard de Decred.

Option              | Explication
---                 | ---
`Size`              | La taille de la transaction en octets.
`Taux de Frais`          | Le taux des frais perçus par le réseau (par kB).
`Temps de Réception`     | Le moment où le réseau a confirmé la transaction.
`Temps de Minage`        | Le moment où un mineur a inclus la transaction dans un bloc.
`Inclus dans le Bloc` | Le numéro de bloc dans lequel la transaction est devenue une partie.

La note `Heure reçue`, `Heure minée` et `Inclus dans le bloc` n'auront pas de valeur jusqu'à ce qu'un mineur valide la transaction et l'inclut dans un bloc Decred. Après avoir été confirmé dans un bloc, la transaction est considérée comme complète.


---

### Achat de tickets

Pour un achat de billets (soumission de participation), il existe quelques différences
à partir d'une transaction standard affichée.

Notez la différence sous les détails: le mot `Ticket` apparaît au-dessus de
l'adresse du portefeuille de l'expéditeur sur la gauche, et les mots `Engagement de
Subvention` apparaît sur la droite. Cet utilisateur particulier a acheté un
ticket d'enjeu pour 8.75411638 DCR et reçu une modification du montant
de 7.15994209 DCR. L'adresse indiquée à gauche sous `Ticket` est
l'adresse qui contient les fonds utilisés pour l'achat de cette
ticket. La première sortie à droite est l'adresse qui conserve
les droits de vote pour ce ticket spécifique. La deuxième sortie, `Engagement de
Subvention`, est l'adresse où la récompense ira. Ce n'est pas encore
montré par l'explorateur de bloc en ce moment. La troisième et dernière sortie
est l'adresse où les changements pour cette transaction seront envoyés.

---

### Votes de la preuve-d'enjeu

Notez les termes d'identification dans la section des détails: `Vote`, `Stake
Base`, `Block Commitment` et` Vote Bits`:

Ces mots-clés indiquent que cette transaction est un vote qui a été jeté
à partir d'un portefeuille de preuve d'enjeu. Dans cet exemple particulier, 
l'utilisateur avait déjà acheté un ticket pour 8.99472311 DCR et était
envoyé 10.82959184 DCR après la publication du vote dans cette transaction.
