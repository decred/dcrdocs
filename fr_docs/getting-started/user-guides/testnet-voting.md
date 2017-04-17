# Testnet Hard Fork Guide de vote

Ce guide a été mis à jour pour v0.8.2 

À partir de la version v0.8.0 du 13 février 2017, le mécanisme de vote a été mis en place pour les tests sur le Testnet de Decred. On estime que le vote d'essai débutera le 25 février 2017 vers 1 heure du CST et durera 7 jours. Si vous souhaitez participer, des guides pour Paymetheus et les applications de ligne de commande peuvent être trouvés ici. 

---

## Introduction

Il existe un processus en deux étapes pour voter pour mettre en œuvre des changements de consensus qui créeraient une fork difficile. Remarque: les intervalles de bloc suivants sont pour le testnet, ils seront différents pour mainnet.

La première étape consiste à respecter le seuil de mise à niveau sur le réseau. Une fois que le code de l' hardfork est relâchée, la majorité des nodes du réseau participant au PdT/PdE doivent commencer avant le début du vote. Pour la preuve de travail, au moins 75% des 100 blocs les plus récents doivent avoir la dernière version en bloc. Pour la preuve d'enjeu, 75% des votes exprimés dans un intervalle de bloc 2016 statique doivent avoir la dernière version du vote.

