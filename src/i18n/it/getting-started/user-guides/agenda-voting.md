# Mainnet Voting Guide

This guide was last updated on September 23, 2017.

Questa pagina ha lo scopo di dare una breve introduzione su come funziona il voto di agenda e dettagliare il processo per impostare i tuoi biglietti per lanciare il tuo voto preferito per qualsiasi ordine del giorno.

---

## Introduction

C'è un processo a due fasi per votare per implementare cambiamenti di consenso che creano uno scenario forzato.

Innanzitutto, è importante notare che il bloccante Decred ha specificamente designato due diversi intervalli di blocco per il processo di voto. Esiste un **Stake Version Interval** (**SVI**) di 2016 blocchi (~ 1 settimana) e **Rule Change Interval** (**RCI**) di 8064 blocchi (~ 4 settimane). 4 Intervalli di variazione delle stazioni rientrano in 1 intervallo di cambio di regola.

The first step of the voting process is to meet the upgrade threshold on the network. After the hard fork code is released (such as the sdiff algorithm change in v1.0.0), a majority of the nodes on the network participating in PoW/PoS need to first upgrade before the voting can be scheduled to begin. For Proof-of-Work, at least 95% of the 1000 most recent blocks must have the latest block version. For Proof-of-Stake, 75% of the votes cast within a single **SVI** must have the latest vote version. Once miner and voter upgrade thresholds are met, the voting is scheduled to begin on the first block of the next **RCI** (due to there being 4 **SVI**s per **RCI**, it can take up to 6048 blocks [3 **SVI**s] for the next **RCI** to begin).

La seconda fase di questo processo è il voto effettivo. Un singolo **RCI** si traduce, mentre un massimo di 40320 voti sono espressi. I voti sono classificati al blocco finale del **RCI**, e gli esiti vengono determinati prima che il blocco successivo venga estratto.

Ci sono alcuni esiti possibili di un voto:

1. Se più del 90% di tutti i voti all'interno del RCI sono voti "assenti", il voto del giorno rimane attivo per il prossimo RCI.
2. Se tutti i voti non rinuncianti nell'ambito del RCI non soddisfano la soglia di maggioranza di Sì o No, il voto del giorno rimane attivo per il prossimo RCI.
3. Se il 75% di tutti i voti non astenuti nell'ambito del RCI è a sostegno dell'ordine del giorno ("Sì"), l'ordine del giorno è considerato bloccato e le modifiche del consenso attiveranno 8064 blocchi dopo la votazione approvata.
4. Se il 75% di tutti i voti non assenti nel RCI è contrario all'ordine del giorno ("No"), l'ordine del giorno non riesce e le modifiche del consenso non verranno mai attivate.
5. Se un ordine del giorno raggiunge la scadenza prima di giungere ad una maggioranza del 75%, l'ordine del giorno scade e le modifiche del consenso non verranno mai attivate.

Di seguito è riportato un diagramma dell'intero ciclo per un singolo ordine del giorno con aggiornamenti di consenso.

<img src="/img/voting-cycle-v9.png">

---

## Voting Preparation

Per partecipare al voto, devi prima avere bisogno di un portafoglio. Se non lo si dispone già, visitare la [Beginner Guide](/getting-started/beginner-guide.md), scegliere un portafoglio e seguire le guide di installazione e configurazione.

Successivamente, è necessario apprendere le basi di [Proof-of-Stake](/mining/proof-of-stake.md). Dovresti essere in grado di [buy tickets](/mining/proof-of-stake.md#how-to-stake) con l'applicazione di tua scelta.

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
