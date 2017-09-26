# <i class="fa fa-linux"></i> Linux 사용자 안내서 

---

## <i class="fa fa-cloud"></i> dcrd를 Decred 네트워크에 연결

> 1 단계

모든`dcrd`,`dcrwallet` 및`dcrctl` 명령은 Decred 파일이있는 디렉토리에서 실행되어야합니다! `dcrd`를 시작하십시오 :

```no-highlight
~/Decred/$ ./dcrd -u <username> -P <password>
```

dcrwallet 시작 :

```no-highlight
~/Decred/$ ./dcrwallet -u <username> -P <password>
```

> 2 단계

새 지갑 주소 생성 :

```no-highlight
~/Decred/$ ./dcrctl -u <username> -P <password> --wallet getnewaddress default
```

새 주소를 복사하십시오 (마지막 명령의 출력). 각 창에서`ctrl+c'를 눌러`dcrd`와`dcrwallet`을 닫거나 멈 춥니 다.

> 3 단계

다음 명령을 사용하여`dcrd`를 다시 시작하십시오 :

```no-highlight
~/Decred/$ ./dcrd -u <username> -P <password> --miningaddr <new address from step two or your web client wallet address>
```

> 4 단계

rpc.cert를 / usr / share / ca-certificates에 복사하여 TLS 보안 설정 :

```no-highlight
sudo cp /home/<username>/.dcrd/rpc.cert /usr/share/ca-certificates/dcrd.crt
```

텍스트 편집기를 사용하여 "dcrd.crt"(따옴표 제외) 행을 /etc/ca-certificates.conf에 추가하십시오:

```no-highlight
sudo gedit /etc/ca-certificates.conf
```

CA 인증서 목록 업데이트 :

```no-highlight
sudo update-ca-certificates
```

---

## <i class="fa fa-download"></i> cgminer를 다운로드하고 압축을 풉니 다.

최신 cgminer 릴리스를 찾으려면 https://github.com/decred/cgminer/releases 를 방문하십시오. Linux 터미널을 통해 다운로드하고 추출하려면 다음 명령을 사용하십시오:

```no-highlight
wget https://github.com/decred/decred-release/releases/download/v0.0.4_cgminer/cgminer-decred-linux-x86_64-20160208.tar.gz
tar -xvf cgminer-decred-linux-x86_64-20160208.tar.gz
```

---

## <i class="fa fa-play-circle"></i> cgminer 초기화 및 실행

> 1 단계

`dcrd`가 블록 체인과의 동기화가 끝나지 않았으면, 블록 체인이 끝날 때까지 기다렸다가 다음 단계로 진행하십시오. 끝나면 다음과 같이 표시됩니다:

```no-highlight
[INF] BMGR: Processed 1 block in the last 5m34.49s
```

> 2 단계

cgminer 디렉토리에서 다음 명령으로 cgminer를 시작하십시오:

```no-highlight
~/Decred/$ ./cgminer --blake256 -o https://127.0.0.1:9109 -u <username> -p <password>
```

`S` (설정), `W` (설정 파일 작성), `Enter` (설정 파일을 `cgminer.conf` 로 저장) 키를 눌러 cgminer 설정 파일을 만드십시오. `cgminer.conf` 는 cgminer와 동일한 디렉토리에 있습니다. 이제 cgminer는 다음 명령을 실행하여 시작할 수 있습니다:

```no-highlight
~/Decred/$ ./cgminer
```

이것으로 솔로 cgminer 기본 설정 가이드를 마칩니다. cgminer 사용법 및 프로그램 기능에 대한 자세한 설명은 공식 [cgminer README](https://github.com/decred/cgminer/blob/3.7/README).
