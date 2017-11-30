# <i class="fa fa-desktop"></i> 구성 

---

#### 1. `dcrd` 가 사용하는 포트 번호에 대한 정보를 어떻게 볼 수 있습니까?

`-h` 또는 `--help` 매개 변수에서 `dcrd` 에 전달 된 포트 번호[^8929] 를 얻을 수 있습니다 :

```no-highlight
dcrd -h
```

다음 행을 찾으십시오:

```no-highlight
--rpclisten=  Add an interface/port to listen for RPC connections (default port: 9109, testnet: 19109)
```

또한 `dcrd` 를 시작할 때 기록됩니다 :

```no-highlight
12:01:46 2016-02-08 [INF] RPCS: RPC server listening on [::1]:9109
12:01:46 2016-02-08 [INF] RPCS: RPC server listening on 127.0.0.1:9109
```

---

#### 2. `dcrd`, `dcrwallet`, `dcrctl` 에 대한 설정 파일은 무엇을 의미합니까?

각 응용 프로그램 (`dcrd`, `dcrwallet`, `dcrctl`) 은 자신의 설정 파일을 가질 수 있습니다[^9055]. 기본 경로를 보려면 `-h` 를 사용하고 설정 파일 옵션 (`-C`, `--configfile`) 의 괄호 안에있는 경로를보십시오. 경로에서 텍스트 파일을 만들고 방금 조회 한 경로에 따라 이름을 지정합니다.

그런 다음 `dcrd` [sample config file](https://github.com/decred/dcrd/blob/master/sample-dcrd.conf) 과 `dcrwallet` [sample config file](https://github.com/decred/dcrwallet/blob/master/sample-dcrwallet.conf) 원하는 옵션을 설정하십시오 `dcrctl`. 도 똑같이 할 수 있습니다. 형식은 동일합니다 `-h` 로 나열된 모든 명령 행 옵션은 설정 파일에 지정할 수 있습니다 (긴 옵션 이름 만 사용하십시오).

일단 이들이 만들어지고 제자리에있게되면 모든 옵션을 항상 명령 줄에 추가 할 필요가 없습니다. 예를 들어, 명령 행에서 매개 변수를 전달하지 않고 `dcrctl` 을 실행할 수 있습니다 :

```no-highlight
dcrctl getnetworkhashps
2547036949350
```

---

#### 3. 메인 트넷과 testnet 데몬과 지갑을 동시에 같은 머신에서 실행할 수 있습니까? 

예[^9264], 적절한 위치 `--testnet` 에 (`dcrd`, `dcrwallet`, `dcrctl`)를 추가하면 모든 것이 잘될 것입니다. 이것이 다른 포트와 데이터 / 로그 디렉토리를 사용하는 이유입니다!

---

#### 4.`dcrd` 와 `dcrwallet` 에서 동일한 RPC 서버 인증 암호를 사용했을 때의 보안 함의는 무엇입니까? 

 `dcrd` 에 접근하는 것보다 `dcrwallet`. 에 접근하는 것보다 훨씬 적게 할 수 있습니다. 중요한 것은 지갑을 열지 않은 상태에서 `dcrwallet`,에 대한 RPC 액세스[^11480]를 사용하여 동전을 보낼 수 있다는 것입니다.

 `dcrd` 와 `dcrwallet` 이 같은 머신 상에 존재할 때, 그다지 중요하지는 않지만, 지갑이 `dcrd`, 가 아닌 별도의 머신 상에있는보다 안전한 설정을 실행하면 꽤 명확하지 않을 것입니다 두 가지 모두에 대해 동일한 자격 증명을 사용하려고합니다. `dcrd` 는 네트워크에 동기화 (블록 체인 데이터, 브로드 캐스트 트랜잭션 다운로드 등)하기 위해 인터넷 연결 시스템에 있어야한다는 것을 기억하십시오.

다른 한편으로, 최상의 보안을 위해 귀하의 자금을 담고있는 `dcrwallet` 은 인터넷 액세스가 가능한 시스템에 있지 않아야합니다. 동전이 들어있는 지갑이 딱 들어 맞지 않으면 동전을 훔치는 것이 훨씬 어렵습니다. 인터넷을 통해 액세스 할 수있는 컴퓨터에서. 분명히, 당신이 동전을 걸고 있다면 적어도 하나의 인터넷에 접한 `dcrwallet` 인스턴스가 필요합니다. 따라서 가장 안전한 설정은 인터넷에 액세스 할 수없는 컴퓨터에있는 하나의 "콜드" `dcrwallet` 인스턴스와 콜드 (예 : 다른 시드를 사용하는)의 두 번째 "핫" `dcrwallet` 인스턴스를 포함합니다. dcrwallet 인스턴스는 `--ticketaddress` 매개 변수를 통해 투표 권한을 위임합니다. 둘 다 다른 자격 증명을 사용합니다.

---

#### 5. 아웃 바운드 동료 8 명만 연결하는 이유는 무엇입니까? 

8 개의 아웃 바운드 피어에 대해 의도적 인 구성 할 수없는 제한이 있습니다[^15399]. 그것보다 더 많은 아웃 바운드 피어는 어떤 식 으로든 당신을 도울 수 없으며 실제로 당신과 네트워크 모두에있어서 더 나쁘다. 이것은 btcsuite (Decred의 업스트림 프로젝트)를 포함하여 Bitcoin에서 매우 철저하게 테스트되었습니다. 아웃 바운드 커넥션을 올리면 할 수있는 일은 상대적으로 적은 수의 공개 키를 낭비하는 것입니다 (시드하는 사람보다 항상 "leechers"가 훨씬 많습니다).

반면에 최대 연결 수를 늘리면 허용 된 인바운드 연결 수가 증가하므로 새 노드 및 SPV 클라이언트에 사용할 수있는 슬롯이 더 많아 지므로 네트워크에 도움이됩니다.

---

## <i class="fa fa-book"></i> 소스 

[^8929]: Decred Forum, [Post 8,929](https://forum.decred.org/threads/600/#post-8929)
[^9055]: Decred Forum, [Post 9,062](https://forum.decred.org/threads/472/page-12#post-9062)
[^9264]: Decred Forum, [Post 9,264](https://forum.decred.org/threads/626/#post-9264)
[^11480]: Decred Forum, [Post 11,480](https://forum.decred.org/threads/428/#post-11480)
[^15399]: Decred Forum, [Post 15,399](https://forum.decred.org/threads/1371/page-2#post-15399)
