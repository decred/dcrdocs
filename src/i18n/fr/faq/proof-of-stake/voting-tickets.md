# Tickets de Vote

---

#### 1. Quand a-t-il commencé le vote par la preuve-d'enjeu?

La preuve d'enjeu aà commencé au bloc[^7969] 4,096.

---

#### 2. Dans le code source TicketPoolSize est défini sur 8,192, mais la taille actuelle du pool de tickets est supérieure à celle. Pourquoi?

C'est intentionnel et fait partie intégrante de l'ajustement dynamique du prix du ticket [^8965]. Le `TicketPoolSize` est la taille du pool de tickets cible et cela fonctionne très semblable à la difficulté cible de la preuve de travail (PdT). Le fait que la taille actuelle de la pool de ticket soit plus grande que la cible est ce qui provoque l'augmentation du prix du ticket qui, à son tour, entraînera éventuellement moins de ticket et entraînera le nombre de tickets dans la pool de se réduisent vers la cible. Si elle tombe sous, le prix va baisser pour encourager davantage de ventes de ticket afin d'augmenter le nombre de ticket dans la piscine vers la cible.

---

#### 3. Si j'ai de la malchance et que mon ticket expire sans vote, est-ce que je perds les frais de transaction??

Oui[^9806].

---

#### 4. Le vote sur mainnet a été bloqué jusqu'au bloc 4096, alors que les gens achètent des tickets. Cela signifie-t-il qu'il y aura un risque beaucoup plus élevé pour ces tickets d'expirer?

Non[^9806], le délai d'expiration ne commence pas jusqu'à ce qu'un ticket soit réellement extrait dans un bloc. Les tickets étaient simplement en attente dans la pool de mémoire jusqu'à ce qu'ils puissent être inclus dans les blocs à partir du bloc 4,096.

---

#### 5. Que se passe-t-il si aucun (ou moins de 3) des électeurs sélectionnés n'émettent leurs transactions ssgen?

Les votes sont toujours déterminés par la pointe actuelle. Les mineurs ne commencent pas à exploiter un nouveau bloc jusqu'à ce que au moins 3+ des électeurs sélectionnés émettent leurs transactions ssgen. Donc, si un bloc trouvé ne parvient pas à obtenir les votes sélectionnés[^10219], le bloc est simplement orphelin par le prochain bloc qu'un mineur trouve.

Pour un exemple plus concret, supposons que la chaîne actuelle soit au bloc 5000. Les électeurs déterminés par le bloc 5000 ont déjà soumis leurs votes, de sorte que les mineurs échouent à chercher le bloc 5001. Maintenant, un mineur trouve une solution pour le bloc 5001 et le soumet au réseau. Tous les daemon (et donc les portefeuilles) verront que 5001 est apparu. Cependant, les mineurs ne commencent pas immédiatement à partir de 5001. Au lieu de cela, ils continuent à extraire 5000 jusqu'à ce que 3+ votes pour le bloc 5001 s'affichent. À ce moment-là, ils changent tous et commencent à s'enquérir de 5001. Si ces 3+ votes ne se présentent jamais, un autre bloc candidat 5001 sera trouvé par les autres mineurs qui travaillent encore sur le bloc 5000 qui présenteront leur solution (différente) pour le bloc 5001 au réseau. Étant donné que chacun de ces nouveaux blocs candidats pour 5001 ont un hash différent, différents tickets sont sélectionnés.

---

#### 6. Que se passe-t-il si un ticket m'a manqué un vote??

Votre portefeuille révoque automatiquement le ticket dans le bloc après avoir échoué [^13912], afin que vous les récupériez juste après qu'ils aient été manqué comme fonds immatures (cela signifie qu'ils ne seront pas dépensés pour 256 blocs lorsqu'ils mûront).

Par exemple:

```no-highlight
dcrctl --wallet getstakeinfo
```

Sortie          | Description
---             |---
`allmempooltix` | Tous les tickets de participation dans la pool de mémoire (en attente d'être inclus dans un bloc).
`ownmempooltix` | Vos tickets de participation dans la pool de mémoire (en attente d'être extraits dans un bloc).

---

#### 7. Quelle est la différence entre un ticket manqué et révoqué?

Les tickets émis sont des tickets qui ont été appelés à voter, mais ne l'ont pas fait. Une fois qu'un ticket a été manqué, il peut être révoqué [^14763]. Le portefeuille révoque automatiquement les tickets manqués qu'il contrôle (en supposant qu'il soit déverrouillé afin qu'il puisse signer la transaction de révocation).

Tout `rebroadcastmissed` fait son appel au portefeuille pour demander au daemon du réseau (` dcrd`) de lui donner à nouveau la liste des tickets manqués pour vérifier à nouveau s'il est nécessaire de révoquer. En règle générale, cela n'est pas nécessaire, sauf si, par exemple, une tentative de révoquaction d'un ticket a été effectuée mais a échoué car le portefeuille a été verrouillé. En d'autres termes, si vous remarquez que la révocation n'est pas égale à celle manquée, vous devrez peut-être `rebroadcastmissed`. Comme on l'a dit, il y a rarement besoin de cela puisque le portefeuille le fait automatiquement au démarrage et recherche des tickets manqués sur chaque bloc.

Continuez vers [Proof-of-Work Mining](/mining/proof-of-work.md)

---

## <i class="fa fa-book"></i> Sources 

[^7969]: Decred Forum, [Post 7,969](https://forum.decred.org/threads/531/#post-7969)
[^8965]: Decred Forum, [Post 8,965](https://forum.decred.org/threads/531/page-2#post-8965)
[^9806]: Decred Forum, [Post 9,806](https://forum.decred.org/threads/180/page-6#post-9806)
[^10219]: Decred Forum, [Post 10,219](https://forum.decred.org/threads/180/page-6#post-10219)
[^13912]: Decred Forum, [Post 13,912](https://forum.decred.org/threads/1271/#post-13912)
[^14763]: Decred Forum, [Post 14,763](https://forum.decred.org/threads/1335/#post-14763)
