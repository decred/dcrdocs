# Simnet 

---

## 개요 

Decred 애플리케이션을 개발하거나 잠재적인 변화를 테스트 할 때 필요한 만큼만 블록을 만들수 있도록 쉬운 테스트 네트워크를 갖는 것이 매우 유용합니다.

이러한 시나리오를 용이하게하기 위해 dcrd는 시뮬레이션 네트워크 (`--simnet`).  를 제공합니다. 다음은 주 네트워크와 구별되는 가장 중요한 속성에 대한 개요입니다.

* 블록의 CPU 마이닝을 빠르게하기 위해 난이도가 매우 낮게 시작됩니다.
* 네트워킹 변경 :
    * All code related to peer discovery and IP address dissemination is disabled to help ensure the network remains private
    * 피어 및 RPC 네트워크 포트가 다릅니다.
    * 고유 한 네트워크 바이트 시퀀스가 ​​피어 투 피어 메시지 프로토콜에 사용되므로 블록이 실수로 주 네트워크와 교차 될 수 없습니다
* 모든 체인 및 지불 주소 매개 변수는 주 네트워크와 혼동하지 않도록 고유합니다:
    * 다른 생성 블록
    * P지불 주소는 다른 접두사로 시작됩니다.
        * 표준 지불 대 pubkeyhash (P2PKH) 대문자 `S` 로 시작
        * 표준 pay-to-scripthash (P2SH)는 소문자 `s` 로 시작합니다.
    * 내 보낸 계층 적 결정 론적 확장 키 (BIP32)는 서로 다른 접두사로 시작합니다.
        * 공개 확장 키는 `spub` 로 시작합니다.
        * 개인 확장 키는 `sprv` 로 시작합니다.
    * HD 키 경로에 사용되는 BIP44 동전 유형은 소문자 `s` 입니다.

  ---

## 시작하기 

simnet에서 하나의 `dcrd` 노드를 돌리는 것은 단순히 `dcrd` 플래그로 `--simnet` 를 시작하는 것입니다. 그러나 실제로 유용하기 위해서는 일반적으로 주소 사이에 동전을 보낼 수 있어야합니다. 이는 블록을 채굴해야하고 지갑과 연결되어야 함을 의미합니다.

또한 새로운 사설망에는 아직 동전이 없기 때문에 소유 할 주소로 지불하는 초기 일련의 블록을 채굴해야 사용할 동전을 사용할 수 있습니다.

앞에서 언급했듯이, simnet은 고유 한 주소를 사용하여 주 네트워크와의 혼동을 방지합니다. 따라서 주소 형식을 지원하는 지갑을 사용해야 함을 나타냅니다. 이를 위해 `dcrwallet` 플래그가있는 `--simnet` 을 사용할 수 있습니다.

다음은 시작하기위한 명령 참조입니다.

**참고: 이 모든 명령은 설정 파일을 만들고 사용하는 것으로 단순화 할 수 있습니다. 그러나 여기의 명령은 명령 줄의 모든 스위치를 사용하여 각각에 필요한 것을 정확하게 보여줍니다.**

* simnet에서 dcrd 시작 :

    `$ dcrd --simnet --rpcuser=<username> --rpcpass=<password>`

* 새로운 simnet wallet 생성 :

    `$ dcrwallet --simnet --create`

* simnet에서 dcrwallet을 시작하십시오.

    `$ dcrwallet --simnet --username=<username> --password=<password>`

* 새로운 simnet 만들기 Decred address :

    `$ dcrctl --simnet --wallet --rpcuser=<username> --rpcpass=<password> getnewaddress`

* 초기 dcrd 프로세스를 중지하고 이전 명령의 출력으로 설정된 마이닝 주소로 다시 시작하십시오:

    `$ dcrd --simnet --rpcuser=<username> --rpcpass=<password> --miningaddr=<S....>`

* dcrd에게 첫 번째 코인베이스가 성숙하기에 충분한 초기 블록을 생성하도록 지시합니다:

    `$ dcrctl --simnet --rpcuser=<username> --rpcpass=<password> generate 100`

* 지갑 잔고를 확인하여 동전을 사용할 수 있는지 확인하십시오:

    `$ dcrctl --simnet --wallet --rpcuser=<username> --rpcpass=<password> getbalance`
  
이 시점에서 다른 simnet 주소로 보낼 수있는 동전이있는 완전한 기능의 개인 simnet이 있습니다. 하나 이상의 트랜잭션이 전송 될 때마다 트랜잭션을 포함하는 새 블록을 채우기 위해 `generate 1` RPC를 발행해야합니다.
