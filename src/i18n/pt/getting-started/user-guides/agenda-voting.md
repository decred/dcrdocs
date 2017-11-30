# Mainnet Voting Guide

This guide was last updated on September 23, 2017.

O propósito desta página é fornecer uma breve introdução ao funcionamento da votação na agenda do projeto e detalhes acerca do processo de alocação de tickets de modo a dar seu voto de preferência nas questões abrangidas por tal agenda

---

## Introduction

Existe um processo de duas fases para votação implementar as mudanças de consenso, que cria um cenário de Hard Forking.

Primeiramente, é importante notar que a blockchain do Decred designou especificamente dois intervalos de bloco diferentes para o processo de votação. Tem a **Stake Version Interval** (**SVI**) de 2016 blocos (~1 semana) e um **Rule Change Interval** (**RCI**) de 8064 blocos (~4 semanas). 4 Stake Version Intervals cabem em 1 Rule Change Interval.

The first step of the voting process is to meet the upgrade threshold on the network. After the hard fork code is released (such as the sdiff algorithm change in v1.0.0), a majority of the nodes on the network participating in PoW/PoS need to first upgrade before the voting can be scheduled to begin. For Proof-of-Work, at least 95% of the 1000 most recent blocks must have the latest block version. For Proof-of-Stake, 75% of the votes cast within a single **SVI** must have the latest vote version. Once miner and voter upgrade thresholds are met, the voting is scheduled to begin on the first block of the next **RCI** (due to there being 4 **SVI**s per **RCI**, it can take up to 6048 blocks [3 **SVI**s] for the next **RCI** to begin).

O segundo passo desse processo é a votação em si. Uma única **RCI** torna-se conhecida enquanto um máximo de 40320 votos são feitos. Os votos são contados ao final do bloco do **RCI**, e o resultado da votação são determinados antes que o próximo bloco seja minerado.

Existem alguns possíveis resultados de uma votação:

1. Se mais de 90% dos votos na RCI forem "Abstenção", a votação nesse determinado assunto permanece ativa para a próxima RCI.
2. Se todos os votos diferentes de "abstenção" na RCI não conseguirem uma maioria de 75% para Sim ou para Não, a votação nesse determinado assunto permanece ativa para a próxima RCI.
3. Se 75% de todos os votos diferentes de "abstenção" na RCI forem favoráveis à proposta ("Sim"), ela é considerada fechada e as mudanças serão ativadas 8064 blocos após sua aprovação.
4. Se 75% de todos os votos diferentes de "abstenção" na RCI forem desfavoráveis à proposta ("Não"), ela recusada e as mudanças não entram em vigor.
5. Se a proposta alcançar sua data de expiração antes de alcançar maioria de 75% dos votos, ela expira e não entra em vigor.

Abaixo está um gráfico de todo o ciclo para uma única agenda com as atualizações de consenso.

<img src="/img/voting-cycle-v9.png">

---

## Voting Preparation

Para participar da votação, você primeiro precisa de uma wallet. Se você ainda não tem uma, vá ao [Guia do Iniciante](/getting-started/beginner-guide.md), escolha uma wallet e siga o guia de instalação da que você escolheu.

Em seguida, você vai precisar aprender o básico sobre [Proof-of-Stake](/mining/proof-of-stake.md). Você precisará estar habilitado a [comprar tickets](/mining/proof-of-stake.md#how-to-stake) utilizando a aplicação que escolheu.

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
