# Ручна ЦЛИ инсталација 

---

The newest Binary Releases can be found here: [https://github.com/decred/decred-binaries/releases](https://github.com/decred/decred-binaries/releases). With the exception of the `.msi` and `.dmg` files, they are archives of the latest executable binaries for each release. Although most of this will be unzip and go, instructions are provided for macOS, Linux, and Windows below (assumed proficiency for *BSD users).

> macOS

1. Преузмите исправну датотеку:

    For 32-bit computers, download the `decred-darwin-386-v1.1.0.tar.gz` file. <br />
    For 64-bit computers, download the `decred-darwin-amd64-v1.1.0.tar.gz` file.

2. Крећите се да преузмете локацију и извадите датотеку .tar.gz file:

    Финдер: једноставно двапут кликните на .тар.гз датотеку. <br />
    Терминал: користите наредбу `tar -xvzf filename.tar.gz`. 

    **НАПОМЕНА**: Ако користите Сафари на МацОС Сиерра и имате "Отвори" сигурне "датотеке након преузимања" датотеке са могућношћу преференце .гз и .зип се аутоматски некомпримирају након преузимања. Команда. The `tar -xvzf filename.tar.gz` доводи до ове грешке: `tar: Error opening archive: Failed to open 'filename.tar.gz'`. Уместо тога користите `tar -xvzf filename.tar` (уклоните .гз из претходне команде).
    
    Both of these should extract the tar into a folder that shares the same name. (`e.g. tar -xvzf decred-darwin-amd64-v1.1.0.tar.gz` should extract to `decred-darwin-amd64-v1.1.0`). It should include `dcrctl`, `dcrd`, `dcrwallet`, `sample-dcrctl.conf`, `sample-dcrd.conf`, and `sample-dcrwallet.conf`.


> Linux

1. Преузмите исправну датотеку:

    For 32-bit computers, download the `decred-linux-386-v1.1.0.tar.gz` file. <br />
    For 64-bit computers, download the `decred-darwin-amd64-v1.1.0.tar.gz` file. <br />
    For 32-bit ARM computers, download the `decred-linux-arm-v1.1.0.tar.gz` file. <br />
    For 64-bit ARM computers, download the `decred-linux-arm64-v1.1.0.tar.gz` file.

2. Крећите се да преузмете локацију и извадите датотеку .tar.gz:

    Убунту Претраживач фајлова: једноставно кликните десним тастером на .тар.гз и изаберите "екстрактуј овде". <br />
    Терминал: користите наредбу `tar -xvzf filename.tar.gz` command. 
    
    Both of these should extract the tar.gz into a folder that shares the same name. (`e.g. tar -xvzf decred-darwin-amd64-v1.1.0.tar.gz` should extract to `decred-darwin-amd64-v1.1.0`). It should include `dcrctl`, `dcrd`, `dcrwallet`, `sample-dcrctl.conf`, `sample-dcrd.conf`, and `sample-dcrwallet.conf`.

> Windows

Напомена: Виндовс 7/8/10 обично нуди подршку за датотеке `.zip`, зато је пожељно користити датотеку `.zip` тако да апликације трећих страна нису потребне за датотеку `.tar.gz`. Упутства су дата за датотеку `.zip`.

1. Преузмите исправну датотеку:

    For 32-bit computers, download the `decred-windows-386-v1.1.0.zip` file. <br />
    For 64-bit computers, download the `decred-windows-amd64-v1.1.0.zip` file.

2. Крећите се да преузмете локацију и отпустите датотеку `.zip`:

    Претраживач фајлова: Десни клик на .зип датотеку, одаберите "Ектрацт Алл .." и од вас се тражи позив да се директоријум користи. Подразумевано ће издвојити `.zip` у фолдер са истим именом. Требало би да садржи `dcrctl`, `dcrd`, `dcrwallet`, `sample-dcrctl.conf`, `sample-dcrd.conf`, и `sample-dcrwallet.conf`.

Ако одлучите да преузмете датотеку `.tar.gz` захтеват ће два одвојена издвајања у некој апликацији независног програма (7-zip, WinRAR, итд.) да бисте дошли до стварних бинарних датотека.

---

## Минимална конфигурација

У најмању руку, `dcrd`, `dcrwallet`, и `dcrctl` да би могли да комуницирају једни са другима, морају се покренути са истом комбинацијом rpcuser/rpcpass. За ручну конфигурацију пратите ове кораке:

1. Ако се не налазе постојећи директоријуми засновани на оперативном систему који су наведени у [configuration files](#configuration-file-locations), молимо вас да их креирате за `dcrd`, `dcrwallet`, и `dcrctl`.
2. Using your favourite text editor, create a new file enter the text, `[Application Options]` as the first line. Save it as `dcrd.conf` in `dcrd`'s home directory.
3. Create another new file and add the text `[Application Options]` to the first line as before. Save it as `dcrwallet.conf` in `dcrwallet`'s home directory.
4. Create a third text file and save it as `dcrctl.conf` in `dcrctl`'s home directory. You don't need to add anything to this one right now.
5. Изаберите произвољно корисничко име и лозинку, они ће се користити само за сваку апликацију за комуникацију путем даљинског позива позива. Најједноставна конфигурација је да их подесите једнако.
6. Унутар `dcrd.conf`, испод `[Application Options]`, додајте следеће редове:<br /><br />
        `rpcuser=<chosen-username>`<br />
        `rpcpass=<chosen-password>`<br /><br />
7. Унутар `dcrwallet.conf`, испод `[Application Options]`, одајте следеће редове:<br /><br />
        `username=<chosen-username>`<br />
        `password=<chosen-password>`<br /><br />
8. Унутар `dcrctl.conf`, додајте следеће редове:<br /><br />
        `rpcuser=<chosen-username>`<br />
        `rpcpass=<chosen-password>`<br /><br />
9. Сачувајте све три конфигурационе датотеке.

Please see the [sample config](https://github.com/decred/dcrd/blob/master/sampleconfig/sampleconfig.go#L8-L352) for more customisation options.