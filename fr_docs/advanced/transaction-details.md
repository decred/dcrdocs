# **Details de Transaction**

---

Les transactions Decred sont des transferts de DCR qui existent dans des blocs. Les transactions sont principalement constituées d'entrées et de sorites, mais elles ont aussi quelques autres champs de données. 


## **Format de Transaction**

Domaine        | Description                                                                                    | Taille
---          | ---                                                                                            | ---
Version      | Version de transaction. Ce numéro sert à indiquer comment la transaction doit être interprétée  | 4 bytes
Nombre d'entrées  | Le nombre d'entrées dans la transaction codée en nombre entier de longueur variable                   | 1-9 bytes
Entrées       | Liste sérialisée de toutes les entrées de la transaction                                                | Variable
Nombre de sorties | Le nombre de sorties dans la transaction est codé en entier de longueur variable                  | 1-9 bytes
Sorties      | Liste sérialisée de toutes les sorties de la transaction                                               | Variable
Temps de verrouillage    | Le moment où une transaction peut être dépensée. (Habituellement zéro, dans ce cas il n'a aucun effet)        | 4 bytes
Échéance       | La hauteur du bloc auquel la transaction expire et n'est plus valide                       | 4 bytes


### Entrées
Les entrées passent des sorties précédemment réalisées. Il existe deux types d'entrées de transaction: témoin et non-témoin.


#### Entrées non témoins
Une entrée de transaction non-témoin est une référence à une sortie non utilisée et à un numéro de séquence. Une référence à une sortie non utilisée appelée "point de dépassement". Les point de dépassement ont trois champs:

Champ            | Description                                                                                                                           | Taille
---              | ---                                                                                                                                   | ---
Hash de ransaction | Le hash de la transaction qui contient la sortie dépensée                                                                     | 32 bytes
Indice de sortie     | L'indice de la sortie en cours d'envoi                                                                                                   | 4 bytes
Arbre             | Quel arbre la sortie en cours utilise. Cela est nécessaire car il existe plus d'un arbre utilisé pour localiser les transactions dans un bloc. | 1 byte

En plus d'un point de dépassement, les entrées non-témoins contiennent un numéro de séquence. Ce nombre a une signification plus historique que l'utilisation pertinente; Cependant, son but le plus pertinent est de permettre le "verrouillage" des paiements afin qu'ils ne puissent être échangés que jusqu'à un certain moment.


#### Entrées témoins
Une entrée de transaction témoin contient les données nécessaires pour prouver qu'une sortie peut être dépensée. Les contributions des témoins contiennent quatre champs de données:

Champ            | Description
---              | ---
Valeur            | Le montant des pièces de monnaie que la sortie qui est dépensée transfère.
Hauteur du bloc     | La hauteur du bloc contenant la transaction dans laquelle se trouve la sortie dépensée.
Indice du bloc      | L'indice de la transaction dans laquelle se trouve la sortie dépensée.
Script de signature | Le script qui satisfait aux exigences du script dans la sortie dépensée.


### Sorties
Les sorties sont des transferts de DCR qui peuvent être dépensés par des entrées. Les sorties ont toujours trois champs de données:

Champ             | Description                                                                                     | Taille
---               | ---                                                                                             | ---
Valeur             | La quantité de DCR envoyée par la sortie.                                                     | 8 bytes
Version           | La version de la sortie. Ce numéro sert à indiquer comment la sortie doit être interprétée. | 2 bytes
Script de clé publique | Clé publique le script qui doit être satisfait de passer le Script de sortie                                           | Variable

---

## **Serialisation**
Le format affiché ci-dessus n'est pas le format auquel les transactions sont envoyées et reçues. Lors de l'envoi ou de la réception de transactions, elles peuvent être sérialisées de quelques façons. La façon dont une transaction doit être désérialisée peut être déterminée à partir de sa version. Les versions de transaction occupent quatre octets, mais ces quatre octets sont utilisés pour stocker deux valeurs distinctes. Les deux premiers octets de la version d'une transaction indiquent son numéro de version réel. Les deux premiers octets désignent leur format de sérialisation.


### Formats de Serialisation
Lors de la sérialisation, il existe deux parties principales d'une transaction: son «préfixe» et ses données de témoins.
Le préfixe de transaction comprend:

* Entrées (sans données témoins)
* Les sorties
* Heure de verrouillage
* Expiration

Les données des témoins d'une transaction ne comportent que ses entreées. Les champs de données inclus de ses entrées dépendent du format de sérialisation spécifique. Ce format peut être l'un des suivants:

* **0 (Complète Serialisation)** - Le préfixe de la transaction est situé immédiatement avant les données de son témoin.
* **1 (Pas de témoins)** - Le préfixe de la transaction est la seule donnée présente.
* **2 (Témoins seulement)** - Les données des témoins de la transaction sont les seules données présentes. Pour chaque entrée, cela inclut sa valeur, sa hauteur de bloc, son index de bloc et son script de signature.
* **3 (Témoins signant)** - Les données des témoins de la transaction sont les seules données présentes et sont sérialisées à des fins de signature. Pour chaque entrée, cela inclut uniquement son script de signature.
* **4 (Témoins signant avec valeur)** - Les données des témoins de la transaction sont les seules données présentes et sont sérialisées à des fins de signature. Contrairement au format de signature du témoin, ce format comprend la valeur de chaque entrée avant son script de signature.