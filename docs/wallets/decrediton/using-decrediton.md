# <img class="dcr-icon" src="/img/dcr-icons/Wallet.svg" /> Using Decrediton

Last updated for Decrediton v{{ decreditonversion }}.

This guide assumes you have already set up a Decrediton wallet using [the Decrediton Setup guide](decrediton-setup.md).

---

## Main menu

The main menu of Decrediton is displayed on the left side of the window, and it is used to switch between the different features Decrediton offers. It can be minimized by clicking the arrow icon at the top. At the bottom of the menu is a button to rescan the blockchain. This button will force a rescan of all of your owned addresses to check for new transactions, which can sometimes fix issues where Decrediton is displaying an incorrect balance. This process will take some time, however it will not cause Decrediton to redownload the whole blockchain.

---

## Overview

The overview tab gives a quick summary of your total DCR (available and locked in tickets) and a list of recent transactions.

Graphs of your balance, ticket and transaction over the last two weeks can be viewed here.

![Overview Tab](/img/decrediton/overview.png)

---

## Transactions

The transactions tab is split into four sections:

### Send

This where you can send Decred from your wallet to another address. First you need to select which account in your wallet to send the funds from, and then enter the recipient address into the text box. Finally enter the amount of Decred you wish to send.

There are additional buttons here which can be used to create more advanced transactions if required. The **+** button will allow you to send Decred to multiple addresses in a single transaction. The **Send All** button will construct a transaction that will completely drain the selected account. There is also a button which will allow you to send funds from one account in your wallet to another account in your wallet.

Once you have entered the details of your transaction, the estimated fee and transaction size are detailed below the input panels. After reviewing these numbers, you can press the **Send** button and your transaction will be broadcast.

![Send Tab](/img/decrediton/send.png)

### Receive

