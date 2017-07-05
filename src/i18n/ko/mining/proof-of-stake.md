# 스테이크 증명 (PoS) 채광

v1.0.0의 최종 업데이트

이 문서는 Decred와 함께 스테이크 증식 (steaking)을위한 교육 자료가 될 예정입니다. Proof-of-Stake 프로토콜의 목적, 스테이징 프로세스에 대한 간략한 소개, 티켓 수명주기에 대해 설명하고 티켓 구입을 시작하십시오. 

---

## 개요 

Decred의 독특한 Proof-of-Stake 프로토콜은 여러 가지 용도로 사용됩니다:

이해 관계자를위한 메트릭 / 최종 사용자 지원을 제공합니다. 즉, 이해 관계자는 Decred 블록 체인의 특정 제안 / 안건에 투표 할 수 있습니다. 의제에는 개발 팀이 특정 기능의 구현, 구현을 위해 이미 제출 된 기능 코드의 활성화 또는 개발자 보조금 지출 방법과 같은 다른 결정을 내리는 데 시간을 할애할지 여부가 포함될 수 있습니다. 투표에 대한 자세한 내용은 [Mainnet Voting Guide](/getting-started/user-guides/agenda-voting.md)에서 확인하십시오.

Decred의 PoS는 부적합한 광부를위한 견제와 균형 시스템을 제공합니다. 이해 관계자가 네트워크의 합의 규칙과 일치하지 않으면 유효하지 않은 블록에 투표 할 수 있습니다.

---

## 스테이크 101 

스테이크 홀더 광산 채굴에 참여하기 위해 이해 관계자는 티켓을받는 대가로 일부 DCR을 잠급니다. 모든 소유 티켓은 이해 관계자에게 단 하나의 표를 던질 수있는 능력을 부여합니다. 투표시, 각 티켓은 티켓의 원래 **Ticket Price** 에 작은 보상을 더합니다. 각 티켓은 무작위로 투표하도록 선택되어 평균 투표 시간은 28 일이지만 투표일로 선택되기 전에 만료 될 확률은 .5 %이며 최대 142 일까지 소요될 수 있습니다 (이 만료일은 원래 **Ticket Price** 보상없이). 채굴 된 모든 블록에는 5 표가 포함되어야합니다 (광부는 5 표 미만인 경우 보상 공제로 처벌됩니다). 채굴 된 모든 블록에는 최대 20 회의 신규 항공권 구매가 포함될 수 있습니다. 새로운 티켓은 **Ticket Pool* 에 입력되기 전에 성숙되기까지 256 블록이 필요하며 투표를 요청받을 수 있습니다.

당신이 측설하는 동안 익숙해야하는 몇 가지 중요한 변수가 있습니다.

