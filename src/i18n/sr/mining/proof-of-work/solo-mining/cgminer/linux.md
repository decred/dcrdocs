# <i class="fa fa-linux"></i> Linux упутство за кориснике 

---

## <i class="fa fa-cloud"></i> Повежите dcrd са Децред мрежом 

> Први корак

Имајте на уму да све `dcrd`, `dcrwallet`, и `dcrctl`  команде морају бити извршене у директоријуму гдје су ваше декред датотеке! Почни `dcrd`:

```no-highlight
~/Decred/$ ./dcrd -u <username> -P <password>
```

Старт дцр новчаник:

```no-highlight
~/Decred/$ ./dcrwallet -u <username> -P <password>
```

> Други корак

Генеришите нову адресу новчаника:

```no-highlight
~/Decred/$ ./dcrctl -u <username> -P <password> --wallet getnewaddress default
```

Копирајте нову адресу (излаз из последње команде). Затвори / заустави `dcrd` и `dcrwallet` притиском `ctrl+c` у сваком прозору.

> Корак три

Поново покрените `dcrd` помоћу наредбе:

```no-highlight
~/Decred/$ ./dcrd -u <username> -P <password> --miningaddr <new address from step two or your web client wallet address>
```

> Четврти корак

Подешавање сигурности ТЛС копирањем рпц.церт у / уср / схаре / ца-сертификате:

```no-highlight
sudo cp /home/<username>/.dcrd/rpc.cert /usr/share/ca-certificates/dcrd.crt
```

Користите обрађивач текста да бисте додали линију"dcrd.crt" (без цитата) у /etc/ca-certificates.conf:

```no-highlight
sudo gedit /etc/ca-certificates.conf
```

Ажурирајте листу сертификата ЦА:

```no-highlight
sudo update-ca-certificates
```

---

## <i class="fa fa-download"></i> Преузмите и извадите цгминер 

Посетите https://github.com/децред/цгминер/релеасес да бисте пронашли најновије издање цгминер-а. Да бисте преузели и извадили преко Linux terminal, користите следеће команде:

```no-highlight
wget https://github.com/decred/decred-release/releases/download/v0.0.4_cgminer/cgminer-decred-linux-x86_64-20160208.tar.gz
tar -xvf cgminer-decred-linux-x86_64-20160208.tar.gz
```

---

## <i class="fa fa-play-circle"></i> Покрените цгминер 

> Први корак

Ако `dcrd` није завршио синхронизацију са блочејном, сачекајте да заврши, а затим пређите на следећи корак. Када буде завршено, то ће показати:

```no-highlight
[INF] BMGR: Processed 1 block in the last 5m34.49s
```

>Други корак

У вашем цгминер директоријуму започните цгминер помоћу наредбе:

```no-highlight
~/Decred/$ ./cgminer --blake256 -o https://127.0.0.1:9109 -u <username> -p <password>
```

Креирајте цгминер конфигурациону датотеку притиском следећих тастера: `S` (подешавања), `W` (Врите Цонфиг Филе), `Enter` (Сачувај конфигурациону датотеку као `cgminer.conf`). Имајте на уму да `cgminer.conf` поставиће се у исти директориј као цгминер. Цгминер се сада може покренути једноставним покретањем наредбе:

```no-highlight
~/Decred/$ ./cgminer
```

Ово закључује основни водич за постављање соло цгминер. За више информација о кориштењу цгминер и детаљним објашњењима о програмским функцијама погледајте службени [cgminer README](https://github.com/decred/cgminer/blob/3.7/README).
