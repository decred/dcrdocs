# Conception hybride

---

Le contraste majeur avec le schéma suivant-satoshi décrit précédemment [^1] est un nouveau système de loterie dans lequel les billets doivent être achetés et attendent une période d'échéance avant de pouvoir être sélectionnés et dépensés. La sélection des tickets pour un bloc est effectuée lexicographiquement à partir d'une pool de billets mature basé sur la pseudorandomness contenue dans l'en-tête du bloc. Étant donné que la manipulation de cette pseudo-altération est difficile dans un système PdT, la manipulation de la sélection des tickets est associée à un coût fondamental pour le mineur PdT. La sélection des tickets sur une période de temps peut être décrite par une fonction de densité de probabilité similaire à la probabilité d'obtenir un bloc dans PdT à un taux de hachage constant au cours d'une difficulté constante [^2], ce qui donne une distribution de probabilité avec un mode approximativement égal à la moitié de la taille d'une pool de tickets. Le prix d'achat d'un billet est réglementé par une nouvelle difficulté de mise en jeu qui est déterminé par le nombre de tickets en nombre exponentiellement pondéré et la taille du pool de billets matures dans les blocs précédents

La validation des blocs PdT s'explique par les étapes suivantes:

1. Un bloc est exploité par un mineur PdT, qui sélectionne les transactions à mettre en place. Les transactions liées au système de pote sont insérées dans le set UTXO.
2. Les mineurs PdE votent sur le bloc en produisant une transaction de vote à partir de leur billet. Le vote permet à la fois de construire un bloc au-dessus du bloc précédent et choisit si l'arbre de transaction régulier précédent (contenant les transactions liées coinbase et une transaction d'enjeu non reliée) est valide.
3. Un autre mineur PdT commence à construire un bloc, en insérant les votes des mineurs PdE. La majorité des suffrages exprimés doit être inclus dans le bloc suivant pour que ce bloc soit accepté par le réseau. Sur les transactions de vote dans ce nouveau bloc, le mineur PdT vérifie un drapeau pour voir si le mineur PdT a indiqué si l'arbre de transactions régulières du bloc était valide. Ces indicateurs de vote sont comptabilisés et, sur la base d'un vote majoritaire, un indicateur de bit est défini dans ce bloc pour indiquer si l'arbre de transaction régulière du bloc précédent est valide.
4. Une valeur de circonstance est trouvé qui satisfait la difficulté du réseau, et le bloc est inséré dans la chaîne de blocs. Si l'arbre de transactions régulières du bloc précédent a été validé, insérez ces transactions dans l'ensemble UTXO. Aller à 1.

our décourager la manipulation des votes inclus, une pénalité de subvention linéaire est appliquée au bloc actuel s'ils n'incluent pas toutes les transactions de vote dans leur bloc. La pénalité "douce" d'invalidation de l'arborescence de transaction précédente permet d'éviter le rejet du travail, ce qui est nécessaire pour sécuriser le système et fait supposer que le prochain bloc sera obtenu par un mineur désintéressé pour préserver la subvention de l'ancien bloc en faveur de leurs propres. Même dans le cas où ce n'est pas vrai, un mineur malveillant avec un taux de hachage élevé aura encore au moins besoin \((\text{number for majority}/2)+1\) votes en faveur de l'arbre de transaction de leur bloc précédent afin de produire un bloc qui leur donne une subvention du bloc précédent.

Les indicateurs d'octets sont explicitement ajoutés à la fois à l'en-tête du bloc et aux votes afin que les mineurs puissent facilement voter dans de nouvelles hard fork ou soft fork.

---

## <i class="fa fa-book"></i> Références 

[^1]: Bentov I., Lee C., Mizrahi A., Rosenfeld M. 2014. [Proof-of-activity: Extending Bitcoin's proof-of-work via proof-of-stake](https://decred.org/research/bentov2014.pdf).
[^2]: Nakamoto S. 2008. [Bitcoin: A peer-to-peer electronic cash system](https://decred.org/research/nakamoto2008.pdf).
