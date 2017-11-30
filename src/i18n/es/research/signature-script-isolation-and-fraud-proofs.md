# Aislamiento de scripts de firma y pruebas de fraude

---

Para evitar la maleabilidad de la transacción, la capacidad de generar una transacción con las mismas referencias de entrada y salidas y aún un ID de transacción diferente, los scripts de entrada se han eliminado del cálculo del hash de transacción. Los orígenes de esta modificación han sido controvertidos, aunque parece haber sido implementado en ambas monedas de CryptoNote y sidechains en el pasado [^1] [^2]. Ahora se está proponiendo para Bitcoin como una bifurcación suave llamada "testigo segregado" [^3]. Al igual que en la implementación de los Elementos sidechains, los compromisos con los datos de los testigos están incluidos en el árbol merkle del bloque [^2]. Además, las pruebas de fraude, como se sugiere para el bifurcado suave de Bitcoin [^3], son establecidas por los mineros y también se comprometen a formar parte de los datos en el árbol merkle.

---

## <i class="fa fa-book"></i> Referencias

[^1]: von Saberhagen N. 2013. [CryptoNote v2.0](https://decred.org/research/saberhagen2013.pdf).
[^2]: Maxwell G. 2015. [Traer nuevos elementos a Bitcoin con sidechains] (https://decred.org/research/maxwell2015.pdf).
[^3]: Wuille P. 2015. [testigo separado de Bitcoin] (https://prezi.com/lyghixkrguao/segregated-witness-and-deploying-it-for-bitcoin/).
