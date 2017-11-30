# 운영 체제 간 명령 줄 차이점 

이 페이지는 v1.0.0에서 마지막으로 업데이트되었습니다.

---

The purpose of this page is to explain the key differences for running the cross-platform command-line applications on Windows, Linux, and macOS.

---

> 시작 명령

명령 줄 응용 프로그램 (`dcrd`,`dcrwallet`,`dcrctl`) 의 첫 번째 주요 차이점은 명령 줄에서 시작하는 방법입니다. 이것은 쉘의 차이만큼이나 운영체제 만큼은 아닙니다. Windows에는 명령 프롬프트와 PowerShell이 ​​설치되어 있습니다. macOS는 터미널 애플리케이션 내에서 Bash를 사용하며 많은 Linux 배포판에서는 Bash도 사용합니다. 다음은 Bash 및 명령 프롬프트에 대한 기본 실행 명령의 예입니다.

**명령 프롬프트:** `dcrd.exe`, `dcrwallet.exe`, `dcrctl.exe` <br />
**Bash:** `./dcrd`, `./dcrwallet`, `./dcrctl`

우리의 가이드 중 일부는 시작 명령으로 OS에 무관심합니다 `dcrctl --wallet getbalance`, 를 실행하라는 가이드가 있다면, 그것은 명령 프롬프트에 `dcrctl.exe --wallet getbalance` 를 사용하고 Bash에는 `./dcrctl --wallet getbalance` 를 사용하는 것을 의미합니다.

> 응용 프로그램 디렉토리 위치

명령 행 클라이언트가 다른 다른 방법은 각 응용 프로그램 디렉토리 (블록, 지갑, 구성 파일은 모두 데이터 디렉토리에 저장 됨)의 위치입니다. 다음은 각 응용 프로그램의 기본 응용 프로그램 디렉토리 목록입니다. 

| OS      | dcrd, dcrwallet, dcrctl App Directories      | 
| -------:|:--------------------------------------------- |
| Windows | `C:\Users\<your-username>\AppData\Local\dcrd\`      |
|         | `C:\Users\<your-username>\AppData\Local\dcrwallet\` | 
|         | `C:\Users\<your-username>\AppData\Local\dcrctl\`    |
| macOS   | `~/Library/Application Support/dcrd/`         |
|         | `~/Library/Application Support/dcrwallet/`    |
|         | `~/Library/Application Support/dcrctl/`       |
| Linux   | `~/.dcrd/`                                    |
|         | `~/.dcrwallet/`                               |
|         | `~/.dcrctl/`                                  |

