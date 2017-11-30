# dcrd 설치 가이드 

v1.0.0에서 마지막으로 업데이트되었습니다.

이 가이드는 [startup flags](/getting-started/startup-basics.md#startup-command-flags)를 사용하여 `dcrd` 응용 프로그램을 설정하는 것을 돕기위한 것입니다.

**선수 과목:**

- 최신 [dcrinstall](/getting-started/user-guides/cli-installation.md) 을 사용하여 `dcrd` 를 설치하십시오. 다른 설치 방법을 사용하면 추가 단계가 필요합니다.
- 명령 프롬프트 (Windows) 및 Bash (OSX / Linux) 셸의 시작 명령이 [여기](/getting-started/cli-differences.md)와 어떻게 다른지 검토하십시오.

---

`dcrd` 는 Decred의 노드 데몬입니다. 데몬은 직접 인터페이스하지 않는 백그라운드에서 작동하는 프로그램입니다. `dcrd` 는 Decred의 과거 거래 원장 (또는 블록 체인) 전체를 유지 관리하며 전 세계의 다른 Decred 노드로 트랜잭션을 중계 할 수 있습니다. 자신의 개인 Decred 블록 체인 서버로 생각할 수 있습니다. blockchain은 `dcrd` 홈 디렉토리의 `data` 폴더에 저장됩니다.

**고급 사용자 : SSH를 통해 헤드리스 모드로 실행중인 경우,** 
 [화면](http://www.howtogeek.com/howto/ubuntu/keep-your-ssh-session-running-when-you-disconnect/)과 같은 터미널 멀티플렉서를 사용해야합니다.
또는 [tmux](https://tmux.github.io/). 지시 사항을 볼 곳
다른 쉘로 이동하려면 `screen`
에서 새 창을 시작해야합니다
또는 `tmux`.

---

## <i class="fa fa-cloud"></i> 결산 네트워크에 연결

처음 `dcrd` 를 실행하면 Decred 네트워크에 연결되어 블록 체인을 다운로드하기 시작합니다. `dcrwallet` 과 `dcrctl` 이 `dcrd` 와 통신 할 수있게하려면, 설정 파일은 `rpcuser` 와 `rpcpass` 설정을 가능하게해야합니다.

> RPC 사용자 이름 및 암호 구성

[`dcrinstall`](/getting-started/user-guides/cli-installation.md), 을 사용했다면 설정 파일은 `dcrd`, `dcrwallet`, `dcrctl` 에 대한 RPC 사용자 이름 / 암호로 이미 설정되어 있습니다 .

`dcrinstall` 을 사용하지 않았다면, 설정 파일에서 최소한의 설정 만 가능하게해야합니다. 이렇게하려면 [이 가이드](/advanced/manual-cli-install.md#minimum-configuration) 을 따르십시오.

> 시작 dcrd

올바르게 설정된 구성 파일을 사용하여 Decred 디렉토리에 다른 쉘 창을 열거 나 (방금 지갑을 만든 경우 마지막 창을 사용하십시오). 다음 명령을 입력하십시오 (이 안내서의 전제 조건을 검토하여 OS / 쉘 응용 프로그램에 적합한 명령을 판별하십시오):

```no-highlight
dcrd
```

> dcrd가 Decred Blockchain에 동기화 될 때까지 기다립니다.

`dcrd` 가 성공적으로 시작되면 데몬이 네트워크에 연결하고 블록을 처리하기 시작할 때 쉘 윈도우가 메시지로 채워지는 것을보아야합니다. 완료 될 때까지 기다리십시오 - 전체 블록 체인이 `dcrd` 데이터 디렉토리로 다운로드되고 있습니다. 

다음과 같이 시작할 때 줄이 표시됩니다:

```no-highlight
22:58:04 2016-02-09 [INF] BMGR: Syncing to block height 617 from peer 104.236.167.133:9108
```

그런 다음 블록을 계속 다운로드하면서 다음과 같은 행이 표시됩니다:

```no-highlight
22:58:16 2016-02-09 [INF] BMGR: Processed 321 blocks in the last 10.03s (544 transactions, height 322, 2016-02-09 09:50:34 +1000 EST)
```

가장 최근에 처리 된 블록이 현재 블록 높이가되면 블록 체인이 완전히 동기화됩니다. 로그 메시지에서 날짜와 시간을 비교하거나 [공식 블록 탐색기](https://mainnet.decred.org/) 에서 마지막 블록 높이와 처리 된 마지막 블록의 높이를 비교하여 알 수 있습니다.  

이 연결은 앞으로 사용됩니다. `dcrwallet` 을 사용하려면이 `dcrd` 인스턴스를 그대로 두어야합니다.

---

이제 `dcrd` 를 설정 했으므로 [dcrwallet Setup](/getting-started/user-guides/dcrwallet-setup.md) 안내서를 방문하십시오.
