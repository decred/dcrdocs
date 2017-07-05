# Разлике у командној линији преко оперативних система 

Ова страница је последњи пут ажурирана за в1.0.0.

---

The purpose of this page is to explain the key differences for running the cross-platform command-line applications on Windows, Linux, and macOS.

---

> Стартне команде

Прва велика разлика у апликацијама командне линије (`dcrd`,`dcrwallet`,`dcrctl`) је како их лансирате из командне линије. Ово није толико оперативни систем, јер је то разлика у шкољкама. Windows долази са Command Prompt и PowerShell. macOS користи Bash у оквиру апликације Terminal, а многе Linux дистрибуције користе Bash. Испод су примери основних команди за Bash и Command Prompt.

**Command Prompt:** `dcrd.exe`, `dcrwallet.exe`, `dcrctl.exe` <br />
**Bash:** `./dcrd`, `./dcrwallet`, `./dcrctl`

Неки наши водичи могу бити ОС-агностик са командама лансирања. Ако водич каже да покреће `dcrctl --wallet getbalance`, то се односи на кориштење `dcrctl.exe --wallet getbalance` за Команд Промпт и `./dcrctl --wallet getbalance` for Bash.

> Локације апликационих директоријума

На други начин клијенти командне линије разликују се локација сваког директорија апликација (блокови, новчани, конфигурациони фајлови су сви ускладиштени у директоријуму података). Испод је табела подразумеваних директорија апликација за сваку апликацију. 

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

