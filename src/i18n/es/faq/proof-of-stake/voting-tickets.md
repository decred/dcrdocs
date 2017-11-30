# Tickets de votación

---

#### 1. ¿Cuándo comenzó la votación de prueba de estaca?

La votación de prueba-de-estaca comenzó [^7969] en el bloque 4.096.

---

#### 2. En el código fuente TicketPoolSize se establece en 8.192, pero el tamaño de la piscina de tickets actuales es mayor que eso. ¿Por qué?

Es intencional y es parte integral del ajuste dinámico del precio del ticket [^8965]. El `TicketPoolSize` es el tamaño de la piscina de ticket de destino y funciona muy similar a la dificultad de destino para la prueba de trabajo (PoW). El hecho de que el tamaño actual de las piscinas de tickets es mayor que el objetivo es lo que hace que el precio del ticket suba, que a su vez eventualmente causará que menos tickets puedan ser comprados y el resultado en el número de tickets en la piscina reduciendo hacia al objetivo. Si cae por debajo, el precio caerá para animar más ventas del ticket para aumentar el número de tickets en la piscina hacia el objetivo.

---

#### 3. Si no tengo suerte y mi ticket caduca sin votar, ¿pierdo la tarifa de transacción?

Sí [^9806].

---

#### 4. La votación en mainnet estuvo en 'retención' hasta el bloque 4.096, con gente comprando tickets. ¿Significa esto que habrá un riesgo significativamente mayor de que estos tickets expiren?

No [^9806], el tiempo de caducidad no se inicia hasta que un ticket se extrae en un bloque. Los boletos estaban sentados en la piscina de memoria hasta que pudieran ser incluidos en bloques empezando con el bloque 4.096.

---

#### 5. ¿Qué sucede si ninguno (o menos de 3) de los votantes seleccionados emite sus transacciones ssgen?

Los votos siempre están determinados por la punta actual. Los mineros no comienzan a minar para un nuevo bloque hasta que por lo menos 3+ de los votantes seleccionados emitan sus transacciones de ssgen. Por lo tanto, si un bloque encontrado no logra obtener los votos seleccionados [^ 10219], el bloque es simplemente huérfano por el siguiente bloque que encuentra otro minero.

Para un ejemplo más concreto, supongamos que la punta de cadena actual está en el bloque 5.000. Los votantes determinados por el bloque 5.000 ya han presentado sus votos, por lo que los mineros están chugging lejos buscando el bloque 5,001. Ahora, un minero encuentra una solución para el bloque 5,001 y lo envía a la red. Todos los daemons (y, por lo tanto, billeteras) verán que sólo se han presentado 5,001. Sin embargo, los mineros no comienzan de inmediato la minería de 5,001. En su lugar continúan minando de 5.000 hasta 3+ votos para el bloque de 5.001 que aparecen. En ese punto todos ellos cambian y comienzan la minería de 5,001. Si esos votos de 3+ nunca aparecen, otro bloque candidato 5,001 será encontrado por los otros mineros que aún trabajan en el bloque 5000, quienes presentarán su (diferente) solución para el bloque 5,001 a la red. Puesto que cada uno de estos nuevos bloques candidatos para 5,001 tiene un hash diferente, se seleccionan diferentes tickets.

---

#### 6. ¿Qué sucede si un ticket que tuve perdió un voto?

Su billetera revocará automáticamente el ticket en el bloque después de que se haya perdido [^13912], por lo que los devolverá justo después de que se perdieran como fondos inmaduros (lo que significa que no se gastarán en 256 bloques cuando maduren).

Por ejemplo:

```no-highlight
dcrctl --wallet getstakeinfo
```

Salida          | Descripción
---             |---
`allmempooltix` | Todos los tickets de estaca en la piscina de memoria (a la espera de ser extraído en un bloque).
`ownmempooltix` | Sus tickets de estaca en la piscina de memoria (a la espera de ser extraído en un bloque).

---

#### 7. ¿Cuál es la diferencia entre un ticket perdido y revocado?

Los tickets perdidos son tickets que fueron llamados a votar, pero no lo hicieron. Después de que un ticket se ha perdido, puede ser revocado [^14763]. La billetera revoca automáticamente las entradas perdidas que controla (asumiendo que está desbloqueada para poder firmar la transacción de revocación).

Todo `rebroadcastmissed` es decirle a la billetera que le pida al daemon de la red (`dcrd`) que le dé la lista de entradas perdidas de nuevo para comprobar si alguna necesita ser revocada. Típicamente esto no es necesario a menos que, por ejemplo, un intento de revocar un ticket se haya hecho pero falló porque la billetera estaba bloqueada. En otras palabras, si observa que se revocó no equivale a la perdida, puede que necesite `rebroadcastmissed`. Como se dijo, sin embargo, rara vez es necesario para esto, ya que la billetera automáticamente lo hace en el arranque y busca tickets perdidos en cada bloque.

Continúe con [Minería de prueba de trabajo] (/mining/proof-of-work.md)

---

## <i class="fa fa-book"></i> Fuentes

[^7969]: Decred Forum, [Post 7,969](https://forum.decred.org/threads/531/#post-7969)
[^8965]: Decred Forum, [Post 8,965](https://forum.decred.org/threads/531/page-2#post-8965)
[^9806]: Decred Forum, [Post 9,806](https://forum.decred.org/threads/180/page-6#post-9806)
[^10219]: Decred Forum, [Post 10,219](https://forum.decred.org/threads/180/page-6#post-10219)
[^13912]: Decred Forum, [Post 13,912](https://forum.decred.org/threads/1271/#post-13912)
[^14763]: Decred Forum, [Post 14,763](https://forum.decred.org/threads/1335/#post-14763)
