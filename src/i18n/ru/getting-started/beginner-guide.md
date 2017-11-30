# Руководство для начинающих 

Последнее обновление для v1.0.1

---

## Добро пожаловать в Decred 

Добро пожаловать в Decred! Мы очень рады Вам. Как Вы знаете или, может быть, еще не знаете, Decred отличается от других. Для того, чтобы полностью разобраться, как все работает, предстоит узнать много нового. Данное руководство постарается облегчить процесс знакомства.

Данное руководство для начинающих - это схема, как запустить и настроить программное обеспечение Decred. При создании узла в сети (node) и Decred в своем кошельке Вы можете выбрать из нескольких клиентов. В частности, Вы узнаете, как устанавливать, настраивать и использовать приложения Decred, как получать DCR, как голосовать через Proof-of-Stake и как использовать block explorer.

Вам нужно будет следовать "Руководству по установке" [Installation Guide](#installation-guides), а затем следовать инструкциям ниже по выбранному Вами приложению . После того, как Ваше приложение настроено, просмотрите "Общие инструкции" [General Guides](#general-guides) в нижней части этой страницы. Если у Вас по ходу возникают какие-либо вопросы, присоединяйтесь к нам в нашем [Slack](/support-directory.md#join-us-on-slack).

**ПРИМЕЧАНИЕ: Для изучения того, как использовать программное обеспечение Decred, не опасаясь совершить ошибку и потерять реальные деньги, настоятельно рекомендуется использовать testnet. После того, как Вы, следуя инструкциям, установили выбранное Вами программного обеспечения, посетите раздел "Инструкции по пользованию testnet" [Using Testnet guide](/getting-started/using-testnet.md) чтобы узнать, как запустить приложение в тестовой сети Decred.**

---

## Приложения 

Ниже Вы найдете список доступных в настоящее время приложений, со схемой, показывающей их совместимость с различными операционными системами.

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
| Другие UNIX|            | X    | X         | X      |             |

"Другие UNIX" в настоящее время включает в себя различные *BSD и Solaris/illumos.

Примечание. Вскоре Вы можете заметить одно из многих различий между Decred и другими
популярными криптовалютами: daemon кошелька и daemon узла разделены.
Многие другие системы объединяют эти функции в едином daemon.
Для тех, кто предпочитает использовать интерфейсы командной строки, это означает, что Вы должны
запускать `dcrd` для полной функциональности узла и `dcrwallet` для хранения Ваших DCR,
создания транзакций и участия в Proof-of-Stake майнинге / голосовании.

---

## Руководства по установке 

Для начала работы выберите вариант установки ниже, доступный для Вашей операционной системы:

* [Paymetheus](/getting-started/user-guides/paymetheus.md)
* [Command Line Suite **via dcrinstall**](/getting-started/user-guides/cli-installation.md) - NOTE: The `dcrinstall` method is the fastest and easiest way to get a command-line node and wallet running. It is recommended and the command-line path setup guides below will assume you've used this method.
* [Decrediton (ALPHA)](/getting-started/user-guides/decrediton-setup.md)

---

**ПРИМЕЧАНИЕ:** Все следующие руководства можно найти в меню навигации под теми же именами.

## Путь для Paymetheus (Paymetheus Path) 

Следующие руководства, по порядку, помогут Вам начать работу с Paymetheus:

* [Paymetheus Setup](/getting-started/user-guides/paymetheus.md)
* [Using Paymetheus](/getting-started/user-guides/using-paymetheus.md)

## Путь для Decrediton (Decrediton Path)

Следующее руководство поможет Вам загрузить Decrediton:

* [Decrediton Setup](/getting-started/user-guides/decrediton-setup.md)

## Путь командной строки (Command-Line Path) 

Следующие команды, по порядку, помогут Вам начать работу с приложениями командной строки (`dcrd`, `dcrwallet`, `dcrctl`):

* [Command-Line Differences](/getting-started/cli-differences.md)
* [Startup Option Basics](/getting-started/startup-basics.md)
* [dcrd Setup](/getting-started/user-guides/dcrd-setup.md)
* [dcrwallet Setup](/getting-started/user-guides/dcrwallet-setup.md)
* [dcrctl Basic Usage](/getting-started/user-guides/dcrctl-basics.md)

## Общие инструкции 

Следующие руководства применяются вне зависимости от типа приложений:

* [Using Testnet](/getting-started/using-testnet.md)
* [Obtaining DCR](/getting-started/obtaining-dcr.md)
* [Using the Block Explorer](/getting-started/using-the-block-explorer.md)
* [Proof-of-Stake Guide](/mining/proof-of-stake.md)
* [Mainnet Voting Guide](/getting-started/user-guides/agenda-voting.md)
