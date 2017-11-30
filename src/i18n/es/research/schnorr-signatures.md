# Firmas Schnorr 

---

Se han propuesto firmas Schnorr para Bitcoin. También se han utilizado extensivamente en otras criptomonedas, tales como monedas de Nxt y de CryptoNote. En el caso más sencillo, un criptosistema ECDSA de firma Schnorr puede describirse como lo que sigue:

1. \(y = xG\) donde \(y\) es el punto de clave pública en la curva, \(x\) es el escalar privado,    \(G\) es el generador de curva.
2. \(r = kG\) donde \(r\) es el punto de la curva resultante de la multiplicación de \(k\), el nonce scalar, para el generador.
3. \(h = H (M || r)\) donde \(H\) es una función de hash seguro, \(M\) es el mensaje (usualmente un hash de 32 bytes) y \(r\) es el punto codificado previamente descrito. \(||\) denota concatenación.
4. \(S = k - hx \) donde \(s\) es el escalar denotado de \(k - hx\).
5. La firma es \((r, s)\), y la verificación es simplemente \(H(M || r) == hQ + sG\).

En lo anterior, las multiplicaciones por una letra capital (por ejemplo, \(kG\)) son multiplicaciones puntuales para una escala, y por lo tanto siempre dan un resultado a un punto en la curva. La adición de estos puntos da lugar a otro punto. Las adiciones y multiplicaciones de escalares entre sí son las mismas que la multiplicación regular que harías con cualquier integro. Es importante notar que la multiplicación de un punto por un escalar se considera un paso irreversible, porque el cálculo del escalar desde el nuevo punto por defecto es el problema de logaritmo discreto.

De lo anterior está claro que \(r\) es un punto de la curva, mientras que \(s\) es un escalar. Considere el grupo de firmantes representado por \(x_{suma} = x_1 + ... + x_n\) con nonces \(k_{sum} = k_1 + ... + k_n\). La clave pública para la suma escalar privada sería: \ (y = x_ {sum} G \). La firma de estas sumas (de todos los participantes del grupo) sería: \(r'= k_{suma} G s' = k_{sum} - h x_{sum}\). Para generar esta firma todos los participantes tendrían que compartir su clave privada y nonces de antemano. Evidentemente, queremos evitar esto, así que en vez de eso, permítanos que cada participante cree una firma parcial. \(r_n = k_1 G + ... + k_n G = r'\) (la suma de los puntos nonce públicos, que los participantes pueden publicar libremente individualmente) \(s_n = k_n - h x_n\). Sustituyendo esto en las fórmulas generales de las firmas y usando la adición puntual o escalar: \(r = r_n = r'\) (igual que arriba) \(s = s_1 + ... + s_n = s'\) Además, debe ser cierto que \((k_1 - h x_1) + ... + (k_n - h x_n) = s_1 + ... + s_n = s')\). Haciendo una firma m-of-n no es trivial. Se ha sugerido que para estos casos se utilice un árbol merkle que contenga todas las sumas de clave pública posibles para los participantes \(m\), generando un \(log (n)\) tamaño de firma[28].

---

## <i class="fa fa-book"></i> Referencias 

[^1]: Wuille P. 2015. [Firmas de árboles: Multisig sobre esteroides utilizando firmas de árboles] (https://decred.org/research/wuille2015.pdf).
