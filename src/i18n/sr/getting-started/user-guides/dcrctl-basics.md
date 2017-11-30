# Дцрцтл oснове 

Последње ажурирање за в1.0.0.

Овај водич намерава да вам помогне да научите основне наредбе апликације `dcrctl` користећи [minimal configuration file](/advanced/manual-cli-install.md#minimum-configuration). 

**Предуслови:**

- Користите најновије [dcrinstall](/getting-started/user-guides/cli-installation.md) да бисте инсталирали `dcrctl`. Додатни кораци ће бити потребни ако се користи други метод инсталације.
- Review how the launch commands for the Command Prompt (Windows) and Bash (macOS/Linux) shells differ [here](/getting-started/cli-differences.md).
- [Setup dcrd](/getting-started/user-guides/dcrd-setup.md) и покрените га у позадини.
- [Setup dcrwallet](/getting-started/user-guides/dcrwallet-setup.md) и покрените га у позадини.

---

`dcrctl` је клијент који контролише `dcrd` и `dcrwallet` реко даљинског поступка (RPC). Можете користити `dcrctl` за многе ствари као што су провера стања, куповина улазница, креирање трансакција и преглед информација о мрежи.

**ПОДСЈЕТНИК:** TОвај водич користи примере ОС-агностика за наредбе. Прегледајте предуслове да бисте утврдили да ли бисте требали користити `./dcrctl` или `dcrctl.exe` умјесто `dcrctl`.

---

> Конфигуришите РПЦ корисничко име и лозинку

Команде које се шаљу на `dcrd` или `dcrwallet` ће захтевати корисничко име / лозинке РПЦ-а у конфигурацијским датотекама.

Ако сте користили [`dcrinstall`](/getting-started/user-guides/cli-installation.md), ваше конфигурационе датотеке су већ подешене са корисничким именом / лозинком РПЦ-а за `dcrd`, `dcrwallet`, и `dcrctl`.

Ако нисте користили `dcrinstall`, мораћете да омогућите минимална подешавања у вашим конфигурационим датотекама. Пратите [this guide](/advanced/manual-cli-install.md#minimum-configuration) да то урадите.

---

## дцрцтл команде

Морате покренути наредбе дцрцтл у одвојеном шел прозору (Цомманд Промпт / Басх).

Да бисте издали команде `dcrwallet`, потребно је да користите `dcrctl --wallet <command>`.

а бисте издали команде `dcrd`, мораћете да користите `dcrctl <command>`.

Да бисте видели комплетну листу команди које `dcrctl` може послати на `dcrwallet`,  издајте сљедећу наредбу:

```no-highlight
dcrctl -l
```

Ово ће вратити веома дугачку листу команди, раздвојених апликацијом. Команде у горњем делу су за `dcrd` а наредбе у доњем делу су за `dcrwallet`. Можете сазнати више о појединачној наредби тако што ћете укуцати следеће наредбе за `dcrwallet`:

```no-highlight
dcrctl help --wallet <command>
```

or the following for `dcrd` commands:

```no-highlight
dcrctl help <command>
```

---

## Откључавање новчаника

Неке функционалности `dcrwallet` захтевају да се новчаник откључа.

Следи наредба за откључавање новчаника: 

```no-highlight
dcrctl --wallet walletpassphrase <private passphrase set during wallet creation> 0
```

Овде, спецификујемо да `dcrctl` пошаље команду на `dcrwallet` користећи `--wallet` заставицу. Тренутна наредба је `walletpassphrase` која прихвата два параметра, вашу приватну лозинку и временско ограничење. Одређивање `0` за временско ограничење откључава `dcrwallet` без временског ограничења. Приметите, међутим, да ово само откључава новчаник за тренутну сесију. Ако затворите прозор на који се новчаник покреће, или зауставите / поново покрените `dcrwallet`, мораћете да га поново откључате следећи пут када покренете. 

Ако је команда била успешна, нећете добити потврду од `dcrctl`, али ако погледате вашу `dcrwallet` сесију, то ће рећи:

```no-highlight
[INF] RPCS: The wallet has been unlocked without a time limit.
```

NOTE: Пошто је откључавање новчаника неопходно за многе функције дцрваллет-а `dcrwallet`, `dcrwallet` се може започети са флагом `--promptpass` или постављањем `promptpass=true` у `dcrwallet.conf` (discussed [here](/advanced/storing-login-details.md#dcrwalletconf)).

---

## Провера вашег баланса

Да пошаљете наредбу `getbalance` у `dcrwallet` користећи `dcrctl`, унесите следеће у своју љуску:

```no-highlight
dcrctl --wallet getbalance
```

Ово ће вратити све стање на свим вашим рачунима.

---

## Добијање нове адресе за пријем

Да пошаљете `getnewaddress` команду на `dcrwallet` користећи `dcrctl`, унесите следеће у своју љуску:

```no-highlight
dcrctl --wallet getnewaddress
```

Ово ће генерисати и вратити нову адресу за плаћање. Да бисте умањили поновну употребу адресе, користите ову наредбу да бисте добили нову адресу за сваку трансакцију коју желите примити.

---

## Слање ДЦР-а

Да пошаљете ДЦР на адресу, издајте наредбу `sendtoaddress` на `dcrwallet` користећи `dcrctl`. Упишите следеће у својој школи, попуните адресу примаоца и износ за слање:

```no-highlight
dcrctl --wallet sendtoaddress <address> <amount>
```

Ако је успјешно, `dcrctl` ће вратити трансакцијски хеш који се може користити за гледање трансакције на службеном [Decred Block Explorer](/getting-started/using-the-block-explorer.md).

---

## Провјерите мрежну статистику

Постоји много различитих команди за проверу различитих мрежних статистика. Овде ћемо покрити слање `getinfo` у `dcrd` и `getstakeinfo` у `dcrwallet`.

Да бисте добили информације о вашем локалном `dcrd` чвору, издајте наредбу `getinfo` на `dcrd` користећи `dcrctl`. У својој школи унесите следеће:

```no-highlight
dcrctl getinfo
```

Да бисте добили информације о мрежи Прув оф стејк, пошаљите `getstakeinfo` команду на `dcrwallet` користећи `dcrctl`. У својој школи унесите следеће:

```no-highlight
dcrctl --wallet getstakeinfo
```

---

## Додатне команде

Више команди се такође могу пронаћи на страници [Program Options](/advanced/program-options.md).

---
