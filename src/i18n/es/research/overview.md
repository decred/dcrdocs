# <i class="fa fa-info-circle"></i> Visión general

---

Los protocolos distribuidos de estampación de tiempo se aplicaron por primera vez a la descentralización de una red financiera en el innovador documento sobre Bitcoin por Nakamoto [^1]. El campo ha visto el seguimiento de la investigación explosiva de aficionados y profesionales, que compiten para ofrecer extensiones, ajustes, mejoras y perfeccionamientos del protocolo existente. Las implementaciones notables de nuevas ideas incluyen Ethereum [^2], que extendió scripting, CryptoNote [^3], que refinó la privacidad, y Sidechains [^4], que investigó las clavijas de dos vías con 1:1 Bitcoin tokens. Estos protocolos utilizan la prueba de trabajo (PoW) como se describió originalmente en el whitepaper de Bitcoin.

Una extensión común al protocolo Bitcoin modifica el mecanismo de consenso para utilizar total o parcialmente la prueba de estaca (PoS), o el uso de una estaca (tokens) en lugar de su poder de computación para participar en el proceso de estampación de tiempo. El primer Blockchain de prueba de estaca basada en el protocolo Bitcoin fue implementada en 2012 por King y Nadal [5], e incluye PoW y PoS que se inclinan gradualmente hacia PoS completo con el tiempo. Las críticas a los sistemas puros de consenso PoS han sido abundantes [6] [7], con la oposición más vehemente procedente de aquellos que trabajan con los blockchains puramente PoW. El argumento más común contra el PoS para el estampado de tiempo distribuido es "nada en la estaca" o "simulación sin costo", describiendo la inestabilidad sistemática resultante de que las partes interesadas puedan generar historias temporalmente sin costo para ellas mismas.

A pesar de la controversia, es evidente que los sistemas con una superposición PoS dependiente de un sistema de registro de tiempo PoW pueden ser capaces de lograr un consenso independiente. Esto es explorado matemáticamente por Bentov y colegas [^8] en un documento sobre su esquema, prueba de actividad (PoA), y parece ser una extensión viable a los protocolos PoW que pueden permitir algunas nuevas propiedades interesantes. Un diseño similar llamado MC2 fue propuesto anteriormente por Mackenzie en 2013 [^9]. Aquí describimos la construcción e implementación de un sistema similar de consenso que hemos denominado "Decred".

El trabajo de investigación en Decred se organiza actualmente en torno a las subsecciones siguientes:

* [Diseño híbrido](hybrid-design.md)
* [Pooling de Estacas Descentralizadas](decentralized-stake-pooling.md)
* [Algoritmos de Firma de la Curva Elíptica](elliptic-curve-signature-algorithms.md)
* [BLAKE-256 Hash Function](blake-256-hash-function.md)
* [Extensiones de Script](script-extensions.md)
* [Aislamiento de scripts de firma y pruebas de fraude](signature-script-isolation-and-fraud-proofs.md)
* [Extensiones de transacciones](transaction-extensions.md)
* [Firmas Schnorr ](schnorr-signatures.md)
* [Varias mejoras ](miscellaneous-improvements.md)

## <i class="fa fa-book"></i> Referencias 

[^1]: Nakamoto S. 2008. [Bitcoin: A peer-to-peer electronic cash system](https://decred.org/research/nakamoto2008.pdf).
[^2]: Buterin V. 2014. [A Next-generation smart contract and decentralized application platform](https://decred.org/research/buterin2014.pdf).
[^3]: von Saberhagen N. 2013. [CryptoNote v2.0](https://decred.org/research/saberhagen2013.pdf).
[^4]: Back A., Corallo M., Dashjr L., Friedenbach M., Maxwell G., Miller A., Poelstra A., Timon A., Wuille P. 2014. [Enabling Bitcoin innovations with pegged sidechains](https://decred.org/research/back2014.pdf).
[^5]: King S. and Nadal S. 2012. [PPCoin: Peer-to-peer crypto-currency with proof-of-stake](https://decred.org/research/king2012.pdf).
[^6]: Bentov I., Gabizon A., Mizrahi A. 2015. [Cryptocurrencies without proof-of-work](https://decred.org/research/bentov2015.pdf).
[^7]: Poelstra A. 2015. [On stake and consensus](https://decred.org/research/poelstra2015.pdf).
[^8]: Bentov I., Lee C., Mizrahi A., Rosenfeld M. 2014. [Proof-of-activity: Extending Bitcoin's proof-of-work via proof-of-stake](https://decred.org/research/bentov2014.pdf).
[^9]: Mackenzie A. 2013. [MEMCOIN2: A hybrid proof-of-work, proof-of-stake crypto-currency](https://decred.org/research/mackenzie2013.pdf).
