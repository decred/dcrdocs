# 타원 곡선 시그니처 알고리즘 

---

secp256k1은 타원 곡선 매개 변수의 안전한 선택으로 널리 간주되지만 곡선의 원점에 대한 몇 가지 질문이 남아 있습니다. 예를 들면, Koblitz 곡선의 선택등이 있습니다.

\((y^2 + xy = x^3 + ax^2 + b \text{ and } a = a^2 \text{, } b = b^2 \text{; } a = 1 \text{ 또는 } 2 \text{, } b != 0)\)

일반적으로 \(GF(2^m)\) where \(m\) 가 {\(0\), \(...\), 상한선} 범위의 소수 일 때 갈 로아 필드 \(x,y \in GF(2^m)\)[^1]. 128 비트 보안의 경우, \(m\) 는 \(\geqslant 257\) 이어야하며 일반적으로이 범위에서 가능한 가장 작은 소수이므로 빠른 계산을 용이하게합니다. 이 경우 \(m\) 에 대한 분명한 선택은 \(277\text{, } a = 0\); 입니다. 이 적절한 $ m $ 값이 곡선 매개 변수의 큐레이터에 의해 알려지고[^2] 가장 계산적으로 효율적인 솔루션이라는 사실에도 불구하고 매개 변수 \(m = 283\) 와 \(a = 0\) 가 세 가지 가능한 옵션 중에서 선택되었습니다:

 \((m = 277\text{, } a = 0\text{; } m = 283\text{, } a = 0\text{; } m = 283\text{, } a = 1)\).

다른 모든 Koblitz 곡선 사양의 경우 가장 명확한 \(m\) 값이 선택됩니다. 이것이 흥미로울지라도 Galois 필드에 약간 큰 $ m $ 값을 사용하여 적용 할 수있는 알려진 공격은 없습니다. secp256k1에서 사용되는 매개 변수에 대한 다른 이의 제기도 제기되었습니다[^3].

128 비트 보안이 적용된 또 다른 매우 유명한 DSA (디지털 서명 알고리즘)는 Ed25519[^4]. 입니다. 이것은 Curve25519에 양이온으로 등가 인 곡선에 대해 EdDSA 서명 알고리즘을 사용하며 널리 사용되고 있습니다. secp256k1의 ECDSA와는 달리, Ed25519는 임의의 오라클 모델 (Schnorr Signatures (schnorr- signatures.md) 참조)에서 안전성이 입증 된보다 간단한 Schnorr 시그니처를 사용합니다.

Bitcoin을위한 Schnorr 서명도 제안되었습니다[^5]. 그러나 decrered는 secp256k1의 커브 매개 변수를 사용하는 Schnorr 시그니처 독점 OP 코드를 사용하는 대신 새 OP 코드 OP_CHECKSIGALT를 사용하여 새 서명 구성표를 무제한으로 확인합니다. 현재 구현에서는 secp256k1 Schnorr 서명과 Ed25519 서명을 모두 사용하여 secp256k1 ECDSA 서명을 보완 할 수 있습니다. 미래에는 양자 보안과 같은 소프트 포크에 새로운 서명 체계를 추가하는 것이 쉽지 않습니다. 이 두 개의 Schnorr 스위트를 사용 가능하게하면 일반 서명과 동일한 공간을 점유하는 간단한 그룹 서명을 생성 할 수 있습니다[^6], 둘 다 구현됩니다. 장래에, 딜러없는 비밀 공유를 사용하는 임계 값 서명은 동일한 공간을 점유하는 t-of-n 임계 값 서명을 가능하게합니다[^7].

---

## <i class="fa fa-book"></i> 참고 문헌 

[^1]: Pornin T. 2013. [StackExchange Cryptography : NIST 권장 ECC 매개 변수를 신뢰해야합니까?](https://decred.org/research/pornin2013.pdf)
[^2]: Solinas J. 2000. [Koblitz 곡선에 대한 효율적인 산술](https://decred.org/research/solinas2000.pdf).
[^3]: Bernstein D. and Lange T. 2014. [SafeCurves : 타원 곡선 암호화의 안전한 곡선 선택](http://safecurves.cr.yp.to).
[^4]: Bernstein D., Duif N., Lange T., Schwabe P., Yang B. 2012. [High-speed high-security signatures](https://decred.org/research/bernstein2012.pdf).
[^5]: Osuntokun O. 2015. [OP_SCHNORRCHECKSIG : Bitcoin을위한 ECDSA의 대안으로 Schnorr 서명 탐색](https://decred.org/research/osuntokun2015.pdf).
[^6]: Petersen T. 1992. [이산 대수 문제에 기초한 분산 형 검증기 및 검증 가능한 비밀 공유](https://decred.org/research/petersen1992.pdf).
[^7]: Stinson D. 및 Strobl R. 2001. 암시 적 인증서에 대해 분산 된 Schnorr 시그니처와 (t, n) 임계 값 스키마를 제공합니다.
