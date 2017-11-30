# Mainnet Voting Guide

This guide was last updated on September 23, 2017.

Halaman ini dimaksudkan untuk memberikan pengantar singkat tentang bagaimana cara kerja pemilihan suara agenda dan rincian proses penetapan tiket Anda untuk memberikan suara pilihan Anda untuk agenda apa pun.

---

## Introduction

Ada dua tahap proses pemungutan suara untuk menerapkan perubahan konsensus yang akan menciptakan skenario forking yang sulit.

Pertama, penting untuk dicatat bahwa rantaiblok yang dideklarasikan telah secara khusus menunjuk dua interval blok yang berbeda untuk proses pemungutan suara. Ada **Interval versi saham** (**SVI**) dari 2016 blocks (~1 minggu) dan **Interval Pergantian Aturan** (**RCI**) dari 8064 blok (~4 minggu). 4 Interval Versi Saham muat dalam 1 Interval Pergantian Aturan.

The first step of the voting process is to meet the upgrade threshold on the network. After the hard fork code is released (such as the sdiff algorithm change in v1.0.0), a majority of the nodes on the network participating in PoW/PoS need to first upgrade before the voting can be scheduled to begin. For Proof-of-Work, at least 95% of the 1000 most recent blocks must have the latest block version. For Proof-of-Stake, 75% of the votes cast within a single **SVI** must have the latest vote version. Once miner and voter upgrade thresholds are met, the voting is scheduled to begin on the first block of the next **RCI** (due to there being 4 **SVI**s per **RCI**, it can take up to 6048 blocks [3 **SVI**s] for the next **RCI** to begin).

Langkah kedua dari proses ini adalah pemilihan yang sebenarnya. Satu **RCI** terjadi saat sebanyak-banyaknya 40320 suara dilemparkan. Suara dihitung di blok akhir dari **RCI**, dan hasilnya ditentukan sebelum blok berikutnya ditambang.

Ada beberapa kemungkinan hasil pemungutan suara:

1. Jika lebih dari 90% suara dalam RCI adalah suara "Abstain", suara agenda tetap aktif untuk RCI berikutnya.
2. Jika semua suara yang tidak abstain dalam RCI gagal memenuhi ambang batas mayoritas 75% Ya atau Tidak, pemungutan suara tetap aktif untuk RCI berikutnya.
3. Jika 75% suara non-abstain di dalam RCI mendukung agenda ("Ya"), agenda dianggap terkunci dan perubahan konsensus akan mengaktifkan 8064 blok setelah pemungutan suara selesai.
4. Jika 75% suara non-pantang dalam RCI bertentangan dengan agenda ("Tidak"), agenda gagal dan perubahan konsensus tidak akan pernah diaktifkan.
5. Jika sebuah agenda mencapai masa kedaluwarsa sebelum mencapai suara mayoritas 75%, agenda akan berakhir dan perubahan konsensus tidak akan pernah diaktifkan.

Berikut adalah diagram keseluruhan siklus untuk satu agenda dengan peningkatan tingkat konsensus.

<img src="/img/voting-cycle-v9.png">

---

## Voting Preparation

Untuk berpartisipasi dalam pemungutan suara, Anda terlebih dahulu membutuhkan dompet. Jika Anda belum memilikinya, kunjungi [Beginner Guide](/getting-started/beginner-guide.md), pilih dompet, dan ikuti panduan pemasangan dan pengaturan.

Selanjutnya, Anda harus mempelajari dasar-dasar [Proof-of-Stake](/mining/proof-of-stake.md). Anda harus bisa [membeli tiket](/mining/proof-of-stake.md#how-to-stake) dengan aplikasi pilihan Anda.

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
