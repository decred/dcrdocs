# Ручна установка CLI 

---

The newest Binary Releases can be found here: [https://github.com/decred/decred-binaries/releases](https://github.com/decred/decred-binaries/releases). With the exception of the `.msi` and `.dmg` files, they are archives of the latest executable binaries for each release. Although most of this will be unzip and go, instructions are provided for macOS, Linux, and Windows below (assumed proficiency for *BSD users).

> macOS

1. Завантажте правильний файл:

    For 32-bit computers, download the `decred-darwin-386-v1.1.0.tar.gz` file. <br />
    For 64-bit computers, download the `decred-darwin-amd64-v1.1.0.tar.gz` file.

2. Перейдіть до папки завантаження та розпакуйте файл .tar.gz:

    Finder: просто подвійний клік на файлі .tar.gz. <br />
    Термінал: використовуйте команду `tar -xvzf filename.tar.gz` command. 

    ** ПРИМІТКА **: Якщо Ви користуєтесь Safari на macOS Sierra, і у Вас ввімкнено preference "Відкривати безпечні файли після завантаження" ('Open "safe" files after downloading'), файли .gz та .zip будуть автоматично розпаковані після завантаження. Команда `tar -xvzf filename.tar.gz` призводить до наступної помилки відкриття архіву: `tar: Error opening archive: Failed to open 'filename.tar.gz'`. Замість цього скористайтеся `tar -xvzf filename.tar` (видаліть .gz з попередньої команди).
    
    Both of these should extract the tar into a folder that shares the same name. (`e.g. tar -xvzf decred-darwin-amd64-v1.1.0.tar.gz` should extract to `decred-darwin-amd64-v1.1.0`). It should include `dcrctl`, `dcrd`, `dcrwallet`, `sample-dcrctl.conf`, `sample-dcrd.conf`, and `sample-dcrwallet.conf`.


> Linux

1. Завантажте правильний файл:

    For 32-bit computers, download the `decred-linux-386-v1.1.0.tar.gz` file. <br />
    For 64-bit computers, download the `decred-darwin-amd64-v1.1.0.tar.gz` file. <br />
    For 32-bit ARM computers, download the `decred-linux-arm-v1.1.0.tar.gz` file. <br />
    For 64-bit ARM computers, download the `decred-linux-arm64-v1.1.0.tar.gz` file.

2. Перейдіть до папки завантаження та розпакуйте файл .tar.gz file:

    Ubuntu File Browser: правий клік на .tar.gz і виберіть "Extract Here". <br />
    Термінал: використовуйте команду `tar -xvzf filename.tar.gz` command. 
    
    Both of these should extract the tar.gz into a folder that shares the same name. (`e.g. tar -xvzf decred-darwin-amd64-v1.1.0.tar.gz` should extract to `decred-darwin-amd64-v1.1.0`). It should include `dcrctl`, `dcrd`, `dcrwallet`, `sample-dcrctl.conf`, `sample-dcrd.conf`, and `sample-dcrwallet.conf`.

> Windows

Примітка. Windows 7/8/10 сам по собі забезпечує підтримку файлів `.zip` fтому краще використовувати файл `.zip` щоб не звертатися до сторонніх програм з файлом `.tar.gz`. Інструкції надаються для файлу `.zip`.

1. Завантажте правильний файл:

    For 32-bit computers, download the `decred-windows-386-v1.1.0.zip` file. <br />
    For 64-bit computers, download the `decred-windows-amd64-v1.1.0.zip` file.

2. Перейдіть до папки завантаження та розпакуйте файл `.zip` file:

    Провідник: правий клік на файлі .zip, виберіть "Extract All..", має відкритися запит, який саме з каталогів буде використовуватися. За замовчуванням `.zip` буде витягнуто до папки з таким самим ім'ям. Вона має містити `dcrctl`, `dcrd`, `dcrwallet`, `sample-dcrctl.conf`, `sample-dcrd.conf`, та `sample-dcrwallet.conf`.

Якщо Ви вирішите завантажити файл `.tar.gz` то для отримання фактичних бінарних файлів потрібні будуть 2 розпаковки через сторонні програми (7-zip, winRAR тощо).

---

## Мінімальна конфігурація

Для того, щоб, `dcrd`, `dcrwallet`, та `dcrctl` мали можливість обмінюватися повідомленнями, вони, як мінімум, повинні бути запущені тією ж самою комбінацією rpcuser / rpcpass. Для ручної настройки, будь ласка, виконайте наступні дії:

1. Якщо не існує вихідних каталогів, залежно від операційної системи, перерахованих в розділі [configuration files](#configuration-file-locations) вище, створіть їх для `dcrd`, `dcrwallet`, та `dcrctl`.
2. Using your favourite text editor, create a new file enter the text, `[Application Options]` as the first line. Save it as `dcrd.conf` in `dcrd`'s home directory.
3. Create another new file and add the text `[Application Options]` to the first line as before. Save it as `dcrwallet.conf` in `dcrwallet`'s home directory.
4. Create a third text file and save it as `dcrctl.conf` in `dcrctl`'s home directory. You don't need to add anything to this one right now.
5. Виберіть довільне ім'я користувача та пароль, вони будуть використовуватися тільки для зв`язку через remote procedure call. Найпростіша конфігурація - встановити їх однаковими.
6. Всередині `dcrd.conf`, нижче `[Application Options]`, додайте наступні рядки:<br /><br />
        `rpcuser=<chosen-username>`<br />
        `rpcpass=<chosen-password>`<br /><br />
7. Всередині `dcrwallet.conf`, нижче `[Application Options]`, додайте наступні рядки:<br /><br />
        `username=<chosen-username>`<br />
        `password=<chosen-password>`<br /><br />
8. Усередині `dcrctl.conf`, додайте наступні рядки:<br /><br />
        `rpcuser=<chosen-username>`<br />
        `rpcpass=<chosen-password>`<br /><br />
9. Збережіть всі три конфігураційні файли.

Please see the [sample config](https://github.com/decred/dcrd/blob/master/sampleconfig/sampleconfig.go#L8-L352) for more customisation options.