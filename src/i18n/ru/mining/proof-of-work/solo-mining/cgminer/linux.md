# <i class="fa fa-linux"></i> Руководство пользователя Linux

---

## <i class="fa fa-cloud"></i> Подключить dcrd к сети Decred

> Шаг первый

Обратите внимание, что все команды `dcrd`, `dcrwallet`, и `dcrctl` должны выполняться в каталоге, где размещены Ваши файлы Decred! Запустить `dcrd`:

```no-highlight
~/Decred/$ ./dcrd -u <username> -P <password>
```

Запустить dcrwallet:

```no-highlight
~/Decred/$ ./dcrwallet -u <username> -P <password>
```

> Шаг второй

Создайте новый адрес кошелька:

```no-highlight
~/Decred/$ ./dcrctl -u <username> -P <password> --wallet getnewaddress default
```

Скопируйте новый адрес (output последней команды). Закройте / остановите `dcrd` и `dcrwallet` нажав `ctrl+c` в каждом окне.

> Шаг третий

Перезапустите `dcrd` с помощью команды:

```no-highlight
~/Decred/$ ./dcrd -u <username> -P <password> --miningaddr <new address from step two or your web client wallet address>
```

> Шаг четвертый

Настройте безопасность TLS путем копирования rpc.cert в /usr/share/ca-certificates:

```no-highlight
sudo cp /home/<username>/.dcrd/rpc.cert /usr/share/ca-certificates/dcrd.crt
```

Используйте текстовый редактор, чтобы добавить строку "dcrd.crt" (без кавычек) в /etc/ca-certificates.conf:

```no-highlight
sudo gedit /etc/ca-certificates.conf
```

Обновите список сертификатов CA:

```no-highlight
sudo update-ca-certificates
```

---

## <i class="fa fa-download"></i> Загрузите и извлеките cgminer

Чтобы найти последнюю версию cgminer, зайдите на https://github.com/decred/cgminer/releases . Для загрузки и извлечения через Ваш терминал Linux используйте следующие команды:

```no-highlight
wget https://github.com/decred/decred-release/releases/download/v0.0.4_cgminer/cgminer-decred-linux-x86_64-20160208.tar.gz
tar -xvf cgminer-decred-linux-x86_64-20160208.tar.gz
```

---

## <i class="fa fa-play-circle"></i> Инициализируйте и запустите cgminer

> Шаг первый

Если `dcrd` не завершил синхронизацию с блокчейном, дождитесь её завершения, а затем перейдите к следующему шагу. Когда она завершена, будет показано:

```no-highlight
[INF] BMGR: Processed 1 block in the last 5m34.49s
```

> Шаг второй

В своем каталоге cgminer запустите cgminer с помощью команды:

```no-highlight
~/Decred/$ ./cgminer --blake256 -o https://127.0.0.1:9109 -u <username> -p <password>
```

Создайте конфигурационный файл cgminer нажав следующие клавиши: `S` (Настройки), `W` (Написать конфигурационный файл), `Enter` (Сохранить конфигурационный файл как `cgminer.conf`). Обратите внимание, что `cgminer.conf` будет помещен в тот же каталог, что и cgminer. Теперь Cgminer можно запустить, просто выполнив команду:

```no-highlight
~/Decred/$ ./cgminer
```

Это окончание основного руководства по настройке соло-cgminer. Для получения дополнительной информации об использовании cgminer и подробных объяснений функций программы обратитесь к официальному разработчику [cgminer README](https://github.com/decred/cgminer/blob/3.7/README).
