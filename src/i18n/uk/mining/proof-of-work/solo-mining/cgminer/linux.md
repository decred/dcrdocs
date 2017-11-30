# <i class="fa fa-linux"></i> Посібник користувача Linux 

---

## <i class="fa fa-cloud"></i> Підключіть dcrd до мережі Decred 

> Крок перший

Зверніть увагу, що всі команди `dcrd`, `dcrwallet`, та `dcrctl` повинні виконануватися у каталозі, де розміщені Ваші файли  Decred! Запустіть `dcrd`:

```no-highlight
~/Decred/$ ./dcrd -u <username> -P <password>
```

Запустіть dcrwallet:

```no-highlight
~/Decred/$ ./dcrwallet -u <username> -P <password>
```

> Крок другий

Створіть нову адресу гаманця:

```no-highlight
~/Decred/$ ./dcrctl -u <username> -P <password> --wallet getnewaddress default
```

Скопіюйте нову адресу (output останньої команди). Закрийте / зупиніть `dcrd` та `dcrwallet` натиснувши `ctrl+c` у кожному вікні.

> Крок третій

Перезапустити `dcrd` за допомогою команди:

```no-highlight
~/Decred/$ ./dcrd -u <username> -P <password> --miningaddr <new address from step two or your web client wallet address>
```

> Крок четвертий

Налаштуйте безпеку TLS, скопіювавши rpc.cert на /usr/share/ca-certificates:

```no-highlight
sudo cp /home/<username>/.dcrd/rpc.cert /usr/share/ca-certificates/dcrd.crt
```

Використайте текстовий редактор, щоб додати рядок "dcrd.crt" (без лапок) до /etc/ca-certificates.conf:

```no-highlight
sudo gedit /etc/ca-certificates.conf
```

Оновіть список сертифікатів CA:

```no-highlight
sudo update-ca-certificates
```

---

## <i class="fa fa-download"></i> Завантажте та розпакуйте cgminer 

Щоб знайти останню версію cgminer, зайдіть на сторінку https://github.com/decred/cgminer/releases tДля завантаження та розпакування через термінал Linux використовуйте такі команди:

```no-highlight
wget https://github.com/decred/decred-release/releases/download/v0.0.4_cgminer/cgminer-decred-linux-x86_64-20160208.tar.gz
tar -xvf cgminer-decred-linux-x86_64-20160208.tar.gz
```

---

## <i class="fa fa-play-circle"></i> Ініціалізуйте і запустіть cgminer 

> Крок перший

Якщо `dcrd` не завершив синхронізацію з blockchain, зачекайте, поки вона скінчиться, а потім перейдіть до наступного кроку. Коли вона закінчиться, буде відображено:

```no-highlight
[INF] BMGR: Processed 1 block in the last 5m34.49s
```

> Крок другий

У своєму каталозі cgminer запустіть cgminer за допомогою команди:

```no-highlight
~/Decred/$ ./cgminer --blake256 -o https://127.0.0.1:9109 -u <username> -p <password>
```

Створіть конфігураційний файл cgminer, натиснувши такі клавіші: `S` (Налаштування, Settings), `W` (Write Config File, Написати конфігураційний файл), `Enter` (Зберегти конфігураційний файл  як `cgminer.conf`). Зверніть увагу, що `cgminer.conf` буде розміщено в тому ж каталозі, що й cgminer. Тепер cgminer можна запустити, просто виконавши команду:

```no-highlight
~/Decred/$ ./cgminer
```

Це завершення основного посібника із налаштування cgminer. Щоб отримати додаткові відомості про використання cgminer та докладні роз'яснення щодо функцій програми, зверніться до офіційного розробника [cgminer README](https://github.com/decred/cgminer/blob/3.7/README).
