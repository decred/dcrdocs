# The Paymetheus Windows Wallet

Ce guide suppose que vous avez déjà mis en place un portefeuille Paymetheus en utilisant [ce guide](paymetheus.md).

---

## Overview

L'onglet Aperçu donne un résumé rapide de votre DCR total (dépensable et verrouillé), le nombre de comptes et les transactions ainsi qu'une liste de l'activité récente du compte.

![Overview tab](/img/Paymetheus-overview.png)  

---

## Comptes

L'onglet Comptes affiche les comptes dans votre portefeuille et vous permet d'en ajouter de nouveaux. Les comptes Decred travaillent tout comme les comptes bancaires. Ils vous permettent de conserver des enregistrements séparés de votre DCR. Cette fonctionnalité est le plus utile pour ceux qui gèrent des entreprises et souhaite conserver des comptes séparés pour les enregistrements fiscaux par exemple. Le transfert de DCR à travers les comptes créera une transaction sur la chaîne de blocs.

![Overview tab](/img/Paymetheus-accounts.png)  

---

## Scripts

Actuellement utilisé uniquement pour l'exploitation de PdE dans une pool. À partir de la version 0.8.0 la configuration du script a été automatisée. Consultez la section Tickets d'achat ci-dessous pour plus d'informations.

![Scripts tab](/img/Paymetheus-import-script.png)  

---

## Create Transaction

Cet onglet explique comment envoyer des fonds à une autre adresse. Copiez simplement les adresses récepteurs dans la zone de texte et tapez le montant de Decred que vous souhaitez envoyer. Les frais estimés seront également répertoriés. Vous pouvez cliquer sur le bouton '+' pour envoyez Decred à plusieurs adresses dans la seule transaction, si vous le souhaitez.

![Create transaction tab](/img/Paymetheus-send.png)  

---

## Purchase Tickets tab

Paymetheus est en mesure d'acheter des tickets pour la preuve d'enjeu en utilisant sa caractéristiques d'achat de ticket manuel. Notez que Paymetheus peut *uniquement* acheter des tickets, il ne peut pas faire le vote effectif. Pour cela, vous devrez installer [solo PdE](/mining/proof-of-stake)ou utiliser a PdE [stake pool](/mining/proof-of-stake.md#sign-up-for-a-stake-pool).

> Pour rejoindre la pool, fournissez une adresse de clé publique qui peut être utilisée pour générer un 
> 1-of-2 multisignature script. Le script multisignature sera généré par 
> la pool et vous retourné à vous avec une adresse P2SH pour donner droit de vote.

Ne vous inquiétez pas si vous ne comprenez pas cette citation. Ce que cela signifie, c'est que vous créez une adresse à laquelle on peut accéder par deux portefeuilles. Un seul portefeuille doit être disponible pour utiliser l'adresse. Cela signifie que la pool peut voter en votre nom et vous pouvez voter en utilisant votre propre portefeuille si la pool cesse de fonctionner.

Il ne donne PAS à la pool l'accès à vos fonds. Tout ce que vous faites, c'est accorder le droit de vote à la pool. La pool ne touche pas vos fonds.

