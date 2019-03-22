# <img class="dcr-icon" src="/img/dcr-icons/TicketVoted.svg" /> Consensus Rules Voting

This page is intended to give a brief introduction to how consensus rule voting works and details the process for setting your tickets to cast your preferred vote for any agenda.

---

## Introduction

The consensus rules are a set of rules which every full node participating in the Decred network must enforce when considering the validity of blocks and transactions.

Examples of consensus rules include:

- Blocks must not be larger than the maximum permitted size.
- Decred must not be [double-spent](../../glossary.md#double-spend).
- Blocks must meet the current [difficulty](../../glossary.md#difficulty) requirement.

It is essential that every node on the network uses exactly the same set of consensus rules.
Nodes attempting to use consensus rules differing from the majority of the network will not be able to properly validate the blockchain, thus they will not able to participate and will eventually end up operating on their own seperate network.

Decred has a built-in upgrade mechanism which allows consensus rules to be changed across the entire network in a coordinated fashion.
This enables the rules to be changed predictably and without fracturing the network.
The process also allows proof-of-stake voters to exercise sovereignty over whether or not to accept the proposed changes.

The process to change the consensus rules is detailed below.

---

## Step 1: Decred Change Proposal (DCP)

A Decred Change Proposal (DCP) is a design document which describes potential protocol or consensus changes to Decred.
A well written DCP will include a detailed description of the proposed change, explain the motivation for making the change and provide a reference implementation.

Detailed documentation on the format of DCPs, as well as all of the DCPs which have been produced so far, can be found in the  GitHub repository [decred/dcps](https://github.com/decred/dcps).

## Step 2: New node software

New node software which implements the consensus rule changes must be developed and released.
This new software will include all of the code necessary to enforce the existing consensus rules, as well as the code required to implement the change specified in the DCP.
The new code implementing the change will lie dormant until the change has been voted upon and accepted by the proof-of-stake voters.

## Step 3: Network upgrade

Proof-of-work miners and proof-of-stake voters must upgrade their software to the new version before voting on activation of the new rules can begin. Each has a different threshold to meet before the upgrade is considered complete:

- The **proof-of-work** upgrade is considered complete once 95% of the latest 1,000 blocks are mined with the latest version
- The **proof-of-stake** upgrade is considered complete once 75% of the votes in a complete [stake version interval](../../glossary.md#stake-version-interval-svi) are of the latest version

Once both of these thresholds have been met, the vote is scheduled to begin on the first block of the next [rule change interval](../../glossary.md#rule-change-interval-rci).

## Step 4: Voting

Voting takes place across the duration of a full [rule change interval](../../glossary.md#rule-change-interval-rci).
Each proof-of-stake ticket which is called to vote during this interval will include votebits which indicate whether the ticket holder wishes to accept or reject the new rules, or if they wish to abstain from voting.
If ticket holders do not explicitly set their voting preference, the default setting is to abstain.
Given that each block can contain a maximum of five votes, and the rule change interval on mainnet is 8,064 blocks, the maximum number of votes is 40,320.
Every vote has a quorum requirement of 10%.
This means that at least 10% of all votes cast must be non-abstain for the result to be considered valid.

There are a few possible outcomes of a vote:

1. If quorum is not met (more than 90% of all votes are "Abstain"), the agenda vote remains active for the next RCI.
1. If all non-abstaining votes within the RCI fail to meet the 75% Yes or No majority threshold, the agenda vote remains active for next RCI.
1. If 75% of all non-abstaining votes within the RCI are in support of the agenda ("Yes"), the agenda is considered locked in and the consensus changes will activate 8,064 blocks after the vote passed.
1. If 75% of all non-abstaining votes within the RCI are in opposition of the agenda ("No"), the agenda fails and the consensus changes will never activate.
1. If an agenda reaches its expiration before ever reaching a 75% majority vote, the agenda expires and the consensus changes will never activate.

## Step 5. Rule activation

If the quorum requirement is met, and more than 75% of the votes are in favour of activating the new consensus rules, then a "lock-in" period begins.
This is a fixed period of 8,064 blocks (~4 weeks).
During this period, all participants in the Decred network **must** upgrade their software to the latest version.
All full nodes participating in the network will automatically activate the new rules on the first block after this period, so any nodes still running the old software will no longer be able to participate.

Below is a diagram of the entire cycle for a single agenda with consensus upgrades.

![Consensus rule voting cycle](/img/voting-cycle.png)

---

## Voting Preparation

To participate in voting, you first need a wallet. If you don't have one already, visit the [Beginner Guide](../../getting-started/beginner-guide.md), choose a wallet, and follow the installation and setup guides.

Next, you'll need to learn the basics of [Proof-of-Stake](../../proof-of-stake/proof-of-stake.md). You'll need to be able to [buy tickets](../../proof-of-stake/how-to-stake.md) with your application of choice.

Finally, you'll need to learn how to set the `votechoice` for your tickets in order to cast a "Yes", "No", or "Abstain" vote for an agenda. By default, your tickets will cast "Abstain" votes. To set your vote choice, see our quick [How To Vote](how-to-vote.md).

---

## Verifying Your Vote

The easiest method to track your how your tickets actually voted is to use the [block explorer](https://explorer.dcrdata.org) to view each of your votes.

The block explorer has been updated to display "YES", "NO", and "ABSTAIN" votes for each agenda with each ticket. The first and second tickets in the following example image voted "ABSTAIN" for both agendas while the third ticket voted "YES" for both agendas. The image will be updated to reflect the v5 agenda when voting is live.

![Verifying votes on the block explorer](/img/verify_block-explorer-votes.png)

---

## Tracking Vote Progress

[voting.decred.org](https://voting.decred.org) is an official website set up to track the progress of upgrading and voting.

---

## :fa-book: Further Information

- Blog post announcing Consensus Rules Voting: <https://blog.decred.org/2016/11/16/Upgrading-Consensus/>
