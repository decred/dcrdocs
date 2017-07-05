# dcrctl 기본 사항 

v1.0.0에서 마지막으로 업데이트되었습니다.

이 안내서는 [최소 설정 파일](/advanced/manual-cli-install.md#minimum-configuration) 을 사용하여 `dcrctl` 응용 프로그램의 기본 명령을 배우는 것을 돕기위한 것입니다. 

**선수 과목:**

- 최신 [dcrinstall](/getting-started/user-guides/cli-installation.md) 을 사용하여 `dcrctl` 을 설치하십시오. 다른 설치 방법을 사용하면 추가 단계가 필요합니다.
- 명령 프롬프트 (Windows) 및 Bash (OSX / Linux) 셸의 시작 명령이 [여기](/getting-started/cli-differences.md).
- [Setup dcrd](/getting-started/user-guides/dcrd-setup.md) 를 실행하고 백그라운드에서 실행하십시오.
- [Setup dcrwallet](/getting-started/user-guides/dcrwallet-setup.md) 을 백그라운드에서 실행하십시오.

---

`dcrctl` 은 원격 프로 시저 호출 (RPC)을 통해 `dcrd` 와 `dcrwallet` 을 제어하는 ​​클라이언트입니다. 잔액 확인, 티켓 구매, 트랜잭션 생성, 네트워크 정보보기와 같은 많은 일에 `dcrctl` 을 사용할 수 있습니다.

**REMINDER:** 이 가이드는 명령에 대해 OS에 영향을받지 않는 예제를 사용합니다. `./dcrctl` 대신 `dcrctl.exe` 또는 `dcrctl` 를 사용해야하는지 결정하기위한 전제 조건을 검토하십시오.

---

> RPC 사용자 이름 및 암호 구성

`dcrd` 또는 `dcrwallet` 명령은 RPC 사용자 이름 / 암호를 설정 파일에 설정해야합니다.

[`dcrinstall`](/getting-started/user-guides/cli-installation.md), 을 사용했다면 설정 파일은 `dcrd`, `dcrwallet`, `dcrctl` 에 대한 RPC 사용자 이름 / 암호로 이미 설정되어 있습니다 .

`dcrinstall` 을 사용하지 않았다면, 설정 파일에서 최소한의 설정 만 가능하게해야합니다. 이렇게하려면 [this guide](/advanced/manual-cli-install.md#minimum-configuration) 을 따르십시오.

---

## dcrctl 명령

별도의 쉘 창 (명령 프롬프트 / bash)에서 dcrctl 명령을 실행해야합니다.

`dcrwallet` 에게 명령을 내리려면 `dcrctl --wallet <command>` 를 사용해야합니다.

`dcrd` 에 명령을 내리려면 `dcrctl <command>` 를 사용해야합니다.

`dcrctl` 가 `dcrd` 와 `dcrwallet` 에 보낼 수있는 명령의 전체 목록을 보려면 쉘에서 다음 명령을 실행하십시오 :

```no-highlight
dcrctl -l
```

이렇게하면 응용 프로그램별로 구분 된 매우 긴 명령 목록이 반환됩니다. 맨 위 섹션의 명령은 `dcrd` 를위한 명령이고, 맨 아래 섹션의 명령은 `dcrwallet` 을위한 명령입니다. `dcrwallet` 명령에 대해 다음을 입력하여 개별 명령에 대해 자세히 알 수 있습니다.

```no-highlight
dcrctl help --wallet <command>
```

`dcrd` 명령에 대해서는 다음을 사용하십시오 :

```no-highlight
dcrctl help <command>
```

---

## 지갑 잠금 해제

`dcrwallet` 의 일부 기능은 지갑의 잠금을 해제해야합니다.

지갑을 잠금 해제하라는 명령은 다음과 같습니다: 

```no-highlight
dcrctl --wallet walletpassphrase <private passphrase set during wallet creation> 0
```

여기서 `dcrctl` 이 `--wallet` 플래그를 사용하여 `dcrwallet` 에 명령을 보내도록 지정합니다. 실제 명령어는 `walletpassphrase` 입니다.이 매개 변수는 사설 패스 프레이즈와 시간 제한을가집니다. 시간 제한을 위해 '0'을 지정하면 시간 제한없이 `dcrwallet` 의 잠금이 해제됩니다. 그러나 현재 세션의 지갑 만 잠금 해제됩니다. 지갑을 실행중인 창을 닫거나 `dcrwallet` 을 중지 / 재시작하면 다음에 시작할 때 다시 잠금을 해제해야합니다.

명령이 성공하면 `dcrctl` 에서 확인을 얻지 못하지만 `dcrwallet` 세션을 보면 다음과 같이됩니다 :

```no-highlight
[INF] RPCS: The wallet has been unlocked without a time limit.
```

참고: `dcrwallet` 의 많은 기능을 위해서는 지갑 잠금 해제가 필요하기 때문에 `dcrwallet` c은 `--promptpass` 플래그로 시작하거나 `dcrwallet.conf` 에서 `promptpass=true` 를 설정할 수 있습니다 (discussed [여기](/advanced/storing-login-details.md#dcrwalletconf)).

---

## 잔액 확인하기

`dcrctl` 을 사용하여 `dcrwallet` 에 `getbalance` 명령을 보내려면 쉘에 다음을 입력하십시오 :

```no-highlight
dcrctl --wallet getbalance
```

그러면 모든 계정의 잔액이 모두 반환됩니다.

---

## 새로운 수신 주소 받기

`dcrctl` 을 사용하여 `getnewaddress` 명령을 `dcrwallet` 에 보내려면 쉘에 다음을 입력하십시오 :

```no-highlight
dcrctl --wallet getnewaddress
```

이렇게하면 새 수취인 주소가 생성되어 반환됩니다. 주소 재사용을 최소화하려면이 명령을 사용하여 수신하려는 각 트랜잭션에 대해 새 주소를 얻으십시오.

---

## DCR 보내기

DCR을 주소로 보내려면 `dcrctl` 을 사용하여 `sendtoaddress` 명령을 `dcrwallet `에 실행하십시오. 쉘에 다음을 입력하여 수신 주소와 보낼 금액을 입력하십시오:

```no-highlight
dcrctl --wallet sendtoaddress <address> <amount>
```

성공하면 `dcrctl` 은 공식 [Decred Block Explorer](/getting-started/using-the-block-explorer.md) 에서 트랜잭션을보기 위해 사용할 수있는 트랜잭션 해시를 반환합니다.

---

## 네트워크 통계 확인

다른 네트워크 통계를 확인하는 데는 여러 가지 명령이 있습니다. 여기서는`getinfo` 를 `dcrd` 로, `getstakeinfo` 를 `dcrwallet` 으로 보냅니다.

로컬 `dcrd` 노드에 관한 정보를 얻으려면 `dcrctl` 을 사용하여 `dcrd` 에`getinfo` 명령을 내리십시오. 쉘에 다음을 입력하십시오:

```no-highlight
dcrctl getinfo
```

스테이크 네트워크에 대한 정보를 얻기 위해서는 `dcrctl` 을 사용하여`dcrwallet` 에 `getstakeinfo` 명령을 내리십시오. 쉘에 다음을 입력하십시오:

```no-highlight
dcrctl --wallet getstakeinfo
```

---

## 추가 명령

더 많은 명령은 [프로그램 옵션](/advanced/program-options.md) 페이지에서도 찾을 수 있습니다.

---
