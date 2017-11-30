# <i class="fa fa-windows"></i> Руководство пользователя Windows

---

## <i class="fa fa-cloud"></i> Подключить dcrd к сети Decred

> Шаг первый

Обратите внимание, что все команды `dcrd`, `dcrwallet`, и `dcrctl` должны выполняться в каталоге, где размещены Ваши файлы Decred! Запустите `dcrd`:

```no-highlight
C:\Decred> dcrd -u <username> -P <password>
```

Запустите dcrwallet:

```no-highlight
C:\Decred> dcrwallet -u <username> -P <password>
```

> Шаг второй

Создайте новый адрес кошелька:

```no-highlight
C:\Decred> dcrctl -u <username> -P <password> --wallet getnewaddress
```

Скопируйте новый адрес (output последней команды). Закройте / остановите `dcrd` и `dcrwallet` нажав `ctrl+c` в каждом окне.

> Шаг третий

Перезапустите `dcrd` с помощью команды:

```no-highlight
C:\Decred> dcrd --miningaddr <new address from step two or your web client wallet address>
```

---

## <i class="fa fa-download"></i> Загрузите и извлеките cgminer

Чтобы найти последнюю версию cgminer, зайдите на https://github.com/decred/cgminer/releases Для 64-битной Windows загрузите и извлеките `cgminer-decred-w64_*.zip`. Для 32-битной Windows загрузите и извлеките `cgminer-decred-w32_*.zip`. Извлеките все файлы в новую папку и откройте новую папку для просмотра файлов.

---

## <i class="fa fa-play-circle"></i> Инициализируйте и запустите cgminer

> Шаг первый

Щелкните правой кнопкой мыши на `start_local.bat` и нажмите `Edit`. Измените имя пользователя и пароль, чтобы они соответствовали учетным данным, используемым на шаге 1. Сохраните и закройте start_local.bat Для справки, команда в start_local.bat:

```no-highlight
C:\Decred> cgminer --blake256 -o https://127.0.0.1:9109 -u <username> -p <password> --cert "%LOCALAPPDATA%\Dcrd\rpc.cert"
```

> Шаг второй

Если dcrd не завершил синхронизацию с блокчейном, дождитесь её завершения, а затем перейдите к следующему шагу. Когда она завершена, будет показано:

```no-highlight
[INF] BMGR: Processed 1 block in the last 5m34.49s
```

> Шаг третий

Двойной клик на `start_local.bat`. `cgminer` Должен открыться. Создайте конфигурационный файл `cgminer` нажав следующие клавиши: `S` (Настройки), `W` (Написать конфигурационный файл), `Enter` (Save config file asСохранить конфигурационный файл как `cgminer.conf`). Обратите внимание, что `cgminer.conf` будет помещен в тот же каталог, что и cgminer. Теперь Cgminer можно запустить, просто дважды кликнув `cgminer.exe`. Это окончание основного руководства по настройке соло-cgminer. Для получения дополнительной информации об использовании cgminer и подробных объяснений функций программы обратитесь к официальному разработчику [cgminer README](https://github.com/decred/cgminer/blob/3.7/README).
