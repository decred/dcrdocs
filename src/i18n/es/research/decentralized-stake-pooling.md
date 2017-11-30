# Agrupamiento de Estacas Descentralizadas

---

Una cuestión que surge de los anteriores diseños de PoS es cómo realizar la performa de agrupaciones en la minería PoS análoga a PoW minería de agrupación.

Decred resuelve este problema permitiendo múltiples entradas en una transacción de compra de tickets y comprometiéndose a la cantidad de subsidio UTXO para cada entrada proporcionalmente, mientras tambien se compromete a una nueva clave pública de salida o script para estas recompensas proporcionales. El subsidio se otorga entonces a los que generan el ticket de una manera sin fiar, y el ticket puede ser firmado al redondeo por robin antes de ser enviado a la red. Es importante destacar que el control sobre la producción del voto en sí se da a otra clave pública o script que no puede manipular la subvención dada a los destinatarios. La producción del voto de una manera distribuida se puede lograr usando una script en el ticket que permita a firmantes múltiples.