Official stake pools are [listed here](/mining/proof-of-stake.md#list-of-stakepools).
All stake pools run the same basic code, but may differ in the amount of redundancy available.
More redundancy equals less chance of missed votes (although all pools will have missed votes
as many missed votes are caused by PoW miners (sometimes they will find a solution to the blocks
so quickly that votes haven't had time to propagate around the network). In order to ensure one pool
does't become too large, it is recommended that you join a smaller pool. While a pool can't access your funds,
they CAN choose to vote against your wishes. Doing so would have them blacklisted pretty quickly, but
keeping individual pool sizes low means that any rogue operators would have a hard time affecting
the outcome of any vote. By spreading tickets around pools, it makes the network even more decentralized.

![Creating voting account](/img/Paymetheus-create-voting-account.png)

There's a fair bit of information here, so we'll go through each of the options.

* **Ticket difficulty** - The current price of a ticket.
* **Blocks until retarget** - When this reaches 0, a new ticket price is calculated.
* **Source account** - This is the account that will purchase the tickets and receive the reward.
* **Tickets to purchase** - The number of tickets to purchase.
* **Ticket fee (DCR/kB)** - Tickets are entered into the voting pool by order of their fee. In times of high demand,
                        you will need to increase this value in order to have your tickets accepted.
                        You can view current ticket fees [here](https://www.dcrstats.com).
* **Split fee (DCR/kB)** - Paymetheus uses a "split" transaction to avoid blocking your balance, splitting the
                       exact amount needed for the ticket from the balance in your wallet. The "split" transaction
                       needs to be confirmed at least once before you can reuse your balance. This can block your
                       whole balance for several minutes while this confirmation occurs. Without the split, you
                       would have to wait for the confirmation of the ticket transaction, which could take several hours.
                       This can be left at 0.01. It does not affect your chances of buying tickets or voting with them.

* **Expiry (blocks)** - Often ticket fees will increase during a window and you may be stopped out by higher fees. By setting an expiry, tickets that are not mined by the given block height are cancelled so you can try again with higher fees if you wish. If this is empty, they will not expire until the end of the window.

* **Stake pool preference** - Automate setup with PoS pools. See below for more information.
* **Voting address** - The Decred address that will do the voting. Solo and custom pool miners only.
* **Pool fee address** - For those using a custom pool.
* **Pool fees (%)** - For those using a custom pool.

![Purchasing tickets](/img/Paymetheus-ticket-purchasing.png)  

To easily set up ticket purchasing for a stake pool, click the 'Manage pools button'. If you haven't already,
you'll need to register with a stake pool (see above). Once you've registered, log in, look for your API key, and copy it.
Select the pool you just registered with from the drop down. Paste the key into the 'API key' box and click 'Save'.
You should see a bunch of letters and numbers appear in the bottom box. Click 'Close'. You can now purchase
tickets by clicking the 'Purchase' button!

![Manage stake pools](/img/Paymetheus-manage-stake-pool.png)

NOTE: While you can purchase tickets using Paymetheus, it cannot vote for you so you must either use a pool
or run your own voting wallet which needs to be online 24/7. If you would prefer to solo mine,
check the [dcrd Setup Guide](/getting-started/user-guides/dcrd-setup.md), [dcrwallet Setup Guide](/getting-started/user-guides/dcrd-setup.md) and [PoS Mining Guide](/mining/proof-of-stake.md) for more information.

---

## Request Payment

This is where you can generate wallet addresses to give to other people so they can
send you DCR. Simply choose the account you want funds to go to and press Generate Address.
Copy the address (it's the top line that starts with Ds) and share that with the other person.
Decred addresses can be used as many times as you want, but for privacy reasons it's best
to generate a new one for each transaction. There's around 1.4E48 (that's 14 followed by 47 zeroes)
addresses available so you don't need to worry about running out.

![Request Payment](/img/Paymetheus-receive.png)  

---

## Transaction History

This tab shows a list of all transactions that have occurred. The transaction hash can be used with the
[block explorer](/getting-started/using-the-block-explorer.md) to see more information about the transaction.  

![Transaction History](/img/Paymetheus-transactions.png)  

---

## Stake Mining

This tab shows some statistics on the PoS network:  

Item                         | Description
:-----------------------------:|:------------------------------------------------------------:
Number of live tickets       | The total number of tickets that are eligible for voting across the network
Number of tickets in mempool | The total number of tickets waiting to enter the voting pool
Ticket difficulty            | The cost of a ticket (refunded on ticket vote/expiry)
Owned tickets in mempool     | The number of your tickets in the mempool
Owned live tickets           | The number of your tickets that are eligible for voting
Owned immature tickets       | Number of tickets waiting to mature before going live (256 blocks, ~17 hours)
Tickets missed               | Tickets that missed a vote either because the voting wallet or stake pool was offline or the PoW miner didn't mine it properly
Tickets revoked              | Tickets that missed a vote and have had the ticket price refunded (minus the ticket fee), should be the same as tickets missed
Tickets voted                | Lifetime tickets voted by this wallet
Total subsidy earned         | Lifetime DCR subsidy earned by this wallet
