# **<i class="fa fa-linux"></i> *gominer* Linux 풀 마이닝 사용자 가이드**

이 안내서는 구성 파일을 사용하여 선택한 채굴 풀이있는 gominer의 기본 초기 설정을위한 것입니다. 고급 옵션을 사용할 수 있습니다.

마지막 업데이트 : 2017 년 4 월 28 일.

---

### **<i class="fa fa-download"></i> 를 다운로드하고 압축을 풉니 다 *gominer* Binary**


>.tar.gz 파일 다운로드

최신 gominer Linux 바이너리를 다운로드하려면 [https://github.com/decred/decred-binaries/releases](https://github.com/decred/decred-binaries/releases) 를 방문하십시오. gominer의 64 비트 버전 만 사용할 수 있습니다. 최신 최신 릴리스는 다음과 같습니다:

- `gominer-linux-amd64-cuda-v1.0.0.tar.gz`,
- `gominer-linux-amd64-opencl-v1.0.0.tar.gz`,
- `gominer-linux-amd64-opencladl-v1.0.0.tar.gz`.

NVIDIA 그래픽 카드의 경우, `*-cuda-*.tar.gz` 파일을 다운로드하십시오. <br />
Radeon과 FirePro 라인의 AMD 그래픽 카드는 `*-opencladl-*.tar.gz` 파일을 다운로드하십시오. <br />
다른 그래픽 카드의 경우 `*-opencl-*.tar.gz` 파일을 다운로드하십시오.

커맨드 라인 애호가를 위해 다음은 v1.0.0에 대한 직접 링크입니다 :

```no-highlight
$ wget https://github.com/decred/decred-binaries/releases/download/v1.0.0_gominer/gominer-linux-amd64-cuda-v1.0.0.tar.gz
$ wget https://github.com/decred/decred-binaries/releases/download/v1.0.0_gominer/gominer-linux-amd64-opencl-v1.0.0.tar.gz
$ wget https://github.com/decred/decred-binaries/releases/download/v1.0.0_gominer/gominer-linux-amd64-opencladl-v1.0.0.tar.gz
```

>.tar.gz 파일의 압축을 풉니 다.

모든 파일을 추출하여 새 디렉토리에 복사하십시오. 이 튜토리얼에서는 `~/decred/` 를 작업 디렉토리로 사용합니다. 커맨드 라인에서 :

```no-highlight
$ tar -xzf gominer-linux-amd64-cuda-v1.0.0.tar.gz -C ~/decred/
```

tar 압축을 풀면 `gominer-linux-amd64-opencladl-v1.0.0`. 디렉토리가 생성됩니다. 이 디렉토리의 내용은 `blake256.cl`, `blake256-old.cl`, `gominer`, `LICENSE`, `README.md`, `sample-gominer.conf` 입니다.

FCUDA 버전의 경우 CUDA 런타임 라이브러리가 포함되었습니다. 이 버전의 파일에는 `libcudart.so.8.0` 과 `rungominer.sh` 도 포함됩니다. 이 스크립트는 사용자의 편의를 위해 포함 된 런타임 라이브러리로 gominer를 시작하는 데 사용됩니다. 그러나 CUDA 8을 지원하는 그래픽 카드 용 드라이버가 설치되어 있어야합니다. 더 오래된 운전사는 발사에 충돌하는 gominer를 일으키는 원인이 될 것이다.

### ** *gominer* 설정 파일 설정**

> 1 단계 : 채광 풀 선택

이 단계를 시작하기 전에 이미 마이닝 풀 계정에 가입해야합니다 (선택한 마이닝 풀에서 필요한 경우 풀 웹 사이트에서 작업자를 만들어야 함). 나중에 사용할 수 있도록 작업자의 로그인과 암호 및 풀의 계층 + TCP 주소 : 포트를 기록하십시오.

새로 구입 한 경우, Decred 마이닝 풀에서 근로자를 만들기위한 몇 가지 가이드가 있습니다 (경고 : 계정을 만들 때 설정 한 PIN을 잊지 마세요. 마이닝 된 DCR 없이는 철회 할 수 없습니다):

- [https://dcr.maxminers.net/index.php?page=gettingstarted](https://dcr.maxminers.net/index.php?page=gettingstarted)
- [https://dcr.suprnova.cc/index.php?page=gettingstarted](https://dcr.suprnova.cc/index.php?page=gettingstarted)
- [https://www2.coinmine.pl/dcr/index.php?page=gettingstarted](https://www2.coinmine.pl/dcr/index.php?page=gettingstarted)
- [https://pool.mn/dcr/index.php?page=gettingstarted](https://pool.mn/dcr/index.php?page=gettingstarted)

> Step 2: Verify Device ID#

구성 파일을 설정하기 전에, gominer가 식별 한대로 어떤 장치를 사용할지 알아야합니다. 이렇게하려면 터미널 창을 열고 위의 gominer를 설치 한 위치 (예 `~/decred/gominer-linux-amd64-cuda-v1.0.0`), 로 이동하고 `./gominer -l` 또는 `./rungominer.sh -l` CUDA 버전을 사용하는 경우 Enter 키를 누르면 내 장치 목록이 표시됩니다. 사용할 장치 ID를 기록하십시오. 힌트 : 비디오 카드가 코드 명으로 나열 될 수 있습니다.

> 3 단계 : 설정 파일 편집

선택한 텍스트 편집기로 `sample-gominer.conf` 파일을 엽니 다. 변경하려는 각 설정에 대해 `=` 기호 다음의 설정 변수 앞에 세미콜론을 간단하게 삭제하십시오. 

'일반 설정'섹션에서:

- 2 단계에서 `./gominer -l` 또는 `./rungominer.sh -l` 명령을 사용하여 기록한 장치 ID 번호에 `devices=` 를 설정하십시오. 여러 장치는 쉼표로 구분해야합니다. `devices=2,3`.

'마이닝 설정'섹션에서:

- 선택란의 채굴 풀의 stratum+tcp address : port에 `pool=` 을 설정하십시오. decredpool.org는 `stratum+tcp://stratum.decredpool.org:3333`     을 사용합니다 (경고: the http://address:port는  gominer - stratum+tcp *must* 가 사용되어야합니다).
- 작업자의 로그인에 `pooluser=` 를 설정하십시오.
- `poolpass=` 를 당신의 작업자 암호로 설정하십시오.

이러한 변경이 완료되면 파일을 저장하십시오. 이 파일의 복사본을 만들고 gominer config 디렉토리에있는 gominer.conf라고합니다:

```no-highlight
$ mkdir -p ~/.gominer
$ cp sample-gominer.conf ~/.gominer/gominer.conf
```

### **고미너 출시 gominer**

 `gominer` 와 `blake256.cl` 을 포함하는 디렉토리로 다시 이동하십시오. `e.g. ~/decred/gominer-linux-amd64-cuda-v1.0.0/`, 을 실행하고 `./gominer` 또는 `./rungominer.sh` 를 실행하십시오. 모든 것이 올바르게 완료 되었다면, gominer는 설정 파일을 읽고, 풀에 연결하고, 지정된 장치로 해시를 시작해야합니다. 각 장치의 해시 비율 및 허용, 거부, 부실 및 제출 된 총 공유에 대한 통계를 비롯하여 스크롤 메시지가 표시됩니다.

연결 오류가있는 경우 `pool`, `pooluser` 또는 `poolpass` 가 잘못 구성되었을 수 있습니다.

gominer가 사용하고 싶지 않은 장치에서 해시를 시작하면 `devices` 설정이 잘못 구성되었을 수 있습니다.

위의 두 가지 문제가 모두 존재한다면, 설정 파일의 이름이 틀리거나 ( `gominer.conf` 라는 이름이어야합니다) 잘못된 디렉토리에 위치 할 것입니다 ( `~/.gominer/` 에 있어야합니다).

### **수영장 웹 사이트에 익숙해지기**

귀하의 고미너가 당신을 위해 숨을 거두었으므로, 당신은 수영장의 웹 사이트를 체크 아웃 할 시간이 있습니다. 대부분의 풀에는 웹 사이트에 대시 보드가있어 풀, 네트워크 및 현재 라운드 (풀에서 찾은 각 블록 사이의 경과 시간)에 대한 통계를 찾을 수 있습니다. 또한 충분한 지불금을 받으면 DCR 지불 주소를 설정하고 자동 지불 기준 액을 설정하거나 총 계정 잔액을 현금화하도록 선택하여 계정 편집 페이지에서 동전을 인출 할 수 있습니다.

### **유용한 힌트들**

*gominer 의 OpenCL 및 OpenCL ADL 버전의 경우* gominer는 500ms마다 실행되는 작업 알고리즘을 산출하는 WorkSize를 자동으로 계산합니다. `gominer.conf` 에서 Intensity / WorkSize 설정을 변경하면 알려진 문제가 발생할 것입니다. 알고리즘은 WorkSize가 낮아서 더 빠른 속도로 실행됩니다 (더 많은 공유가 생성되지 않음). 결과적으로 사용량이 증가합니다 때때로 10MB / 초 정도의 높은 메모리 이로 인해 결국 시스템이 RAM 공간을 모두 소모하여 자동으로 gominer를 종료하게됩니다. 이 설정을 그대로두고 gominer가 자신의 WorkSize를 계산할 수있게하는 것이 가장 좋습니다.
