# <i class="fa fa-windows"></i> Посібник користувача Windows 

---

## <i class="fa fa-cloud"></i> Підключіть dcrd до мережі Decred 

> Крок перший

Зверніть увагу, що всі команди `dcrd`, `dcrwallet`, та `dcrctl` повинні бути виконані у каталозі, де розміщені Ваші файли Decred! Запустіть `dcrd`:

```no-highlight
C:\Decred> dcrd -u <username> -P <password>
```

Запустіть dcrwallet:

```no-highlight
C:\Decred> dcrwallet -u <username> -P <password>
```

> Крок другий

Створіть нову адресу гаманця:

```no-highlight
C:\Decred> dcrctl -u <username> -P <password> --wallet getnewaddress
```

Скопіюйте нову адресу (output останньої команди). Закрийте / зупиніть `dcrd` та `dcrwallet` натиснувши `ctrl+c` у кожному вікні.

> Крок третій

Перезапустіть `dcrd` за допомогою команди:

```no-highlight
C:\Decred> dcrd --miningaddr <new address from step two or your web client wallet address>
```

---

## <i class="fa fa-download"></i> Завантажте та розпакуйте cgminer 

Щоб знайти останню версію cgminer, зайдіть на сторінку https://github.com/decred/cgminer/releases to find the latest cgminer release. Для 64-бітової ОС Windows завантажте та розпакуйте `cgminer-decred-w64_*.zip`. Для 32-бітової ОС Windows завантажте та розпакуйте `cgminer-decred-w32_*.zip`. Витягніть всі файли до нової папки та відкрийте нову папку для перегляду файлів.

---

## <i class="fa fa-play-circle"></i> Ініціалізуйте та запустіть cgminer 

> Крок перший

Правий клік на `start_local.bat` and click `Edit`. та натисніть "Редагувати". Змініть ім'я користувача та пароль, щоб вони відповідали обліковим даним, використаним на кроці 1. Збережіть та закрийте start_local.bat Для довідки, команда у start_local.bat:

```no-highlight
C:\Decred> cgminer --blake256 -o https://127.0.0.1:9109 -u <username> -p <password> --cert "%LOCALAPPDATA%\Dcrd\rpc.cert"
```

> Крок другий

Якщо dcrd не завершив синхронізацію з blockchain, зачекайте, поки вона скінчиться, а потім перейдіть до наступного кроку. Коли вона закінчиться, буде відображено:

```no-highlight
[INF] BMGR: Processed 1 block in the last 5m34.49s
```

> Крок третій

Двічі клацніть на `start_local.bat`. `cgminer` повинен відкритися. Створіть конфігураційний файл `cgminer` натиснувши такі клавіші: `S` (Налаштування,Settings ), `W` (Write Config File, Написати конфігураційний файл), `Enter` (Зберегти конфігураційний файл  як `cgminer.conf`). Зверніть увагу, що `cgminer.conf` буде розміщено в тому ж каталозі, що й cgminer. Тепер cgminer можна запустити, просто двічі клацнувши "cgminer.exe". Це завершення основного посібника із налаштування cgminer. Щоб отримати додаткову інформацію щодо використання cgminer та докладні роз'яснення щодо функцій програми, зверніться до офіційного розробника [cgminer README](https://github.com/decred/cgminer/blob/3.7/README).
