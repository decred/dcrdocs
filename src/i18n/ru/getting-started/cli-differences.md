# Различия командной строки операционных систем 

Последнее изменение этой страницы для v1.0.0.

---

The purpose of this page is to explain the key differences for running the cross-platform command-line applications on Windows, Linux, and macOS.

---

> Команды запуска

Первым важным отличием приложений командной строки (`dcrd`,`dcrwallet`,`dcrctl`) является то, как именно Вы запускаете их из командной строки. Это не столько операционная система, сколько разница в оболочках. В Windows встроены "Запрос команды" (Command Prompt) и PowerShell. MacOS использует Bash в приложении Terminal, и многие дистрибутивы Linux также используют Bash. Ниже приведены примеры основных команд запуска для Bash и Command Prompt.

**Command Prompt:** `dcrd.exe`, `dcrwallet.exe`, `dcrctl.exe` <br />
**Bash:** `./dcrd`, `./dcrwallet`, `./dcrctl`

Некоторые из наших руководств могут быть OS-независимыми касательно команд запуска. Если в руководстве сказано, что надо запустить `dcrctl --wallet getbalance`, это относится к использованию `dcrctl.exe --wallet getbalance` для Command Prompt и `./dcrctl --wallet getbalance` для Bash.

> Расположение каталогов приложений

Другим отличием клиентов командной строки является расположение каталога каждого из приложений (блоки, кошельки, конфигурационные файлы хранятся в каталоге данных). Ниже приведена таблица каталогов приложений по умолчанию для каждого приложения. 

| OS      | dcrd, dcrwallet, dcrctl App Directories      | 
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

