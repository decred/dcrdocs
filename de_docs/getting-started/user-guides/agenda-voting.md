# **Mainnet Voting Guide**

This guide was last updated on May 2, 2017.

This page is intended to give a brief introduction to how agenda voting works and details the process for setting your tickets to cast your preferred vote for any agenda.

---

## **Introduction**

There is a two-phase process for voting to implement consensus changes that would create a hard forking scenario.

First, it's important to note that the Decred blockchain has specifically designated two different block intervals for the voting process. There is a **Stake Version Interval** (**SVI**) of 2016 blocks (~1 week) and a **Rule Change Interval** (**RCI**) of 8064 blocks (~4 weeks). 4 Stake Version Intervals fit within 1 Rule Change Interval.

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

## **How To Vote**

To participate in voting, you first need a wallet. If you don't have one already, visit the [Beginner Guide](/getting-started/beginner-guide.md), choose a wallet, and follow the installation and setup guides.

Next, you'll need to learn the basics of [Proof-of-Stake](/mining/proof-of-stake.md). You'll need to be able to [buy tickets](/mining/proof-of-stake.md#how-to-stake) with your application of choice.

Finally, you'll need to learn how to set the `votechoice` for your tickets in order to cast a "Yes", "No", or "Abstain" vote for an agenda. By default, your tickets will cast "Abstain" votes. If you are solo-staking with `dcrwallet`, go here. If you are pool-staking with `dcrwallet`, `Paymetheus`, or `Decrediton`, go here.

---

## **Solo-voting**

Through the command-line, you'll want to familiarize yourself with the `dcrctl --wallet getvotechoices` and `dcrctl --wallet setvotechoice "agendaid" "choiceid"` commands.

The first command, `dcrctl --wallet getvotechoices`, returns JSON resembling this:

```
{
  "version": 4,
  "choices": [
    {
      "agendaid": "sdiffalgorithm",
      "agendadescription": "Change stake difficulty algorithm as defined in DCP0001",
      "choiceid": "abstain",
      "choicedescription": "abstain voting for change"
    },
    {
      "agendaid": "lnsupport",
      "agendadescription": "Request developers begin work on Lightning Network (LN) integration",
      "choiceid": "abstain",
      "choicedescription": "abstain from voting"
    }
  ]
}
```

The second command, `dcrctl --wallet setvotechoice "agendaid" "choiceid"`, let's you set your votechoice. `"agendaid"` is found via the `getvotechoices` command above, and `"choiceid"` can be `yes`, `no`, or `abstain`.

For example, issuing `dcrctl --wallet setvotechoice sdiffalgorithm yes` results in the following changes to `dcrctl --wallet getvotechoices`:

```
{
  "version": 4,
  "choices": [
    {
      "agendaid": "sdiffalgorithm",
      "agendadescription": "Change stake difficulty algorithm as defined in DCP0001",
      "choiceid": "yes",
      "choicedescription": "change to the new algorithm"
    },
    {
      "agendaid": "lnsupport",
      "agendadescription": "Request developers begin work on Lightning Network (LN) integration",
      "choiceid": "abstain",
      "choicedescription": "abstain from voting"
    }
  ]
}
```

---

## **Stakepool-voting**

If your Stakepool has updated to the latest stakepool software, you will find a "Voting" page in the navigation menu with dropdown options for each agenda. After you've chosen how you want your tickets to vote, simply press the "Update Voting Preferences" to save your votechoices. Below you'll find an image of the votechoices for vote version 4.

<img src="/img/stakepool-voting-page.png">

---

## **Verifying Your Vote**

The easiest method to track your how your tickets actually voted is to use the [block explorer](https://mainnet.decred.org) to view each of your votes.

The block explorer has been updated to display YES and NO votes for each agenda. If a ticket voted abstain, it will not display anything. The first ticket in this example image voted "ABSTAIN" for both agendas, the second ticket voted "YES" for both agendas, and the third ticket voted "YES" for the lnsupport agenda and "ABSTAIN" for the sdiffalgorithm agenda.

<img src="/img/verify_block-explorer-votes.png">

You can also manually verify your vote by inputting the txid for the ticket purchase transaction into the block explorer or clicking the link for a Voted Ticket on your stakepool's website. Below is a quick walkthrough, starting from a stakepool's website. The red numbers of each image corresponds to the step number.

1. Go to your stakepool's Tickets page, open the Voted Tickets section and click the txid for the ticket you want to inspect. This will open the block explorer to the ticket purchase transaction. (Figure 3)
2. Press the '+' button to view the transaction details. (Figure 4)
3. Press the '>' on the 1st output of the transaction (the 'stakesubsmission' output) to open the block explorer to the actual voting transaction. (Figure 4)
4. The vote transaction should already be expanded, if not, press the '+' button. (Figure 5)
5. Locate the second output of the transaction. The vote for this ticket is shown within the first 4 digits of the OP_RETURN. The 6th digit shows the vote version. In the images below, a version 4 vote voted "01" *in hexadecimal* (aka 0x01). (Figure 5)
6. Compare the block explorer votebits with the chart below and you'll see that the ticket voted to abstain from both lnsupport and sdiffalgo agendas while verifying the previous block as valid. (Figure 6)

figure 3:<br>
<img src="/img/verify_voted-tickets.png">

figure 4:<br>
<img src="/img/verify_block-explorer-sstx.png">

figure 5:<br>
<img src="/img/verify_block-explorer-votebits.png">

figure 6:<br>
<img src="/img/verify_votebits-chart.png">

---

## **Tracking Vote Progress**

[voting.decred.org](https://voting.decred.org) is an official website set up to track the progress of upgrading and voting. 

---


