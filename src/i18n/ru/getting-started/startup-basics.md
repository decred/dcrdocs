# Основные сведения о запуске

Последнее обновление для v1.0.0

---

Это руководство создано для пользователей приложений командной строки. Пользователи Paymetheus и Decrediton могут спокойно игнорировать использование конфигурационных файлов  - Paymetheus и Decrediton автоматически имеют дело с базовой конфигурацией. Также следует отметить, что в некоторых из наших руководств указываются настройки конфигурационных файлов, в других - флаги команд запуска. 

---

## Расположение конфигурационных файлов 

Все программное обеспечение Decred при запуске считывает конфигурационный файл, чтобы определить, какие настройки оно должно включить / отключить / установить во время этой начальной загрузки. Все флаги\параметры запуска командной строки `(e.g. dcrwallet --testnet)` можно заменить настройками в соответствующем конфигурационном файле `(e.g. dcrwallet --testnet может быть заменен testnet=1 в dcrwallet.conf)`.

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

Каждой из этих папок допускается собственный файл `.conf`, названный по имени отдельного приложения (`e.g. dcrd uses dcrd.conf`). Также обратите внимание, что домашние каталоги `Dcrd` и `Dcrwallet` создаются автоматически при первом запуске каждого приложения. Вам нужно будет вручную создать домашний каталог `Dcrctl` для использования конфигурационного файла.

Метод установки [dcrinstall](/getting-started/user-guides/cli-installation.md) автоматически создает конфигурационные файлы с уже включенными минимальными настройками конфигурации [minimum configuration settings](/advanced/manual-cli-install.md#minimum-configuration). 

Метод ручной установки [Manual Installation](/advanced/manual-cli-install.md#installation) включает образцы конфигурационных файлов в .zip/.tar.gz. Рекомендуется скопировать эти конфигурационные файлы в соответствующий каталог, описанный выше, и переименовать их, чтобы удалить 'sample-'. Многие настройки этих файлов закомментированы (они не читаются программой во время выполнения), поэтому все эти параметры фактически отключены. Вы можете включить эти предварительно прописанные настройки, просто удалив точку с запятой перед линией.

---

## Флаги запуска командной строки

Большинство параметров, которые Вы можете установить через конфигурационный файл, также могут быть переданы приложению в качестве параметров во время запуска. Например, следующие OS-специфичные команды откроют `dcrd` для использования в Testnet, как альтернатива - использование `testnet=1` в Вашем конфигурационном файле:

    Windows: dcrd.exe --testnet
    macOS: ./dcrd --testnet
    Linux: ./dcrd --testnet

Приведенный выше пример сначала обратится к конфигурационному файлу `dcrd` за настройками, а затем к выполняемым командам, чтобы включить настройку testnet. 

---

## Расширенное использование

[Storing Login Details in Config Files](/advanced/storing-login-details.md) <!-- Содержит ту же информацию, приведенную выше, в разделе "Минимальная конфигурация" (Minimum Configuration). Возможно, удалить. -->

[Full List of Options for Each Application](/advanced/program-options.md)
