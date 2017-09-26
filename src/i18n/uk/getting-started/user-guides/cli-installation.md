# CLI Посібник з інсталяції  

Останнє оновлення цієї сторінки була виконане для for v1.0.1.

---

## dcrinstall 

`dcrinstall` рекомендований спосіб установки інструментів інтерфейсу командного рядка Decred `dcrd`, `dcrwallet`, та `dcrctl`.

`dcrinstall` is an automatic installer and upgrader for the Decred software. The newest release can be found here: [https://github.com/decred/decred-release/releases/tag/v1.1.0](https://github.com/decred/decred-release/releases/tag/v1.1.0). Binaries are provided for Windows, macOS, Linux, OpenBSD, and FreeBSD. Executing installer will install `dcrd`, `dcrwallet`, and `dcrctl`. Instructions are provided for macOS, Linux, and Windows below (assumed proficiency for *BSD users).

`dcrinstall` автоматично завантажить попередньо скомпільований, підписаний пакет бінарних файлів, який знаходиться на GitHub, перевірить підпис цього пакета, скопіює бінарні файли з пакету до певної папки в залежності від OS, створить конфігураційні файли з параметрами, щоб дозволити 3 додаткам спілкуватися один з одним, і проведе Вас через процес створення гаманця. Після запуску `dcrinstall`, Ви зможете запустити програмне забезпечення без додаткового налаштування.

> macOS:

1. Завантажте правильний файл:

    For 32-bit computers, download the `dcrinstall-darwin-386-v1.1.0` file. <br />
    For 64-bit computers, download the `dcrinstall-darwin-amd64-v1.1.0` file.

2. Зробіть dcrinstall-darwin-xxxx-vx.x.x виконуваним файлом у Вашому терміналі та запустіть його

    Перейдіть до каталогу, куди було завантажено файл dcrinstall, за допомогою команди `cd` запустіть chmod у режимі u + x у файлі dcrinstall і запустіть створений виконуваний файл. Нижче наведено приклад команд (замінюйте каталоги або ім'я файлу за потребою):
    
    `cd ~/Downloads/` <br />
    `chmod u+x dcrinstall-darwin-amd64-v1.1.0` <br />
    `./dcrinstall-darwin-amd64-v1.1.0`
    
3. Виконувані бінарні файли для `dcrd`, `dcrwallet`, та `dcrctl` тепер можна знайти в каталозі `~/decred/` Перед завершенням процесу `dcrinstall` Вас буде спрямовано до діалогового вікна створення гаманця. Для завершення роботи виконайте дії, описані в посібнику "Створення гаманця" [Wallet Creation Walkthrough](/getting-started/user-guides/dcrwallet-setup.md#wallet-creation-walkthrough) інструкцій з установки dcrwallet.

> Linux:

1. Завантажте правильний файл:

    For 32-bit computers, download the `dcrinstall-linux-386-v1.1.0` file. <br />
    For 64-bit computers, download the `dcrinstall-linux-amd64-v1.1.0` file. <br />
    For 32-bit ARM computers, download the `dcrinstall-linux-arm-v1.1.0` file. <br />
    For 64-bit ARM computers, download the `dcrinstall-linux-arm64-v1.1.0` file.

2. Зробіть dcrinstall-linux-xxxx-vx.x.x виконуваним файлом у Вашому терміналі та запустіть його:

    Перейдіть до каталогу, куди було завантажено файл dcrinstall, за допомогою команди `cd` запустіть chmod у режимі u + x у файлі dcrinstall і запустіть створений виконуваний файл. Нижче наведено приклад команд (замінюйте каталоги або ім'я файлу за потребою):
    
    `cd ~/Downloads/` <br />
    `chmod u+x dcrinstall-linux-amd64-v1.1.0` <br />
    `./dcrinstall-linux-amd64-v1.1.0`
    
3. Бінарні файли для `dcrd`, `dcrwallet`, та `dcrctl` тепер можна знайти в каталозі `~/decred/` Перед завершенням процесу `dcrinstall` Вас буде спрямовано до діалогового вікна створення гаманця. Для завершення роботи виконайте дії, описані в посібнику "Створення гаманця" [Wallet Creation Walkthrough](/getting-started/user-guides/dcrwallet-setup.md#wallet-creation-walkthrough) інструкцій з установки dcrwallet.

> Windows:

1. Завантажте правильний файл:

    For 32-bit computers, download the `dcrinstall-windows-386-v1.1.0.exe` file. <br />
    For 64-bit computers, download the `dcrinstall-windows-amd64-v1.1.0.exe` file. <br />

2.  Запустіть виконуваний файл dcrinstall.

    Ви можете двічі клікнути на ньому або запустити його з командного рядка. 
    
3. Бінарні файли для `dcrd`, `dcrwallet`, і `dcrctl` тепер можна знайти в каталозі `%HOMEPATH%\decred\` directory (зазвичай %HOMEPATH% це `C:\Users\<username>`). Перед завершенням процесу `dcrinstall` Вас буде спрямовано до діалогового вікна створення гаманця. Для завершення роботи виконайте дії, описані в посібнику "Створення гаманця" [Wallet Creation Walkthrough](/getting-started/user-guides/dcrwallet-setup.md#wallet-creation-walkthrough) інструкцій з установки dcrwallet.
