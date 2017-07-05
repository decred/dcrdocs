# BLAKE-256 Función de Hash

---

SHA256, utilizado en Bitcoin, tiene una número de deficiencias técnicas debido a su construcción Merkle-Damgård. Estas vulnerabilidades llevaron a la competencia SHA3 para una nueva función de hash basada en una construcción fundamental diferente. Decred ha elegido BLAKE256 como su función hash, un finalista para la competición [^1] [^2]. La función hash se basa en una construcción HAIFA que incorpora una variación de la cifra de flujo ChaCha por Bernstein. La función hash es notable por su alto rendimiento en microarquitectura x86-64, siendo más rápido para mensajes cortos que SHA256 [^3] a pesar de ser considerado tener un margen de seguridad mucho mayor en 14 rondas.

---

## <i class="fa fa-book"></i> Referencias 

[^1]: Aumasson J., Henzen L., Meier W., Phan R. 2010. [SHA-3 proposal BLAKE](https://decred.org/research/aumasson2010.pdf).
[^2]: Aumasson J., Henzen L., Meier W., Phan R. 2014. The hash function BLAKE.
[^3]: Bernstein D. and Lange T. 2013. [eBACS: ECRYPT benchmarking of cryptographic systems](http://bench.cr.yp.to).
