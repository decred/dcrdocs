# <i class="fa fa-ticket"></i> Acheter des Tickets et Frais

---

#### 1. Existe-t-il un moyen de voir les tickets achetés par un portefeuille local?

Utilisez la commande suivante pour afficher tous vos tickets[^9987]:

```no-highlight
dcrctl --wallet gettickets true
```

---

#### 2. Est-ce que je paie des frais de transaction pour la transaction ssgen?

Non, ssgen n'impose pas de frais[^10219] (contrairement aux transactions d'achat de ticket d'origine qui rivalisent pour des espaces limités dans chaque bloc). Ils sont effectivement comme des transactions coinbase preuve-de-travail à cet égard.

---

#### 3. Comment changer les frais du ticket?

```no-highlight
dcrctl --wallet setticketfee <fee>
```

---

#### 4. Comment puis-je acheter manuellement des tickets?

```no-highlight
dcrctl --wallet purchaseticket <fromaccount> <spendlimit> <minconf>
```

Où:

Option        | Explication
---           | ---
`fromaccount` | Habituellement "défaut" (Sauf si vous avez créé un autre).
`spendlimit`  | Nombre maximal de DCR que vous souhaitez dépenser sur les tickets.
`minconf`     | Ceci peut être réglé sur 0.

---

#### 5. Comment devrais-je régler txfee?

Le  `ticketfee` (ou frais de ticket) détermine l'ordre dans lequel les ticket de mempool entrent dans la pool de vote. Des frais plus élevés encouragent les mineurs Preuve-de-travail à mettre vos tickets à l'avant de la file d'attente. Si vous définissez les frais supérieurs à la moyenne, vos ticket sont plus susceptibles d'être inclus dans le prochain bloc. Le txfee par défaut est de 0,01 DCR. Il semblerait alors que la meilleure idée est de configurer votre txfee en haut afin que vous soyez au premier plan. Mais ce n'est pas toujours une bonne idée. En fait, c'est rarement une bonne idée simplement parce que la file d'attente mempool est très courte ou nulle la plupart du temps. N'oubliez pas que le txfee rêduira votre bénéfice DCR car il est changé sur chaque ticket et n'est pas remboursable que si il vote ou pas.

Considérez un coût d'enjeu constant de 10 DCR. Chaque bloc 20 tickets peuvent se déplacer dans la pool de vote du mempool. C'est une valeur de 200 DCR. Chaque bloc génère environ 30 DCR et renvoie 50DCR aux électeurs. 3 DCR est envoyé aux développeurs pour aider à financer le développement de Decred, donc seulement 27 finissent dans les mains des mineurs. Cela signifie que 77 DCR est libéré de chaque bloc pour retourner dans les tickets, en supposant que tous les retours sont réinvestis. C'est moins de la moitié de ce que le bloc peut gérer. La seule façon pour que plus de DCR entrent dans la mempool est par des investissement externe (c.-à-d. acheter à partir d'un échange) ou de mineurs qui ont leur DCR en attente de la baisse du coût de l'investissement.

Dans le cas d'une baisse des coûts, un mineur cherche à entrer dans la pool avant que le coût ne change à nouveau. Cela se produit tous les 144 blocs (environ 12 heures). Peu importe si c'est dans le premier bloc ou le 100ieme. Dans 144 blocs, 2880 tickets seront acceptés avec une valeur de 28800 DCR. Il n'y a pas cette sorte de volume dans le réseau de la preuve-d'enjeu à ce moment. Il existe un scénario dans lequel vous pourriez vouloir fixer vos frais plus haut. Si le coût de l'enjeu est sur le point de changer en quelques blocs, la mempool n'est pas vide et vous voulez vous assurer que vous obtenez le prix actuel, cela peut aider à fixer vos frais un peu plus élevé que la moyenne pour vous assurer d'entrer, surtout si la prochaine modification signifie que vous manquez un ticket.

Continuez vers [PdE Minage Solo FAQ](/faq/proof-of-stake/solo-mining.md)

---

## <i class="fa fa-book"></i> Sources 

[^9987]: Decred Forum, [Post 9,987](https://forum.decred.org/threads/582/page-2#post-9987)
[^10219]: Decred Forum, [Post 10,219](https://forum.decred.org/threads/180/page-6#post-10219)
