# <img class="dcr-icon" src="/img/dcr-icons/Wallet.svg" /> Using Decrediton

Last updated for Decrediton v1.2.1.

This guide assumes you have already set up a Decrediton wallet using [the Decrediton Setup guide](decrediton-setup.md).

---

## Overview

The overview tab gives a quick summary of your total DCR (spendable and locked in tickets) and a list of recent transactions.

The "Rescan Blockchain" button will force a rescan of all of your owned addresses to check for new transactions. This can sometimes fix issues where Decrediton is displaying an incorrect balance. Note - this button will not redownload the whole blockchain.

![Overview Tab](/img/decrediton/overview.png)

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

## Send

This tab is how you send funds to another address. Simply copy the recipient
address into the text box and type in the amount of Decred you wish to send.
The estimated fee will be listed as well. You can click the '+' button to
send Decred to multiple addresses in one transaction if you wish.
The "Send All" button will construct a transaction that will completely drain an account.

![Send Tab](/img/decrediton/send.png)

---

## Receive

This is where you can generate wallet addresses to give to other people so they can
send you DCR. Simply choose the account you want funds to go to and select the **Generate New Address** button.
The address is displayed in the blue text box - it's the line that starts with Ds, or Ts on testnet.
You can select the clipboard icon to copy the address and share it with the person sending you DCR.
Decred addresses can be used as many times as you want, but for privacy reasons it's best
to generate a new one for each transaction. There's around 1.4E48 (that's 14 followed by 47 zeroes)
addresses available so you don't need to worry about running out.

![Receive Tab](/img/decrediton/receive.png)

---

## History

This tab shows a list of all transactions that have occurred involving this wallet. A dropdown menu allows filtering the list
by transaction type: regular, ticket and vote transactions. The transaction hash can be used with the
[block explorer](/getting-started/using-the-block-explorer.md) to see more information about the transaction.

![History Tab](/img/decrediton/history.png)

---

## Tickets

The tickets tab allows you to see how many proof of stake tickets you current have, to buy new tickets, and to set your voting preferences.

Before you can use the tickets tab you must first import the API key from your [stakepool account](/mining/how-to-stake.md#pos-using-a-stakepool).

![Tickets Tab](/img/decrediton/tickets.png)

Once you have done this, the "Purchase Tickets" and "Voting Settings" pages will become active.

> Purchase Tickets

![Purchase Tickets page](/img/decrediton/purchase-tickets.png)

The total number of tickets you currently own is at the top of the page:

- Mempool Tickets - Tickets waiting to be mined by PoW miners (only 20 new tickets are mined into each block)
- Immature Tickets - Mined tickets which cannot vote until a 256 block maturing period has passed (around 20 hours)
- Live Tickets - Mature tickets eligible to be called to vote

<!-- TODO:  missed, revoked, expired tickets,  -->

The purchase tickets panel allows you to buy more tickets. Most of the settings are already entered, you just need to select which account to purchase tickets from and how many tickets you want to buy.

<!-- TODO:  advanced options  -->
<!-- TODO: Revoke button -->
<!-- TODO: Import script button -->

The automatic purchase panel allows you to enable the automatic ticket buyer - Decrediton will continually buy tickets for you for as long as you keep it running. You can configure how the ticket buyer works using the advanced options:

![Automatic Purchase panel](/img/decrediton/autobuyer.png)

- Balance to maintain - If your balance is lower than this number, you will not buy tickets. The default of 0 will use all the funds in your account to buy tickets.
- Max Price Absolute -  If the ticket price is above this value, you will not buy more tickets. The default of 0 turns this off.
- Max Per Block - Do not buy more than this number of tickets per block. A negative number means buy one ticket every n blocks. e.g. -2 would mean buy a ticket every second block.
- Max Fee - Tickets are entered into the mempool in order of their fee per kilobyte. This sets the maximum fee you are willing to pay.
- Max Price Relative  - If the current window price is significantly higher than the last few windows, do not buy any tickets. E.g. With the default value of 1.25, if the average price of the last few windows is 50DCR, you won’t buy any tickets if the current window is over 62.5DCR.

> Voting Settings

![Voting Settings page](/img/decrediton/voting.png)

This page shows all of the agendas which are currently up for vote on the Decred blockchain.
You can read the details of each agenda and choose which way you would like to vote on each issue.
This setting is only used at the moment each individual ticket votes, which means that you can change your
voting preferences if you change your mind about an agenda.

---

## Settings

The settings tab allows you to customise the units DCR amounts are displayed in and also allows you to switch Decrediton onto the testnet blockchain.

The settings tab is also where you come to change your private passphrase.

![Settings Tab](/img/decrediton/settings.png)

---


## Help

The help tab contains various links to get help using Decrediton. The "Issues" link will take you the to the Decrediton Github page where problems with the Decrediton software can be reported. We would be grateful for your help!

![Help Tab](/img/decrediton/help.png)
