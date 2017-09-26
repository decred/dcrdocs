# 시작 기본 사항

이 가이드는 v1.0.0에서 마지막으로 업데이트되었습니다.

---

이 가이드는 명령 줄 응용 프로그램 사용자에게 적용됩니다. Paymetheus와 Decrediton 사용자는 설정 파일의 사용을 무시할 수 있습니다 - Paymetheus와 Decrediton은 모두 기본 구성을 자동으로 처리합니다. 우리 가이드 중 일부는 구성 파일 설정을 보여주고 다른 가이드는 시작 명령 플래그를 보여줍니다. 

---

## 구성 파일 위치

Decred 소프트웨어는 모두 시작될 때 구성 파일에서 해당 초기로드 중에 활성화 / 비활성화 / 설정해야하는 설정을 결정합니다. 모든 명령 행 시작 플래그 `(e.g. dcrwallet --testnet)` 는 적절한 구성 파일 `(e.g. dcrwallet --testnet could be replaced by testnet=1 in dcrwallet.conf)` 의 설정으로 바꿀 수 있습니다.

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

이 폴더들 각각은 개별 응용 프로그램의 이름을 따서 명명 된 자체의 `.conf` 파일이 허용됩니다 (`e.g. dcrd uses dcrd.conf`). 또한 `Dcrd` 와 `Dcrwallet` 홈 디렉토리는 각 응용 프로그램이 처음 시작될 때 자동으로 만들어집니다. 설정 파일을 사용하기 위해서 수동으로 `Dcrctl` 홈 디렉토리를 만들어야합니다.

 [dcrinstall](/getting-started/user-guides/cli-installation.md) 설치 방법은 [minimum configuration settings](/advanced/manual-cli-install.md#minimum-configuration) 으로 구성 파일을 자동으로 만듭니다. 이미 사용하도록 설정되었습니다. 

 [Manual Installation](/advanced/manual-cli-install.md#installation) 방법에는 .zip / .tar.gz 내에 샘플 구성 파일이 있습니다. 이러한 설정 파일을 위에서 설명한 적절한 디렉토리에 복사하고 'sample-'을 제거하도록 이름을 바꾸는 것이 좋습니다. 이러한 파일에는 많은 설정이 주석 처리되어 있으며 (런타임 중에 주석이 프로그램에서 읽히지 않음) 모든 설정이 효과적으로 비활성화됩니다. 세미콜론을 삭제하기 만하면 미리 작성된 설정을 활성화 할 수 있습니다.

---

## 시작 명령 플래그

구성 파일을 통해 설정할 수있는 대부분의 설정은 실행 중에 매개 변수로 응용 프로그램에 전달 될 수도 있습니다. 예를 들어, 다음의 OS 특정 명령은 Testnet 사용을 위해 `dcrd` 를 열 것입니다. 이것은 설정 파일에서 `testnet=1` 을 사용하는 대신에 가능합니다 :

    Windows: dcrd.exe --testnet
    macOS: ./dcrd --testnet
    Linux: ./dcrd --testnet

위 예제는 먼저 설정을위한 `dcrd` 설정 파일을 찾은 다음 실행 가능한 명령을 찾아서 testnet 설정을 가능하게합니다. 

---

## 고급 사용법

[Storing Login Details in Config Files](/advanced/storing-login-details.md) <!-- This has the same information found in the above, Minimum Configuration section. Could probably delete. -->

[Full List of Options for Each Application](/advanced/program-options.md)
