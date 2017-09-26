# <i class="fa fa-male"></i> Solo Minería

---

#### 1. ¿Necesito el poder hash para estacar la mina?

La Estaca "minería" no necesita ningún poder hash [^ 9304]. Piense en ello un poco como el interés en las monedas invertidas. Usted bloquea sus monedas por un período de tiempo para comprar un ticket que le da una probabilidad alta (> 99%) de obtener derechos de voto y recibir intereses a cambio de emitir un voto y el costo de oportunidad de no poder usar esas monedas para potencialmente hasta ~ 4.7 meses.

Si ya ha comprado tickets de estacas, esas monedas están bloqueadas hasta que los tickets ganen o expiren. Usted está staking en solitario y por lo tanto DEBE mantener su billetera en línea las 24/7 hasta que todos sus tickets hayan ganado (o expirado) o usted perderá hacia fuera las recompensas puesto que usted no puede emitir un voto si la billetera no está en línea. Debido a que las monedas están bloqueadas, no hay forma de cambiar las monedas ya apostadas ahora.

El pool de estacas, por otro lado, le permite delegar sus derechos de voto a la piscina por lo que es responsable de estar en línea las 24 horas del día, los 7 días de la semana y votar por usted.

---

#### 2. ¿No es una de las razones principales para la minería de estacas para asegurar que siempre hay una cantidad suficiente de pares en línea?

Definitivamente no [^ 9311]. La minería de estacas no puede hacer cumplir eso. Una cartera de estilo SPV podría realizar fácilmente el estacado necesario comunicándose con otros nodos completos (instancias `dcrd`) en la red. Es cierto que la cartera actual requiere `dcrd` para ejecutarse, pero que no siempre será el caso.

Incluso si el software intentara imponerlo, no se podía impedir que la gente escribiera utilidades y lo hiciera a través de la red peer-to-peer sin necesidad de ejecutar su propia instancia local de todos modos.

---

#### 3. ¿Qué sucede si mi cartera está inaccesible o bloqueada cuando mis entradas son seleccionadas por los mineros?

Si su cartera está desconectada o bloqueada [^ 9806] cuando se seleccionan sus tickets, pierde los premios y su ticket se quita de la piscina inmediatamente. No hay "redos".

---

#### 4. ¿Puedo probar de alguna manera si mi máquina está accesible para votar? En otras palabras, ejecutar las acciones de un minero que querría conseguir mi voto.

Usted no necesita ser accesible. La votación es determinista sobre una base por bloque [^ 9806]. Es decir que su billetera sabrá si su ticket se selecciona en función del bloque actual y luego se emite una "transacción de voto" (transacción ssgen) a la red, al igual que otras transacciones.

---

#### 5. ¿Puedo ejecutar varias carteras con sólo la votación con la misma semilla en varios servidores?

Puede tener varias carpetas de solo votación porque no están creando nuevas direcciones [^ 12697]. El problema viene cuando usted tiene dos carpetas que crean las transacciones que implican nuevas direcciones porque no saben lo que el otro está haciendo.

Si está realizando una configuración en caliente/frío, puede crear multiples billeteras calientes de votos solamente sin ningún problema, siempre y cuando ambos estén al tanto de la dirección a la que otorga los derechos de voto.

Continúe con [Stake Pools FAQ](/faq/proof-of-stake/stake-pools.md)

---

## <i class="fa fa-book"></i> Fuentes

[^9304]: Decred Forum, [Post 9,304](https://forum.decred.org/threads/626/page-2#post-9304)
[^9311]: Decred Forum, [Post 9,311](https://forum.decred.org/threads/582/page-2#post-9311)
[^9806]: Decred Forum, [Post 9,806](https://forum.decred.org/threads/180/page-6#post-9806)
[^12697]: Decred Forum, [Post 12,697](https://forum.decred.org/threads/1127/#post-12697)
