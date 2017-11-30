# <i class="fa fa-male"></i> Minage en Solo 

---

#### 1. Ai-je besoin d'un pouvoir de hachage pour le minage d'enjeu?

Le minage preuve-d'enjeu n'a pas besoin de puissance de hachage [^9304]. Pensez-y un peu à des intérêt sur les decred investis. Vous verrouillez vos coins pendant un certain temps afin d'acheter un ticket qui vous donne une probabilité élevée (>99%) de gagner des droits de vote et de recevoir des intérêts en échange d'un vote et le coût d'opportunité de ne pas pouvoir utiliser ces coin potentiellement jusqu'à ~ 4,7 mois.

Si vous avez déjà acheté des tickets de participation, ces coins sont verrouillez jusqu'à ce que les tickets votent ou expirent. Vous êtes en solo et, par conséquent, vous devez garder votre portefeuille en ligne 24 heures sur 24, 7 jours sur 7, jusqu'à ce que tous vos tickets aient votés (ou aient expiré) ou vous allez manquer les récompenses puisque vous ne pouvez pas voter si votre portefeuille n'est pas en ligne. Parce que ces coins sont maintenant verrouillés, il n'y a aucun moyen de changer les coins déjà mises en jeu.

La pool d'enjeu , en revanche, vous permet de déléguer vos droits de vote à la pool afin qu'elle soit responsable d'être en ligne 24 heures sur 24 et 7 jours sur 7 et de voter pour vous.

---

#### 2. N'est-ce pas l'une des principales raisons pour lesquelles le minage d'enjeu s'assure de toujours avoir une quantité suffisante de pairs en ligne?

Certainement pas [^9311]. Le minage d'enjeu ne peu possiblement pas renforcer ca. Un portefeuille SPV style peut effectuez facilement le jalonnement nécessaire en communiquant avec d'autres nodes complètes (instances `dcrd`) sur le réseau. Il est vrai que le portefeuille actuel exige que `dcrd` soit en cours d'exécution, mais ce ne sera pas toujours le cas.

Même si le logiciel a essayé de l'appliquer, vous ne pouvez pas empêcher les utilisateurs d'écrire des utilitaires et de le faire via le réseau peer-to-peer sans avoir à exécuter leur propre instance locale de toute façon.

---

#### 3. Que se passe-t-il si mon portefeuille est inaccessible ou verrouillé lorsque mes tickets sont sélectionnés par des mineurs?

Si votre portefeuille est hors ligne ou verrouillé [^9806] lorsque vos tickets sont sélectionnés, vous perdez sur les récompenses et votre ticket est retiré du pool immédiatement. Il n'y a pas de "retour".

---

#### 4. Puis-je vérifier si ma machine est accessible pour le vote? En d'autres termes, exécuter les actions d'un mineur qui voudrait obtenir mon vote.

Vous n'avez pas besoin d'être joignable. Le vote est déterministe sur une base par bloc [^9806]. C'est-à-dire que votre portefeuille saura si votre ticket est sélectionné en fonction du bloc actuel, puis une "transaction de vote" (transaction ssgen) est diffusée sur le réseau, tout comme les autres transactions.

---

#### 5. Puis-je gérer plusieurs portefeuilles de vote avec la même graine sur plusieurs serveurs?

Vous pouvez avoir plusieurs portefeuilles vote-uniquement, car ils ne créent pas de nouvelles adresses [^12697]. Le problème vient lorsque vous avez deux portefeuilles créant des transactions impliquant de nouvelles adresses car elles ne savent pas ce que l'autre fait.

Si vous effectuez une configuration chaude/froid, vous pouvez créer de multiples portefeuilles de vote sans problème tant que les deux sont au courant de l'adresse à laquelle vous avez droit de vote.

Continuez vers [Stake Pools FAQ](/faq/proof-of-stake/stake-pools.md)

---

## <i class="fa fa-book"></i> Sources 

[^9304]: Decred Forum, [Post 9,304](https://forum.decred.org/threads/626/page-2#post-9304)
[^9311]: Decred Forum, [Post 9,311](https://forum.decred.org/threads/582/page-2#post-9311)
[^9806]: Decred Forum, [Post 9,806](https://forum.decred.org/threads/180/page-6#post-9806)
[^12697]: Decred Forum, [Post 12,697](https://forum.decred.org/threads/1127/#post-12697)
