# Mainnet Voting Guide

This guide was last updated on September 23, 2017.

Ova stranica ima kratak uvod u način funkcioniranja dnevnog reda dnevnika i detalje procesa postavljanja ulaznica za biranje željenog glasa za bilo koji dnevni red.

---

## Introduction

Postoji dvostupanjski postupak za glasanje za provedbu konsenzusnih promjena koje bi stvorile snažan scenarij.

Prvo, važno je napomenuti da je Decred lanacblokova posebno odredio dva različita intervala blokova za proces glasanja. Postoji **Interval verzija uloga** (**SVI**) od 2016 blokova (~ 1 tjedan) i **Interval promjene pravila** (**RCI**) od 8064 blokova (~ 4 tjedna). 4 Intervalne inačice uloga uklapaju se u interval 1 izmjene pravila.

The first step of the voting process is to meet the upgrade threshold on the network. After the hard fork code is released (such as the sdiff algorithm change in v1.0.0), a majority of the nodes on the network participating in PoW/PoS need to first upgrade before the voting can be scheduled to begin. For Proof-of-Work, at least 95% of the 1000 most recent blocks must have the latest block version. For Proof-of-Stake, 75% of the votes cast within a single **SVI** must have the latest vote version. Once miner and voter upgrade thresholds are met, the voting is scheduled to begin on the first block of the next **RCI** (due to there being 4 **SVI**s per **RCI**, it can take up to 6048 blocks [3 **SVI**s] for the next **RCI** to begin).

Drugi korak ovog procesa je stvarno glasanje. Jedan **RCI** se pojavljuje dok si najviše 40320 glasova oslobodi. Glasovi su poredani na završnom bloku **RCI**, a ishodi se određuju prije nego što se sljedeći blok bude vađen.

Postoji nekoliko mogućih ishoda glasanja:

1. Ako je više od 90% svih glasova u okviru RCI-a glasilo "Suzdržan", glasanje na dnevnom redu ostaje aktivno za sljedeći RCI.
2. Ako svi nepromišljeni glasovi unutar RCI-a ne ispunjavaju 75% da ili nema većinskog praga, glasanje na dnevnom redu ostaje aktivno za sljedeći RCI.
3. Ako je 75% svih glasova koja ne odbijaju u okviru RCI-a podržavaju dnevni red ("Da"), dnevni red se smatra zaključanim, a konsenzusne promjene će aktivirati 8064 blokova nakon donošenja glasova.
4. Ako je 75% svih nepromišljenih glasova u okviru RCI-a u suprotnosti s dnevnim redom ("Ne"), dnevni red ne uspije, a promjene konsenzusa nikada neće aktivirati.
5. Ako dnevni red dosegne svoje isteka prije nego ikada postigne 75% glasova, dnevni red istječe i konsenzusne promjene nikada neće aktivirati.

U nastavku je dijagram cijelog ciklusa za pojedinačni program s nadogradnjama konsenzusa.

<img src="/img/voting-cycle-v9.png">

---

## Voting Preparation

Da biste sudjelovali u glasovanju, najprije trebate račun. Ako ga već nemate, posjetite [Vodič za početnike](/getting-started/beginner-guide.md), odaberite račun i slijedite vodiče za instalaciju i postavljanje.

Zatim ćete morati naučiti osnove [Dokaz-O-Ulogu](/mining/proof-of-stake.md). Trebate biti u mogućnosti [kupiti ulaznice](/mining/proof-of-stake.md#how-to-stake) s vašom prijavom izbora.

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
