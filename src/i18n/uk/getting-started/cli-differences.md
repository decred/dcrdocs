# Відмінності командних рядків операційних систем 

Ця сторінка була востаннє оновлена для for v1.0.0.

---

The purpose of this page is to explain the key differences for running the cross-platform command-line applications on Windows, Linux, and macOS.

---

> Команди запуску

Перша велика відмінність додатків командного рядка (`dcrd`,`dcrwallet`,`dcrctl`) полягає в тому, як саме Ви запускаєте їх з командного рядка. Це не стільки операційна система, скільки різниця в оболонках. У Windows вбудовані "Запит команди" (Command Prompt) та PowerShell. MacOS використовує Bash у додатку Terminal, і багато з дистрибутивів Linux також використовують Bash. Нижче наведено приклади основних команд запуску для Bash та Command Prompt.

**Command Prompt:** `dcrd.exe`, `dcrwallet.exe`, `dcrctl.exe` <br />
**Bash:** `./dcrd`, `./dcrwallet`, `./dcrctl`

Деякі з наших посібників можуть бути OS-незалежними щодо команд запуску. Якщо у посібнику сказано, що треба запустити  `dcrctl --wallet getbalance`, це стосується використання `dcrctl.exe --wallet getbalance` для Command Prompt та `./dcrctl --wallet getbalance` для Bash.

> Розташування каталогів додатків

Друга відмінність клієнтів командного рядка полягає в розташуванні каталогу кожного з додатків (блоки, гаманці, конфігураційні файли зберігаються в каталозі даних). Нижче наведено таблицю каталогів додатків за умовчанням для кожного додатку. 

| OS      | Каталоги додатків  dcrd, dcrwallet, dcrctl      | 
| -------:|:--------------------------------------------- |
| Windows | `C:\Users\<your-username>\AppData\Local\dcrd\`      |
|         | `C:\Users\<your-username>\AppData\Local\dcrwallet\` | 
|         | `C:\Users\<your-username>\AppData\Local\dcrctl\`    |
| macOS   | `~/Library/Application Support/dcrd/`         |
|         | `~/Library/Application Support/dcrwallet/`    |
|         | `~/Library/Application Support/dcrctl/`       |
| Linux   | `~/.dcrd/`                                    |
|         | `~/.dcrwallet/`                               |
|         | `~/.dcrctl/`                                  |

