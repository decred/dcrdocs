# Mainnet Voting Guide

This guide was last updated on September 23, 2017.

Ця сторінка призначена для короткого ознайомлення з тим, як працює голосування з порядку денного та як саме відбувається процес налаштування Ваших тікетів для голосування потрібним Вам чином з будь-яких питань порядку денного.

---

## Introduction

Голосування за здійснення консенсусних змін, з метою створення hardfork сценарію, складається з двох етапів.

По-перше, важливо зазначити, що blockchain Decred має два різних інтервали блока, спеціально призначених для процесу голосування. Існує "Інтервал версії **Stake Version Interval** (**SVI**) з 2016 блоків (~1 week) та "Інтервал зміни правил" (**RCI**) з 8064 блоків (~4 тижні). 1 "Інтервал зміни правил" співпадає за часом з 4 "Інтервалами версії".

The first step of the voting process is to meet the upgrade threshold on the network. After the hard fork code is released (such as the sdiff algorithm change in v1.0.0), a majority of the nodes on the network participating in PoW/PoS need to first upgrade before the voting can be scheduled to begin. For Proof-of-Work, at least 95% of the 1000 most recent blocks must have the latest block version. For Proof-of-Stake, 75% of the votes cast within a single **SVI** must have the latest vote version. Once miner and voter upgrade thresholds are met, the voting is scheduled to begin on the first block of the next **RCI** (due to there being 4 **SVI**s per **RCI**, it can take up to 6048 blocks [3 **SVI**s] for the next **RCI** to begin).

Другий крок цього процесу - це фактичне голосування. Один **RCI** має місце, коли максимум у 40320 голосів набрано. Голоси підраховуються у кінцевому блоці **RCI**, а результати визначаються до того, як видобувається наступний блок.

Є кілька можливих результатів голосування:

1. Якщо більше 90% всіх голосів в рамках RCI є голосами "утриматися", питання залишається активним пунктом до наступного RCI.
2. Якщо всі голоси, що не утрималися, в рамках RCI не досягають 75% порогу переважання "Так" чи "Ні", цей пункт повістки дня залишається активним для голосування у наступному RCI.
3. Якщо 75% усіх голосів, що не утрималися, в рамках RCI підтримують порядок денний ("Так"), питання вважається вирішеним, а зміни консенсусу активуються через 8064 блоки після того, як відбулося голосування.
4. Якщо 75% всіх голосів, що не утрималися, в рамках RCI протистоять порядку денному ("Ні"), питання не пройшло, і зміни консенсусу не активізуються.
5. Якщо термін дії питання на порядку денному закінчується, так і не отримавши 75% голосів, він знімається, і зміни консенсусу не активізуються.

Нижче наведено схему всього циклу для питання порядку денного з оновленнями консенсуса.

<img src="/img/voting-cycle-v9.png">

---

## Voting Preparation

Щоб взяти участь у голосуванні, спочатку Вам потрібно мати гаманець. Якщо у Вас його ще немає, зайдіть на [Beginner Guide](/getting-started/beginner-guide.md), виберіть гаманець та дотримуйтесь інструкцій із встановлення та налаштування.

Далі Вам треба ознайомитись із основами Proof-of-Stake [Proof-of-Stake](/mining/proof-of-stake.md). Вам треба буде мати можливість купувати тікети [buy tickets](/mining/proof-of-stake.md#how-to-stake) за допомогою обраного додатка.

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
