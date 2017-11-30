# 초보자 가이드 

v1.0.1의 최종 업데이트

---

## Decred에 환영 

Decred에 오신 것을 환영합니다! 우리는 당신을 매우 기쁘게 생각합니다. 당신이 이미 알았거나 알지 못했을 때, Decred는 다릅니다. 어떻게 작동 하는지를 완전히 익히는 법을 배울 수있는 새로운 많은 것들이 있습니다. 이 문서는 좀 더 쉽게 이해하려고 시도합니다.

이 초보자 용 안내서는 Decred 소프트웨어를 설치하고 실행하는 방법입니다. 여러 클라이언트 중에서 선택하여 네트워크에서 노드를 가져오고 지갑에서 Decred를 얻을 수 있습니다. 특히, Decred 애플리케이션을 설치, 설정 및 사용하는 방법을 배우게됩니다. DCR을 얻는 방법; 스테이크 증서를 통해 투표하는 법; 블록 탐색기를 사용하는 방법에 대해 설명합니다.

 [Installation Guide](#installation-guides), 를 따라야하며, 아래에서 선택한 응용 프로그램의 경로를 따라야합니다. 신청서가 작성되면이 페이지 하단의 [General Guides](#general-guides) 를보십시오. 도중에 질문이 있으시면 [Slack](/support-directory.md#join-us-on-slack) 에 가입하십시오.

**참고:  실수를 저 지르고 실제 돈을 잃을 염려없이 Decred 소프트웨어 사용법을 배우려면 Testnet을 사용하는 것이 좋습니다. 소프트웨어 선택을위한 가이드를 따라 가신 후 [Using Testnet guide](/getting-started/using-testnet.md) 를 방문하여 Decred 's testnet에 애플리케이션을 시작하는 방법을 알아보십시오.**

---

## 신청서 

아래에는 다양한 운영 체제와의 호환성을 보여주는 차트와 함께 현재 사용 가능한 응용 프로그램 목록이 나와 있습니다.

**Paymetheus**: The only Windows GUI client as of v1.1.0. <br />
**dcrd**: The node daemon, this command-line application handles block management and consensus. <br />
**dcrwallet**: The wallet daemon, this command-line application handles address and transaction management. <br />
**dcrctl**: The remote procedure call (RPC) client, this command-line application is used to control dcrd and dcrwallet via RPC commands. <br />
**Decrediton**: Cross-platform GUI client as of v1.1.0.

|           | Paymetheus | dcrd | dcrwallet | dcrctl | Decrediton |
| ---------:|:----------:|:----:|:---------:|:------:|:-----------:|
| Windows   | X          | X    | X         | X      |             |
| macOS     |            | X    | X         | X      | X           |
| Linux     |            | X    | X         | X      | X           |
| Other UNIX|            | X    | X         | X      |             |

"다른 UNIX" 에는 현재 다양한 * BSD 및 Solaris / illumos가 포함됩니다.

참고: 곧 Decred와 다른 것의 많은 차이점 중 하나를 발견하게 될 것입니다.
인기있는 cryptocurrencies : 지갑 데몬과 노드 데몬은 별개입니다.
많은 동전들이이 기능을 하나의 데몬으로 함께 실행합니다.
커맨드 라인 인터페이스를 사용하기를 원하는 사람들은
전체 노드 기능을 위해 `dcrd` 를 실행하고, DCR을 저장하기 위해 `dcrwallet` 을 실행하십시오.
거래를 만들고 증거 스테이크 광업 / 투표에 참여하십시오.

---

## 설치 안내서 

시작하려면 아래에서 운영 체제에서 사용할 수있는 설치 옵션을 선택하십시오:

* [Paymetheus](/getting-started/user-guides/paymetheus.md)
* [Command Line Suite **via dcrinstall**](/getting-started/user-guides/cli-installation.md) - 참고: `dcrinstall` 방법은 명령 줄 노드를 얻는 가장 빠르고 쉬운 방법이며 지갑 실행 중. 아래 권장되는 방법과 명령 줄 경로 설정 지침에 따라이 방법을 사용했다고 가정합니다.
* [Decrediton (ALPHA)](/getting-started/user-guides/decrediton-setup.md)

---

**참고:** 다음 가이드는 모두 같은 이름의 탐색 메뉴에서 찾을 수 있습니다.

## Paymetheus 경로 

다음 안내서는 순서대로 Paymetheus를 시작할 것입니다:

* [Paymetheus Setup](/getting-started/user-guides/paymetheus.md)
* [Using Paymetheus](/getting-started/user-guides/using-paymetheus.md)

## Decrediton 경로 

다음 가이드는 Decrediton을로드하는 데 도움이됩니다:

* [Decrediton Setup](/getting-started/user-guides/decrediton-setup.md)

## 명령 줄 경로

다음 가이드는 순서대로 명령 줄 응용 프로그램 (`dcrd`, `dcrwallet`, `dcrctl`) 을 시작하게합니다:

* [Command-Line Differences](/getting-started/cli-differences.md)
* [Startup Option Basics](/getting-started/startup-basics.md)
* [dcrd Setup](/getting-started/user-guides/dcrd-setup.md)
* [dcrwallet Setup](/getting-started/user-guides/dcrwallet-setup.md)
* [dcrctl Basic Usage](/getting-started/user-guides/dcrctl-basics.md)

## 일반 가이드 

다음 안내서는 여러 응용 프로그램과 독립적입니다:

* [Using Testnet](/getting-started/using-testnet.md)
* [Obtaining DCR](/getting-started/obtaining-dcr.md)
* [Using the Block Explorer](/getting-started/using-the-block-explorer.md)
* [Proof-of-Stake Guide](/mining/proof-of-stake.md)
* [Mainnet Voting Guide](/getting-started/user-guides/agenda-voting.md)
