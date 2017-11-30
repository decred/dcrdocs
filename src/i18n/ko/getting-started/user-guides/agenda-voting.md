# Mainnet Voting Guide

This guide was last updated on September 23, 2017.

이 페이지는 의제 투표 방법에 대한 간략한 소개와 모든 의제에 대해 선호 투표를하기 위해 티켓을 설정하는 과정에 대해 자세히 설명합니다.

---

## Introduction

어려운 포크 시나리오를 만드는 컨센서스 변경을 구현하기위한 투표를위한 2 단계 프로세스가 있습니다.

첫째, Decred 블록 체인은 투표 프로세스에 대해 두 개의 서로 다른 블록 간격을 지정했습니다. 2016 블록 (~ 1 주)의 **스테이크 버전 간격** (**SVI**)과 8064 블록 (** 4 주)의 **규칙 변경 간격** (**RCI**)이 있습니다. 4 Stake Version Interval은 1 Rule Change Interval 내에 맞습니다.

The first step of the voting process is to meet the upgrade threshold on the network. After the hard fork code is released (such as the sdiff algorithm change in v1.0.0), a majority of the nodes on the network participating in PoW/PoS need to first upgrade before the voting can be scheduled to begin. For Proof-of-Work, at least 95% of the 1000 most recent blocks must have the latest block version. For Proof-of-Stake, 75% of the votes cast within a single **SVI** must have the latest vote version. Once miner and voter upgrade thresholds are met, the voting is scheduled to begin on the first block of the next **RCI** (due to there being 4 **SVI**s per **RCI**, it can take up to 6048 blocks [3 **SVI**s] for the next **RCI** to begin).

이 프로세스의 두 번째 단계는 실제 투표입니다. 단일 ** RCI **는 최대 40320 표를 던지는 동안 전파됩니다. 투표는 **RCI** 최종 블록에서 집계되며 다음 블록을 채굴하기 전에 결과가 결정됩니다.

투표 결과에는 몇 가지가있을 수 있습니다:

1. RCI 내의 모든 투표의 90 % 이상이 "기권"투표 인 경우, 의제 투표는 다음 RCI에 대해 활성 상태로 유지됩니다.
2. RCI 내의 기권하지 않은 모든 투표가 75 % 예 또는 아니요 다수의 기준을 충족시키지 못하면 의제 투표는 다음 RCI에 대해 활성 상태로 유지됩니다.
3. RCI 안의 모든 비회 표의 75 %가 의제를지지한다면 ( "예"), 의제는 의결 된 것으로 간주되고 합의가 바뀌면 투표가 통과 된 후 8064 블록이 활성화 될 것이다.
4. RCI 내의 모든 비회원 표의 75 %가 의제 ( "반대표")에 반대한다면, 의제는 실패하고 합의가 바뀌지 않을 것입니다.
5. 의제가 75 %의 다수 표를 얻기 전에 만료되면, 의제가 만료되고 합의가 변경되지 않습니다.

아래는 컨센서스 업그레이드가 적용된 단일 의제에 대한 전체주기를 나타낸 다이어그램입니다.

<img src="/img/voting-cycle-v9.png">

---

## Voting Preparation

투표에 참여하려면 먼저 지갑이 필요합니다. 아직 가지고 있지 않다면 [Beginner Guide](/getting-started/beginner-guide.md), 를 방문하고 지갑을 선택한 다음 설치 및 설정 가이드를 따르십시오.

다음으로 [Proof-of-Stake](/mining/proof-of-stake.md). 의 기본 사항을 알아야합니다. 귀하가 선택한 신청서를 통해 [buy tickets](/mining/proof-of-stake.md#how-to-stake) 방법이 필요할 수 있습니다.

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
