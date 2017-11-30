# Details de Transaction

---

Les transactions Decred sont des transferts de DCR qui existent dans des blocs. Les transactions sont principalement constituées d'entrées et de sorites, mais elles ont aussi quelques autres champs de données.


## Format de transaction

Champ        | Description                                                                                    | Taille
---          | ---                                                                                            | ---
Version      | Version de transaction. Ce numéro sert à indiquer comment la transaction doit être interprétée  | 4 octets
Input count  | Le nombre d'entrées dans la transaction est codé comme un nombre entier de longueur variable                   | 1-9 octets
Entrées       | Liste sérialisée de toutes les entrées de la transaction                                                | Variable
Output count | Le nombre de sorties dans la transaction est codé comme un nombre entier de longueur variable                  | 1-9 octets
Outputs      | Liste sérialisée de toutes les sorties de la transaction                                               | Variable
Heure de verrouillage    | Le moment où une transaction peut être dépensée. (habituellement zéro, auquel cas il n'a aucun effet)       | 4 octets
Expiration       | La hauteur du bloc à laquelle la transaction expire et n'est plus valide                       | 4 octets


### Entrées
Les intrants passent des sorties antérieures. Il existe deux types d'entrées de transaction: témoin et non-témoin.


#### Entrées non témoins
Une entrée de transaction non-témoin est une référence à une sortie non utilisée et à un numéro de séquence. Une référence à une sortie non utilisée est appelée "point de dépassement". Outpoints ont trois champs:

Champ            | Description                                                                                                                           | Taille
---              | ---                                                                                                                                   | ---
Hachage Transaction | Le hash de la transaction qui contient la sortie dépensée                                                                     | 32 octets
Indice de sortie     | L'indice de sortie étant dépensé                                                                                                   | 4 octets
Arbre             | Dans quel arbre de sortie les dépenses sont utilisée. Cela est nécessaire car il existe plus d'un arbre utilisé pour localiser les transactions dans un bloc. | 1 octet

En plus d'un point de dépassement, les entrées non-témoins contiennent un numéro de séquence. Ce nombre a une signification plus historique que l'utilisation pertinente; Cependant, son but le plus pertinent est de permettre le "verrouillage" des paiements afin qu'ils ne puissent être échangés que jusqu'à un certain moment.


#### Entrées des témoins
Une entrée de transaction de témoin contient les données nécessaires pour prouver qu'une sortie peut être dépensée. Les entrées des témoins contiennent quatre champs de données:

Champ            | Description
---              | ---
Valeur            | La quantité de coins que la sortie dépensée transfère.
Hauteur du bloc     | Hauteur du bloc contenant la transaction dans laquelle se trouve la sortie en cours de déploiement.
Indice de bloc      | L'indice de la transaction dans laquelle se trouve la sortie en cours de déploiement.
Script de signature | Le script qui satisfait aux exigences du script dans la sortie dépensée.


### Les sorties
Les sorties sont des transferts de DCR qui peuvent être dépensés par des entrées. Les sorties ont toujours trois champs de données:

Champ             | Description                                                                                     | Taille
---               | ---                                                                                             | ---
Valeur             | La quantité de DCR envoyée par la sortie.                                                     | 8 octets
Version           | La version de la sortie. Ce numéro sert à indiquer comment la sortie doit être interprétée. | 2 octets
Script de clé publique | Le script qui doit être satisfait pour passer la sortie                                           | Variable

---

## Serialisation
Le format affiché ci-dessus n'est pas le format auquel les transactions sont envoyées et reçues. Lors de l'envoi ou de la réception de transactions, elles peuvent être sérialisées de quelques façons. La façon dont une transaction doit être désérialisée peut être déterminée à partir de sa version. Les versions de transaction occupent quatre octets, mais ces quatre octets sont actuellement utilisés pour stocker deux valeurs distinctes. Les deux premiers octets de la version d'une transaction indiquent son numéro de version réel. Les deux premiers octets désignent leur format de sérialisation.


### Formats de Sérialisation
Lors de la sérialisation, il existe deux parties principales d'une transaction: son «préfixe» et ses données témoins.
Le préfixe de transaction comprend:

* Entrées (sans données témoins)
* Les sorties
* Heure de verrouillage
* Expiration

Les données des témoins d'une transaction ne comportent que ses intrants. Les champs de données inclus de ses entrées dépendent du format de sérialisation spécifique. Ce format peut être l'un des suivants:

* **0 (sérialisation complète)** - Le préfixe de la transaction est situé immédiatement avant les données de son témoin.
* **1 (Pas de témoin)** - Le préfixe de la transaction est la seule donnée présente.
* **2 (Le seul témoin)** - Les données des témoins de la transaction sont les seules données présentes. Pour chaque entrée, cela inclut sa valeur, sa hauteur de bloc, son index de bloc et son script de signature.
* **3 (Signature du témoin)** - Les données des témoins de la transaction sont les seules données présentes et sont sérialisées à des fins de signature. Pour chaque entrée, cela inclut uniquement son script de signature.
* **4 (signature du témoin avec valeur)** - Les données des témoins de la transaction sont les seules données présentes et sont sérialisées à des fins de signature. Contrairement au format de signature du témoin, ce format comprend la valeur de chaque entrée avant son script de signature.
