# منحنى بيضاوي الشكل  وتوقيع الخوارزميات

---

على الرغم من أن secp256k1  يعتبر على نطاق واسع ضمن اختيار آمن من المعلمات لمنحنى بيضاوي الشكل، ولا تزال بعض الأسئلة حول أصل منحنى. على سبيل المثال، واختيار منحنى Koblitz,

\((y^2 + xy = x^3 + ax^2 + b \text{ and } a = a^2 \text{, } b = b^2 \text{; } a = 1 \text{ or } 2 \text{, } b != 0)\)

وذلك يتم عادة عن طريق تعداد حقول  Galois لملحق الثنائية, \(GF(2^m)\) كما في  \(m\) وهو يعد الرئيس في النطاق  {\(0\), \(...\), الحد الأعلى} and \(x,y \in GF(2^m)\)[^1]. ولأمن 128 بايت,  \(m\)  يعد المطلوب للحصول \(\geqslant 257\)  وعادة ما يكون الأصغر في هذا النطاق وذلك لتسهيل الحساب السريع. وفي هذه الحالة، فإن الخيار الواضح ل  \(m\) هو \(277\text{, } a = 0\); على الرغم من وجود هذه القيمة المناسبة $ m $ المعروفة من قبل القيمين المعلمات منحنى [^ 2] وحقيقة أنه كان الحل الأكثر كفاءة حسابيا،  العامل المتغير \ ( m= 283 \) و \ (a = 0 \) من بين ثلاثة خيارات ممكنة:

 \((m = 277\text{, } a = 0\text{; } m = 283\text{, } a = 0\text{; } m = 283\text{, } a = 1)\).

لجميع منحنيات المحددة من Koblitz, الأكثر وضوحاً هو القيمة المحددة ل \(m\). على الرغم من أن هذا هو الغريب، حيث لا توجد هجمات معروفة التي يمكنك تطبيقها باستخدام أكبر قليلا $ m $ قيمة حقل Galois. كما أثيرت اعتراضات أخرى على العامل المتغير المستخدمة من قبل secp256k1 [^ 3].

آخر شعبية للخوارزمية للتوقيع الرقمي  (DSA) مع أمن 128 بايت هي Ed25519[^4].  وهذا الإستخدام ل  EdDSA لخوارزمية التوقيع على انحناء منحنى أي ما يعادل Curve25519 ويستخدم على نطاق واسع اليوم. على عكس secp256k1's ECDSA, Ed25519  التي تستخدم توقيعات أبسط و هي التي تكون آمنة بشكل مؤكد في نموذج أوراكل عشوائي.  [Schnorr Signatures](schnorr-signatures.md)).

Schnorr signatures have also been proposed for Bitcoin[^5]. However, instead of using an OP code exclusive to Schnorr signatures utilizing the curve parameters for secp256k1, Decred instead uses a new OP code OP_CHECKSIGALT to verify an unlimited number of new signature schemes. In the current implementation, both secp256k1 Schnorr signatures and Ed25519 signatures are available to supplement secp256k1 ECDSA signatures. In the future, it is trivial to add new signature schemes in a soft fork, such as those that are quantum secure. Having these two Schnorr suites available also allows for the generation of simple group signatures occupying the same space of a normal signature[^6], which for both is implemented. In the future, threshold signatures using dealerless secret sharing will also enable t-of-n threshold signatures occupying the same amount of space[^7].

---

## <i class="fa fa-book"></i> References 

[^1]: Pornin T. 2013. [StackExchange Cryptography: Should we trust the NIST-recommended ECC parameters?](https://decred.org/research/pornin2013.pdf)
[^2]: Solinas J. 2000. [Efficient arithmetic on Koblitz curves](https://decred.org/research/solinas2000.pdf).
[^3]: Bernstein D. and Lange T. 2014. [SafeCurves: Choosing safe curves for elliptic-curve cryptography](http://safecurves.cr.yp.to).
[^4]: Bernstein D., Duif N., Lange T., Schwabe P., Yang B. 2012. [High-speed high-security signatures](https://decred.org/research/bernstein2012.pdf).
[^5]: Osuntokun O. 2015. [OP_SCHNORRCHECKSIG: Exploring Schnorr Signatures as an alternative to ECDSA for Bitcoin](https://decred.org/research/osuntokun2015.pdf).
[^6]: Petersen T. 1992. [Distributed provers and verifiable secret sharing based on the discrete logarithm problem](https://decred.org/research/petersen1992.pdf).
[^7]: Stinson D. and Strobl R. 2001. Provably secure distributed Schnorr signatures and a (t,n) threshold scheme for implicit certificates.
