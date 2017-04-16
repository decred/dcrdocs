# **<i class="fa fa-info-circle"></i> Vue d'Ensemble**

Decred a deux méthodes de vérification de transaction preuve-de-travail (PdT) et preuve-d'enjeu (PdE).

---

## **1. <i class="fa fa-fire"></i> [Preuve-de-travail (PdT)) Minage](proof-of-work.md)**

Preuve-de-travail plus communément appelée minage PdT, est l'activité de commettre le matériel et les ressources de votre ordinateur pour traiter le réseau des transactions et de construire les blocs qui composent la chaîne de blocs dans le réseau Decred. Chaque fois qu'un bloc est créé (par un mineur), environ 30 nouvelles pièces sont crées. Ces pièces sont divisées comme suit:

Subvention | Partie
---     | ---
`60%`   | PdT Mineurs
`30%`   | PdE Voteurs
`10%`   | Decred development subsidiaire

En moyenne, vous recevrez une récompense approximativement proportionnelle au hashrate de votre mineur et le hashrate global du réseau lorsque vous commettez votre ordinateur au minage PdT. Pour commencer, vous devez avoir un ordinateur avec une carte vidéo. La plupart des cartes vidéo peuvent être utilisées pour le minage (y compris le modèle trouvés dans les "mobile" de certains ordinateurs portables). En général, les cartes vidéo haut de gamme se produisent un hashrate plus élevés et reçoivent donc des récompenses plus élevées.

---

## **2. <i class="fa fa-ticket"></i> [Preuve-d'enjeu (PdE) Minage](proof-of-stake.md)**

Preuve-d'enjen minage(PdE) est la deuxième méthode de vérification des blocs dans Decred. Il est à bon marché, mais il vous faut déjà avoir quelques DCR dans votre portefeuille. Dans le réseau de Decred, les mineurs PdT résolvent les blocs puis tournent ces blocs aux mineurs de PdE pour voter sur eux. Quand un bloc est terminé, 5 billets sont choisi au hasard dans la pool PdE pour voter sur le bloc. Si au moins 3 votes sont 'Oui' alors le bloc est validé, inclus dans la chaîne de blocs et les deux PdT et PdE sont payés. Si le vote échoue, le bloc est rejeté et les transactions doivent être introduitent dans un autre bloc. Les mineurs PdT ne sont pas payé, mais les mineurs PdE le sont.

Il s'agit d'encourager les mineurs PdT à miner selon les souhaits des mineurs PdE. Par exemple, si les règles du réseau changent à l'avenir les mineurs qui ne les suivent ne seront pas payés. Cela aide aussi à arrêter les plus grosses pool de minage qui ont trop d'influence sur le réseau. Dans les cryptocurrency qui n'utilisent pas PdE, les larges groupes de mineurs PdT qui contrôle efficacement le réseau peut s'accorder pour bloquer les transactions, arrêter les changement du réseau ou même forcer de fausses transactions (bien que cela prendrait une énorme
quantité de ressources). La complicité entre les mineurs PdT et PdE n'est pas possible car les billets ne sont pas choisis avant l'heure du vote. La complicité entre mineurs PdT est aussi éloignée que la pool de billets est conservé à environ 40960 tickets actifs à tout moment. La chance que trois billets appartienne au même individu ou que le groupe soit choisi pour le même bloc est très petite. Même si cela se produit, chaque transaction est validée au moins deux fois, de sorte que la chance de toute personne manipulant la chaîne de blocs est effectivement nulle.
