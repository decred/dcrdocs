# Почетне основе

Овај водич је последњи пут ажуриран за в1.0.0

---

Овај водич се односи на кориснике апликација за командну линију. Корисници Пејментхауса и Децредитона могу сигурно игнорисати употребу конфигурационих датотека - Пејментхаус и Децредитон аутоматски обављају основну конфигурацију. Такође је вредно напоменути да неки од наших водича приказују подешавања конфигурационих датотека, а други водичи приказују заставе за покретање. 

---

## Локације конфигурационих датотека

Сви програми Децред, када се покрену, чита из конфигурационог фајла како би утврдили која подешавања би требала омогућити / онемогућити / подесити током почетног оптерећења. Све заставе за покретање командне линије `(e.g. dcrwallet --testnet)` могу бити замењене поставкама унутар одговарајуће конфигурационог фајла `(e.g. dcrwallet --testnet could be replaced by testnet=1 in dcrwallet.conf)`.

These configuration files are located within the application home directory of the application. The location of these default home directories for Windows, macOS, and Linux are listed below:

Windows:

    C:\Users\<username>\AppData\Local\Dcrwallet\
    C:\Users\<username>\AppData\Local\Dcrd\
    C:\Users\<username>\AppData\Local\Dcrctl\ 
    C:\Users\<username>\AppData\Local\Decred\Paymetheus

macOS: 

    ~/Library/Application Support/Dcrwallet/
    ~/Library/Application Support/Dcrd/
    ~/Library/Application Support/Dcrctl/
    ~/Library/Application Support/decrediton/
    
Linux: 
    
    ~/.dcrwallet/
    ~/.dcrd/
    ~/.dcrctl/
    ~/.config/decrediton

Свакој од ових мапа је дозвољен сопствени `.цонф` фајл, назван по индивидуалној апликацији (`e.g. dcrd uses dcrd.conf`). Такође, имајте на уму да се домаћи директорији `Dcrd` и `Dcrwallet` аутоматски креирају када се свака апликација први пут покрене. Морат ћете ручно креирати домен директоријум `Dcrctl` за кориштење конфигурационе датотеке.

Инсталациони метод [dcrinstall](/getting-started/user-guides/cli-installation.md) аутоматски ствара конфигурационе датотеке, са [minimum configuration settings](/advanced/manual-cli-install.md#minimum-configuration) Већ омогућено. 

Метода [Manual Installation](/advanced/manual-cli-install.md#installation) садржи узорке конфигурационе датотеке унутар .zip/.tar.gz. Препоручује се да ове конфигурацијске датотеке копирате у одговарајући директоријум описан горе, и преименујете их да бисте уклонили 'узорак'. Ове датотеке имају пуно подешавања (коментари нису прочитани од стране програма током радног времена), тако да су сва ова подешавања ефикасно онемогућена. Ове претходно написане поставке можете омогућити једноставним брисањем полу-колоне прије линије.

---

## Почетне командне заставе

Већина поставки које можете подесити преко конфигурационог фајла могу се пренијети на апликацију као параметре током лансирања. На примјер, сљедеће ОС-специфицне наредбе би отвориле `dcrd` за кориштење Тестнет-а, алтернатива кориштењу `testnet=1` у вашој конфигурационој датотеки:

    Windows: dcrd.exe --testnet
    macOS: ./dcrd --testnet
    Linux: ./dcrd --testnet

Горе наведени примјер би најпре погледао конфигурациону датотеку `dcrd` за поставке, а потом погледао извршну наредбу како би омогућио поставку тестнет. 

---

## Напредна употреба

[Storing Login Details in Config Files](/advanced/storing-login-details.md) <!-- This has the same information found in the above, Minimum Configuration section. Could probably delete. -->

[Full List of Options for Each Application](/advanced/program-options.md)
