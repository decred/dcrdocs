# <i class="fa fa-life-ring"></i> Stake Pools 

---

#### 1. ¿Existen otros beneficios para una piscina de estaca aparte de no necesitar ejecutar un nodo completo y mantener su cartera desbloqueada? Por ejemplo, ¿tendrá una mejor oportunidad de ganar o algo así?

Las piscinas de estacas generalmente implementarán la redundancia multi-billetera al tener muchas carteras distribuidas físicamente en todo el mundo. Esto significa que hay menos posibilidades de un voto
que se pierda porque una cartera este debajo. También reduce la latencia entre la cartera y la red, lo que puede reducir la posibilidad de que se pierda un voto.

---

#### 2. ¿Una stakepool divide la recompensa entre todos los participantes (% basado en la cantidad de tickets que envió a la piscina)?

Es técnicamente posible crear una piscina que soporte la división proporcional de recompensas [^9262], pero la implementación actual de la referencia de stakepool `dcrstakepool` no permite esto. Simplemente vota en su nombre. Esto lo hace al hacer que los derechos de voto de los tickets sean una script P2SH multi-firma de 1-de-2. Las firmas de piscina de voto con su clave privada al momento en que sea seleccionado el ticket. Puesto que se trata de un script de multi-firma de 1-de-2, significa que si el grupo no pudo votar por usted por alguna razón (extremadamente improbable, ya que el grupo mainnet tendrá múltiples redundancias y failover en automático), todavía sería posible votar en su propio nombre porque tiene la segunda clave privada y por lo tanto podría proporcionar una firma válida y satisfacer el requisito 1-de-2.

Además, es importante tener en cuenta que la compra del ticket original contiene el compromiso de ir a una dirección de recompensa para la cual solo usted tiene la clave privada. Las pruebas de estaca del consenso de voto imponen el compromiso, por lo que es imposible para la piscina robar sus fondos.

Con el fin de dividir las recompensas de la piscina tendría que ser el recipiente de todas las recompensas y luego se confía en dividir correctamente las recompensas entre todos los participantes de acuerdo a su proporcionalidad. Se espera que tal esquema se desarrolle con el entendimiento de que es menos seguro que el enfoque que el diseño de la actual piscina usa.

---

#### 3. Tengo que ejecutar mi cartera para comprar tickets, pero ¿votarán adecuadamente sin mí si lo cierra y la piscina me vota en su lugar?

Sí [^9274], eso es correcto. Sólo necesita ejecutar su cartera para gastar sus monedas para comprar el ticket que delega sus derechos de votación a la piscina que luego votará en su nombre. La dirección de recompensa es un compromiso consensuado en la compra de tickets para una de sus propias direcciones para las cuales solo tiene la clave privada.

---

#### 4. ¿Hay algún problema que pudiera surgir si una piscina de estacas tiene demasiadas personas? Por ejemplo, la fuerza de votación un bloque dentro o fuera?

Ciertamente es posible [^9311], pero una de las cosas que todos los grupos deberían apoyar es permitir que cada usuario seleccione sus preferencias de votación individuales. De esa manera, cada vez que su ticket sube y los votos de la piscina en su nombre, votará de acuerdo a sus preferencias.

---

#### 5. ¿Están los bits de votación establecidos al comprar un ticket o cuando su ticket se llama para votar? ¿Esto cambia cuando está en una stakepool?

Los bits de voto se establecen cuando usted realmente vota [^13607] (lo cual realmente sólo tiene sentido porque usted podría haber comprado el ticket semanas o meses antes de que exista una agenda de votación específica).

Un stakepool puede funcionar como quiera, ya que hay mucho espacio para la flexibilidad debido a la forma en que el plan de compromiso de compra de tickets está diseñado. Dicho esto, en general, la gente debería evitar el uso de piscinas de estacas que no les permitan controlar cómo quieren votar sobre temas no específicos de la agrupación.

---

#### 6. ¿Qué medidas de seguridad existen para impedir que los propietarios de piscinas desaparezcan con los fondos de la piscina?

El diseño de la piscina actual es tal que la piscina NO puede robar los fondos [^14593]. Usted sólo está delegando los derechos de voto (y en realidad es un 1-de-2 multisig lo que significa que usted o la piscina puede votar). La compra de tickets contiene un compromiso consensuado para la dirección final del subsidio, por lo que simplemente no hay forma de que el grupo robe los fondos.

Lo peor que sucedería si un propietario de la piscina desaparece es que los votos se perderán, lo que resulta en la revocación del billete que a su vez hace que las monedas originales vuelvan al propietario de la moneda original (menos la tarifa de transacción inicial por supuesto). Sin embargo, como se mencionó anteriormente, debido a que el billete es un 1-de-2 multisig, cada usuario podría ejecutar su propia cartera para votar en caso de desaparecer el propietario de la piscina.

---

#### 7. ¿Dónde puedo ver un ejemplo de billete de grupo de estacas en el explorador de bloques?

Las agrupaciones de estacas implican direcciones 'Dc', ya que la piscinas de estacas usa direcciones de hash de pago a script [^17515]. Por ejemplo, vea txid: [c0abc0ec63a8de15550f067e2b6fde28f0432fb91b938574b282daa69f914103](https://mainnet.decred.org/tx/c0abc0ec63a8de15550f067e2b6fde28f0432fb91b938574b282daa69f914103).

Continue en [PoS Voting Tickets FAQ](/faq/proof-of-stake/voting-tickets.md)

---

## <i class="fa fa-book"></i> Fuentes

[^9262]: Decred Forum, [Post 9,262](https://forum.decred.org/threads/626/#post-9262)
[^9274]: Decred Forum, [Post 9,274](https://forum.decred.org/threads/626/#post-9274)
[^9311]: Decred Forum, [Post 9,311](https://forum.decred.org/threads/582/page-2#post-9311)
[^13607]: Decred Forum, [Post 13,607](https://forum.decred.org/threads/1236/#post-13607)
[^14593]: Decred Forum, [Post 14,593](https://forum.decred.org/threads/1321/#post-14593)
[^17515]: Decred Forum, [Post 17,515](https://forum.decred.org/threads/1289/#post-17515)
