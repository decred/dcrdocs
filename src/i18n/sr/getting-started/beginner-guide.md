# Водич за почетнике 

Последње ажурирање за в1.0.1

---

## Добродошли у Децред 

Добродошли у Децред! Веома смо задовољни што вас имамо. Као што можда и можда већ знате или не, Децред је другачији. Постоји пуно нових ствари које ћете научити да у потпуности схвате како ствари раде. Ова документација ће покушати да ствари олакшају разумевање.

Овај почетни водич је пут до покретања софтвера Децред. Можете изабрати више клијената да бисте добили чвор на мрежи и Децред у новчанику. Конкретно, научићете како да инсталирате, подесите и користите програме прогнане; Како добити ДЦР; Како гласати преко доказног предмета; И како користити блок истраживач.

Морате да пратите [Installation Guide](#installation-guides), а затим пратите путању за апликацију по вашем избору испод. Након постављања ваше апликације, идите кроз [General Guides](#general-guides) на дну ове странице. Ако имате било каквих питања на овом путу, придружите нам се у нашем [Slack](/support-directory.md#join-us-on-slack).

**НАПОМЕНА: Користећи Тестнет, препоручујемо да научите како да користите софтвер Децред без страха да направите грешку и изгубите прави новац. Након што пратите водиче за подешавање вашег избора софтвера, посјетите [Using Testnet guide](/getting-started/using-testnet.md) како бисте сазнали како да покренете апликацију на тестовску мрежу Децреда.**

---

## Апликације 

Испод ћете наћи листу тренутно доступних апликација, а графикон показује њихову компатибилност са различитим оперативним системима.

**Paymetheus**: The only Windows GUI client as of v1.1.0. <br />
**dcrd**: The node daemon, this command-line application handles block management and consensus. <br />
**dcrwallet**: The wallet daemon, this command-line application handles address and transaction management. <br />
**dcrctl**: The remote procedure call (RPC) client, this command-line application is used to control dcrd and dcrwallet via RPC commands. <br />
**Decrediton**: Cross-platform GUI client as of v1.1.0.

|           | Paymetheus | dcrd | dcrwallet | dcrctl | Decrediton |
| ---------:|:----------:|:----:|:---------:|:------:|:-----------:|
| Windows   | X          | X    | X         | X      |             |
| macOS     |            | X    | X         | X      | X           |
| Linux     |            | X    | X         | X      | X           |
| Other UNIX|            | X    | X         | X      |             |

"Други UNIX" тренутно укључује разне *BSDs и Solaris/illumos.

Напомена: Ускоро ћете приметити једну од многих разлика између Децред и других 
популарних крипто вредности: даемон новчаника и даемон чворова су одвојени.
Много других кованица ради ове функције заједно у једном демону.
За оне који одлуче да користе интерфејс командне линије, то значи да морате
Покрените `dcrd` за пуну функцију чвора и,`dcrwallet` за чување DCR,
Створити трансакције и учествовати у претраживању / гласању доказа.

---

## Водич за инсталацију 

Да бисте започели, изаберите опцију за инсталације доступне за ваш оперативни систем испод:

* [Paymetheus](/getting-started/user-guides/paymetheus.md)
* [Command Line Suite **via dcrinstall**](/getting-started/user-guides/cli-installation.md) - НАПОМЕНА: Метода `dcrinstall` је најбржи и најлакши начин за добијање чвора у командној линији и Новчаник ради. Препоручује се и упутства за подешавање путање командне линије претпостављају да сте користили овај метод.
* [Decrediton (ALPHA)](/getting-started/user-guides/decrediton-setup.md)

---

**НАПОМЕНА:** Сви следећи водичи могу се наћи у навигационом менију са истим именима..

## Употреба Пејментхауса 

Следећи водичи, по наруџби, ће вам започети помоћу Паиметхеуса:

* [Paymetheus Setup](/getting-started/user-guides/paymetheus.md)
* [Using Paymetheus](/getting-started/user-guides/using-paymetheus.md)

## Употреба Децредита 

Следећи водич ће вам помоћи да учитате Децредитон:

* [Decrediton Setup](/getting-started/user-guides/decrediton-setup.md)

## Употреба командне линије 

Следећи водичи, по реду, ће вам започети помоћу  апликација командне линије (`dcrd`, `dcrwallet`, `dcrctl`):

* [Command-Line Differences](/getting-started/cli-differences.md)
* [Startup Option Basics](/getting-started/startup-basics.md)
* [dcrd Setup](/getting-started/user-guides/dcrd-setup.md)
* [dcrwallet Setup](/getting-started/user-guides/dcrwallet-setup.md)
* [dcrctl Basic Usage](/getting-started/user-guides/dcrctl-basics.md)

## Уопштено 

Следећи водичи су независни од различитих апликација:

* [Using Testnet](/getting-started/using-testnet.md)
* [Obtaining DCR](/getting-started/obtaining-dcr.md)
* [Using the Block Explorer](/getting-started/using-the-block-explorer.md)
* [Proof-of-Stake Guide](/mining/proof-of-stake.md)
* [Mainnet Voting Guide](/getting-started/user-guides/agenda-voting.md)
