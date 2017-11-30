# <i class="fa fa-linux"></i> Посібник користувача Linux 

---

## <i class="fa fa-download"></i> Завантаження та розпакування cgminer 

Для завантаження останньої версії cgminer перейдіть на сторінку https://github.com/decred/cgminer/releases. Щоб завантажити та витягти файли через термінал, запустіть наступні команди. Зауважте, що в цьому прикладі завантажується cgminer v0.0.4.

```no-highlight
~/Decred/$ wget "https://github.com/decred/decred-release/releases/download/v0.0.4_cgminer/cgminer-decred-linux-x86_64-20160208.tar.gz"
~/Decred/$ tar -xvf cgminer*
```

Перейдіть до нового каталогу cgminer:

```
~/Decred/$ cd cgminer*
```

## <i class="fa fa-play-circle"></i> Ініціалізація і запуск cgminer 

> Крок перший

Щоб передивитися список hardware, що підходить для майнинга, введіть у вікні термінала наступне:

```no-highlight
~/Decred/$ ./cgminer -n
```

Ви маєте побачити список Ваших відеокарт, перерахованих або за їх кодовими назвами GPU, або за іменами драйверів. Останній рядок виводу повинен відображати кількість сумісних GPU, які Ви можете використовувати для майнінга.

> Крок другий (необов'язковий)

Щоб протестувати Вашу систему та дізнатися хешрейт (виробничу потужність), з яким здатні працювати Ваші GPU, скористайтеся командою:

```no-highlight
~/Decred/$ ./cgminer --blake256 --benchmark
```

> Крок третій

Зареєструйтеся на одному з веб-сайтів пулів та встановіть нового майнера на кожному з Ваших комп'ютерів. Якщо необхідно, ознайомтеся з інструкціями на веб-сайті обраного Вами пула. У термінальному вікні з кроку 1 введіть наступну команду для запуску cgminer (ігнорувати квадратні дужки):

```no-highlight
~/Decred/$ ./cgminer --blake256 -o <pool url>:<port number> -u <web login>.<worker name> -p <worker password>
```

Приклад:

```no-highlight
~/Decred/$ ./cgminer --blake256 -o http://dcr.maxminers.net:7727 -u DecredMiner.miner1 -p 7@!x5L1
```

> Крок четвертий

Тепер cgminer має запуститися. Створіть конфігураційний файл cgminer, натиснувши такі клавіші: `S` (Параметри), `W` (Write Config File), `Enter` (Зберегти конфігураційний файл  як `cgminer.conf`). Зверніть увагу, що `cgminer.conf` буде розміщено в тому ж каталозі, що і `cgminer`. Щоб додати інші пули до Вашого конфігураційного файлу, відкрийте `cgminer.conf` за допомогою Gedit (GUI) / Pico (CLI) або подібного текстового редактора. В секції "pools" конфигураційного файла можно додати декілька пулів, використовуючи наступний синтаксис (зверніть увагу на кому між кожним окремим записом пула):

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

> Крок п'ятий

Збережіть `cgminer.conf` і закрийте `cgminer`. Перезапустіть cgminer за допомогою команди:

```no-highlight
~/Decred/$ ./cgminer
```

Це завершення основного посібника із налаштування пулу cgminer. Для отримання додаткової інформації щодо використання cgminer та докладних роз'яснень функцій програми зверніться до офіційного разробника [cgminer README](https://github.com/decred/cgminer/blob/3.7/README).
