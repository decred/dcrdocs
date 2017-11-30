# Mainnet Voting Guide

This guide was last updated on September 23, 2017.

Tämän sivun tarkoitus on antaa lyhyt esittely siitä miten esityksistä äänestäminen toimii ja yksityiskohtia prosessiin jolla asetat lipukkeesi äänestämään haluamallasi tavalla mistä tahansa esityksestä.

---

## Introduction

Äänestysprosessi jolla toteutetaan konsesus-muutokset jotka voivat johtaa hard forkiin, on kaksivaiheinen.

Ensiksi, on olennaista kertoa että Decred-lohkoketjulla on kaksi nimenomaisesti äänestysprosessia varten asetettua lohko-intervallia. **Stake Version Interval** (**SVI**) on 2016 lohkoa (~1 Viikko) ja **Rule Change Interval** (**RCI**) on 8064 lohkoa (~4 viikkoa). 1 Rule Change Interval kestää 4 Stake Version Intervallia.

The first step of the voting process is to meet the upgrade threshold on the network. After the hard fork code is released (such as the sdiff algorithm change in v1.0.0), a majority of the nodes on the network participating in PoW/PoS need to first upgrade before the voting can be scheduled to begin. For Proof-of-Work, at least 95% of the 1000 most recent blocks must have the latest block version. For Proof-of-Stake, 75% of the votes cast within a single **SVI** must have the latest vote version. Once miner and voter upgrade thresholds are met, the voting is scheduled to begin on the first block of the next **RCI** (due to there being 4 **SVI**s per **RCI**, it can take up to 6048 blocks [3 **SVI**s] for the next **RCI** to begin).

Prosessin toinen askel on itse äänestäminen. Yhden **RCI**n aikana annetaan maksimissaan 40320 ääntä. Äänet lasketaan **RCI**n viimeisessä lohkossa, ja lopputulos on selvillä ennen seuraavan lohkon louhimista.

Äänestyksellä on useampi mahdollinen lopputulos:

1. Jos yli 90% kaikista äänistä RCI:n aikana ovat "Abstain" ääniä, agendan äänestys pysyy aktiivisena seuraavan RCI:n ajan.
2. Jos kaikki ei-pidättäytyvät äänet RCI:n aikana eivät onnistu saavuttamaan 75% Kyllä tai Ei-rajaa, agendan äänestys pysyy aktiivisena seuraavan RCI:n ajan.
3. Jos 75% kaikista ei-pidättäytyvistä äänistä RCI:n aikana kannattavat agendaa ("Yes"), agenda katsotaan hyväksytyksi ja konsesus-muutokset aktivoituvat 8064 lohkoa äänestyksen jälkeen.
4. Jos 75% kaikista ei-pidättäytyvistä äänistä RCI:n aikana vastustaa agendaa ("No"), agenda hylätään ja konsensus-muutokset eivät koskaan aktivoidu.
5. Jos agenda vanhenee ennen kuin se saa taakseen 75% enemmistön, se vanhenee ja konsensus-muutokset eivät koskaan aktivoidu.

Alla diagrammi yhden konsensuspäivityksiä sisältävän agendan koko kaaresta.

<img src="/img/voting-cycle-v9.png">

---

## Voting Preparation

Osallistuaksesi äänestykseen, tarvitset ensiksi lompakon. Jos sinulla ei vielä ole lompakkoa, katso [Aloittelijan Opas](/getting-started/beginner-guide.md), valitse lompakko, ja seuraa asennusohjeita.

Seuraavaksi sinun tarvitsee opetella [Proof-of-Stake](/mining/proof-of-stake.md)-louhinnan perusteet. Sinun pitää pystyä [ostamaan lipukkeita](/mining/proof-of-stake.md#how-to-stake) valitsemallasi sovelluksella.

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
