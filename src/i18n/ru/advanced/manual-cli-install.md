# Ручная установка CLI 

---

The newest Binary Releases can be found here: [https://github.com/decred/decred-binaries/releases](https://github.com/decred/decred-binaries/releases). With the exception of the `.msi` and `.dmg` files, they are archives of the latest executable binaries for each release. Although most of this will be unzip and go, instructions are provided for macOS, Linux, and Windows below (assumed proficiency for *BSD users).

> macOS

1. Загрузите правильный файл:

    For 32-bit computers, download the `decred-darwin-386-v1.1.0.tar.gz` file. <br />
    For 64-bit computers, download the `decred-darwin-amd64-v1.1.0.tar.gz` file.

2. Перейдите в папку загрузки и извлеките файл .tar.gz:

    Finder: просто двойной клик на файле .tar.gz. <br />
    Терминал: используйте команду `tar -xvzf filename.tar.gz`. 

    **ПРИМЕЧАНИЕ**: Если Вы используете Safari в MacOS Sierra, и у Вас включена preference "Открывать безопасные файлы после загрузки" ('Open "safe" files after downloading'), файлы .gz и .zip будут автоматически разархивированы после загрузки. Команда `tar -xvzf filename.tar.gz` приводит к следующей ошибке открытия архива: `tar: Error opening archive: Failed to open 'filename.tar.gz'`. Вместо этого используйте `tar -xvzf filename.tar` (удалите .gz из предыдущей команды).
    
    Both of these should extract the tar into a folder that shares the same name. (`e.g. tar -xvzf decred-darwin-amd64-v1.1.0.tar.gz` should extract to `decred-darwin-amd64-v1.1.0`). It should include `dcrctl`, `dcrd`, `dcrwallet`, `sample-dcrctl.conf`, `sample-dcrd.conf`, and `sample-dcrwallet.conf`.


> Linux

1. Загрузите правильный файл:

    For 32-bit computers, download the `decred-linux-386-v1.1.0.tar.gz` file. <br />
    For 64-bit computers, download the `decred-darwin-amd64-v1.1.0.tar.gz` file. <br />
    For 32-bit ARM computers, download the `decred-linux-arm-v1.1.0.tar.gz` file. <br />
    For 64-bit ARM computers, download the `decred-linux-arm64-v1.1.0.tar.gz` file.

2. Перейдите в папку загрузки и извлеките файл .tar.gz:

    Ubuntu File Browser: просто правый клик на файле .tar.gz и выбрать "Extract Here". <br />
    Терминал: используйте команду `tar -xvzf filename.tar.gz`. 
    
    Both of these should extract the tar.gz into a folder that shares the same name. (`e.g. tar -xvzf decred-darwin-amd64-v1.1.0.tar.gz` should extract to `decred-darwin-amd64-v1.1.0`). It should include `dcrctl`, `dcrd`, `dcrwallet`, `sample-dcrctl.conf`, `sample-dcrd.conf`, and `sample-dcrwallet.conf`.

> Windows

Примечание. Windows 7/8/10 изначально поддерживает файлы `.zip` , поэтому предпочтительнее использовать файл `.zip` чтобы не требовались сторонние приложения для файла `.tar.gz` . Инструкции предоставлены для `.zip`.

1. Загрузите правильный файл:

    For 32-bit computers, download the `decred-windows-386-v1.1.0.zip` file. <br />
    For 64-bit computers, download the `decred-windows-amd64-v1.1.0.zip` file.

2. Перейдите в папку загрузки и распакуйте файл `.zip`:

    Проводник: правый клик на .zip-файле, выберите "Extract All..", должен появиться запрос, какой из каталогов будет использоваться. По умолчанию `.zip` будет извлечен в папку с тем же именем. Там должны находиться `dcrctl`, `dcrd`, `dcrwallet`, `sample-dcrctl.conf`, `sample-dcrd.conf`, и `sample-dcrwallet.conf`.

Если Вы решите загрузить файл `.tar.gz` , то для получения фактических бинарных файлов потребуются две отдельных распаковки в стороннем приложении (7-zip, winRAR и т.д.).

---

## Минимальная конфигурация

Для того, чтобы `dcrd`, `dcrwallet`, и `dcrctl` имели возможность обмениваться сообщениями, они, как минимум, должны быть запущены с помощью одной и той же комбинации rpcuser / rpcpass. Для настройки вручную выполните следующие действия:

1. Если не существует исходных каталогов, в зависимости от операционной системы, перечисленых в разделе [configuration files](#configuration-file-locations) выше, создайте их для `dcrd`, `dcrwallet`, и `dcrctl`.
2. Using your favourite text editor, create a new file enter the text, `[Application Options]` as the first line. Save it as `dcrd.conf` in `dcrd`'s home directory.
3. Create another new file and add the text `[Application Options]` to the first line as before. Save it as `dcrwallet.conf` in `dcrwallet`'s home directory.
4. Create a third text file and save it as `dcrctl.conf` in `dcrctl`'s home directory. You don't need to add anything to this one right now.
5. Выберите произвольное имя пользователя и пароль, которые будут использоваться только для связи через remote procedure call. Самая простая конфигурация - установить их однаковими.
6. Внутри `dcrd.conf`, ниже `[Application Options]`, добавьте следующие строки:<br /><br />
        `rpcuser=<chosen-username>`<br />
        `rpcpass=<chosen-password>`<br /><br />
7. Внутри `dcrwallet.conf`, ниже `[Application Options]`, добавьте следующие строки:<br /><br />
        `username=<chosen-username>`<br />
        `password=<chosen-password>`<br /><br />
8. Внутри `dcrctl.conf`, добавьте следующие строки:<br /><br />
        `rpcuser=<chosen-username>`<br />
        `rpcpass=<chosen-password>`<br /><br />
9. Сохраните все три конфигурационных файла.

Please see the [sample config](https://github.com/decred/dcrd/blob/master/sampleconfig/sampleconfig.go#L8-L352) for more customisation options.