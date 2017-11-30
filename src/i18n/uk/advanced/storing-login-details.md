# <i class="fa fa-hdd-o"></i> Зберігання даних входу у систему 

Всі параметри, зазначені у командному рядку під час запуску dcrd,
dcrwallet та dcrctl також можна зберігати у конфігураційних файлах. Це
хороший спосіб зберігання Ваших облікових даних таким чином, щоб Ви непотрібно було
включати їх у скрипти або весь час вводити їх 
у термінал.

---

## <i class="fa fa-laptop"></i> Основні відомості про конфігураційні файли 

Якщо Ви не знайомі з основними відомостями про конфігураційні файли, перегляньте інформацію на нашій сторінці [Startup Options Intro](/getting-started/startup-basics.md#configuration-files) .

---

## <i class="fa fa-terminal"></i> dcrd.conf 

Для наступних кроків виберіть ім'я користувача та пароль. Вам не потрібно їх десь реєструвати,
вони будуть використовуватися тільки для того, щоб дозволити `dcrwallet` та `dcrctl` зв`язуватися з  `dcrd`.

> Використання зразку конфігураційного файлу

Якщо Ви вже скопіювали зразки конфігураційних файлів у відповідні каталоги, будь ласка, виконайте наступні дії.

1. Перейдіть до папки програми dcrd, як описано у `dcrd` [Startup Options Intro](/getting-started/startup-basics.md#configuration-files). 
2. Відкрийте `dcrd.conf` у текстовому редакторі.
3. Знайдіть наступні рядки:

    `;rpcuser=` <br />
    `;rpcpass=`

4. Розкоментуйте рядки, видаливши крапку з комою, і додайте вибране ім'я користувача та пароль до відповідних рядків.

> Creating a New Config File

Якщо Ви **не** скопіювали зразки конфігураційних файлів у відповідні каталоги, будь ласка, виконайте наступні дії.

1. Перейдіть до папки програми `dcrd` як описано вище у нашому [Startup Options Intro](/getting-started/startup-basics.md#configuration-files).
2. Створіть новий текстовий файл.
3. Перейменуйте його у `dcrd.conf`.
3. Відкрийте `dcrd.conf` у текстовому редакторі.
4. Додайте наступні рядки:

```no-highlight
[Application Options]

rpcuser=<username>
rpcpass=<password>
```

---

## <i class="fa fa-terminal"></i> dcrwallet.conf 

Процедура `dcrwallet.conf` дуже схожа на процедуру `dcrd.conf`. 

Зверніть увагу, що якщо значення `username=` та `password=` у `dcrwallet.conf` не збігаються з значеннями `rpcuser=` і `rpcpass=` у  `dcrd.conf`, Вам потрібно буде встановити `dcrdusername=` і `dcrdpassword=`  в `dcrwallet.conf` до значен `rpcuser`/`rpcpass` знайдених у `dcrd.conf` (найпростіше встановити всі імена користувача / паролі однаковими).

> Використання зразку конфігураційного файлу

Please follow the steps below if you've already copied the sample configuration files into their appropriate directories.

1. Перейдіть до папки програми `dcrwallet` як описано у [Startup Options Intro](/getting-started/startup-basics.md#configuration-files). 
2. Відкрийте `dcrwallet.conf` у текстовому редакторі.
3. Знайдіть наступні рядки:

    `;username=` <br />
    `;password=`

4. Розкоментуйте рядки, видаливши крапку з комою, і додайте вибране ім'я користувача та пароль до відповідних рядків.

> Створення нового конфігураційного файлу

Please follow the steps below if you have **not** copied the sample configuration files into their appropriate directories.

1. ерейдіть до папки програми `dcrwallet` як описано в [Startup Options Intro](/getting-started/startup-basics.md#configuration-files).
2. Створіть новий текстовий файл.
3. Перейменуйте його у `dcrwallet.conf`.
3. Відкрийте `dcrwallet.conf` у текстовому редакторі.
4. Додайте наступні рядки:

```no-highlight
[Application Options]

username=<username>
password=<password>
```

Якщо Ви встановили додатковий відкритий пароль для гаманця (другий пароль
під час створення гаманця), Ви також можете додати його до `dcrwallet.conf`:

```no-highlight
walletpass=<yourwalletpassword>
```

Ви не можете зазначити пароль (passphrase) свого приватного гаманця в конфігураційних файлах. Його потрібно ввести вручну за допомогою `dcrctl`. 

---

## <i class="fa fa-terminal"></i> dcrctl.conf 

І знову, простіше встановити однакові імена користувача / паролі  між `dcrd.conf`, `dcrwallet.conf`, та `dcrctl.conf`. Якщо Ви використали різні облікові дані для dcrwallet, Вам потрібно буде вказати один тут, а інший - у командному рядку при видачі команд.

> Використання зразку конфігураційного файлу

Якщо Ви вже скопіювали зразки конфігураційних файлів у відповідні каталоги,  будь ласка, виконайте наступні дії.

1. Перейдіть до папки `dcrctl` як описано в [Startup Options Intro](/getting-started/startup-basics.md#configuration-files). 
2. Відкрийте `dcrctl.conf` у текстовому редакторі.
3. Знайдіть наступні рядки:

    `;rpcuser=` <br />
    `;rpcpass=`

4. Розкоментуйте рядки, видаливши крапку з комою, і додайте вибране ім'я користувача та пароль до відповідних рядків.

> Створення нового конфігураційного файлу

Якщо Ви **не** скопіювали зразки конфігураційних файлів у відповідні каталоги,будь ласка, виконайте наступні дії.

1. Перейдіть до папки `dcrctl` як описано у [Startup Options Intro](/getting-started/startup-basics.md#configuration-files).
2. Створіть новий текстовий файл.
3. Перейменуйте його у `dcrctl.conf`.
3. Відкрийте `dcrctl.conf` у текстовому редакторі.
4. Додати наступні рядки:

```no-highlight
[Application Options]

rpcuser=<username>
rpcpass=<password>
```

---

## <i class="fa fa-tasks"></i> Додаткові параметри конфігурації 

Всі параметри командного рядка можна помістити в конфігураційний файл.
Приклади конфігураційних файлів у остаточній версії програми надають додаткові 
можливості, або ж Ви можете запустити одну з програм з флагом `-h` для відображення списку та опису усіх параметрів вказаної програми.

Існує також повний список опцій для кожної програми, який можна знайти [here](/advanced/program-options.md).