This is where you can generate wallet addresses to give to other people so they can
send you DCR. The address is displayed in the blue text box - it's the line that starts with Ds, or Ts on testnet. Simply choose the account you want funds to go to and select the **Generate New Address** button.
You can select the clipboard icon to copy the address and share it with the person sending you DCR.
Decred addresses can be used as many times as you want, but for privacy reasons it's best to generate a new one for each transaction. There's around 1.4E48 (that's 14 followed by 47 zeroes) addresses available so you don't need to worry about running out.

![Receive Tab](/img/decrediton/receive.png)

### History

This tab shows a list of all transactions that have occurred involving this wallet. A dropdown menu allows filtering the list by transaction type: regular, ticket and vote transactions. The transaction hash can be used with the
[block explorer](../../getting-started/using-the-block-explorer.md) to see more information about the transaction.

![History Tab](/img/decrediton/history.png)

### Export

This tab shows allows you to export your transaction history in a .csv format. You can choose the data you wish to export, select a location to output the generated file, and then press the **Export** button.

![Export Tab](/img/decrediton/export-transactions.png)

---

## Governance

The governance tab enables users holding tickets to have their say on Decred's governance. Here you can browse and vote upon [Politeia proposals](../../governance/politeia/overview.md), and you can set your voting preferences for on chain [consensus rule votes](../../governance/consensus-rule-voting/overview.md). Your privacy settings must allow Decrediton to contact Politeia to download proposal information.

![Governance page](/img/decrediton/governance.png)

Politeia proposals can be filtered by "Under Discussion", "Under Vote", "Finished Voting" and "Abandoned". The "Create Proposal" button will open <https://proposals.decred.org> in your browser.

You are able to vote on proposals if the following two criteria are met:

1. There are currently proposals available open for voting

1. You owned live proof-of-stake tickets when the proposal was opened for voting

![Consensus rule changes Settings page](/img/decrediton/consensus-rule-voting.png)

The Consensus Changes page shows all of the agendas which are currently up for vote on the Decred blockchain.
You can read the details of each agenda and choose which way you would like to vote on each issue.
This setting is only used at the moment each individual ticket votes, which means that you can change your
voting preferences if you change your mind about an agenda.

---

## Tickets

The tickets tab is split into four sections:

### Purchase

Before you can purchase tickets you must first import the API key from your [VSP account](../../proof-of-stake/how-to-stake.md#pos-using-a-voting-service-provider-vsp).

![Tickets Tab](/img/decrediton/tickets.png)

Once you have done this, the "Purchase Tickets" tab becomes active.

![Purchase Tickets page](/img/decrediton/purchase-tickets.png)

The total number of tickets you currently own is at the top of the page:

- **Mempool Tickets** - Tickets waiting to be mined by PoW miners (only 20 new tickets are mined into each block)
- **Immature Tickets** - Mined tickets which cannot vote until a 256 block maturing period has passed (around 20 hours)
- **Live Tickets** - Mature tickets eligible to be called to vote

#### Backup redeem script

Now is a good time to back up your VSPs multi-sig voting script (or "redeem script"). 

!!! warning "Warning"
    Only you and your VSP know the [redeem script](../../proof-of-stake/redeem-script.md). You must backup the script to ensure you don't end up with locked funds. If your VSP goes down, you'll need this script to vote or revoke tickets.

    Lost scripts which have been used at least one time to vote or revoke tickets [can be recovered](/proof-of-stake/redeem-script/#recovery-methods).

Click on the gear icon next to your VSP. Then click on the donut icon that appears.

![Purchase Tickets page](/img/decrediton/redeem-script.png)

This will bring up your VSP's configuration details. Copy the string of characters in the `Script` field and store them in a safe location. 

![Purchase Tickets page](/img/decrediton/redeem-script-field.png)

#### Purchasing tickets

In order to purchase tickets you just need to select which account to purchase tickets from, how many tickets you want to buy, and then press the **Purchase** button.

The "Automatic Ticket Buyer" panel allows you to enable the automated ticket buyer - Decrediton will continually buy tickets for you for as long as you keep it running. You can configure how the ticket buyer works using the options:

![Automatic Purchase panel](/img/decrediton/autobuyer.png)

- **From** - Funds to purchase tickets will come from this account
- **VSP** - Which VSP to purchase tickets with
- **Balance to maintain** - If your balance is lower than this number, you will not buy tickets. The default of 0 will use all the funds in your account to buy tickets

### My Tickets

This tab shows a summary of all of the tickets your wallet has ever purchased. Filters and sorting options are available to make browsing the list easier.

### Statistics

This page displays various statistics about all of the available VSPs. The dropdown can be used to change the currently displayed VSP.

![VSP statistics page](/img/decrediton/pool-stats.png)

---

## Accounts

The accounts tab shows you the accounts in your wallet and allows you to add new ones.
Accounts in Decred work just like bank accounts.
They allow you to keep separate records of your DCR. This feature is most
useful for those who run businesses and wish to keep separate accounts for
tax records for example. Transferring DCR across accounts will create a
transaction on the blockchain.

![Accounts Tab](/img/decrediton/accounts.png)

---

## Security

The Security tab offers two key features - the ability to sign and verify messages using your private key, and the ability to validate addresses.

![Security Tab](/img/decrediton/security.png)

### Sign and Verify messages

Signing a message with an address' private key allows you to prove that you are the owner of a given address to a possible counterparty.

For instance, let's say you sent 100 DCR to a merchant and you have yet to receive your merchandise. You contact the merchant and explain the situation, but need a way to prove you are, in fact, the owner of the address that the funds were sent from. To do this you can generate a signature based on a message only known to you and your counterparty and the private key associated with the address. Upon receipt, the counterparty may use the Verify Message form to ensure the signature is valid.

### Validate Addresses

A Decred address can be entered into the Validate Address text box, and Decrediton will put that address into one of three categories:

- Invalid address
- Valid address owned by the current wallet
- Valid address not owned by the current wallet

---

## Help

The help tab contains links to get help using Decrediton and to learn more about Decred. There are also links to our various communication platforms. The Tutorials section contains introductions to the ticket lifecycle and how Decred's proof-of-stake system works. It is also possible to view logs of the `dcrd`, `dcrwallet` and `decrediton` processes in the Logs section.

![Help Tab](/img/decrediton/help.png)

---

## Settings

The settings tab allows you to customize the units DCR amounts are displayed in and also allows you to switch Decrediton onto the testnet blockchain.

The settings tab is also where you come to change your private passphrase.

![Settings Tab](/img/decrediton/settings.png)
