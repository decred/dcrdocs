# <i class="fa fa-linux"></i> Linux 사용자 안내서

---

## <i class="fa fa-download"></i> cgminer를 다운로드하고 압축을 풉니 다.

최신 cgminer 릴리스를 찾으려면 https://github.com/decred/cgminer/releases 를 방문하십시오. 터미널을 통해 파일을 다운로드하고 압축을 풀려면 다음 명령을 실행하십시오. 이 예제는 cgminer v0.0.4를 다운로드합니다.

```no-highlight
~/Decred/$ wget "https://github.com/decred/decred-release/releases/download/v0.0.4_cgminer/cgminer-decred-linux-x86_64-20160208.tar.gz"
~/Decred/$ tar -xvf cgminer*
```

새로운 cgminer 디렉토리로 이동하십시오:

```
~/Decred/$ cd cgminer*
```

## <i class="fa fa-play-circle"></i> cgminer 초기화 및 실행 

> 1 단계

마이닝 가능 하드웨어를 나열하려면 터미널 창에 다음을 입력하십시오:

```no-highlight
~/Decred/$ ./cgminer -n
```

비디오 카드가 GPU 코드 명 또는 드라이버 이름으로 나열되어야합니다. 출력의 마지막 줄에는 현재 사용할 수있는 호환 GPU 수가 표시됩니다.

> 2 단계 (선택 사항)

시스템을 벤치마킹하고 GPU가 사용할 수있는 해시 레이트를 찾으려면 다음 명령을 사용하십시오:

```no-highlight
~/Decred/$ ./cgminer --blake256 --benchmark
```

> 3 단계

수영장 웹 사이트 중 하나에 등록하고 각 광산 컴퓨터에 새로운 광부를 설치하십시오. 필요한 경우 지시 사항은 원하는 풀 웹 사이트를 참조하십시오. 1 단계의 터미널 창에서 다음 명령을 입력하여 cgminer를 시작하십시오 (대괄호는 무시하십시오):

```no-highlight
~/Decred/$ ./cgminer --blake256 -o <pool url>:<port number> -u <web login>.<worker name> -p <worker password>
```

예:

```no-highlight
~/Decred/$ ./cgminer --blake256 -o http://dcr.maxminers.net:7727 -u DecredMiner.miner1 -p 7@!x5L1
```

> 4 단계

cgminer가 시작됩니다. `S` (설정), `W` (설정 파일 작성), `Enter` (설정 파일을 `cgminer.conf` 로 저장) 키를 눌러 cgminer 설정 파일을 만드십시오. `cgminer.conf` 는 `cgminer` 와 같은 디렉토리에 있습니다. 설정 파일에 다른 풀을 추가하려면, Gedit (GUI) / Pico (CLI) 또는 유사한 텍스트 편집기로 `cgminer.conf` 를여십시오. 구성 파일의 "풀"섹션에서이 구문을 따르면 여러 풀을 추가 할 수 있습니다 (각 개별 풀 항목 사이의 쉼표에 유의하십시오):

```no-highlight
"pools" : [
   {
      "url" : "http://dcr.maxminers.net:7727",
      "user" : "Login.Worker",
      "pass" : "password"
   },
   {
      "url" : "http://dcr.suprnova.cc:9110",
      "user" : "Login.Worker",
      "pass" : "password"
   }
]
```

> 5 단계

 `cgminer.conf` 를 저장하고 `cgminer` 를 닫으십시오. 다음 명령을 사용하여 cgminer를 다시 실행하십시오:

```no-highlight
~/Decred/$ ./cgminer
```

이것으로 기본 cgminer 풀 설정 안내서를 마칩니다. cgminer 사용법 및 프로그램 기능에 대한 자세한 설명은 공식 [cgminer README](https://github.com/decred/cgminer/blob/3.7/README)을 참조하십시오.
