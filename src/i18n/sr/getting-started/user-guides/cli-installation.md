# ЦЛИ упутство за инсталацију  

Ова страница је последњи пут ажурирана за в1.0.1.

---

## дцр инсталaција 

`dcrinstall` је препоручени метод за инсталирање интерфејс алата за наредбе команде `dcrd`, `dcrwallet`, и `dcrctl`.

`dcrinstall` is an automatic installer and upgrader for the Decred software. The newest release can be found here: [https://github.com/decred/decred-release/releases/tag/v1.1.0](https://github.com/decred/decred-release/releases/tag/v1.1.0). Binaries are provided for Windows, macOS, Linux, OpenBSD, and FreeBSD. Executing installer will install `dcrd`, `dcrwallet`, and `dcrctl`. Instructions are provided for macOS, Linux, and Windows below (assumed proficiency for *BSD users).

`dcrinstall` ће аутоматски преузети прекомпликовани, потписани бинарни пакет пронађен на ГитХуб-у, потврдити потпис овог пакета, копирати бинарне датотеке унутар пакета у одређени фолдер у зависности од оперативног система, креирати конфигурационе датотеке са поставкама како би се 3 апликације омогућило комуницирање са Једни друге, и водити вас кроз процес креирања новчаника. Након што покренете `dcrinstall`, моћи ћете да покренете софтвер без додатне конфигурације.

> macOS:

1. Преузмите исправну датотеку:

    For 32-bit computers, download the `dcrinstall-darwin-386-v1.1.0` file. <br />
    For 64-bit computers, download the `dcrinstall-darwin-amd64-v1.1.0` file.

2. Извршите dcrinstall-darwin-xxxx-vx.x.x извршну датотеку унутар вашег терминала и покрените је:

    Пређите до директоријума где је датотека дцринсталл преузета помоћу наредбе `cd` покрените цхмод са режимом у + к на дцринсталл датотеки и покрените извршну датотеку која је креирана. Испод је пример команди (промените директоријуме или име датотеке по потреби):
    
    `cd ~/Downloads/` <br />
    `chmod u+x dcrinstall-darwin-amd64-v1.1.0` <br />
    `./dcrinstall-darwin-amd64-v1.1.0`
    
3. Изводљиви бинарни фајлови за `dcrd`, `dcrwallet`, и `dcrctl` сада се могу наћи у директорију `~/decred/` Пре него што се процес `dcrinstall` заврши, бићете одведени у позив за креирање новчаника. Пратите кораке унутар [Wallet Creation Walkthrough](/getting-started/user-guides/dcrwallet-setup.md#wallet-creation-walkthrough) водича за постављање дцрваллет за завршетак.

> Linux:

1. Преузмите исправну датотеку:

    For 32-bit computers, download the `dcrinstall-linux-386-v1.1.0` file. <br />
    For 64-bit computers, download the `dcrinstall-linux-amd64-v1.1.0` file. <br />
    For 32-bit ARM computers, download the `dcrinstall-linux-arm-v1.1.0` file. <br />
    For 64-bit ARM computers, download the `dcrinstall-linux-arm64-v1.1.0` file.

2. Извршите dcrinstall-linux-xxxx-vx.x.x извршну датотеку унутар вашег терминала и покрените је:

    Пређите до директоријума где је датотека дцринсталл преузета помоћу наредбе `cd` покрените цхмод са режимом у + к на дцринсталл датотеки и покрените извршну датотеку која је креирана. Испод је пример команди (промените директоријуме или име датотеке по потреби):
    
    `cd ~/Downloads/` <br />
    `chmod u+x dcrinstall-linux-amd64-v1.1.0` <br />
    `./dcrinstall-linux-amd64-v1.1.0`
    
3. Бинарни фајлови за `dcrd`, `dcrwallet`, и `dcrctl` сада се могу наћи у директорију `~/decred/` Пре него што се процес `dcrinstall` заврши, бићете одведени у позив за креирање новчаника. Пратите кораке унутар [Wallet Creation Walkthrough](/getting-started/user-guides/dcrwallet-setup.md#wallet-creation-walkthrough) водича за постављање дцрваллет за завршетак.

> Windows:

1. Преузмите исправну датотеку:

    For 32-bit computers, download the `dcrinstall-windows-386-v1.1.0.exe` file. <br />
    For 64-bit computers, download the `dcrinstall-windows-amd64-v1.1.0.exe` file. <br />

2.  Покрените дцринстал извршну датотеку.

    Можете га двапут кликнути или покренути из командног позива. 
    
3. Бинарни фајлови за `dcrd`, `dcrwallet`, и `dcrctl` сада се могу наћи у `%HOMEPATH%\decred\` directory (usually %HOMEPATH% is `C:\Users\<username>`). Before the `Пре него што се процес дцринсталл заврши, бићете одведени у позив за креирање новчаника. Пратите кораке унутар [Wallet Creation Walkthrough](/getting-started/user-guides/dcrwallet-setup.md#wallet-creation-walkthrough) водича за постављање дцрваллет за завршетак.
