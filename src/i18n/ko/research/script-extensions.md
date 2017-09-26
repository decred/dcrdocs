# 스크립트 확장 

---

앞서 언급 한 OP_CHECKSIGALT 및 OP_CHECKSIGALTVERIFY 외에 Bitcoin 스크립팅에 대한 다른 수정이 이루어졌습니다. Wuille[^1]. 에 의해 처음 제안 된 바와 같이 새로운 스크립트 언어에 대한 간단한 소프트 포킹을 가능하게하기 위해 스크립트 출력에 버전 바이트가 추가되었습니다. 모든 수학 및 로직 관련 OP 코드가 다시 활성화되었으며 이제는 int32 레지스터에서 작동합니다. 다양한 바이트 문자열 조작 OP 코드도 다시 구현되어 사용할 수 있습니다. 나머지 사용되지 않은 Bitcoin OP 코드는 향후 소프트 포크에서 용도가 변경되었습니다. Bitcoin 스크립팅 언어의 오래된 버그가 수정되었습니다[^2] [^3].

---

## <i class="fa fa-book"></i> References

[^1]: Wuille P. 2015. [Bitcoin을위한 분리 된 목격자](https://prezi.com/lyghixkrguao/segregated-witness-and-deploying-it-for-bitcoin/).
[^2]: Todd P. [합의한 중요한 코드 작성의 어려움 : SIGHASH_SINGLE 버그](https://decred.org/research/todd2014.pdf).
[^3]: Franco P. Understanding Bitcoin, 6.3: Multisignature (M-of-N) Transactions.