스테이크 난이도 알고리즘은 매 144 블록 (~12 hours), **Ticket Price** 크기를 목표 풀 크기 40,960 티켓 근처에 유지하기 위해 **Ticket Pool** 를 계산합니다. 이 144 블록 창은 `StakeDiffWindowSize`.

 **Ticket Price**/**Stake Difficulty** 는 단일 144 블록 창에서 티켓 가격을 지불해야하는 가격입니다.

 **Ticket Pool** 은 Decred 네트워크의 티켓 총 수입니다.

 **Ticket Fee** (`ticketfee`)는 새로운 블록에 해당 티켓을 포함시키기 위해 노동 허가자에게 인센티브를주기 위해 티켓 구매에 포함되어야하는 수수료입니다. **Ticket Fee** 는 일반적으로 티켓 구매 거래에 대한 DCR / kB 수수료율을 나타냅니다. 따라서 거래 규모가 클수록 더 높은 절대 수수료를 지불하게됩니다. 예를 들어 솔로 스테이징 티켓 구매는 약 300 바이트입니다. 즉 **Ticket Fee** DCR / kB의 은 해당 티켓이 블록에 포함되는 경우에만 .1 DCR에 지출하게됩니다.

 **Ticket Price** 이 단일 **Ticket Window**, 에 비해 상대적으로 낮 으면 수수료 시장이 형성 될 것으로 예상 할 수 있으며 많은 이해 관계자가 창을 닫기 전에 티켓을 구매하려고합니다. **Ticket Price** 이 극히 저렴하고 수익성이없는 가격 인 경우 일반적으로 0.01 DCR / kB 요금의 **Ticket Fee** 가 한 블록에 포함될만큼 높습니다.

항공권을 투표 할 때 투표권이있는 지갑은 온라인 상태 여야합니다. 투표를하기 위해 지갑이 온라인 상태가 아닌 경우 티켓은`누락 됨 '으로 표시되며 티켓에 대한 보상을받지 못합니다. 스테이크 풀은 24/7 온라인으로 투표소를 가질 수없는 사람들을위한 솔루션으로 제공됩니다.

이해 관계자는 스테이크 풀을 사용하여 티켓에 대한 스테이크 풀 투표권을 부여하는 티켓 구매 거래를 생성 할 수 있습니다. 그들은 귀하를 대신하여 투표하는데, 보통 스테이크 풀을 운영하는 데 필요한 최소 3 대의 서버를 호스팅하는 데 드는 비용 (7 % 미만)은 약간의 참가 비용이 필요합니다. 이 수수료는 **Pool Fee** 로 알려져 있으며, 작은 PoS 보상에서 제외됩니다. 스테이크 풀 목록은 [아래](#list-of-stakepools)에서 찾을 수 있습니다.

---

## 티켓 수명주기 

PoS 티켓을 구매하는 것은 간단합니다 (아래 참조).하지만 구매 한 후에는 어떻게됩니까?
메인 넷 (테스트 넷은 다른 매개 변수를 사용함)의 티켓은 평생 동안 몇 단계를 거치게됩니다:

1. Paymetheus <!--, Decrediton,--> 또는 dcrwallet 지갑을 사용하여 티켓을 구입하십시오. 각 티켓 ​​거래의 총 비용은 **Ticket Price** + **Ticket Fee**(`ticketfee`)이어야합니다.
2. 티켓이 `mempool` 에 들어갑니다. 이것은 당신의 표가 PoW 광부에 의해 채굴되기를 기다리는 곳입니다. 단 20 개의 새로운 티켓이 각 블록에 채워집니다.
3. 티켓은 우선 순위가 높은 **Ticket Fee** 거래로 블록으로 채워집니다. **Ticket Fee** 는 거래 KB 당 DCR입니다. 일반적인 트랜잭션 크기는 298 바이트 (솔로 티켓 구매)와 539 바이트 (풀 티켓 구매)입니다.
4. **A -** 티켓을 블록에 채우면 미성숙 티켓이됩니다. 이 상태는 256 블록 (약 20 시간) 동안 지속됩니다. 이 시간 동안 티켓은 투표 할 수 없습니다. 이 시점에서 티켓 수수료는 환불되지 않습니다. <br /> 
**B -** 항공권이 마이닝되지 않은 경우 **Ticket Price** 및 **Ticket Fee** 가 구매 계정으로 반환됩니다.
5. 티켓이 성숙한 후 (256 블록) **Ticket Pool** 에 입장하고 투표 할 수 있습니다.
6. 표 투표의 기회는 평균 28 일의 포아송 분포를 기반으로합니다. 28 일 후에 티켓은 이미 투표 한 50 %의 기회가 있습니다.
7. 40960 티켓의 대상 풀 크기가 주어지면 주어진 티켓은 ~ 142 일 (약 4.7 개월) 내에 99.5 %의 투표 기회를 갖습니다. 이 시간 이후에 표가 투표하지 않으면 만료됩니다. **Ticket Price** 에 대한 환불을받습니다.
8. 투표지가 응답하지 않거나 서로 근접한 곳에서 유효한 블록이 2 개 발견되는 경우 티켓은 투표 통화를 놓칠 수 있습니다. 이 경우 원래 **Ticket Price** 에 대한 환불을 받게됩니다.
9. 표가 표결되거나, 놓치거나 만료 된 후에, 기금 (티켓 가격 및 보조금 (해당되는 경우, 수수료 제외))은 다른 256 블록에 대해 미성숙 상태에 들어간 후 릴리스됩니다. 티켓이 누락되거나 만료 된 경우 지갑에서 티켓 취소 트랜잭션을 제출하면 잠긴 티켓 출력이 해제됩니다. **참고:** 취소는 해당 누락 된 티켓에 대해서만 제출할 수 있습니다. 누락 될 때까지 티켓을 취소 할 수 없습니다.

---

## 스테이크하는 법 

24/7 연중 무휴로 열려있는 지갑은 *highly recommended* . 가동 시간의 손실은 투표 및 보상의 손실을 초래할 수 있습니다. 스테이크 풀은 개인 투표 지갑을 온라인으로 영구 보관할 수없는 사람들을 위해 제공됩니다.

족쇄에 대한 유일한 다른 요구 사항은 티켓을 구입하는 것입니다. 아래에서 [Paymetheus](#paymetheus) 와 [dcrwallet](#dcrwallet) 을 사용하여 항공권을 구입하는 방법에 대한 안내를 찾을 수 있습니다.

스테이크 풀을 사용하려는 경우 먼저 스테이크 풀에 가입해야합니다. 공식적으로 인정 된 스테이크 풀에 대한 링크가 여기에 제공됩니다 [here](#list-of-stakepools).

---

## Paymetheus 

Paymetheus 응용 프로그램 자체는 투표 할 수 없기 때문에 투표권을 스테이크 풀에 할당해야합니다.

Paymetheus와 스테이크 풀을 사용하여 티켓을 구입하는 방법을 배우려면 Paymetheus의 [Purchase Tickets 탭 가이드](/getting-started/user-guides/using-paymetheus.md#purchase-tickets-tab) 를 참조하십시오.

---

## dcrwallet 

[dcrwallet으로 티켓 구매하기](/getting-started/user-guides/dcrwallet-tickets.md) 가이드는 수영장이나 솔로 스테이 킹을 위해 수동 및 자동으로 티켓을 구매하는 방법을 보여줍니다.

---

## <i class="fa fa-life-ring"></i> 스테이크 풀 목록

이 스테이크 풀은 공식적으로 인정됩니다:

* [<i class="fa fa-external-link-square"></i> https://dcr.stakepool.net](https://dcr.stakepool.net)
* [<i class="fa fa-external-link-square"></i> https://dcr.stakeminer.com](https://dcr.stakeminer.com)
* [<i class="fa fa-external-link-square"></i> https://pool.d3c.red](https://pool.d3c.red)
* [<i class="fa fa-external-link-square"></i> https://stakepool.dcrstats.com](https://stakepool.dcrstats.com)
* [<i class="fa fa-external-link-square"></i> https://stake.decredbrasil.com](https://stake.decredbrasil.com)
* [<i class="fa fa-external-link-square"></i> https://stakepool.eu](https://stakepool.eu)
* [<i class="fa fa-external-link-square"></i> https://dcr.ubiqsmart.com](https://dcr.ubiqsmart.com)
* [<i class="fa fa-external-link-square"></i> https://ultrapool.eu](https://ultrapool.eu)

각 수영장의 수수료 및 통계에 대한 비교는
[<i class="fa fa-external-link-square"></i> Decred website](https://decred.org)
페이지 하단의 바닥 글에있는 'Stakepools'링크를 클릭하십시오.

---

<!-- TODO: **Decrediton으로 티켓 구매** -->

## 추가 정보 

[Mainnet Voting Guide](/getting-started/user-guides/agenda-voting.md)

[스테이크 증명 명령](/advanced/program-options.md#pos-commands)

[스테이크 증언 FAQ - 일반](/faq/proof-of-stake/general.md)

[스테이크 증명 FAQ - 티켓 및 수수료 구입](/faq/proof-of-stake/buying-tickets-and-fees.md)

[스테이크 증언 FAQ - 솔로 마이닝](/faq/proof-of-stake/solo-mining.md)

[스테이크 풀기 FAQ - 스테이크 풀](/faq/proof-of-stake/stake-pools.md)

[스테이크 증명 FAQ - 투표 티켓](/faq/proof-of-stake/voting-tickets.md)

[스테이크 마이닝 매개 변수](/advanced/program-options.md#pos-network-parameters)
