# <i class="fa fa-windows"></i> Windows 사용자 가이드

---

## <i class="fa fa-cloud"></i> dcrd를 Decred 네트워크에 연결

> 1 단계

모든 `dcrd`, `dcrwallet`, 및 `dcrctl`  명령은 Decred 파일이있는 디렉토리에서 실행되어야합니다! `dcrd` 를 시작하십시오 :

```no-highlight
C:\Decred> dcrd -u <username> -P <password>
```

dcrwallet 시작 :

```no-highlight
C:\Decred> dcrwallet -u <username> -P <password>
```

> 2 단계

새 지갑 주소 생성 :

```no-highlight
C:\Decred> dcrctl -u <username> -P <password> --wallet getnewaddress
```

새 주소를 복사하십시오 (마지막 명령의 출력). 각 창에서 `ctrl+c` 를 눌러 `dcrd` 와 `dcrwallet`  을 닫거나 멈 춥니 다.

> 3 단계

다음 명령을 사용하여 `dcrd` 를 다시 시작하십시오 :

```no-highlight
C:\Decred> dcrd --miningaddr <new address from step two or your web client wallet address>
```

---

## <i class="fa fa-download"></i> cgminer를 다운로드하고 압축을 풉니 다.

최신 cgminer 릴리스를 찾으려면 https://github.com/decred/cgminer/releases 를 방문하십시오. 64 비트 Windows의 경우 `cgminer-decred-w64_*.zip`. 을 다운로드하여 압축 해제하십시오. 32 비트 Windows의 경우 `cgminer-decred-w32_*.zip`. 을 다운로드하고 압축 해제하십시오. 모든 파일을 새 폴더에 추출하고 새 폴더를 열어 파일을 봅니다.

---

## <i class="fa fa-play-circle"></i> cgminer 초기화 및 실행

> 1 단계

 `start_local.bat` 을 오른쪽 클릭하고 `Edit`. 을 클릭하십시오. 1 단계에서 사용한 자격 증명과 일치하도록 사용자 이름과 암호를 변경하십시오. start_local.bat 저장 및 닫기 참조를 위해 start_local.bat의 명령은 다음과 같습니다:

```no-highlight
C:\Decred> cgminer --blake256 -o https://127.0.0.1:9109 -u <username> -p <password> --cert "%LOCALAPPDATA%\Dcrd\rpc.cert"
```

> 2 단계

dcrd가 블록 체인과의 동기화를 완료하지 않은 경우 dcrd가 완료 될 때까지 기다린 후 다음 단계로 진행합니다. 끝나면 다음과 같이 표시됩니다:

```no-highlight
[INF] BMGR: Processed 1 block in the last 5m34.49s
```

> 3 단계

`start_local.bat`을 더블 클릭하십시오. `cgminer`가 열립니다. `S` (설정),`W` (설정 파일 작성),`Enter` (설정 파일을`cgminer.conf`로 저장) 키를 눌러서`cgminer` 설정 파일을 만드십시오. `cgminer.conf`는 cgminer와 동일한 디렉토리에 있습니다. cgminer는 이제`cgminer.exe '를 두 번 클릭하면 시작할 수 있습니다. 이것으로 솔로 cgminer 기본 설정 가이드를 마칩니다. cgminer 사용법 및 프로그램 기능에 대한 자세한 설명은 공식 [cgminer README](https://github.com/decred/cgminer/blob/3.7/README).
