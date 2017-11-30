# Extensiones de script

---

Aparte de los anteriormente mencionados OP_CHECKSIGALT y OP_CHECKSIGALTVERIFY, se han realizado otras modificaciones a los scripts de Bitcoin. Un byte de la versión a sido agregado a los scripts de salida para permitir el bifurcación suave y simple a los nuevos lenguajes de los scripting, como primer sugerido por Wuille [^ 1]. Todos los códigos OP relacionados con matemáticas y lógica han sido reactivados y ahora operan en registros int32. Varios manipulaciones de la cadena de bytes los códigos OP también se han implementado y vuelto a habilitar. Los códigos OP restantes de Bitcoin no utilizados han sido reutilizados para futuros forks blandos. Algunos errores de larga data en el lenguaje de secuencias de comandos Bitcoin también han sido arreglados [^2] [^3].

---

## <i class="fa fa-book"></i> References

[^1]: Wuille P. 2015. [testigo separado de Bitcoin] (https://prezi.com/lyghixkrguao/segregated-witness-and-deploying-it-for-bitcoin/).
[^2]: Todd P. [La dificultad de escribir un código de consenso crítico: El error SIGHASH_SINGLE] (https://decred.org/research/todd2014.pdf).
[^3]: Franco P. Understanding Bitcoin, 6.3: Multisignature (M-of-N) Transactions.
