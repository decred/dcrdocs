# 서명 스크립트 격리 및 사기 증명 

---

트랜잭션 가단성, 동일한 입력 참조 및 출력 및 다른 트랜잭션 ID를 사용하여 트랜잭션을 생성하는 기능을 방지하기 위해 트랜잭션 해시 계산에서 입력 스크립트가 제거되었습니다. 이 수정의 기원은 과거에 CryptoNote 동전과 곁줄로 구현 된 것처럼 보이지만 논쟁의 여지가있었습니다[^1] [^2]. 이제 Bitcoin은 "분리 된 증인"이라고하는 소프트 포크로 제안되었습니다[^3]. Elements 사이드 체인 구현에서와 같이 미러링 모니터 데이터에 대한 커밋은[^2]. 블록의 Merkle 트리에 포함됩니다. 또한, Bitcoin의 소프트 포크[^3], 에 제안 된 사기 증명은 광부가 설정하고 Merkle 트리의 데이터 일부로 등록합니다.

---

## <i class="fa fa-book"></i> 참고 문헌 

[^1]: von Saberhagen N. 2013. [CryptoNote v2.0](https://decred.org/research/saberhagen2013.pdf).
[^2]: Maxwell G. 2015. [새로운 요소를 사이드 체인으로 Bitcoin에 가져 오기](https://decred.org/research/maxwell2015.pdf).
[^3]: Wuille P. 2015. [Bitcoin을위한 분리 된 증인](https://prezi.com/lyghixkrguao/segregated-witness-and-deploying-it-for-bitcoin/).
