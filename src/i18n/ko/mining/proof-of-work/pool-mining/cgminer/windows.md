# <i class="fa fa-windows"></i> Windows 사용자 가이드

---

## <i class="fa fa-download"></i> cgminer를 다운로드하고 압축을 풉니다.

최신 cgminer 릴리스를 찾으려면 https://github.com/decred/cgminer/를 방문하십시오. 64 비트 Windows의 경우, `cgminer-decred-w64_*.zip` 을 다운로드하여 압축 해제하십시오. 32 비트 Windows의 경우, `cgminer-decred-w32_*.zip` 을 다운로드하고 압축 해제하십시오. 모든 파일을 새 폴더에 추출하고 새 폴더를 열어 파일을 봅니다.

## <i class="fa fa-play-circle"></i> cgminer 초기화 및 실행 

> 1 단계

새로운 cgminer 파일을 가지고있는 파일 탐색기 상단의 주소창에 `cmd` 를 입력하고 `Enter` 키를 눌러 명령 프롬프트 창을여십시오. 마이닝 가능한 하드웨어를 나열하려면 명령 프롬프트 창에 다음을 입력하십시오:

```no-highlight
C:\Decred> cgminer -n
```

비디오 카드가 GPU 코드 명 또는 드라이버 이름으로 나열되어야합니다. 출력의 마지막 줄에는 현재 사용할 수있는 호환 GPU 수가 표시됩니다.

> 2 단계 (선택 사항)

시스템을 벤치마킹하고 수행 할 수있는 해쉬 레이트를 찾으려면 다음 명령을 사용하십시오:

```no-highlight
C:\Decred> cgminer --blake256 --benchmark
```

> 3 단계

수영장 웹 사이트 중 하나에 등록하고 각 광산 컴퓨터에 새로운 광부를 설치하십시오. 필요한 경우 지시 사항은 원하는 풀 웹 사이트를 참조하십시오. 1 단계의 명령 줄 창에서 다음 명령을 입력하여 cgminer를 시작합니다 (대괄호 무시):

```no-highlight
C:\Decred> cgminer --blake256 -o <pool url>:<port number> -u <web login>.<worker name> -p <worker password>
```

예:

```no-highlight
C:\Decred> cgminer --blake256 -o http://dcr.maxminers.net:7727 -u DecredMiner.miner1 -p 7@!x5L1
```

> 4 단계

cgminer가 시작됩니다: `S` (설정), `W` (설정 파일 작성), `Enter` (설정 파일을 `cgminer.conf` 로 저장) 키를 눌러 cgminer 설정 파일을 만드십시오. `cgminer.conf` 는 `cgminer.exe` 와 같은 디렉토리에 있습니다. 설정 파일에 다른 풀을 추가하려면, 메모장 같은 텍스트 에디터로 `cgminer.conf` 파일을여십시오. 구성 파일의 "풀"섹션에서 변경하려면 다음 구문을 사용하십시오 (각 개별 풀 항목 사이의 쉼표에 유의하십시오):

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

 `cgminer.conf` 를 저장하고 `cgminer.exe` 를 닫으십시오. cgminer 프로그램을 두 번 클릭하면 새로 생성 된 구성 파일이 시작되고로드됩니다. 이것으로 기본 cgminer 풀 설정 안내서를 마칩니다. cgminer 사용법 및 프로그램 기능에 대한 자세한 설명은 [cgminer README](https://github.com/decred/cgminer/blob/3.7/README)를 참조하십시오.
