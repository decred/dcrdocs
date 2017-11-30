# CLI 설치 안내서  

이 페이지는 v1.0.1에 마지막으로 업데이트되었습니다.

---

## dcrinstall 

`dcrinstall` 은 Decred 명령 행 인터페이스 도구 `dcrd`, `dcrwallet`, 및 `dcrctl` 을 설치하는 데 권장되는 방법입니다.

`dcrinstall` is an automatic installer and upgrader for the Decred software. The newest release can be found here: [https://github.com/decred/decred-release/releases/tag/v1.1.0](https://github.com/decred/decred-release/releases/tag/v1.1.0). Binaries are provided for Windows, macOS, Linux, OpenBSD, and FreeBSD. Executing installer will install `dcrd`, `dcrwallet`, and `dcrctl`. Instructions are provided for macOS, Linux, and Windows below (assumed proficiency for *BSD users).

`dcrinstall` 은 GitHub에있는 미리 컴파일되고 서명 된 바이너리 패키지를 자동으로 다운로드하고,이 패키지의 서명을 검증하고, 패키지 내의 바이너리를 OS에 의존하는 특정 폴더에 복사하고, 세 개의 응용 프로그램이 통신 할 수 있도록 설정으로 구성 파일을 작성합니다 서로, 그리고 지갑을 만드는 과정을 통해 당신을 실행합니다 `dcrinstall`, 을 실행하면 추가 구성없이 소프트웨어를 시작할 수 있습니다.

> OSX/macOS:

1. 올바른 파일을 다운로드하십시오:

    For 32-bit computers, download the `dcrinstall-darwin-386-v1.1.0` file. <br />
    For 64-bit computers, download the `dcrinstall-darwin-amd64-v1.1.0` file.

2. dcrinstall-darwin-xxxx-vx.x.x 를 터미널에서 실행 가능하게 만들고 실행하십시오:

    `cd` 명령을 사용하여 dcrinstall 파일이 다운로드 된 디렉토리로 이동하고 dcrinstall 파일에서 u + x 모드로 chmod를 실행 한 다음 생성 된 실행 파일을 실행하십시오. 다음은 명령의 예입니다 (필요한 경우 디렉토리 또는 파일 이름 변경):
    
    `cd ~/Downloads/` <br />
    `chmod u+x dcrinstall-darwin-amd64-v1.1.0` <br />
    `./dcrinstall-darwin-amd64-v1.1.0`
    
3. `dcrd`,`dcrwallet`,`dcrctl`에 대한 실행 바이너리는 이제 `~/decred/` 디렉토리에서 찾을 수 있습니다. `dcrinstall` 프로세스가 완료되기 전에 Wallet 생성 프롬프트로 이동합니다. dcrwallet 설치 가이드의 [Wallet Creation Walkthrough](/getting-started/user-guides/dcrwallet-setup.md#wallet-creation-walkthrough) 의 단계를 수행하여 완료하십시오.

> Linux:

1. 올바른 파일을 다운로드하십시오:

    For 32-bit computers, download the `dcrinstall-linux-386-v1.1.0` file. <br />
    For 64-bit computers, download the `dcrinstall-linux-amd64-v1.1.0` file. <br />
    For 32-bit ARM computers, download the `dcrinstall-linux-arm-v1.1.0` file. <br />
    For 64-bit ARM computers, download the `dcrinstall-linux-arm64-v1.1.0` file.

2. 터미널에서 dcrinstall-linux-xxxx-vx.x.x 를 실행 파일로 만들어 실행합니다 :

    `cd` 명령을 사용하여 dcrinstall 파일이 다운로드 된 디렉토리로 이동하고 dcrinstall 파일에서 u + x 모드로 chmod를 실행 한 다음 생성 된 실행 파일을 실행하십시오. 다음은 명령의 예입니다 (필요한 경우 디렉토리 또는 파일 이름 변경):
    
    `cd ~/Downloads/` <br />
    `chmod u+x dcrinstall-linux-amd64-v1.1.0` <br />
    `./dcrinstall-linux-amd64-v1.1.0`
    
3. `dcrd`,`dcrwallet`,`dcrctl`에 대한 바이너리는 이제 `~/decred/` 디렉토리에서 찾을 수 있습니다. `dcrinstall` 프로세스가 완료되기 전에 Wallet 생성 프롬프트로 이동합니다. dcrwallet 설치 가이드의 [Wallet Creation Walkthrough](/getting-started/user-guides/dcrwallet-setup.md#wallet-creation-walkthrough) 의 단계를 수행하여 완료하십시오.

> Windows:

1. 올바른 파일을 다운로드하십시오:

    For 32-bit computers, download the `dcrinstall-windows-386-v1.1.0.exe` file. <br />
    For 64-bit computers, download the `dcrinstall-windows-amd64-v1.1.0.exe` file. <br />

2.  dcrinstall 실행 파일을 실행하십시오.

    두 번 클릭하거나 명령 프롬프트에서 실행할 수 있습니다. 
    
3. 3.`%HOMEPATH%\decred\` 디렉토리 (보통 %HOMEPATH% 는 `C:\Users\<username>`). 에`dcrd`,`dcrwallet`,`dcrctl`의 바이너리를 찾을 수 있습니다. `dcrinstall` 프로세스가 완료되기 전에 Wallet 생성 프롬프트로 이동합니다. dcrwallet 설치 가이드의 [Wallet Creation Walkthrough](/getting-started/user-guides/dcrwallet-setup.md#wallet-creation-walkthrough) 의 단계를 수행하여 완료하십시오.
