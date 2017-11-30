# Алгоритми підпису еліптичної кривої 

---

Хоча вважається, що secp256k1 має безпечний вибір параметрів еліптичної кривої, деякі питання про походження кривої залишаються. Наприклад, вибір кривої Кобліца,

\((y^2 + xy = x^3 + ax^2 + b \text{ and } a = a^2 \text{, } b = b^2 \text{; } a = 1 \text{ or } 2 \text{, } b != 0)\)

як правило, здійснюється шляхом перерахунку подвійного розширення полей Галуа \(GF(2^m)\) де \(m\) є простим числом у діапазоні {\(0\), \(...\), higher limit} and \(x,y \in GF(2^m)\)[^1]. Для 128-бітної безпеки, \(m\) повинна бути \(\geqslant 257\) і зазвичай найменший простий в цьому діапазоні, щоб полегшити швидкий розрахунок. У цьому випадку очевидним вибором для \(m\) is \(277\text{, } a = 0\); незважаючи на існування цього придатного значення $m$, відомого кураторами параметрів кривої[^2] та того факту, що це було найбільш обчислювально ефективним рішенням, параметри \(m = 283\) та \(a = 0\) були вибрали з трьох можливих варіантів:

 \((m = 277\text{, } a = 0\text{; } m = 283\text{, } a = 0\text{; } m = 283\text{, } a = 1)\).

Для всіх інших специфікацій кривої Кобліца вибрано найбільш очевидне значення \ (m \). Цікаво, що не існує жодних відомих атак, які можна застосувати, використовуючи дещо більше значення $m$ для поля Галуа. Виникали такоє інші заперечення щодо параметрів, використаних secp256k1[^3].

Ще одним надзвичайно популярним алгоритмом цифрового підпису (DSA) з 128 бітною безпекою є Ed25519 [^ 4]. Він використовує алгоритм підписання EdDSA над кривою, що біративно еквівалентна Curve25519 і наразі широко застосовується. На відміну від ECDSA secp256k1, Ed25519 використовує простіші Schnorr-подписи, які доведено більш захищені у довільно взятій моделі oracle (див: [Schnorr Signatures](schnorr-signatures.md)).

Schnorr-підписи також пропонувалися для Bitcoin [^ 5]. Проте, замість використання коду OP, виняткового для підписів Schnorr з використанням параметрів кривої для secp256k1, Decred замість цього використовує новий OP-код OP_CHECKSIGALT для перевірки необмеженої кількості нових схем підпису. У поточній реалізації для доповнення підписів secp256k1 ECDSA доступні як secp256k1 Schnorr, так і підписи Ed25519. Надалі тривіальним буде додавання нових схем сигнатур до форку софта, таких як ті, які є квантово безпечні. Наявність цих двох наборів Schnorr також дозволяє генерувати прості групові підписи, що займають стільки ж простору, скільки і нормальна сигнатура[^ 6]. У майбутньому порогові сигнатури, що використовують секретний доступ ділерів, також дадуть змогу порогам t-of-n займати такий же простір[^7].

---

## <i class="fa fa-book"></i> Посилання 

[^1]: Pornin T. 2013. [StackExchange Cryptography: Should we trust the NIST-recommended ECC parameters?](https://decred.org/research/pornin2013.pdf)
[^2]: Solinas J. 2000. [Efficient arithmetic on Koblitz curves](https://decred.org/research/solinas2000.pdf).
[^3]: Bernstein D. and Lange T. 2014. [SafeCurves: Choosing safe curves for elliptic-curve cryptography](http://safecurves.cr.yp.to).
[^4]: Bernstein D., Duif N., Lange T., Schwabe P., Yang B. 2012. [High-speed high-security signatures](https://decred.org/research/bernstein2012.pdf).
[^5]: Osuntokun O. 2015. [OP_SCHNORRCHECKSIG: Exploring Schnorr Signatures as an alternative to ECDSA for Bitcoin](https://decred.org/research/osuntokun2015.pdf).
[^6]: Petersen T. 1992. [Distributed provers and verifiable secret sharing based on the discrete logarithm problem](https://decred.org/research/petersen1992.pdf).
[^7]: Stinson D. and Strobl R. 2001. Provably secure distributed Schnorr signatures and a (t,n) threshold scheme for implicit certificates.
