# Mainnet Voting Guide

This guide was last updated on September 23, 2017.

Esta página pretende dar una breve introducción a cómo funciona la votación de la agenda y detalla el proceso para establecer sus boletos para emitir su voto preferido para cualquier agenda.

---

## Introduction

Hay un proceso de dos fases para votar para implementar cambios de consenso que crearían un escenario de bifurcación dura.

En primer lugar, es importante señalar que la cadena de bloques Decred ha designado específicamente dos intervalos de bloques diferentes para el proceso de votación. Hay un **Intervalo de Versión de Participación** (**SVI**) de 2016 bloques (~1 semana) y un **Intervalo de Cambio de Regla** (**RCI**) de 8064 bloques (~4 semanas). 4 Intervalos de Versión de Participación se ajustan a 1 Intervalo de Cambio de Regla.

The first step of the voting process is to meet the upgrade threshold on the network. After the hard fork code is released (such as the sdiff algorithm change in v1.0.0), a majority of the nodes on the network participating in PoW/PoS need to first upgrade before the voting can be scheduled to begin. For Proof-of-Work, at least 95% of the 1000 most recent blocks must have the latest block version. For Proof-of-Stake, 75% of the votes cast within a single **SVI** must have the latest vote version. Once miner and voter upgrade thresholds are met, the voting is scheduled to begin on the first block of the next **RCI** (due to there being 4 **SVI**s per **RCI**, it can take up to 6048 blocks [3 **SVI**s] for the next **RCI** to begin).

The second step of this process is the actual voting. A single **RCI** transpires while a maximum of 40320 votes are cast. The votes are tallied at the final block of the **RCI**, and outcomes are determined prior to the next block being mined.

There are a few possible outcomes of a vote:

1. If more than 90% of all votes within the RCI are "Abstain" votes, the agenda vote remains active for the next RCI.
2. If all non-abstaining votes within the RCI fail to meet the 75% Yes or No majority threshold, the agenda vote remains active for next RCI.
3. If 75% of all non-abstaining votes within the RCI are in support of the agenda ("Yes"), the agenda is considered locked in and the consensus changes will activate 8064 blocks after the vote passed.
4. If 75% of all non-abstaining votes within the RCI are in opposition of the agenda ("No"), the agenda fails and the consensus changes will never activate.
5. If an agenda reaches its expiration before ever reaching a 75% majority vote, the agenda expires and the consensus changes will never activate.

Below is a diagram of the entire cycle for a single agenda with consensus upgrades.

<img src="/img/voting-cycle-v9.png">

---

## Voting Preparation

To participate in voting, you first need a wallet. If you don't have one already, visit the [Beginner Guide](/getting-started/beginner-guide.md), choose a wallet, and follow the installation and setup guides.

Next, you'll need to learn the basics of [Proof-of-Stake](/mining/proof-of-stake.md). You'll need to be able to [buy tickets](/mining/proof-of-stake.md#how-to-stake) with your application of choice.

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
