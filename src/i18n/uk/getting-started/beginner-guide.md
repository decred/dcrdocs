# Посібник для початківців 

Останнє оновлення для v1.0.1

---

## Ласкаво просимо до Decred 

Ласкаво просимо до Decred! Ми дуже раді Вам. Як Ви знаєте, або, може, ще не знєте, Decred відрізняється від інших. Для того, щоб повністю розібратися, як все працює, доведеться узнати багато нового. Цей посібник допоможе полегшити процес знайомства.

Цей посібник для початківців - це схема, як запустити і налаштувати програмне забезпечення Decred. Під час створення вузлу у мережі (node) та Decred в своєму гаманці Ви можете вибрати з кількох клієнтів. Зокрема, Ви дізнаєтеся, як встановити, налаштувати та використовувати додатки Decred, як отримувати DCR, як проголосувати у Proof-of-Stake та як використовувати block explorer.

Вам потрібно буде додержуватися "Посібника з установки" [Installation Guide](#installation-guides), а потім дотримуватися вказівок нижче для обраного Вами додатка. Після налаштування Вашого додатку передивіться "Загальні інструкції" [General Guides](#general-guides) внизу цієї сторінки. Якщо у Вас виникають будь-які запитання у процесі, приєднуйтеся до нас у нашому [Slack](/support-directory.md#join-us-on-slack).

** ПРИМІТКА. Для вивчення того, як користуватися програмним забезпеченням Decred, не побоюючись зробити помилку та втратити реальні гроші, настійно рекомендовано використовувати testnet. Після того, як Ви, дотримуючись інструкцій, налаштували обране програмне забезпечення, відвідайте розділ "Інструкції з використання testnet" [Using Testnet guide](/getting-started/using-testnet.md) щоб дізнатись, як запустити додаток у тестову мережу Decred

---

## Додатки 

Нижче Ви знайдете список доступних зараз додатків, зі схемою, що показує їх сумісність з різними операційними системами.

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
| Інші UNIX|            | X    | X         | X      |             |

"Інші UNIX" в даний час включає в себе різні * BSD і Solaris /illumos.

Примітка. Ви можете скоро помітити одну з багатьох відмінностей між Decred та іншими
популярними криптовалютами: daemon гаманця та daemon вузла розділені.
Багато інших систем поєднують ці функції у єдиному daemon.
Для тих, хто віддає перевагу використанню інтерфейсів командного рядка, це означає, що Ви повинні
запускати `dcrd` для повного функціональності вузла, а `dcrwallet' для зберігання Ваших DCR,
створення транзакцій та участі у  Proof-of-Stake майнінгу / голосуванні.

---

## Інструкції із встановлення 

Для початку роботи виберіть варіант установки нижче, доступних для Вашої операційної системи:

* [Paymetheus](/getting-started/user-guides/paymetheus.md)
* [Command Line Suite **via dcrinstall**](/getting-started/user-guides/cli-installation.md) - NOTE: The `dcrinstall` method is the fastest and easiest way to get a command-line node and wallet running. It is recommended and the command-line path setup guides below will assume you've used this method.
* [Decrediton (ALPHA)](/getting-started/user-guides/decrediton-setup.md)

---

** ПРИМІТКА: ** Всі наступні посібники можна знайти в меню навігації під тими ж іменами.

## Шлях для Paymetheus (Paymetheus Path) 

Наступні посібники, по черзі, допоможуть Вам розпочати роботу з Paymetheus:

* [Paymetheus Setup](/getting-started/user-guides/paymetheus.md)
* [Using Paymetheus](/getting-started/user-guides/using-paymetheus.md)

## Путь для Decrediton (Decrediton Path) 

Наступний посібник допоможе Вам завантажити Decrediton:

* [Decrediton Setup](/getting-started/user-guides/decrediton-setup.md)

## Шлях командного рядка (Command-Line Path) 

Наступні команди, по черзі, допоможуть Вам розпочати роботу з додатками командного рядка (`dcrd`, `dcrwallet`, `dcrctl`):

* [Command-Line Differences](/getting-started/cli-differences.md)
* [Startup Option Basics](/getting-started/startup-basics.md)
* [dcrd Setup](/getting-started/user-guides/dcrd-setup.md)
* [dcrwallet Setup](/getting-started/user-guides/dcrwallet-setup.md)
* [dcrctl Basic Usage](/getting-started/user-guides/dcrctl-basics.md)

## Загальні інструкції 

Наступні посібники застосовуються незалежно від типу додатків:

* [Використання Testnet](/getting-started/using-testnet.md)
* [Отримання DCR](/getting-started/obtaining-dcr.md)
* [Використання Block Explorer](/getting-started/using-the-block-explorer.md)
* [Довідник з Proof-of-Stake Guide](/mining/proof-of-stake.md)
* [Довідник з голосування у Mainnet Mainnet Voting Guide](/getting-started/user-guides/agenda-voting.md)
