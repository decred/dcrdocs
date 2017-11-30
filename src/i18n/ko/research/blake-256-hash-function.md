# BLAKE-256 해시 기능 

---

Bitcoin에서 사용되는 SHA256은 Merkle-Damgård 구축으로 인해 많은 기술적 인 단점을 가지고 있습니다. 이러한 취약점으로 인해 다른 기본 구성에 기반한 새로운 해시 함수에 대한 SHA3 경쟁이 발생했습니다. Decred는 해시 함수로 BLAKE256을 선택했습니다. 경쟁자[^1] [^2]. 의 최종 후보자입니다. 해쉬 함수는 번스타인 (Bernstein)이 ChaCha 스트림 암호를 변형 한 HAIFA 구성을 기반으로합니다. 해시 함수는 x86-64 마이크로 아키텍처에서 높은 성능을 발휘한다는 점에서 주목할 만합니다. SHA256[^3] 보다 짧은 메시지의 경우 14 라운드에서 훨씬 높은 보안 여유가 있다고 여겨지더라도 더 빠릅니다.

---

## <i class="fa fa-book"></i> 참고 문헌 

[^1]: Aumasson J., Henzen L., Meier W., Phan R. 2010. [SHA-3 제안 BLAKE](https://decred.org/research/aumasson2010.pdf).
[^2]: Aumasson J., Henzen L., Meier W., Phan R. 2014. 해시 함수 BLAKE.
[^3]: Bernstein D. and Lange T. 2013. [eBACS : ECRYPT의 암호화 시스템 벤치마킹](http://bench.cr.yp.to).
