# <i class="fa fa-linux"></i> Руководство пользователя Linux 

---

## <i class="fa fa-download"></i> Загрузка и извлечение cgminer

Чтобы загрузить последнюю версию cgminer, пройдите по ссылке https://github.com/decred/cgminer/releases. Чтобы загрузить и извлечь файлы через терминал, выполните следующие команды. Обратите внимание, что в этом примере загружается cgminer v0.0.4.

```no-highlight
~/Decred/$ wget "https://github.com/decred/decred-release/releases/download/v0.0.4_cgminer/cgminer-decred-linux-x86_64-20160208.tar.gz"
~/Decred/$ tar -xvf cgminer*
```

Перейдите в новый каталог cgminer:

```
~/Decred/$ cd cgminer*
```

## <i class="fa fa-play-circle"></i> Инициализация и запуск cgminer

> Шаг первый

Чтобы просмотреть список hardware, подходящего для майнинга, введите в списке терминалов следующее:

```no-highlight
~/Decred/$ ./cgminer -n
```

Вы должны увидеть список своих видеокарт, перечисленные либо по их кодовым названиям GPU, либо по именам драйверов. В последней строке вывода должно отображаться количество совместимых GPU, которыми Вы можете майнить.

> Шаг второй (необязательный)

Чтобы протестировать Вашу систему и узнать хэшрейт (производственную мощность), на котором способны работать Ваши GPU, используйте команду:

```no-highlight
~/Decred/$ ./cgminer --blake256 --benchmark
```

> Шаг третий

Зарегистрируйтесь на одном из веб-сайтов пулов и установите нового майнера на каждый из Ваших компьютеров. Если необходимо, изучите инструкции на веб-сайте выбранного Вами пула. В окне терминала с первого шага введите следующую команду для запуска cgminer (игнорируйте квадратные скобки):

```no-highlight
~/Decred/$ ./cgminer --blake256 -o <pool url>:<port number> -u <web login>.<worker name> -p <worker password>
```

Пример:

```no-highlight
~/Decred/$ ./cgminer --blake256 -o http://dcr.maxminers.net:7727 -u DecredMiner.miner1 -p 7@!x5L1
```

> Шаг четвертый

Cgminer должен запуститься. Создайте конфигурационный файл cgminer, нажав следующие клавиши: `S` (Настройки), `W` (Write Config File), `Enter` (Сохранить конфигурационный файл как `cgminer.conf`). Обратите внимание, что `cgminer.conf` будет помещен в тот же каталог, что и `cgminer`. Чтобы добавить другие пулы в Ваш конфигурационный файл, откройте `cgminer.conf` с помощью Gedit (GUI) / Pico (CLI) или аналогичного текстового редактора. В секции "pools" конфигурационного файла можно добавить несколько пулов, используя следующий синтаксис (обратите внимание на запятую между каждой отдельной записью пула):

```no-highlight
"pools" : [
   {
      "url" : "http://dcr.maxminers.net:7727",
      "user" : "Login.Worker",
      "pass" : "password"
   },
   {
      "url" : "http://dcr.suprnova.cc:9110",
      "user" : "Login.Worker",
      "pass" : "password"
   }
]
```

> Шаг пятый

Сохраните `cgminer.conf` и закройте `cgminer`. Перезапустите cgminer, используя команду:

```no-highlight
~/Decred/$ ./cgminer
```

Это завершение базового руководства по настройке пула cgminer. Для получения дополнительной информации об использовании cgminer и подробных объяснений функций программы обратитесь к официальному разработчику [cgminer README](https://github.com/decred/cgminer/blob/3.7/README).
