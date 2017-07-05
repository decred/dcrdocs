# Mainnet Voting Guide

This guide was last updated on September 23, 2017.

Ова страница је намењена кратком уводу како гласање дневног реда функционише и детаљно описује процес постављања ваших карата да би вам дали свој омиљени глас за било који дневни ред.

---

## Introduction

Постоји двостепени процес гласања за спровођење консензуских промена које би створиле тежак сценарио.

Прво, важно је напоменути да је Децхед блокчејн посебно одредио два различита интервала за гласање. Постоји интервал **Stake Version Interval** (**SVI**) од 2016 године (~1 week) and a **Rule Change Interval** (**RCI**) од 8064 блокова (~4 недеље). Интервали са 4 става се уклапају у 1 интервал измене правила.

The first step of the voting process is to meet the upgrade threshold on the network. After the hard fork code is released (such as the sdiff algorithm change in v1.0.0), a majority of the nodes on the network participating in PoW/PoS need to first upgrade before the voting can be scheduled to begin. For Proof-of-Work, at least 95% of the 1000 most recent blocks must have the latest block version. For Proof-of-Stake, 75% of the votes cast within a single **SVI** must have the latest vote version. Once miner and voter upgrade thresholds are met, the voting is scheduled to begin on the first block of the next **RCI** (due to there being 4 **SVI**s per **RCI**, it can take up to 6048 blocks [3 **SVI**s] for the next **RCI** to begin).

Други корак овог процеса је стварно гласање. Појединачна **RCI** е преноси док се гласује највише 40320 гласова. Гласови се прикупљају у завршном дијелу **RCI**, а исходи се одређују пре него што се следећи блок минира.

Постоји неколико могућих исхода гласања:

1. Ако више од 90% свих гласова у РЦИ гласају "Абстин", гласање дневног реда остаје активно за следећи RCI.
2. Ако сви гласови који нису уздржани од гласања у РЦИ-у не испуњавају 75% Да или Не већински праг, гласање дневног реда остаје активно за следећи RCI.
3. Ако се 75% свих гласова који нису уздржани од гласања у РЦИ-у подржавају дневни ред ("Да"), дневни ред се сматра закључаним, а промене консензуса ће активирати 8064 блокова након што је гласање прошло.
4. Ако 75% свих гласова који нису уздржани од гласања у РЦИ-у су у супротности са дневним редом ("Не"), дневни ред није успео и промене консензуса никада неће активирати.
5. Ако дневни ред достигне свој истек пре него што икада постигне 75% већине гласова, дневни ред истиче и измјене консензуса никада неће активирати.

Испод је дијаграм читавог циклуса за појединачну агенду са консензусним надоградњама.

<img src="/img/voting-cycle-v9.png">

---

## Voting Preparation

Да бисте учествовали у гласању, прво вам је потребан новчаник. Ако га већ немате, посетите [Beginner Guide](/getting-started/beginner-guide.md), изаберите новчаник и пратите водиче за инсталацију и подешавање.

Затим, морате научити основе [Proof-of-Stake](/mining/proof-of-stake.md). Морате бити у стању да [buy tickets](/mining/proof-of-stake.md#how-to-stake) са вашом пријавом избора.

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
