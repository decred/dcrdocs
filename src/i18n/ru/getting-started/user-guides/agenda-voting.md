# Mainnet Voting Guide

This guide was last updated on September 23, 2017.

Эта страница предназначена для краткого ознакомления с тем, как работает голосование по повестке дня, и как именно происходит процесс настройки Ваших тикетов для голосования нужным Вам образом по любым вопросам повестки дня.

---

## Introduction

Голосование за реализацию консенсусных изменений, с целью создания hardfork сценария, состоит из двух этапов.

Во-первых, важно отметить, что блокчейн Decred имеет два разных интервала блока специально предназначенных для процесса голосования. Существует "Интервал версии" **Stake Version Interval** (**SVI**) из 2016 блоков (~1 неделя) и "Интервал смены правил" **Rule Change Interval** (**RCI**) из 8064 блоков (~4 недели). "Интервал смены правил" совпадает по времени с 4 "Интервалами версии".

The first step of the voting process is to meet the upgrade threshold on the network. After the hard fork code is released (such as the sdiff algorithm change in v1.0.0), a majority of the nodes on the network participating in PoW/PoS need to first upgrade before the voting can be scheduled to begin. For Proof-of-Work, at least 95% of the 1000 most recent blocks must have the latest block version. For Proof-of-Stake, 75% of the votes cast within a single **SVI** must have the latest vote version. Once miner and voter upgrade thresholds are met, the voting is scheduled to begin on the first block of the next **RCI** (due to there being 4 **SVI**s per **RCI**, it can take up to 6048 blocks [3 **SVI**s] for the next **RCI** to begin).

Второй шаг этого процесса - фактическое голосование. Один **RCI** имеет место, когда максимум в 40320 голосов набрано. Голоса подсчитываются в конечном блоке **RCI**, и результаты определяются до того, как добывается следующий блок.

Есть несколько возможных результатов голосования:

1. Если более 90% всех голосов в рамках RCI являются голосами "воздержаться", вопрос остается активным пунктом голосования до следующего RCI.
2. Если все невоздержавшиеся голоса в рамках RCI не достигают 75% порога преобладания "да" или "нет", данный пункт повестки дня остается активным для голосования в следующем RCI.
3. Если 75% всех невоздержавшихся голосов в рамках RCI поддерживают повестку дня ("Да"), вопрос считается решенным, и изменения консенсуса активируются через 8064 блока, после того, как прошло голосование.
4. Если 75% всех невоздержавшихся голосов в рамках RCI противостоят повестке дня ("Нет"), вопрос не прошел, и изменения консенсуса не активируются.
5. Если срок действия вопроса на повестке дня истекает, так и не получив 75% голосов, он снимается, и изменения консенсуса не активируются.

Ниже приведена схема всего цикла для вопроса повестки дня с обновлениями консенсуса.

<img src="/img/voting-cycle-v9.png">

---

## Voting Preparation

Для участия в голосовании сначала требуется кошелек. Если у Вас его еще нет, зайдите на [Beginner Guide](/getting-started/beginner-guide.md), выберите кошелек и следуйте инструкциям по установке и настройке.

Затем Вам следует изучить основы Proof-of-Stake [Proof-of-Stake](/mining/proof-of-stake.md).  Вы должны будете иметь возможность покупать тикеты [buy tickets](/mining/proof-of-stake.md#how-to-stake) с помощью выбранного приложения.

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
