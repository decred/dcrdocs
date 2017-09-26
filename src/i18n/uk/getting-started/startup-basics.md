# Основні відомости про запуск

Останнє оновлення для v1.0.0

---

Цей посібник створено для користувачів додатків командного рядка. Користувачі Paymetheus та Decrediton можуть спокійно ігнорувати використання конфігураційних файлів - Paymetheus і Decrediton автоматично мають справу з базовою конфігурацією. Варто також зазначити, що в деяких з наших посібників наводяться налаштування конфігураційних файлів, а інших - прапори команд запуску. 

---

## Розташування конфігураційних файлів

Все програмне забезпечення Decred при запуску зчитує конфігураційний файл, щоб визначити, які налаштування воно повинно увімкнути / вимкнути / встановити під час цього першого завантаження. Усі прапори\параметри запуску командного рядка`(наприклад. dcrwallet --testnet)`  можуть бути замінені параметрами у відповідному файлі конфігурації`(наприклад. dcrwallet --testnet може бути замінено testnet=1 in dcrwallet.conf)`.

These configuration files are located within the application home directory of the application. The location of these default home directories for Windows, macOS, and Linux are listed below:

Windows:

    C:\Users\<username>\AppData\Local\Dcrwallet\
    C:\Users\<username>\AppData\Local\Dcrd\
    C:\Users\<username>\AppData\Local\Dcrctl\ 
    C:\Users\<username>\AppData\Local\Decred\Paymetheus

macOS: 

    ~/Library/Application Support/Dcrwallet/
    ~/Library/Application Support/Dcrd/
    ~/Library/Application Support/Dcrctl/
    ~/Library/Application Support/decrediton/
    
Linux: 
    
    ~/.dcrwallet/
    ~/.dcrd/
    ~/.dcrctl/
    ~/.config/decrediton

Кожній з цих папок дозволено власний файл `.conf` названий ім`ям окремого додаткуn (`наприклад. dcrd uses dcrd.conf`).акож зауважте, що домашні каталоги `Dcrwallet` створюються автоматично при першому запуску додатку. Вам доведеться вручну створити домашній каталог `Dcrctl` для використання конфігураційного файлу.

Метод встановлення [dcrinstall](/getting-started/user-guides/cli-installation.md) автоматично створює конфігураційні файли з уже ввімкненими мінімальними налаштуваннями конфігурації [minimum configuration settings](/advanced/manual-cli-install.md#minimum-configuration) . 

Метод ручної інсталяції [Manual Installation](/advanced/manual-cli-install.md#installation) містить зразки конфігураційних файлів у .zip/.tar.gz. Рекомендовано скопіювати ці конфігураційні файли до відповідного каталогу, описаного вище, та перейменувати їх, видаливши "sample-". Багато з налаштувань цих файлів закоментовані (вони не читаються програмою під час виконання), тому всі ці параметри фактично вимкнені. Ви можете ввімкнути ці попередньо записані налаштування, просто видаливши крапку з комою перед лінією.

---

## Прапори запуску командного рядка

Більшість з параметрів, які Ви можете встановити через конфігураційний файл, також можуть бути передані додатку як параметри під час запуску. Наприклад, наступні OS-специфічні команди відкриють `dcrd` для використання у Testnet, як альтернатива -  використання`testnet=1` у Вашому конфігураційному файлі:

    Windows: dcrd.exe --testnet
    macOS: ./dcrd --testnet
    Linux: ./dcrd --testnet

Наведений вище приклад спочатку звернеться до конфігураціного файла `dcrd` за налаштуваннями, а потім - до виконуваних команд, щоб увімкнути налаштування testnet. 

---

## Розширене використання

Зберігання облікових даних у конфігураційних файлах [Storing Login Details in Config Files](/advanced/storing-login-details.md) <!-- Містить ту ж інформацію, яка наведена вище в розділі "Мінімальна конфігурація" (Minimum Configuration) вище. Можливо, видалити. -->

[Повний перелік параметрів кожного додатка](/advanced/program-options.md)
