# 기타 개선 사항 

---

Bitcoin 에서처럼 보조금은 블록 높이에 따라 기하 급수적으로 감소합니다. 그러나 Decred의 알고리즘은 매우 단순하지만 CryptoNote와 유사한 급격한 보조금 하락으로 시장 충격을 일으키지 않도록 시간이 지남에 따라 이러한 부식을보다 잘 보완합니다[^1]. PeerCoin[^2], 처럼, PoW 난이도는 이전 블록 시간의 지수 가중 평균 차이로부터 계산됩니다. 그러나이 계산은 Bitcoin과 같은 난이도 창 기간으로 보간됩니다. Bitcoin의 "timewarp"버그는 난이도 계산에 통합 된 블록 시간의 모든 차이를 확인함으로써 해결됩니다[^3].

이기심 광산과 고집적 광업과 같은[^4] 잘 알려진 많은 광산[^5], 공격은 스테이크 광산의 효과적인 분권화와 PoW-PoS 광부가없는 시스템에서 더 이상 유리하게 기능하지 않을 것이라는 점도 주목해야 함니다. 이것은 단순히 지분 광부의 도움없이 블록 체인에 대한 비밀 확장을 생성하는 것이 불가능하기 때문입니다. 이전에 설명한 광산 공격에 대한 탄력성과 우리 시스템에 고유 한 새로운 광산 공격은 향후 연구를위한 유익한 영역이 될 것입니다.

---

## <i class="fa fa-book"></i> 참고 문헌 

[^1]: Buterin V. 2014. [차세대 스마트 계약 및 분산 애플리케이션 플랫폼](https://decred.org/research/buterin2014.pdf).
[^2]: King S. and Nadal S. 2012. [PPCoin : 지분 증명과 함께하는 피어 - 투 - 피어 암호화 통화](https://decred.org/research/king2012.pdf).
[^3]: ArtForz. 2011. [Re : 풀에 대해 매우 유익한 50 개의 + ish 공격을 만드는 가능한 방법?](https://decred.org/research/artforz2011.pdf)
[^4]: Eyal I. 2015. [광부의 딜레마](https://decred.org/research/eyal2015.pdf).
[^5]: Nayak K., Kumar S., Miller A., Shi E. 2015. [완고한 광산 : 이기적인 광산을 일반화하고 식 공격과 결합](https://decred.org/research/nayak2015.pdf).
