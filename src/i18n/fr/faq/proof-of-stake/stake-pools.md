# <i class="fa fa-life-ring"></i> Pools d'Enjeu

---

#### 1. Y a-t-il d'autres avantages pour une pool d'enjeu autrement que de ne pas avoir besoin d'exécuter une node complète et de garder votre portefeuille débloqué? Par exemple, aura-t-il une meilleure chance de gagner ou quelque chose comme ça?

Les pool de minage impliquent généralement la redondance multi-portefeuille en ayant beaucoup de portefeuilles physiquement distribués dans le monde entier. Cela signifie qu'il y a moins de chance qu'un vote soit manqué parce qu'un portefeuille est en panne. Cela réduit également la latence entre le portefeuille et le réseau, ce qui peut réduire les chances d'un vote manqué.

---

#### 2. Est-ce qu'une pool de preuve d'enjeu regroupe une récompense entre tous les participants (% selon le montant des tickets que vous avez soumis aà la pool)?

Il est techniquement possible de créer un pool qui prend en charge le fractionnement proportionnel des primes[^9262], mais l'implémentation actuelle de la mise en jeu de stakepool `dcrstakepool` ne l'autorise pas. Il vote simplement en votre nom. Il fait cela en faisant du droit de vote des billets un script P2SH multi-signature 1-of-2. La piscine signe le vote avec sa clé privée au moment où le ticket est sélectionné. Comme il s'agit d'un script multi-signature 1-of-2, cela signifie que si le pool n'a pas voté pour vous pour quelque raison que ce soit (extrêmement peu probable car le pool mainnet aura une redondance multiple et un basculement automatique), il serait toujours possible Votez en votre propre nom parce que vous avez la deuxième clé privée et pourrait donc fournir une signature valide et satisfaire l'exigence du 1-de-2.

En outre, il est important de noter que l'achat du ticket d'origine contient un engagement à accéder à une adresse de récompense pour laquelle vous seul avez la clé privée. Les règles de consensus sur le vote à l'enjeu imposent l'engagement, de sorte qu'il est impossible pour le groupe de voler vos fonds.

Afin de diviser les récompenses, le pool devrait être récipiendaire de toutes les récompenses et être fiable pour répartir correctement les récompenses parmi tous les participants en fonction de leur proportionnalité. On s'attend à ce qu'un tel schéma soit développé dans la mesure où il est moins sécurisé que l'approche utilisée par la conception actuelle de la pool.

---

#### 3. Je dois lancer mon portefeuille pour acheter des ticket, mais votera-t-il correctement sans moi si je l'arrête et que la pool vote à la place?

Oui[^9274], c'est correct. Vous n'avez qu'à exécuter le portefeuille afin de dépenser vos coins pour acheter le ticket qui délègue vos droits de vote à la pool qui votera en votre nom. L'adresse de récompense est un engagement forcé par consensus dans l'achat de ticket pour l'une de vos adresses pour lesquelles vous avez seulement la clé privée.

---

#### 4. Y a-t-il des problèmes qui pourraient résulter d'une pool d'enjeu ayant trop de personnes. Par exemple, forcer le vote d'un bloc dans une direction ou l'autre?

C'est certainement possible[^9311], mais l'une des choses que tous les pools devraient supporter permet à chaque utilisateur de sélectionner ses préférences de vote individuelles. De cette façon, chaque fois que leur ticket survient et la pool vote en leur nom, il votera selon leurs préférences.

---

#### 5. Les bits de vote sont-ils définis lorsque vous achetez une participation ou lorsque vous êtes réellement appelé à voter? Cela change-t-il lorsque dans une pool d'enjeu?

Ils sont définis réellement lorsque vous votez[^13607] (ce qui n'a vraiment de sens parce que vous avez peut-être acheté le ticket des semaines ou des mois avant même qu'un agenda spécifique de vote existe).

Une pool d'enjeu peut fonctionner, si elle le veut, car il existe beaucoup de marge de manœuvre en la raison de la façon dont le régime d'engagement de l'achat de ticket est conçu. Cela dit, en général, les gens devraient éviter d'utiliser des pools d'enjeu qui ne leur permettent pas de contrôler la façon dont ils veulent voter sur des questions qui ne sont pas liées à la pool.

---

#### 6. Quelles garanties sont en place pour empêcher les propriétaires de la pool de disparaître avec les fonds?

La conception actuelle de la piscine est telle que le groupe ne peut PAS voler les fonds[^14593]. Vous ne déléguez que les droits de vote (et en réalité, c'est un multisig de 1-de-2 qui signifie que vous ou le groupe peut voter). L'achat de ticket comprend un engagement forcé par consensus pour l'adresse de la subvention finale, de sorte qu'il n'y a tout simplement aucun moyen pour le groupe de voler les fonds.

Le pire qui pourrait se produirait si un propriétaire de pool disparaît est que les votes seront manqués, ce qui entraînera la révoque du ticket qui, à son tour, amène les coins originaux à revenir au propriétaire d'origine de ces coins (moins les frais de transaction initiaux bien sûr). Cependant, comme mentionné précédemment, parce que le ticket est un multisig de 1-de-2, chaque utilisateur pourrait exécuter son propre porte-monnaie afin de voter si le propriétaire de la piscine disparaît.

---

#### 7. Où puis-je voir un exemple d'un ticket de pool d'enjeu sur l'explorateur de blocs?

Les Pools d'enejeu involve 'Dc' adresses depuis la pool d'enjeu pay-to-script-hash adresses[^17515]. Pour example, voir txid: [c0abc0ec63a8de15550f067e2b6fde28f0432fb91b938574b282daa69f914103](https://mainnet.decred.org/tx/c0abc0ec63a8de15550f067e2b6fde28f0432fb91b938574b282daa69f914103).

Continuez vers [Tickets de Vote FAQ PdE](/faq/proof-of-stake/voting-tickets.md)

---

## <i class="fa fa-book"></i> Sources 

[^9262]: Decred Forum, [Post 9,262](https://forum.decred.org/threads/626/#post-9262)
[^9274]: Decred Forum, [Post 9,274](https://forum.decred.org/threads/626/#post-9274)
[^9311]: Decred Forum, [Post 9,311](https://forum.decred.org/threads/582/page-2#post-9311)
[^13607]: Decred Forum, [Post 13,607](https://forum.decred.org/threads/1236/#post-13607)
[^14593]: Decred Forum, [Post 14,593](https://forum.decred.org/threads/1321/#post-14593)
[^17515]: Decred Forum, [Post 17,515](https://forum.decred.org/threads/1289/#post-17515)
