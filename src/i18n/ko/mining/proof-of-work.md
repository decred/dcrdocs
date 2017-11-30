# 증명 증명 (PoW) 채광 

---

## 개요  

PoW 광산 (PoW mining)으로 더 잘 알려진 작업 증명 (proof-of-work) 광산 활동
의 하드웨어 및 리소스를 처리하여 네트워크를 처리하는 방법
트랜잭션을 수행하고 Decred에서 블록 체인을 구성하는 블록을 작성합니다.
회로망. 블럭이 만들어 질 때마다 (광부에 의해) 약 30 개의 새로운 Decred 동전
만들어집니다. 이 동전들은 다음과 같이 분리됩니다 :

보조금 | 파티
---     | ---
60%   | PoW 광부들
30%   | PoS 유권자
10%   | 개발 보조금 삭감

귀하는 평균적으로 귀하와
광부의 해시 레이트 및 커밋 할 때 네트워크의 전체 해쉬 레이트
귀하의 컴퓨터를 PoW 광산으로 전환하십시오. 시작하려면 컴퓨터가 있어야합니다.
비디오 카드. 대부분의 비디오 카드는 광업 ( "모바일"
유형은 일부 랩탑에서 발견됨). 일반적으로 고급형 비디오 카드는
높은 해시 트를 사용하므로 더 높은 보상을받을 수 있습니다.
---

## 솔로 광업 또는 풀 채광  

> <i class="fa fa-male"></i> 솔로 광업

<i class="fa fa-exclamation-triangle"></i> **솔로 마이닝은 권장되지 않으며이 문서에서 다루지 않습니다!** Decred 네트워크는 최대 10,000Gh / s의 네트워크 해시 율을 정기적으로 봅니다. . 솔로 마이닝은 일반적으로 GPU 클러스터가 많은 고급 개인 또는 조직 그룹에 의해서만 수행되므로 여기서 다루지 않습니다.

> <i class="fa fa-users"></i> 풀 마이닝

풀에서 마이닝 할 때 해쉬 레이트는 다른 풀 마이너의 해시와 결합되어 블록에 대한 올바른 솔루션을 찾습니다. 광부가 수영장에서 수행하는 작업량에 따라 보상을 받게됩니다.
풀 마이닝은 발견 된 블록을 기반으로 주식을 분배하므로 솔로 채광의 "전부 또는 아님"이 아닌 일정한 금액의 Decred를 얻을 수 있습니다.

---

## 기금을 수령 할 수있는 낙찰받은 주소 얻기 

 [dcrctl Basics](/getting-started/user-guides/dcrctl-basics.md) 가이드에 따라 광업 보상을 철회 할 수 있도록 주소를 만드십시오.

---

## <i class="fa fa-life-ring"></i> 광업 수영장에 가입하십시오

이러한 채광 풀은 Decred를 지원하는 것으로 알려져 있습니다:

* [<i class="fa fa-external-link-square"></i> http://decredpool.org](http://decredpool.org)
* [<i class="fa fa-external-link-square"></i> http://yiimp.ccminer.org](http://yiimp.ccminer.org)
* [<i class="fa fa-external-link-square"></i> http://coinmine.pl/dcr](http://coinmine.pl/dcr)
* [<i class="fa fa-external-link-square"></i> https://dcr.maxminers.net](https://dcr.maxminers.net)
* [<i class="fa fa-external-link-square"></i> https://dcr.suprnova.cc](https://dcr.suprnova.cc)
* [<i class="fa fa-external-link-square"></i> https://pool.mn/dcr](https://pool.mn/dcr)
* [<i class="fa fa-external-link-square"></i> https://zpool.ca](https://zpool.ca)

채광 풀은 모두 동일하거나 다소 동일하게 작동하지만 여러 풀에 등록하여 어느 것이 가장 적합한 지 확인하십시오.

더 작은 수영장에서 광산을 선택하여 네트워크의 해시 비율을 광산 권력의 분권화로 분산시킬 수 있습니다!

---

## GPU 드라이버 / 소프트웨어 

GPU 드라이버에는 대개 마이닝에 필요한 라이브러리가 포함되어 있습니다. 소프트웨어를 실행하는 데 어려움이있는 경우 다시 설치하고 OpenCL (AMD) 또는 CUDA (NVIDIA) 라이브러리가 선택되어 있는지 확인하십시오.

---

## <i class="fa fa-download"></i> 마이닝 소프트웨어 선택 및 다운로드

### 공식 광부 (gominer)

Gominer는 Decred 팀이 개발하고 지원 한 공식 Decred 광부입니다. 마이닝을 설정하고 시작할 수있는 가장 쉬운 광부이기 때문에 대부분의 사용자에게 권장됩니다. 현재 gominer의 최신 버전은 **<i class="fa fa-github"></i> [v1.0.0](https://github.com/decred/gominer/releases/)** 이며 공식 바이너리는 **[https://github.com/decred/decred-binaries/releases/tag/v1.0.0](https://github.com/decred/decred-binaries/releases/tag/v1.0.0)**

올바른 운영 체제 (Windows / Linux)와 GPU 유형 (NVIDIA 카드의 경우 CUDA, AMD 카드의 경우 OpenCL / OpenCLADL)에 맞는 올바른 버전을 선택하십시오. gominer는 64 비트 운영 체제에서만 사용할 수 있습니다. gominer로 마이닝을 시작하기위한 사용자 가이드는 다음에서 찾을 수 있습니다:

- [Windows Pool-Mining](/mining/proof-of-work/pool-mining/gominer/windows.md)

### 비공식 광부

* <i class="fa fa-github"></i> [cgminer](https://github.com/kR105-zz/cgminer) - cgminer 는 **AMD** GPU에서 널리 사용되는 광부입니다. 많은 다른 cryptocurrencies에있는 사용의 오래된 병력 깎인 고마이너보다 사용하기가 더 어렵습니다.

* <i class="fa fa-github"></i> [ccminer](https://github.com/tpruvot/ccminer) -ccminer 는 오랜 역사를 가지고있는 **NVIDIA** GPU에서 널리 사용되는 광부입니다. 많은 다른 cryptocurrencies에서의 사용. 깎인 고마이너보다 사용하기가 더 어렵습니다.

* <i class="fa fa-github"></i> [sgminer](https://github.com/tpruvot/sgminer) - **AMD** 그래픽 카드를 사용하는 사람들은 sgminer를 다운로드 할 수 있습니다.

---

## 소프트웨어 실행하기 

* 압축을 풀고 선택한 장소에 소프트웨어를 설치하십시오.
* 해당 경로에 대한 명령 프롬프트를 엽니 다.
* 설치에 대한 귀하의 마이닝 풀 지침을 따르십시오.
* 광부를 실행하십시오.

PoW Mining FAQ
