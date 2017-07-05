# Testnet 가이드 사용하기

마지막으로 testnet2에 업데이트 됨

---

## 왜 Testnet을 사용합니까?

testnet은 실수로 실제 돈이 들지 않을 것을 염려하지 않고 Decred 응용 프로그램을 실험 할 수있는 멋진 장소입니다. 사실 Decred 소프트웨어의 기본 사항과 새로운 기능을 배우기 위해 testnet을 사용하는 것이 좋습니다.

Decred는 현재 testnet2라고도 알려진 두 번째 Testnet에 있습니다. 테스트 넷은 주기적으로 재설정되어 관리 가능한 블록 체인 파일 크기를 유지합니다.

---

## Testnet 노드를 실행하는 방법

testnet2 노드를 실행하는 것은 매우 쉽습니다. 선택한 응용 프로그램은 testnet2 블록 체인을 다운로드해야하며 testnet2 사용을 위해 새 Wallet 파일을 만들어야합니다. 메인넷 블록 체인 및 지갑 파일은 그대로 유지됩니다. 둘 사이를 전환하는 것은 매우 쉽습니다.

---

## Paymetheus

testnet2에서 `Paymetheus` 를 시작하려면, `Decred Testnet` 응용 프로그램 대신 `Decred` 응용 프로그램을 실행하기 만하면됩니다. 그런 다음 지갑 생성을 통해 걸어 나갈 것입니다 [Paymetheus 설치 가이드](/getting-started/user-guides/paymetheus.md))의 동일한 단계). `dcrd` 가 백그라운드에서 동기화를 마친 후에는 testnet DCR로 `Paymetheus` 지갑을 채우고 소프트웨어에 익숙해 질 수 있습니다.

---

## Decrediton 

testnet2에서 `Decrediton` 을 시작하려면 `--testnet` 플래그로 명령 행에서 `Decrediton` 을 실행해야합니다. 일단 플래그를 사용하면 `--mainnet` 플래그를 사용하여 메인 넷 블록 체인으로 다시 전환 할 때까지 항상 그 모드에서 시작하게됩니다.

Linux의 경우,

1. 터미널을 열고 decrediton 실행 파일을 사용하여 디렉토리를 찾습니다.
2. `./decrediton --testnet` 명령을 실행하십시오.
3. Decrediton이 실행되어 testnet2에 연결을 시도합니다.

macOS / OSX의 경우,

1. 터미널을 열고 다음 명령을 실행하십시오 : `/Applications/decrediton.app/Contents/MacOS/decrediton --testnet`
2. Decrediton이 실행되어 testnet2에 연결을 시도합니다.

Decrediton을 mainnet으로 되돌리려면, `--mainnet` 플래그로 명령을 실행해야한다는 것을 기억하십시오.

___ 

## Command-Line Suite

testnet에서 `dcrd` 와 `dcrwallet` 을 시작하기 위해서, 당신의 시작 명령에 `--testnet` 플래그를 추가하면됩니다. 또는, 모든 설정 파일에 `testnet=1` 을 넣을 수도 있지만, 일반적으로 시작 플래그를 사용하는 것이 훨씬 빠릅니다.

 `dcrd --testnet` 의 첫 번째 실행에서 `dcrd` 는 testnet2 블록 체인을 `dcrd` 의 홈 디렉토리의 `data/testnet2` 폴더로 다운로드하기 시작할 것입니다.

 `--testnet` 플래그로 `dcrwallet` 을 시작하기 전에 `dcrwallet --testnet --create` 명령을 사용하여 별도의 testnet wallet을 생성해야합니다. 이 단계는 [dcrwallet 설치 안내서](/getting-started/user-guides/dcrwallet-setup.md). 

 `dcrwallet` 과 `dcrd` 모두에 명령을 내려면 사용하는 `dcrctl` commands `--testnet` 플래그를 추가해야합니다. 예 : `dcrctl --testnet --wallet getbalance` 명령을 실행하여 testnet 잔액을 확인하십시오. 

---

## Testnet 동전 획득

[Decred Testnet Faucet](https://faucet.decred.org). 을 통해 동전을 획득 할 수 있습니다. testnet을 가지고 노는 것을 끝내면 그 페이지 하단에 표시된 주소로 동전을 반환하십시오.

---

