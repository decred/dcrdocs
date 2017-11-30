# Mainnet Voting Guide

This guide was last updated on September 23, 2017.

Cette page est destinée à donner une brève introduction à la façon dont le vote par l'ordre du jour fonctionne et détaille le processus de fixation de vos tickets pour voter pour tout ordre du jour.

---

## Introduction

Il existe un processus en deux étapes pour voter pour mettre en œuvre des changements de consensus qui créeraient un scénario de hard fork.

Tout d'abord, il est important de noter que la chaîne de blocs de Decred a spécifiquement désigné deux intervalles de blocs différents pour le processus de vote. Il existe un **Stake Version Interval** (**SVI**) de 2016 blocs (~1 semaine) et **Intervalle de modification de règle** (**RCI**) de 8064 blocs (~4 semaines). Les intervalles de la version de 4 étapes correspondent à 1 Intervalle de Changement de Règle.

The first step of the voting process is to meet the upgrade threshold on the network. After the hard fork code is released (such as the sdiff algorithm change in v1.0.0), a majority of the nodes on the network participating in PoW/PoS need to first upgrade before the voting can be scheduled to begin. For Proof-of-Work, at least 95% of the 1000 most recent blocks must have the latest block version. For Proof-of-Stake, 75% of the votes cast within a single **SVI** must have the latest vote version. Once miner and voter upgrade thresholds are met, the voting is scheduled to begin on the first block of the next **RCI** (due to there being 4 **SVI**s per **RCI**, it can take up to 6048 blocks [3 **SVI**s] for the next **RCI** to begin).

La deuxième étape de ce processus est le vote effectif. Un seul **RCI** se transmet alors qu'un maximum de 40320 votes sont exprimés. Les votes sont comptabilisés au dernier bloc du **RCI**, et les résultats sont déterminés avant que le prochain bloc ne soit miné.

Il y a quelques résultats possibles d'un vote:

1. Si plus de 90% de tous les votes au sein du RCI sont des votes "Abstenir", le vote de l'ordre du jour reste actif pour le prochain RCI.
2. Si tous les votes qui ne s'abstiennent pas du RCI ne respectent pas le seuil majoritaire de 75% Oui ou Non, le vote par ordre du jour reste actif pour le prochain RCI.
3. Si 75% de tous les votes non abstenus au sein du RCI sont à l'appui de l'ordre du jour ("Oui"), l'ordre du jour est considéré comme verrouillé et les changements de consensus activeront 8064 blocs après le vote.
4. Si 75% de tous les votes qui ne s'abstiennent pas dans le RCI s'opposent à l'ordre du jour ("Non"), l'ordre du jour échoue et les changements de consensus ne seront jamais activés.
5. Si un programme arrive à son expiration avant d'atteindre un vote majoritaire de 75%, l'ordre du jour expire et les changements de consensus ne seront jamais activés.

Voici un diagramme de l'ensemble du cycle pour un seul programme avec des mises à niveau consensuelles.

<img src="/img/voting-cycle-v9.png">

---

## Voting Preparation

Pour participer au vote, vous avez d'abord besoin d'un portefeuille. Si vous n'en avez déjà déjà, visitez le [Guide du débutant](/getting-started/beginner-guide.md), choisissez un portefeuille et suivez les guides d'installation et de configuration.

Ensuite, vous devrez apprendre les bases de [Proof-of-Stake](/mining/proof-of-stake.md). Vous devrez être en mesure d' [acheter des billets] (/mining/proof-of-stake.md#how-to-stake) avec votre application de choix.

Finally, you'll need to learn how to set the `votechoice` for your tickets in order to cast a "Yes", "No", or "Abstain" vote for an agenda. By default, your tickets will cast "Abstain" votes. To set your vote choice, see our quick [How To Vote](/getting-started/user-guides/how-to-vote.md).

---

## Verifying Your Vote

The easiest method to track your how your tickets actually voted is to use the [block explorer](https://mainnet.decred.org) to view each of your votes.

The block explorer has been updated to display "YES", "NO", and "ABSTAIN" votes for each agenda with each ticket. The first and second tickets in the following example image voted "ABSTAIN" for both agendas while the third ticket voted "YES" for both agendas. The image will be updated to reflect the v5 agenda when voting is live.

<img src="/img/verify_block-explorer-votes.png">

---

## Tracking Vote Progress

[voting.decred.org](https://voting.decred.org) is an official website set up to track the progress of upgrading and voting.

---

## Voting Archive

This section provides an archive for previous votes along with their outcomes.

#V4#

## Change PoS Staking Algorithm
**Agenda ID:**  sdiffalgorithm

Change stake difficulty algorithm as defined in DCP0001

Specifies a proposed replacement algorithm for determining the stake difficulty (commonly called the ticket price). This proposal resolves all issues with a new algorithm that adheres to the referenced ideals.

## Voting Results: 

| Choice  | Result
|-----|-------|
|No   |  2.07%|
|Yes  | 97.92%|

**Locked In:** 141184<br />
**Activated:** 149248<br />
**Hard Forked:** 149328


## Start Lightning Network Support
**Agenda ID:**  lnsupport

Request developers begin work on Lightning Network (LN) integration

The Lightning Network is the most directly useful application of smart contracts to date since it allows for off-chain transactions that optionally settle on-chain. This infrastructure has clear benefits for both scaling and privacy. Decred is optimally positioned for this integration.

##Voting Results:

| Choice  | Result
|-----|-------|
|No   |  1.38%|
|Yes  | 98.61%|

**Locked In:** 141184<br />
**Activated:** 149248
