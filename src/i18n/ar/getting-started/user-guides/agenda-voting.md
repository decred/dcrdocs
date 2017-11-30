# Mainnet Voting Guide

This guide was last updated on September 23, 2017.

تهدف هذه الصفحة الى تقديم مقدمة عن كيفية اعمال التصويت لجدول الأعمال والتفاصيل لعملية وضع التذاكر لتصويتك المفضل لجدول الأعمال.

---

## Introduction

هناك عملية من مرحلتين للتصويت على تنفيذ توافق الأراء والتغييرات التي من شأنها خلق سيناريو أصعب.

أولا, من المهم ملاحظة أن تسلسل الكتل Decred قد عينت على وجه التحديد فواصل زمنية مختلفة في عملية التصويت. هناك ** الفاصل الزمني إصدار حصة ** (** سفي **) من كتل 2016 (~ 1 أسبوع) وفترة التغيير ** القاعدة ** (** رسي **) من 8064 كتل (~ 4 أسابيع). 4 فترات الإصدار حصة تناسب ضمن 1 فترة تغيير القاعدة.

The first step of the voting process is to meet the upgrade threshold on the network. After the hard fork code is released (such as the sdiff algorithm change in v1.0.0), a majority of the nodes on the network participating in PoW/PoS need to first upgrade before the voting can be scheduled to begin. For Proof-of-Work, at least 95% of the 1000 most recent blocks must have the latest block version. For Proof-of-Stake, 75% of the votes cast within a single **SVI** must have the latest vote version. Once miner and voter upgrade thresholds are met, the voting is scheduled to begin on the first block of the next **RCI** (due to there being 4 **SVI**s per **RCI**, it can take up to 6048 blocks [3 **SVI**s] for the next **RCI** to begin).

الخطوة الثانية لهذا المشروع بعد التصويت الفعلي. و ** RCI ** يظهر في حين أن يلقى 40320 صوتا كحد أقصى. يتم احتساب الأصوات في الكتلة النهائية من ** RCI **، ويتم تحديد النتائج للكتلة التالية التي يتم استخراجها.

هناك بعض النتائج المحتملة للتصويت:

1. اذا كانت اكثر من 90% لكل التصويتات بدون ال RCI "امتنع" التصويت, بحيث لا يزال التصويت على جدول الأعمال نشطا ل RCI المقبل.
2. إذا كانت جميع الأصوات التي لم تمتنع عن التصويت فإن RCI تفشل في تلبية عتبة ال 75٪ نعم أو لا الأغلبية، يبقى التصويت جدول الأعمال نشطة ل RCI المقبل.
3. إذا كان 75٪ من جميع الأصوات التي لم تمتنع عن التصويت داخل RCI تدعم جدول الأعمال ("نعم")، يعتبر جدول الأعمال مقفلة وسوف تكون التغييرات في توافق تفعيل 8064 كتل, وذلك بعد اجتياز التصويتات.
4. اذا كان 75% من جميع الأصوات التي لم تمتنع عن التصويت داخل RCI التي تدعم الخيار ("لا"), ويشمل فشل جدول الأعمال والتغيرات وفقا للأراء.
5. إذا كان جدول الأعمال تصل إلى انتهاء صلاحيتها من قبل أي وقت مضى بما يصل الى 75% من الأصوات, وتنتهي الأعمال وجداولها وفقا لما لم ينشط ابدا.

في الرسم البياني التالي من الدورة بأكملها لجدول واحد من الأعمال مع الترقيات لتوافق الآراء.

<img src="/img/voting-cycle-v9.png">

---

## Voting Preparation

للمشاركة في التصويت، تحتاج أولا إلى محفظة. إذا لم يكن لديك واحد بالفعل، قم بزيارة [دليل المبتدئين] (/getting-started/beginner-guide.md), واختيار المحفظة، واتبع أدلة التثبيت والإعداد.

لاحقا, سوف تحتاج لتعلم المبادئ [تجمع الحصص(/mining/proof-of-stake.md)]. فأنت سوف تحتاج للعثور على قابلية [بيع التذاكر] (/mining/proof-of-stake.md#how-to-stake) مع التطبيقات التي تختارها.

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
