# <i class="fa fa-info-circle"></i> 개요 

---

분산 타임 스탬프 프로토콜은 Nakamoto의 Bitcoin에 대한 획기적인 논문에서 금융 네트워크를 분산시키는 데 처음 적용되었습니다[^1]. 이 분야는 아마추어와 전문가 모두의 폭발적인 연구 후속 조치로 기존 프로토콜의 확장, 조정, 개선 및 개선을 제공하기 위해 경쟁하고 있습니다. 주목할만한 새로운 아이디어로는 확장 스크립트 인 Ethereum[^2], 과 개인 정보를 정제 한 CryptoNote[^3], Bitcoin 토큰 1 : 1로 양방향 페그를 조사한 Sidechains[^4], 등이 있습니다. 이러한 프로토콜은 모두 Bitcoin 백서에 설명 된대로 작업 증명 (PoW)을 사용합니다.

Bitcoin 프로토콜에 대한 공통적 인 확장은 타임 스탬프 프로세스에 참여하기위한 계산 능력이 아닌, 지분증명 (PoS) 또는 자신의 지분 (토큰) 사용을 완전히 또는 부분적으로 사용하는 합의 메커니즘을 수정합니다. Bitcoin 프로토콜을 기반으로 한 첫번째 지분증명 블록 체인은 King and Nadal[^5], 에 의해 2012 년에 구현되었으며, PoW와 PoS를 모두 포함하고 점차적으로 PoS로 기울어집니다. 순수한 PoS 합의 시스템에은 비판은 많은 비판을 받았고[^6] [^7], 순수한 PoW 블록 체인으로 일하는 사람들이 가장 격령히 반대했습니다. 분배 된 타임 스탬프를위한 PoS에 대한 가장 일반적인 논쟁은 "스테이크가없는 것"또는 "비용이 들지 않는 시뮬레이션"입니다. 이해 관계자가 비용을 들이지 않고 타임 스탬핑 된 이력을 생성 할 수있는 체계적인 불안정성을 설명합니다.

PoW 타임 스탬프 시스템에 의존하는 PoS 오버레이를 가진 시스템이 논점에도 불구하고 독립적으로 합의를 이룰 수 있다는 것은 명백합니다. 이것은 Bentov와 동료[^8] 에 의해 그들의 계획, 활동 증명 (PoA)에 대한 논문에서 수학적으로 탐구되며 흥미로운 새로운 속성을 가능하게하는 PoW 프로토콜의 실행 가능한 확장 인 것으로 보입니다. 비슷한 디자인의 MC2가 Mackenzie에 의해 2013[^9]. 년에 제안되었고 여기서 "Decred"라고 명명 한 유사한 합의 시스템의 구축과 이행을 기술합니다.

Decred의 연구 작업은 현재 다음 소단원으로 구성됩니다:

* [하이브리드 디자인](hybrid-design.md)
* [분산 형 스테이크 풀링](decentralized-stake-pooling.md)
* [Elliptic Curve Signature Algorithms](elliptic-curve-signature-algorithms.md)
* [BLAKE-256 해시 기능](blake-256-hash-function.md)
* [스크립트 확장 기능](script-extensions.md)
* [서명 스크립트 격리 및 사기 증명](signature-script-isolation-and-fraud-proofs.md)
* [트랜잭션 확장](transaction-extensions.md)
* [Schnorr Signatures](schnorr-signatures.md)
* [Miscellaneous Improvements](miscellaneous-improvements.md)

## <i class="fa fa-book"></i> 참고 문헌 

[^1]: Nakamoto S. 2008. [Bitcoin : 피어 - 투 - 피어 전자 현금 시스템](https://decred.org/research/nakamoto2008.pdf).
[^2]: Buterin V. 2014. [차세대 스마트 계약 및 분산 응용 프로그램 플랫폼](https://decred.org/research/buterin2014.pdf).
[^3]: von Saberhagen N. 2013. [CryptoNote v2.0](https://decred.org/research/saberhagen2013.pdf).
[^4]: Back A., Corallo M., Dashjr L., Friedenbach M., Maxwell G., Miller A., Poelstra A., Timon A., Wuille P. 2014. [Pegged Sidechains로 Bitcoin의 혁신을 가능하게하기](https://decred.org/research/back2014.pdf).
[^5]: King S. and Nadal S. 2012. [PPCoin : 지분증명을 사용하는 피어 - 투 - 피어 암호 화 통화](https://decred.org/research/king2012.pdf).
[^6]: Bentov I., Gabizon A., Mizrahi A. 2015. [직업 증명없는 크립토 통화](https://decred.org/research/bentov2015.pdf).
[^7]: Poelstra A. 2015. [이해 관계 및 합의](https://decred.org/research/poelstra2015.pdf).
[^8]: Bentov I., Lee C., Mizrahi A., Rosenfeld M. 2014. [활동 증명 : Bitcoin의 증명 증명을 통한 작업 증명 확장](https://decred.org/research/bentov2014.pdf).
[^9]: Mackenzie A. 2013. [MEMCOIN2 : 하이브리드 작업 증명, 입증 된 스테이크 암호 통화](https://decred.org/research/mackenzie2013.pdf).
