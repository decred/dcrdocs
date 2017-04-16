# **<i class="fa fa-cubes"></i> Utiliser le Block Explorer**

---

## **<i class="fa fa-info-circle"></i> Vue d'Ensemble**

Un block explorer basé sur
[Insight](https://github.com/bitpay/insight-ui) est prévu pour le réseau Decred. Tous les blocs et les transactions dans la chaîne de blocs de Decred
sont visibles grâce à l'utilisation de cet explorateur de blocs, situé à
[`https://mainnet.decred.org`](https://mainnet.decred.org) et
[`https://testnet.decred.org`](https://testnet.decred.org) pour le
Portefeuille testnet. Voici une analyse rapide de certaines informations sur
il.

Option         | Explication
---            | ---
`Height`       | Le numéro du bloc.
`Age`          | Il y a combien de temps le bloc a été ajouté à la chaîne de bloc.
`Transactions` | Le nombre de transactions inclues dans le bloc.
`Votes`        | Le nombre de preuve d'enjeu inclues dans le bloc.
`Fresh Stake`  | Le nombre de nouveau ticket acheteé dans ce bloc.
`Size`         | La taille (en octets) du bloc.

Sous `Latest Transactions`, vous pouvez voir l'ID de transaction (txid) et la valeur (en DCR) transmise sur le réseau.

---

## **<i class="fa fa-cube"></i> Blocs**

On peut trouver des blocs en recherchant leur numéro de hauteur de bloc,
En cliquant sur une valeur `Hauteur` à partir de la page d'accueil ou de leur
valeur 'BlockHash`. Les blocs plus anciens auront des nombres de blocs inférieurs. L'aperçu de la moitié de la hauteur des blocs représente des informations pertinentes à ce sujet de ce bloc spécifique. Cette information comprend: la hauteur du bloc, le bloc hash, et plusieurs paramètres clés du réseau, décrits ci-dessous:

Option                   | Explication
---                      | ---
`Number of Transactions` | Le nombre de transactions standard (DCR envoyé d'un utilisateur à l'autre).
`Height`                 | La hauteur de la chaîne de blocs dans le résidu de ce bloc.
`Block Reward`           | Le montant de nouveau DCR mineé dans ce bloc.
`Timestamp`              | Le moment où ce bloc a été créé par un mineur et a été inclus dans la chaîne de bloc.
`Merkle Root`            | Une valeur de hash de tous les hachages de transaction inclus dans ce bloc.
`Stake Root`             | Une valeur de hash de tous les hash de transaction liés à la mise en jeu dans ce bloc. Cela comprend les achats de ticket, les votes et les révocations de tickets.
`VoteBits`               | (1) Block a été approuvé par les électeurs de la preuve de participation. (2) Block a été veto par les électeurs de la preuve d'enjeu et toutes les transactions autres que les participations dans le bloc ont été invalidées, ainsi que la subvention des mineurs et des subventions au développement.
`Final State`            | L'état final du générateur de nombres pseudo-aléatoires utilisé pour la sélection des tickets.
`Voters`                 | Le nombre de votes d'enjeu réussis dans ce bloc. La valeur maximale est 5.
`Fresh Stake`            | Le nombre de ticket d'enjeu confirmé dans ce bloc.
`Revocations`            | Le nombre de tickets qui n'ont pas voté et ont été révoqués.
`PoolSize`               | Le nombre total de ticket d'enjeu.
`Difficulty`             | Le réseau de la preuve de travail.
`SBits`                  | Le prix d'un ticket d'enjeu.
`Bits`                   | Une version compacte de la difficulté du réseau au moment où le bloc a été extrait.
`Size`                   | La taille du bloc (en octet)).
`Version`                | La version de block.
`Nonce`                  | La valeur utilisée par un mineur pour trouver la solution correcte pour ce bloc.

## **<i class="fa fa-exchange"></i> Transactions**

Cette section répertorie toutes les transactions qui ont été extraites dans ce bloc. Les transactions sont choisies dans le réseau mempool dans l'ordre des frais les plus élevés en premier. Toutes les transactions dans la synthèse des blocs suivent cette commande: transactions standard (transfert peer-to-peer),
 les votes de la preuve d'enjeu, les achats de tickets de preuve d'enjeu. Les sections suivantes passe en revue chaque type de transaction.

---

### Transactions Standard

Voici les informations incluses dans une norme de ransaction non confirmée qui a traversé le réseau de Decred. Non confirmé signifie n'a pas encore été inclus dans un bloc, ce qui implique qu'il s'agit d'une transaction récente ou a été envoyé avec des frais très bas.

Option              | Explication
---                 | ---
`Size`              | La taille de la transaction en octets.
`Fee rate`          | Le taux de redevances perçues par le réseau (par kB).
`Received Time`     | Le moment où le réseau a confirmé la transaction.
`Mined Time`        | Le moment où un mineur a inclus la transaction dans un bloc.
`Included in Block` | Le numéro de bloc dans lequel la transaction est devenue part.

Note `Received Time`, `Mined Time` et `Included in Block` n'auront pas une valeur jusqu'à ce qu'un mineur confirme la transaction. En fonction des frais dans la mempool, cela prendra cinq minutes en moyenne. Une fois qu'il y a au moins une confirmation, la transaction est considérée achevée.

---

### Achat de Ticket

Pour un achat de ticket (soumission de participation), il existe quelques différences à partir d'une transaction standard affichée.

Notez la différence sous les détails: le mot `Ticket` apparaît au-dessus de l'adresse du portefeuille de l'expéditeur sur la gauche, et les mots `Subsidy Commitement`apparaîssent sur la droite. Cet utilisateur particulier a acheté un
ticket d'enjeu pour 8.75411638 DCR et reçu un changement de montant de 7.15994209 DCR. L'adresse indiquée à gauche sur `Ticket` est l'adresse qui contient les fonds utilisés pour acheter ce ticket. La première sortie à droite est l'adresse qui conserve les droits de vote pour ce ticket spécifique. La deuxième sortie, Subsidy Commitement`, est l'adresse où la récompense sera versée. Ce n'est pas encore montré par l'explorateur de bloc en ce moment. La troisième et dernière sortie est l'adresse où les changements pour cette transaction seront envoyés.

---

### Vote Preuve-d'Enjeu

Notez les termes d'identification dans la section des détails: `Vote`, `Stake Base`, `Block Commitement` et `Vote Bits`:

Ces mots clés indiquent que cette transaction est un vote qui a été appliqué à partir d'un ticket de preuve d'enjeu. Dans cet exemple particulier, l'utilisateur avait précédemment acheté un ticket pour 8.99472311 DCR et a été
envoyé 10.82959184 DCR après la publication du vote dans cette transaction.