La deuxième étape de ce processus est le vote effectif. L'intervalle de bloc précédent 2016 tombe quelque part dans un intervalle de bloc plus important de 5040 et le réseau doit attendre que l'intervalle 5040 du bloc pour finir. En raison des différentes longueurs d'intervalle, il *pourrait* prendre jusqu'à 5040 blocs supplémentaires avant le début de la fenêtre de vote. Après cela, un intervalle de bloc 5040 statique se transmet pendant que les votes sont exprimés et si 75% des votes extraits dans cet intervalle signent un vote "oui" aux modifications proposées, les modifications sont entièrement mises en œuvre après un intervalle de bloc supplémentaire (pour donner aux reste nodes le temps nécessaire à la mise à jour pour éviter d'être enlevé de la chaîne de blocs). Vous trouverez ci-dessous un tableau simplifié pour expliquer chaque intervalle de bloc dans l'ordre où ils apparaissent chronologiquement.

Interval Description | Interval Type | Number of Blocks
---------------------|-------------|---------------
Minimum 75% of Blocks must be newest version | Rolling | 100
Minimum 75% of Votes must be newest version | Static | 2016
Interval after upgrade requirements met | Static | Up to 5040
Actual voting interval - 75% of Votes must signal a "yes" to pass | Static | 5040
Pre-implementation interval if vote passes | Static | 5040

Si une proposition ne parvient pas à atteindre un seuil de 10% des votes «non» ou «oui», les parties prenantes pourront voter à nouveau lors de l'intervalle de vote suivant, jusqu'à ce que ce seuil soit atteint ou que la proposition expire. 

Ci-dessous sont des instructions pour participer à la démo de vote sur le Testnet en utilisant un projet de partage avec Paymetheus et / ou les applications de ligne de commande `dcrd`,` dcrwallet` et `dcrctl`. Le guide de ligne de commande utilise des fichiers de configuration pour transmettre des paramètres à l'application pendant le lancement. Alternativement, les drapeaux peuvent être utilisés lors du démarrage d'une application, mais ils ne seront pas couverts par ce projet.

## Paymetheus

> Step 1: Download and Install Paymetheus

If you haven't already updated your Decred binaries to v0.8.2, visit the [Installation Guide](/getting-started/install-guide.md) and follow the directions for the Windows Installer.

> Step 2: Run Decred Testnet

From the Start Menu, open `Decred Testnet`. This will launch `Paymetheus`, and a new Command Prompt window will open and run `dcrd.exe`. If this is the first time running the testnet daemon, it will take a while to sync to the testnet blockchain. 

In the `Paymetheus` window, you'll be greated by a "Connect to dcrd" dialog. Keep the defaults and press the continue button. The next view will have two buttons, "Create a new wallet" and "Restore wallet from seed." For this guide, it will be assumed you do not already have a seed you wish to restore.

After clicking "Create a new wallet," you'll be greeted with information regarding your new wallet seed. Record your seed, put it in a safe place, and never share it with anyone. You will also need to re-enter it once you press the CONTINUE button. 

After you've typed in your seed, the Encrypt Wallet view will be next. Enter a private passphrase as the directions explain. Press ENCRYPT. Paymetheus will then begin to create your wallet. Once it is created, it will open to your wallet overview page.

> Step 3: Register at Stakepool Website

While waiting for your node/wallet to sync, visit [https://teststakepool.decred.org](https://teststakepool.decred.org) and register for a new account. 

> Step 4: Acquire Testnet Coins

Next, you'll need to acquire Testnet coins in order to buy Testnet tickets. There is an official Testnet faucet located at [https://faucet.decred.org](https://faucet.decred.org). To get a new address from Paymetheus, click the "Request payment" tab on the navigation menu. Clicking the "GENERATE ADDRESS" button will result in an address that should begin with "Ts". Copy and paste that address into the faucet and you should recieve your coins.

> Step 5: Purchase Testnet Tickets

Click the "Purchase tickets" tab within the Paymetheus navigation menu. You will see 7 form fields within the page. All of the defaults can be used for purchasing tickets **except** the "Stake pool preference". Click the "Manage pools" button. You need to enter the API key for your account at the testnet stakepool. To do this, simply visit [https://teststakepool.decred.org/settings](https://teststakepool.decred.org/settings) - your API Token should be the first item on the page. Enter it into the API Key field within Paymetheus and press Save. Your 1-of-2 multi-sig script will be automatically generated and you can press Close. 

Next, select teststakepool.decred.org from the Stake pool preference drop down and press the Purchase button to begin purchasing tickets! Note: the ticket difficulty is equal to the cost per ticket, so make sure you have enough testnet coins to purchase at least one.

> Step 6: Set The Votebits of Your Tickets via Stakepool 

When using a stakepool, any tickets you buy have their voting rights delegated to that stakepool. By default, the pool will vote any way it pleases with your tickets. Of course, you might want to change how your tickets vote.

You can set the votebits of your tickets via the stakepool tickets interface. Below is a screenshot of the [https://teststakepool.decred.org/tickets](https://teststakepool.decred.org/tickets) page. At the bottom of the "Live/Immature" section of this page, you will see the votebit settings. You can only edit the votebits of *all* of your tickets at once via the pool's interface. The tickets displayed below were set to "Yes" for "Previous Block Valid?" and "Yes" for "Increase Block Size from 1.0 MiB to 1.25MB" which resulted in a Votebit value of 5. 

<img src="/img/testnet-voting_votebit-setting.jpg">

For some basic information about Votebits, visit [An Explanation of Votebits](#an-explanation-of-votebits).

## Command Line Instructions

> Step 1: Download and Install Decred

If you haven't already updated your Decred binaries to v0.8.2, visit the [Installation Guide](/getting-started/install-guide.md) and follow the directions for your operating system.

> Step 2: Create Config Files

If you already familiar with the `.conf` files, continue to step 3.

Please view our [Configuration Files Introduction](/getting-started/startup-basics.md#configuration-files) and either create new configuration files or copy the sample configuration files into the directories specified for your operating system.

> Step 3: Edit Config Files to Launch Testnet

To run `dcrd`, `dcrwallet`, and `dcrctl` on the testnet, simply add `testnet=true` or `testnet=1` to all three configuration files. If you are using one of the sample config files, you can simply find the line that reads `;testnet=1` (the first setting within the Network Settings section) and delete the semi-colon. 

This must be done for all three configuration files. 

> Step 4: Create a New Testnet Wallet

If you've never run a Testnet wallet before, you will need to create a new one. With your `dcrwallet.conf` setup for testnet **(see Step 3)**, run `dcrwallet` with the `--create` flag. 

For those unfamiliar with how to do that, follow the operating system specific guide below:

**Windows**: <br />
    1. Using Command Prompt or File Explorer, navigate to the directory of your `dcrwallet` executable <br />
    2. If using File Explorer, select "Open command prompt" option from the "File" dropdown menu <br />
    3. Enter the `dcrwallet.exe --create` command

**macOS**: <br />
    1. Using Terminal or Finder, navigate to the directory of your `dcrwallet` executable <br />
    2. If using Finder, you can open a new Terminal at a folder location by right-clicking a folder and selecting Services > New Terminal at Window from the dropdown menu<br />
    3. Enter the `./dcrwallet --create` command

**Linux**: <br />
    1. Using anything you like, navigate to the directory of your `dcrwallet` executable <br />
    2. Enter the `./dcrwallet --create` command

This will run you through the usual prompts of creating a new wallet. Follow the directions on the screen. You will be required to create a private passphrase (you will use this later to unlock your wallet while creating transactions). The additional layer of encryption is completely optional. Your seed can be used to restore your wallet on any computer using dcrwallet. Record your seed, put it in a safe place, and never share it with anyone. The wallet will close once everything is finished.

> Step 5: Start dcrd on the Testnet

Run your `dcrd` executable with the `testnet=1` or `testnet=true` option within the config file to start your node on the testnet. Your node will begin to sync with the rest of the network. Syncing will take a while.

> Step 6: Start dcrwallet on the Testnet

Run your `dcrwallet` executable with the `testnet=1` or `testnet=true`option within the config file to start your wallet on the testnet. Your wallet will connect to your node and begin to sync your addresses. Syncing may take a while.

> Step 7: Register at Stakepool Website

While waiting for your node/wallet to sync, visit [https://teststakepool.decred.org](https://teststakepool.decred.org) and register for a new account. Continue to step 8.

> Step 8: Wait for Testnet Node/Wallet to Sync

Take a break, this may take a while. 

> Step 9: Create a Public Key Address to Use the Stakepool

The first step to using a stakepool is the generate a new public key address to be used to generate a 1-of-2 multisignature script. Follow the directions on [https://teststakepool.decred.org/address](https://teststakepool.decred.org/address) to generate and save this address. If you've set up an account on a mainnet stakepool, this is the same.

> Step 10: Import Your P2SH Multi-Sig Script From the Stakepool

Next, you need import a script that will allow you to delegate voting rights to the pool. After completing the previous step, this script should be available at [https://teststakepool.decred.org/tickets](https://teststakepool.decred.org/tickets). Again follow the directions there to import the script. If you've set up an account on a mainnet stakepool, this is the same.

> Step 11: Acquire Testnet Coins

Next, you'll need to acquire Testnet coins in order to buy Testnet tickets. There is an official Testnet faucet located at [https://faucet.decred.org](https://faucet.decred.org). Enter a Testnet address (one can be retrieved by running the `getnewaddress` command - examples for each OS below)

    Windows: dcrctl.exe --wallet getnewaddress
    macOS/Linux: ./dcrctl --wallet getnewaddress

> Step 12: Buy Testnet Tickets

[https://teststakepool.decred.org/tickets](https://teststakepool.decred.org/tickets) describes three options for buying tickets. Your best bet is to use manual purchasing, so you can purchase tickets whenever you need them. 

Issue a `dcrctl --wallet getstakeinfo` command to see the current difficulty. This is the current ticket price. Adjust the purchaseticket command shown on the stakepool tickets page to accommodate that current ticket price.

> Step 13: Wait For Voting To Begin

First, a minimum of 75% of ALL votes cast in the last 2016 blocks must be from a node running the latest Decred software. Then, a block interval of 5040 blocks must pass before voting begins. Check [https://hardforkdemo.decred.org](https://hardforkdemo.decred.org) for the latest status on the entire voting process. 

> Step 14: Set The Votebits of Your Tickets via Stakepool 

When using a stakepool, any tickets you buy have their voting rights delegated to that stakepool. By default, the pool will vote any way it pleases with your tickets. Of course, you might want to change how your tickets vote.

You can set the votebits of your tickets via the stakepool tickets interface. Below is a screenshot of the [https://teststakepool.decred.org/tickets](https://teststakepool.decred.org/tickets) page. At the bottom of the "Live/Immature" section of this page, you will see the votebit settings. You can only edit the votebits of *all* of your tickets at once via the pool's interface. The tickets displayed below were set to "Yes" for "Previous Block Valid?" and "Yes" for "Increase Block Size from 1.0 MiB to 1.25MB" which resulted in a Votebit value of 5. 

<img src="/img/testnet-voting_votebit-setting.jpg">

## An Explanation of Votebits

Below is a screenshot of all the meaningful votebit values for vote version 4:

<img alt="Graph explaining the votebit values of vote version 4." src="/img/testnet-voting_vote-version-4.jpg">

This screenshot is fairly self-explanatory. Within the pool interface, if a user selected "Yes" for the block size increase and "Yes" for the previous block being valid, their ticket votebits would be set to "5". 

Below is a screenshot displaying where Votebits and Vote Version can be found within an actual vote casting transaction via the block explorer at [https://testnet.decred.org](https://testnet.decred.org). This Vote was cast with a Votebit value of 5, as noted by the 2nd transaction output. 

<img src="/img/testnet-voting_vote-version-and-votebits.jpg">

You can easily check your cast votes by clicking the Ticket Transaction Hash of any of your tickets within the "Voted Tickets" section of the [https://teststakepool.decred.org/tickets](https://teststakepool.decred.org/tickets) page. (NOTE: You vote *might* display as a V0 [Version 0] due to a bug in the Stakepool code - this is being investigated and might even be solved by the time this guide is published.)

## Hard Fork Demo Website

For the purposes of displaying the status of the new voting implementation, [https://hardforkdemo.decred.org](https://hardforkdemo.decred.org) has been created. Each step is visualized by graphs and fairly straightforward explanations.
