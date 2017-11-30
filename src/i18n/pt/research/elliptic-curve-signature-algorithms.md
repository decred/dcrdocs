# ECDSA, Algoritmo de Assinatura Digital de Curvas Elípticas.

---

Embora secp256k1 seja amplamente considerado como tendo uma escolha segura de parâmetros de curva elíptica, algumas questões sobre a origem da curva permanecem. Por exemplo, a seleção da curva de Koblitz,

\((y^2 + xy = x^3 + ax^2 + b \text{ and } a = a^2 \text{, } b = b^2 \text{; } a = 1 \text{ or } 2 \text{, } b != 0)\)

Normalmente é feito enumerando a extensão binária de Galois fields \(GF(2^m)\) onde \(m\) é um primo na escala {\(0\), \(...\), higher limit} e \(x,y \in GF(2^m)\)[^1]. Para segurança 128-bit, \(m\) é requerido para ser \(\geqslant 257\) e tipicamente o menor primo possivel nesta escala e facilita o cálculo rápido. Neste argumento, a escolha óbvia para \(m\) is \(277\text{, } a = 0\); apesar da existência deste valor apropriado de $m$ que está sendo conhece pelos curators dos parâmetros da curva[^2] e o fato que era o mais computacionalmente a solução eficiente, os parâmetros \(m = 283\) e \(a = 0\) foram selecionados fora de três opções possíveis:

 \((m = 277\text{, } a = 0\text{; } m = 283\text{, } a = 0\text{; } m = 283\text{, } a = 1)\).

Para todas especificações restantes da curva de Koblitz, o mais óbvio \(m \) o valor é selecionado. Embora isto seja curioso, não há nenhum ataque conhecido que pode ser aplicado usando um valor ligeiramente maior de $m$ para o campo de Galois. Outras objeções aos parâmetros usados por secp256k1 foram também levantados[^3].

Um outro algoritmo digital extremamente popular da assinatura (DSA) com 128-bits da segurança é Ed25519[^4]. Isto usa o algoritmo assinando EdDSA sobre um equivalente da curva birationally a Curve25519 e é empregado extensamente hoje. Ao contrário de secp256k1 ECDSA, Ed25519 usa assinaturas mais simples de Schnorr que provavelmente sejam seguras em um modelo de oráculo aleatório(veja: [Schnorr Signatures](schnorr-signatures.md)).

As assinaturas de Schnorr foram propostas também para Bitcoin[ ^5]. Entretanto, em vez de usar um código OP exclusivo às assinaturas de Schnorr que utilizam os parâmetros da curva para secp256k1, Decred em vez disso, usa um novo código OP OP_CHECKSIGALT para verificar um número ilimitado de novos esquemas de assinatura. Na implementação atual, as assinaturas de secp256k1 Schnorr e as assinaturas Ed25519 estão disponíveis para suplementar assinaturas de secp256k1 ECDSA. No futuro, é trivial adicionar esquemas novos da assinatura em um soft fork, tal como aqueles que são segurança quantum. Ter estes dois suites de Schnorr disponíveis permite também a geração das assinaturas simples do grupo que ocupem o mesmo espaço de uma assinatura normal[^6], que para ambos é implementado. No futuro, as assinaturas do ponto inicial que usam dealerless secret  permitirão também habilitar t-of-n as assinaturas do ponto inicial que ocupam a mesma quantidade de espaço[^7].

---

## <i class="fa fa-book"></i> Referências 

[^1]: Pornin T. 2013. [StackExchange Cryptography: Should we trust the NIST-recommended ECC parameters?](https://decred.org/research/pornin2013.pdf)
[^2]: Solinas J. 2000. [Efficient arithmetic on Koblitz curves](https://decred.org/research/solinas2000.pdf).
[^3]: Bernstein D. and Lange T. 2014. [SafeCurves: Choosing safe curves for elliptic-curve cryptography](http://safecurves.cr.yp.to).
[^4]: Bernstein D., Duif N., Lange T., Schwabe P., Yang B. 2012. [High-speed high-security signatures](https://decred.org/research/bernstein2012.pdf).
[^5]: Osuntokun O. 2015. [OP_SCHNORRCHECKSIG: Exploring Schnorr Signatures as an alternative to ECDSA for Bitcoin](https://decred.org/research/osuntokun2015.pdf).
[^6]: Petersen T. 1992. [Distributed provers and verifiable secret sharing based on the discrete logarithm problem](https://decred.org/research/petersen1992.pdf).
[^7]: Stinson D. and Strobl R. 2001. Provably secure distributed Schnorr signatures and a (t,n) threshold scheme for implicit certificates.
