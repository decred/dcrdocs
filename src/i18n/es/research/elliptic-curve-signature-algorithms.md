# Algoritmos de Firma de la Curva Elíptica

---

Aunque secp256k1 se considera ampliamente que tiene una elección segura de los parámetros de la curva elíptica, algunas preguntas sobre el origen de la curva se mantienen. Por ejemplo, la selección de la curva de Koblitz,

\((y^2 + xy = x^3 + ax^2 + b \text{ and } a = a^2 \text{, } b = b^2 \text{; } a = 1 \text{ or } 2 \text{, } b != 0)\)

Se hace típicamente enumerando los campos Galois de extensión binaria \(GF(2^m)\) donde \(m\) es un primo en el rango {\(0\),\(...\), límite superior} y \(x,y\ en GF(2^m)\)[^1]. Para la seguridad de 128 bits, se requiere que \(m\) sea \(\geqslant 257\) y normalmente el primo más pequeño posible en este rango para facilitar el cálculo rápido. En este caso, la elección obvia para \(m\) es \(277\text {,} a = 0\); A pesar de que los curadores de los parámetros de la curva [^2] conocían el valor apropiado de $m$ y el hecho de que era la solución más eficiente desde el punto de vista computacional, los parámetros \(m = 283\) y \ (a = 0\) Se seleccionaron entre tres posibles opciones:

 \((m = 277\text{, } a = 0\text{; } m = 283\text{, } a = 0\text{; } m = 283\text{, } a = 1)\).

Para todas las demás especificaciones de la curva Koblitz, se selecciona el valor \(m\) más obvio. Aunque esto es curioso, no hay ataques conocidos que se puedan aplicar usando un valor $m$ más grande para el campo de Galois. Otras objeciones a los parámetros utilizados por secp256k1 también se han planteado [^3].

Otro algoritmo de firma digital extremadamente popular (DSA) con 128 bits de seguridad es Ed25519 [^4]. Esto utiliza el algoritmo de firma de EdDSA sobre una curva birralmente equivalente a Curve25519 y se emplea extensamente hoy. A diferencia del ECDSA de secp256k1, Ed25519 utiliza firmas Schnorr más sencillas que son probadamente seguras en un modelo de oráculo aleatorio (Ver: [Schnorr Signatures](schnorr-signatures.md)).

Las firmas Schnorr también se han propuesto para Bitcoin [^5]. Sin embargo, en lugar de utilizar un código OP exclusivo a las firmas de Schnorr utilizando los parámetros de la curva para secp256k1, Decred utiliza un nuevo código OP OP_CHECKSIGALT para verificar un número ilimitado de nuevos esquemas de firma. En la implementación actual, las firmas secp256k1 Schnorr y las firmas Ed25519 están disponibles para complementar las firmas secp256k1 ECDSA. En el futuro, es trivial agregar nuevos esquemas de firma en una bifurcación suave, como los que son cuánticamente seguros. Tener estas dos suites Schnorr disponibles también permite la generación de firmas de grupo simple que ocupan el mismo espacio de una firma normal [^ 6], que para ambos se implementa. En el futuro, las firmas de umbral que usan la función de intercambio secreto sin distribuidor también permitirán que las firmas umbral de t-of-n ocupen la misma cantidad de espacio [^7].

---

## <i class="fa fa-book"></i> Referencias 

[^1]: Pornin T. 2013. [StackExchange Cryptography: Should we trust the NIST-recommended ECC parameters?](https://decred.org/research/pornin2013.pdf)
[^2]: Solinas J. 2000. [Efficient arithmetic on Koblitz curves](https://decred.org/research/solinas2000.pdf).
[^3]: Bernstein D. and Lange T. 2014. [SafeCurves: Choosing safe curves for elliptic-curve cryptography](http://safecurves.cr.yp.to).
[^4]: Bernstein D., Duif N., Lange T., Schwabe P., Yang B. 2012. [High-speed high-security signatures](https://decred.org/research/bernstein2012.pdf).
[^5]: Osuntokun O. 2015. [OP_SCHNORRCHECKSIG: Exploring Schnorr Signatures as an alternative to ECDSA for Bitcoin](https://decred.org/research/osuntokun2015.pdf).
[^6]: Petersen T. 1992. [Distributed provers and verifiable secret sharing based on the discrete logarithm problem](https://decred.org/research/petersen1992.pdf).
[^7]: Stinson D. y Strobl R. 2001. Probablemente las firmas Schnorr distribuidas seguras y un esquema de umbral (t, n) para los certificados implícitos.
