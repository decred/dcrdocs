# Diseño híbrido

---

El mayor contraste con el esquema de seguir el satoshi descrito anteriormente[^1]  es un nuevo sistema de lotería en el que los boletos deben ser comprados y luego esperar en un período de madurez antes de que puedan ser seleccionados y gastados. La selección de tickets para un bloque se realiza lexicográficamente a partir de un grupo de tickets maduros basado en la pseudorandomenesis contenida en el encabezado de bloque. Dado que la manipulación de esta pseudorandomenesis es difícil en un sistema PoW, la manipulación de la selección de billetes se asocia con un costo fundamental para el minero PoW. La selección de tickets durante un período de tiempo puede describirse mediante una función de densidad de probabilidad similar a la probabilidad de obtener un bloque en PoW a una velocidad de hash constante a lo largo del tiempo en una dificultad constante [^2], produciendo una distribución de probabilidad con un modo aproximadamente Igual a la mitad del tamaño del billete. El precio para comprar un ticket es regulado por una nueva dificultad de la estaca que es determinada por el promedio ponderado exponencial de los tickets comprados y el tamaño de la piscina madura del ticket en bloques anteriores.

La validación de los bloques PoW se explica por los siguientes pasos:

1. Un bloque es minado por un minero PoW, que selecciona las transacciones para poner dentro de él. Las transacciones relacionadas con el sistema de estaca se insertan en el conjunto UTXO.
2. Los mineros PoS votan en el bloque produciendo una transacción de voto de su ticket. El voto permite que se construya un bloque en la parte superior del bloque anterior y se selecciona si el árbol de transacciones regular anterior (que contiene las transacciones coinbase y no relacionadas con la estaca) es válido.
3. Otro minero PoW comienza a construir un bloque, insertando los votos de los mineros PoS. La mayoría de los votos emitidos deben ser incluidos en el siguiente bloque para que el bloque sea aceptado por la red. De las transacciones de votación en este nuevo bloque, el minero de PoW comprueba una bandera para ver si el minero de PoS indicó si el árbol de transacción regular del bloque era válido. Estos indicadores de votación se registran y, según el voto de la mayoría, se establece un indicador de bits en este bloque para indicar si el árbol de transacciones regular del bloque anterior es válido.
4. Se encuentra un nonce que satisface la dificultad de la red, y el bloque se inserta en la cadena de bloques. Si el árbol de transacciones regular del bloque anterior fue validado, inserte estas transacciones en el conjunto UTXO. Vaya a 1.

Para desalentar la manipulación de los votos incluidos, se aplica una penalización lineal de subsidio al bloque actual si no incluyen todas las transacciones de votación en su bloque. La penalidad "blanda" de invalidar el árbol de transacción anterior ayuda a evitar el descarte del trabajo, que es necesario para asegurar el sistema, y ​​hace la suposición de que el siguiente bloque será obtenido por un minero que no está interesado en preservar el subsidio del anterior bloque en favor de los suyos. Incluso en el caso de que esto no sea cierto, un minero malicioso con una alta tasa de hash todavía necesitará por lo menos \((\text{número para mayoría}/2)+1\) votos a favor del árbol de transacciones de su bloque anterior en Con el fin de producir un bloque que les dé cualquier subsidio del bloque anterior.

Las banderas de bits se agregan explícitamente tanto al encabezado de bloque como a los votos para que cualquiera de los mineros pueda votar fácilmente en nuevas bifurcaciones duras o suaves.

---

## <i class="fa fa-book"></i> Referencias 

[^1]: Bentov I., Lee C., Mizrahi A., Rosenfeld M. 2014. [Proof-of-activity: Extending Bitcoin's proof-of-work via proof-of-stake](https://decred.org/research/bentov2014.pdf).
[^2]: Nakamoto S. 2008. [Bitcoin: A peer-to-peer electronic cash system](https://decred.org/research/nakamoto2008.pdf).
