# CLI Руководство по установке  

Последнее изменение данной страницы для v1.0.1.

---

## dcrinstall 

`dcrinstall` - рекомендуемый метод для установки инструментов интерфейса командной строки Decred `dcrd`, `dcrwallet`, и `dcrctl`.

`dcrinstall` is an automatic installer and upgrader for the Decred software. The newest release can be found here: [https://github.com/decred/decred-release/releases/tag/v1.1.0](https://github.com/decred/decred-release/releases/tag/v1.1.0). Binaries are provided for Windows, macOS, Linux, OpenBSD, and FreeBSD. Executing installer will install `dcrd`, `dcrwallet`, and `dcrctl`. Instructions are provided for macOS, Linux, and Windows below (assumed proficiency for *BSD users).

`dcrinstall` автоматически загрузит предварительно скомпилированный подписанный пакет бинарных файлов, который находится на GitHub, проверит подпись этого пакета, скопирует двоичные файлы из пакета в определенную папку в зависимости от OS, создаст конфигурационные файлы с настройками, чтобы позволить 3 приложениям взаимодействовать друг с другом, и проведет Вас через процесс создания кошелька. После запуска `dcrinstall`,Вы сможете запустить программное обеспечение без дополнительной настройки.

> macOS:

1. Загрузите правильный файл:

    For 32-bit computers, download the `dcrinstall-darwin-386-v1.1.0` file. <br />
    For 64-bit computers, download the `dcrinstall-darwin-amd64-v1.1.0` file.

2. Сделайте dcrinstall-darwin-xxxx-vx.x.x исполняемым файлом в Вашем терминале и запустите его:

    Перейдите в каталог, в который был загружен файл dcrinstall, с помощью команды `cd` запустите chmod в u+x mode в файле dcrinstall и запустите созданный исполняемый файл. Ниже приведены примеры команд (заменяйте каталоги или имя файла по мере необходимости):
    
    `cd ~/Downloads/` <br />
    `chmod u+x dcrinstall-darwin-amd64-v1.1.0` <br />
    `./dcrinstall-darwin-amd64-v1.1.0`
    
3. Исполняемые бинарные файлы для `dcrd`, `dcrwallet`, и `dcrctl` теперь можно найти в каталоге `~/decred/. Перед завершением процесса `dcrinstall` Вы попадете в диалоговое окно создания кошелька. Для завершения работы выполните шаги, описанные в "Пошаговых инструкциях по созданию кошелька" [Wallet Creation Walkthrough](/getting-started/user-guides/dcrwallet-setup.md#wallet-creation-walkthrough) руководства по установке dcrwallet.

> Linux:

1. Загрузите правильный файл:

    For 32-bit computers, download the `dcrinstall-linux-386-v1.1.0` file. <br />
    For 64-bit computers, download the `dcrinstall-linux-amd64-v1.1.0` file. <br />
    For 32-bit ARM computers, download the `dcrinstall-linux-arm-v1.1.0` file. <br />
    For 64-bit ARM computers, download the `dcrinstall-linux-arm64-v1.1.0` file.

2. Сделайте dcrinstall-linux-xxxx-vx.x.x исполняемым в Вашем терминале и запустите его:

     Перейдите в каталог, в который был загружен файл dcrinstall, с помощью команды `cd`, запустите chmod в u+x mode в файле dcrinstall и запустите созданный исполняемый файл. Ниже приведены примеры команд (заменяйте каталоги или имя файла по мере необходимости):
    
    `cd ~/Downloads/` <br />
    `chmod u+x dcrinstall-linux-amd64-v1.1.0` <br />
    `./dcrinstall-linux-amd64-v1.1.0`
    
3. Бинарные файлы для `dcrd`, `dcrwallet`, и `dcrctl` теперь можно найти в каталоге `~/decred/`. Перед завершением процесса `dcrinstall` Вы попадете в диалоговое окно создания кошелька. Для завершения работы выполните шаги, описанные в "Пошаговых инструкциях по созданию кошелька" [Wallet Creation Walkthrough](/getting-started/user-guides/dcrwallet-setup.md#wallet-creation-walkthrough) руководства по установке dcrwallet.

> Windows:

1. Загрузите правильный файл:

    For 32-bit computers, download the `dcrinstall-windows-386-v1.1.0.exe` file. <br />
    For 64-bit computers, download the `dcrinstall-windows-amd64-v1.1.0.exe` file. <br />

2.  Запустите исполняемый файл dcrinstall.

    Вы можете либо дважды кликнуть по нему, либо запустить его из командной строки. 
    
3. Бинарные файлы для `dcrd`, `dcrwallet`, и `dcrctl` теперь можно найти в каталоге `%HOMEPATH%\decred\` (обычно %HOMEPATH% - это `C:\Users\<username>`). Перед завершением процесса `dcrinstall` Вы попадете в диалоговое окно создания кошелька. Для завершения работы выполните шаги, описанные в "Пошаговых инструкциях по созданию кошелька" [Wallet Creation Walkthrough](/getting-started/user-guides/dcrwallet-setup.md#wallet-creation-walkthrough) руководства по установке dcrwallet.
