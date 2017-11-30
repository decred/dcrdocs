# Алгоритмы подписи эллиптической кривой 

---

Хотя считается, что secp256k1 имеет безопасный выбор параметров эллиптической кривой, некоторые вопросы о происхождении кривой остаются. Например, выбор кривой Коблица,

\((y^2 + xy = x^3 + ax^2 + b \text{ and } a = a^2 \text{, } b = b^2 \text{; } a = 1 \text{ or } 2 \text{, } b != 0)\)

как правило, осуществляется путем пересчета двойного расширения полей Галуа \(GF(2^m)\) где \(m\) простое число в диапазоне {\(0\), \(...\), higher limit} и \(x,y \in GF(2^m)\)[^1]. Для 128-битной безопасности, \(m\) требуется быть \(\geqslant 257\) и, как правило, наименьшее простое в этом диапазоне, чтобы облегчить быстрый расчет. В этом случае очевидным выбором для \(m\) является \(277\text{, } a = 0\); несмотря на существование этого подходящего значения $m$, известного кураторами параметров кривой[^2] и тем, что оно было наиболее эффективным с вычислительной точки зрения, параметры \(m = 283\) где \(a = 0\) были выбраны из трех возможных вариантов:

 \((m = 277\text{, } a = 0\text{; } m = 283\text{, } a = 0\text{; } m = 283\text{, } a = 1)\).

Для всех других спецификаций кривой Коблица выбирается наиболее очевидное значение \(m\) . Любопытно, что не существует ни одной из известных атак, которые можно осуществить при использовании чуть большего значения $m$ для поля Галуа. Возникали также другие возражения против параметров, используемых secp256k1[^3].

Еще одним чрезвычайно популярным алгоритмом цифровой подписи (DSA) с 128-битной безопасностью является Ed25519[^4]. Он использует алгоритм подписи EdDSA над кривой, бирационально эквивалентной Curve25519 и сегодня широко применяется. В отличие от ECDSA secp256k1, Ed25519 использует более простые Schnorr-подписи, которые доказуемо более безопасны в произвольно взятой модели oracle (см: [Schnorr Signatures](schnorr-signatures.md)).

Schnorr-подписи также предлагались для Bitcoin[^5].  Однако, вместо использования OP-кода, исключительного для сигнатур Schnorr с использованием параметров кривой для secp256k1, Decred вместо этого использует новый OP-код OP_CHECKSIGALT для проверки неограниченного количества новых схем подписи. В текущей реализации для дополнения secp256k1 ECDSA сигнатур доступны как secp256k1 Schnorr подписи, так и Ed25519 подписи. В будущем будет тривиально добавлять новые схемы подписи к форку софта, например, такие, которые квантово безопасны. Наличие этих двух наборов Schnorr также позволяет генерировать простые групповые подписи, занимающие столько же пространство, сколько нормальная сигнатура[^6], В будущем пороговые сигнатуры, использующие секретный доступ дилеров, также позволят порогам t-of-n занимать такое же пространство[^7].

---

## <i class="fa fa-book"></i> Ссылки 

[^1]: Pornin T. 2013. [StackExchange Cryptography: Should we trust the NIST-recommended ECC parameters?](https://decred.org/research/pornin2013.pdf)
[^2]: Solinas J. 2000. [Efficient arithmetic on Koblitz curves](https://decred.org/research/solinas2000.pdf).
[^3]: Bernstein D. and Lange T. 2014. [SafeCurves: Choosing safe curves for elliptic-curve cryptography](http://safecurves.cr.yp.to).
[^4]: Bernstein D., Duif N., Lange T., Schwabe P., Yang B. 2012. [High-speed high-security signatures](https://decred.org/research/bernstein2012.pdf).
[^5]: Osuntokun O. 2015. [OP_SCHNORRCHECKSIG: Exploring Schnorr Signatures as an alternative to ECDSA for Bitcoin](https://decred.org/research/osuntokun2015.pdf).
[^6]: Petersen T. 1992. [Distributed provers and verifiable secret sharing based on the discrete logarithm problem](https://decred.org/research/petersen1992.pdf).
[^7]: Stinson D. and Strobl R. 2001. Provably secure distributed Schnorr signatures and a (t,n) threshold scheme for implicit certificates.
