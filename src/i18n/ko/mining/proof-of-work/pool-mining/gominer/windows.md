# <i class="fa fa-windows"></i> *gominer* Windows 풀 마이닝 사용 설명서 

이 안내서는 구성 파일을 사용하여 선택한 마이닝 풀에 gominer를 기본 설정하는 것을 기본으로합니다.보다 고급 옵션을 사용할 수 있습니다.

gominer v1.0.0 용 최종 업데이트.

---

### <i class="fa fa-download"></i> 다운로드 및 추출 *gominer* Binary 


>.zip 파일 다운로드

 [https://github.com/decred/decred-binaries/releases/tag/v1.0.0](https://github.com/decred/decred-binaries/releases/tag/v1.0.0) 을 방문하여 gominer Windows 바이너리. '다운로드'섹션에는 다음 파일이 표시됩니다:

- `gominer-windows-amd64-cuda-v1.0.0.zip`,
- `gominer-windows-amd64-opencl-v1.0.0.zip`,
- `gominer-windows-amd64-opencladl-v1.0.0.zip`.

NVIDIA 그래픽 카드의 경우 `*-cuda-*.zip` 파일을 다운로드하십시오. <br />
Radeon과 FirePro 라인의 AMD 그래픽 카드는 `*-opencladl-*.zip` 파일을 다운로드하십시오. <br />
다른 그래픽 카드의 경우 `*-opencl-*.zip` 파일을 다운로드하십시오.

모든 파일을 새 폴더에 추출하거나 복사하십시오. 이 폴더의 경로 이름을 기억하거나 새로운 파일 탐색기 창을 열어 폴더 내용을 봅니다 (이 튜토리얼의 나머지 부분에서는 예제로 `C:\decred\gominer\` 를 사용합니다). 이 폴더의 내용은 `blake256.cl`, `gominer.exe`, `LICENSE`, `README.md`, `sample-gominer.conf` 이어야합니다.

> 명령 프롬프트 노트

새로운 사람들을 위해 특정 디렉토리 (폴더)에서 명령 프롬프트를 여는 몇 가지 방법을 익히십시오:

- 파일 탐색기에서 특정 폴더로 이동하고 검색 주소창에 `cmd` 를 입력 한 다음 Enter 키를 누릅니다.
- 파일 탐색기에서 특정 폴더로 이동하여 "파일"드롭 다운을 클릭하고 "명령 프롬프트 열기"옵션으로 이동 한 다음 "명령 프롬프트 열기"를 선택하십시오.
- 시작 메뉴를 클릭하거나 키보드의 Windows 키를 누르고 `cmd`, 를 입력 한 다음 검색 결과에 나타나는 "명령 프롬프트"데스크탑 응용 프로그램을 엽니 다 `cd` 명령을 사용하여 현재 디렉토리를 특정 폴더로 변경하십시오 `e.g. cd C:\decred\gominer\`. `dir` 커맨드만으로 현재 디렉토리의 내용을 볼 수 있습니다.

### 설치 *gominer* 구성 파일 

> 1 단계 : 채광 풀 선택

이 단계를 시작하기 전에 이미 마이닝 풀 계정에 가입해야합니다 (선택한 마이닝 풀에서 필요한 경우 풀 웹 사이트에서 작업자를 만들어야 함). 나중에 사용할 수 있도록 작업자의 로그인과 암호 및 풀의 계층 + TCP 주소 : 포트를 기록하십시오.

새로 구입 한 경우, Decred 마이닝 풀에서 근로자를 만들기위한 몇 가지 가이드가 있습니다 (경고 : 계정을 만들 때 설정 한 PIN을 잊지 마세요. 마이닝 된 DCR 없이는 철회 할 수 없습니다):

- [https://dcr.maxminers.net/index.php?page=gettingstarted](https://dcr.maxminers.net/index.php?page=gettingstarted)
- [https://dcr.suprnova.cc/index.php?page=gettingstarted](https://dcr.suprnova.cc/index.php?page=gettingstarted)
- [https://www2.coinmine.pl/dcr/index.php?page=gettingstarted](https://www2.coinmine.pl/dcr/index.php?page=gettingstarted)
- [https://pool.mn/dcr/index.php?page=gettingstarted](https://pool.mn/dcr/index.php?page=gettingstarted)

> 2 단계 : 기기 ID 확인 #

구성 파일을 설정하기 전에 gominer에서 식별 한대로 (특히 CPU 또는 IGP로 마이닝하지 않으려는 경우) 어떤 장치를 사용하고 싶은지 알아야합니다. 이렇게하려면 `gominer.exe` (`e.g. C:\decred\gominer\`), 의 위치에서 명령 프롬프트를 열고 `gominer.exe -l`, 을 입력 한 다음 Enter 키를 누릅니다. 함께 광산이 표시됩니다. 사용할 장치 ID를 기록하십시오. 힌트 : 비디오 카드가 코드 명으로 나열 될 수 있습니다.

> 3 단계 : 설정 파일 편집

 `sample-gominer.conf` 파일을여십시오. 변경하려는 각 설정에 대해 `=` 기호 다음의 설정 변수 앞에 세미콜론을 간단하게 삭제하십시오. 

'일반 설정'섹션에서:

- 2 단계에서 `gominer.exe -l` 명령을 사용하여 기록한 장치 ID 번호에 `devices =`    를 설정하십시오. 여러 장치는 쉼표로 구분해야합니다. `devices = 2,3`.

'마이닝 설정'섹션에서:

- 선택란의 채굴 풀의 stratum+tcp address:port에 `pool =` 을 설정하십시오. decredpool.org는 `stratum+tcp://stratum.decredpool.org:3333` (경고: http://address:port 는 gominer - stratum+tcp *must* 가 사용되어야합니다).
- 작업자의 로그인에 `pooluser=` 를 설정하십시오.
- `poolpass=` 를 당신의 작업자 암호로 설정하십시오.

이 변경 사항을 적용한 후 다른 이름으로 저장 또는 저장 + 파일 이름을 gominer.conf로 바꿉니다.

> 4 단계 : gominer.conf를 로컬 AppData 폴더에 복사

새 파일 탐색기에서 주소 표시 줄에 `%localappdata%\Gominer\` 를 입력하십시오. `gominer.conf` 를 원래 위치에서 복사하십시오. `e.g. C:\decred\gominer\`, 를 `%localappdata%\Gominer\` 에 저장합니다.

### gominer.exe 시작

 `gominer.exe` 와 `blake256.cl` 을 포함하는 디렉토리로 다시 이동하십시오. `e.g. C:\decred\gominer\`, 를 실행하고 `gominer.exe`. 를 실행하십시오. 모든 것이 올바르게 완료 되었다면, gominer는 설정 파일을 읽고, 풀에 연결하고, 지정된 장치로 해시를 시작해야합니다. 각 장치의 해시 비율 및 허용, 거부, 부실 및 제출 된 총 공유에 대한 통계를 비롯하여 스크롤 메시지가 표시됩니다.

연결 오류가있는 경우 `pool`, `pooluser` 또는 `poolpass` 가 잘못 구성되었을 수 있습니다.

gominer가 사용하고 싶지 않은 장치에서 해시를 시작하면 `devices` 설정이 잘못 구성되었을 수 있습니다.

위의 두 가지 문제가 모두 존재한다면 설정 파일의 이름이 틀리거나 ( `gominer.conf` 라고 부름) 잘못된 디렉토리에 위치 할 가능성이 있습니다 ( `%localappdata%\Gominer\` 에 있어야합니다).

### 귀하의 수영장 웹 사이트에 익숙해지기 

귀하의 고미너가 당신을 위해 숨을 거두었으므로, 당신은 수영장의 웹 사이트를 체크 아웃 할 시간이 있습니다. 대부분의 풀에는 웹 사이트에 대시 보드가있어 풀, 네트워크 및 현재 라운드 (풀에서 찾은 각 블록 사이의 경과 시간)에 대한 통계를 찾을 수 있습니다. 또한 충분한 지불금을 받으면 DCR 지불 주소를 설정하고 자동 지불 기준 액을 설정하거나 총 계정 잔액을 현금화하도록 선택하여 계정 편집 페이지에서 동전을 인출 할 수 있습니다.

### 유용한 힌트

*gominer 의 OpenCL 및 OpenCL ADL 버전의 경우* gominer는 500ms마다 실행되는 작업 알고리즘을 산출하는 WorkSize를 자동으로 계산합니다. `gominer.conf` 에서 Intensity / WorkSize 설정을 변경하면 알려진 문제가 발생할 것입니다. 알고리즘은 WorkSize가 낮아서 더 빠른 속도로 실행됩니다 (더 많은 공유가 생성되지 않음). 결과적으로 사용량이 증가합니다 때때로 10MB / 초 정도의 높은 메모리 이로 인해 결국 시스템이 RAM 공간을 모두 소모하여 자동으로 gominer를 종료하게됩니다. 이 설정을 그대로두고 gominer가 자신의 WorkSize를 계산할 수있게하는 것이 가장 좋습니다.
