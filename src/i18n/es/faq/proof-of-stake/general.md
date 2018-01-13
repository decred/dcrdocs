# <i class="fa fa-ticket"></i> PoS Preguntas Frecuentes Generales 

---

#### 1. ¿Que es el sistema de Prueba-de-Participación  de Decred?.

El sistema de Prueba-de-Participación (PoS) permite a los propietarios de Decred  tener una palabra en la gobernancia de la moneda. Esto tiene el objetivo de darle al usuario una voz junto a los mineros.
Para participar, los usuarios pueden comprar "boletos", que entrarán a lotería.  En cada bloque  se escogen 5 "tickets" de  la piscina de "boletos" PoS. Si al menos 3 de estos votos validan el bloque anteriormente minado.
el nuevo bloque minado es añadido a la cadena, y ambos mineros PoW y propietarios PoS son pagados. Si el bloque no es validado por los propietarios PoS, a los mineros PoW no se les paga,  pero si a los propietarios PoS. Esto se hace
 para incentivar a los mineros PoW a minar conforme a los deseos de los propietarios PoS.

Este sistema PoS tiene varias ventajas para solucionar problemas, que sistemas solamente PoW podrían encontrar. Por ejemplo, porque los propietarios PoS tienen que validar el bloque que los mineros PoW minan, los mineros PoW no pueden 
decidir por su cuenta cambiar las reglas de la red (un ataque de 51%). O, cuando la cadena de Decred aplica una bifurcación dura, la vieja y pequeña cadena moriría rápidamente ya que no estaría siendo validada por los componentes PoS de la cadena.

El sistema PoS recompensa a sus acconistas/inversionistas por su participacion. Cada bloque de Decred  tiene un componente de recompensa PoS que será distribuido entre todos los boletos  elegidos para votar ese bloque. El sistema es diseñado de tal forma que
el tiempo promedio para que el boleto sea seleccionado es de 28 días. Si un boleto no ha sido seleccionado después de 40960 bloques (un poco menos de 5 meses) este sera removido por el sistema. Los DCR usados para comprar un boleto
 se reembolsa tanto si vota o no.

Otra característica interesante es que el sistema PoS permite tener la habilidad de votar sobre una agenda. Ya que la validacion del bloque puede ser considerado un voto, al añadier componentes votebit extra al boleto el sistema puede rastrear y contar los votos de una serie de bloques. Estos votos pueden ser acerca de cualquier cosa. 

En el sistema de Prueba-de-Participación de Decred cualquiera que posea DCR puede participar a través de la compra de un boleto.

---

#### 2. ¿ Que son los boletos?

Un boleto es una ficha que usted compra para participar en el sistema PoS. Usted puede comprar a través de la interfaz de comando de linea de dcrctl, o a través de un GUI como Paymetheus[^1] o Decrediton. Cuando usted compra 
un boleto, usted paga el valor actual de un boleto y la tarifa del boleto usando sus DCR. Cuando el boleto es comprado, este va a un  "mempool" temporal.  20 boletos pueden ser minados en cada bloque y son escogidos
para ser minados en base a su tarifa por kilobyte. Como existe un numero limitado deboletos que pueden ser minado de cada bloque a un precio dado (2880), puede existir competencia para tener boletos minados. En este caso,
usted puede incrementar la tarifa que está dispuesto a pagar para tener su/s boletos(s) minados. Una vez que su boleto es minado éste será movido de "allmempool" hacia la piscina de boletos"inmmature". Despues 256 bloques
(alrededor de 20 horas) ésto madurarane irán hacia la piscina de tickets en vivo donde podran ser elegidos para recibir votos.

---

#### 3. ¿ Necesito estar constantemente conectado a la red para participar en PoS?

La cartera necesita estar conectada 24/7 para responder a un voto si este ticket llegara a ser seleccionado. Existen dos vías principales para hacer esto, las cuales son; una cartera de participación solitaria que le permite configurar y mantenerse en linea todo el tiempo, o usted 
también puede utilizar [stake pool](/mining/proof-of-stake.md#solo-mining-or-pool-mining). Una participación colaborativa es básicamente una cartera comunal donde usted puede asignar los derechos de votación de sus tickets y la piscina 
votara a su favor para obtener una pequeño porcentaje de recompensa PoS. 

Es importante tomar en cuneta que usted solo esta asignando los derechos de votación en la piscina, sin afectar sus fondos actuales. Una participación colaborativa nunca tendrá acceso a sus fondos.

---

#### 4. ¿ Cuanto es "el precio del ticket"?

Los precios de los tickets están determinados por un algoritmo el cual tiene el objetivo de mantener el tamaño de la piscina de tickets, el cual es la cantidad total de tickets en el sistema PoS, la meta de la piscina de tickets es tener un tamaño alrededor de 40960 tickets.
El precio del ticket subira y bajara de acuerdo a la demanda de este, y la cantidad de tickets que estén en la piscina en ese momento.

Por cada 144 bloques el algoritmos ajusta el precio de el ticket. Esto es llamado "comprando la ventana". Cada bloque puede contener 20 tickets que fueron comprados recientemente. Esto significa que por cada vez que se este "comprando la ventana" un máximo de 2880 tickets
podrían ser agregados la piscina de tickets del sistema PoS

El precio del ticket sera siempre renovado sin importar si su ticket vota, pierde o expira. 

---

#### 5. ¿Que son fees?

El sistema PoS utiliza dos tipos de fees, un txfee(tambien conocido como fee "fragmentado") y un ticketfee.
	
El txfee es un fee que usted le paga a la red por procesar su transacción al comprar el ticket. Este fee tiene una configuración predeterminada del monto mínimo (0.01 DCR/kB) y no debería ser cambiado.
El ticketfee es un fee que usted paga si su ticket es minado. Este fee es un incentivo que se entrega a los minadores PoW para minar su ticket de la y añadirlo a la piscina de tickets.

En el caso que la compra de ventanas este llena, esto significaría que hay mas tickets siendo comprados que los que han sido minados durante el esa ventana, el ticketfee sera usado para determinar que tickets serán seleccionados para añadir
a la piscina de tickets. Los tickets que tengan el ticketfee mas alto serán seleccionados por los minadores PoW.

Los fees son los calculados en DCR por kilobyte. Ya que un ticket es solo alrededor 300 (uno solo) o 540 (en la piscina) bytes de tamaño, el fee que usted paga sera mas bajo que el que el monto especifico de fee que usted configuro

Ambos txfees y ticketfees no ser reembolsados cuando el ticket vote, expire, o haya perdido el voto.

Retornar los fondos a su cartera despues de que el ticket haya votado o haya sido revocado no generara fee.

---

#### 6. ¿Que es una participación colaborativa?

Una participación colaborativa es el equivalente a una piscina minera, pero con el sistema PoS a traves de las opciones de su cartera Decred, usted puede enviar sus derechos de votación a la participación colaborativa. Si su ticket es seleccionado para votar,
la participación colaborativa emitirá el voto para usted y le entregara una recompensa con la recompensa PoS restando el fee de la participación colaborativa (usualmente es 4-5%). A diferencia de las piscinas mineras, la recompensa PoS no es dividida entre todos los usuarios de la participación colaborativa. La recompensa completa es entregada al dueño del ticket.

La participación colaborativa le permitirá a usted comprar tickets pero no podrá tener su propia cartera desbloqueada y siempre estará  en linea. Es importante resaltar que sus fondos nunca abandonaran su cartera. Usted no enviara nada a la participación colaborativa,
con solo dar la autorización para votar a su favor. La participación colaborativa no tiene acceso a sus fondos. 

Una participación colaborativa implementara normalmente una multi-cartera respaldada por diferentes carteras físicas que están distribuidas alrededor del mundo. Esto significa que existen menos posibilidades de que un  voto se pierda si alguna cartera se cae,
esto también reduce la latencia entre la cartera y la red por lo cual se puede reducir las posibilidades de que un voto se pierda.

---

#### 7. ¿Que pasa con mis fondos cuando compro un ticket?

Los fondos usados para comprar los tickets son bloqueados hasta que el ticket sea seleccionado para votar o expire. No tienen permitido dejar su cartera y aparecerán en la sección "lockedbytickets" de su cartera.
Si su ticket es seleccionado para votar, se le sera reembolsado la cantidad total que usted pago por el ticket y se le entregara la recompensa PoS.

El único costo que tiene usar este sistema es el fee que usted configuro. El txfee sera cobrado por la transacción que tiene su ticket a través de la red. El ticketfee sera cargado por la incorporación a la
colaboración participativa, y este fee sera pagado a los mineros PoW. Si su ticket no es minado, no se le cargara por la transacción en la red ya que esta nunca se hizo

En el caso que su ticket no haya sido seleccionado para votar despues 40960 bloques (aproximadamente 4 meses). El sistema revocara su ticket y lo que usted pago (menos el fee) sera devuelto a su cartera.

---

#### 8. ¿ Que posibilidades hay de que mi ticket reciba un voto?

El sistema PoS en Decred usa  la distribución Poisson para determinar las probabilidades de que un ticket sea votado en cualquier momento. Ya que el tamaño de la colaboración participativa es de 40960 tickets, todos los tickets tienen un 50% de posibilidades de recibir un voto
en un tiempo de 28 días y un 99.5% de posibilidades de recibir un voto antes de expirar. Cabe destacar que estos valores cambiaran con el tamaño de la colaboración participativa.


---

#### 9 ¿ Que son las votaciones de la Prueba-de-Participaciones?

Ya que las validaciones del bloque son hechas por el sistema PoS el cual se comporta como un sistema de votación, este tambien se puede usar para votar en otras cuestiones.

Cuando un bloque es seleccionado para ser validado, los tickets votan para aprobar o desaprobar el bloque minado anteriormente. Esto requiere que 3 de 5 tickets voten si.

Añadiendo otro parámetro al ticket que no interfiere con la aprobación de los bloques minados, el sistema puede saber la cantidad de tickets usando ese parámetro una un numero de bloques. Usted puede configurar ese parámetro en su cartera en cualquier momento antes de la votación.

Por ejemplo, usted puede escoger el color de su ticket entre rojo o azul, al elegir entre estas dos opciones, el sistema contara en los próximos 1000 bloques cuando tickets rojo hay y cuantos tickets azules hay. Tal vez después hayan 3000 tickets rojos, 1500 tickets azules, y 500 tickets a los que no les asignaron un color.

Si usted remplaza las opciones de color por la opción si o no, usted tendrá un sistema de votación que puede contar los votos en cualquier momento. Usando el sistema PoS cualquiera que posea DCR puede votar en cualquier cuestión programada en la agenda

El sistema de votación puede usarse en cualquier cuestión de gobernanza. Para Decred, el uso mas prominente sera para votar en las bifurcaciones fuertes, los cuales son cambios que se hacen a como funciona la moneda. Por ejemplo:

- Incrementar el tamaño máximo del bloque
- Cambiar el algoritmo PoS usado para determinar el precio de cada ticket.
- Vote on major new features for the currency (e.g. lightning network, enhanced privacy).
- Cambiar el algoritmo PoW.
- Pretty much anything the community decides would be in the best interest of the currency.

Actualmente, esta en desarrollo una plataforma donde la comunidad enviara y recomendara una agenda de votación.

---

#### 10. ¿ Que es una votación bifurcada? 

Como la mayoría de crypto monedas Decred podría bifurcarse en algún punto

Un punto que tiene la agenda programada para el sistema PoS de votación podría ser tener una bifurcación fuerte. Si este punto se emite, la nueva versión del código de Decred seria incluido en esta bifurcación, pero la bifurcación no se activaría hasta que el sistema PoS no haya votado acerca de esto.

Para que haya una votación para una bifurcación fuerte tienen que existir dos condiciones criticas las cuales son:

- Primero, el 75% de los mineros PoW tienen que actualizarse a la ultima versión que del bloque que exista en la red. Esta comprobación se hace en los últimos 1000 bloques.
- Segundo, el 75% de los mineros PoS tienen que actualizarse a la ultima versión. Esto se comprueba con los últimos 2016 bloques.

Una vez que esto sea comprobado, el proceso de votación comienza. Los tickets ´podrán ser configurados con un parámetro adicional, los parámetros serán si/no/me abstengo. Usted hace esto en su cartera antes de que los tickets voten. Los tickets marcados como me abstengo no serán contados en el conteo total de la cantidad de votos.

The PoS system then starts counting tickets with these parameters set over a predetermined amount of blocks. If over this interval the amount of ‘yes’ votes is 75% or more, the vote has passed. A lock in period of a set number of blocks will start before the hardfork goes live, so everyone has a chance to upgrade and not be hardforked off the network.

Because the code for the hardfork is already in the then current version of Decred there is no need for the developers to interfere or the majority of PoW miners and PoS miners to upgrade after a decision has been reached. If the vote on a hardfork passes it will be implemented automatically after the lock in period.

The hardfork vote can fail at multiple points. The vote might not start at all if the PoW miners or PoS miners do not upgrade. After that, the threshold of 75% votes might not be reached.

In case a vote fails a new round will start at the beginning of the process. This means checking whether the PoW miners have upgraded, if the PoS miners have upgraded, and then another vote counting period. This will continue for a certain amount of rounds, after which, if the vote hasn't passed, the agenda issue will be tabled.

---

#### 11. Is PoS susceptible to large exchanges using their customers’ decred? 

The number of decred a person (or exchange) has means nothing to PoS. It's the number of tickets you have. Funds used to purchase tickets are locked until the ticket they purchased votes. This means that
decred involved in PoS are effectively nontransferable. For an exchange to use their customers’ decred for voting, they would have to transfer them out of the wallets and lock them for up to 5 months. People
would notice their balances change (decred locked in PoS will not show as spendable) and they would not be able to withdraw any funds so the exchange would suffer a large loss of liquidity.

Further there is a hard limit of 20 tickets added per block so no exchange could flood the pool faster than this.

Finally, there's a soft cap on the total number of tickets in the pool. Every 144 blocks (2880 tickets) the ticket price is adjusted based on the number of tickets in the pool and the rate that new tickets
were added in the last window. Eventually the ticket price would be so high that even an exchange wouldn't be able to buy many tickets. And remember that even if they did that their DCR are locked so they
can't buy more when the price drops again.

---

#### 12. Is PoS susceptible to influence from large balance holders such as the original developers? 

The pool size limits above apply here. This stops one person/group flooding the PoS pool with large numbers of their own tickets. Even if they bought up the whole pool (with huge fees) the most they would
likely get is about 4000 tickets (based on previous ticket windows where the ones around 30DCR usually go up to 100 for the next window, and the max for the one after that is often over 300). So a large
balance holder could probably buy 2 windows out. A window at 30 would be 86,400DCR then the next at 100 would be 288,000DCR. So it would cost 374,400DCR to buy 5760 tickets. With a target pool size of 40960 tickets, 374400 DCR would give you about 14% of all tickets.

Now the holder could wait a couple of days for the price to drop then start buying back up again. Except that most of their funds will be locked in the ones they bought earlier (although some will have voted) so their buying power for the new window is greatly reduced. But let's say they have super capital and bought all the decred on all exchanges. So they are able to buy another two windows and replace those tickets that voted and were successful in buying all the tickets (at very high fees and/or prices). Let's say that takes them to about 25% of the tickets.

Tickets for a block are chosen with a random distribution. To force a vote to go a certain way you would need 3 out of 5 votes for a given block which is 60%. Even with that huge expenditure of capital,
they are less than half way there. And a vote isn't decided on a single block so you would need 60% of 75% of blocks in the voting period.

And THEN you still need the PoW miners to confirm the votes. If they think someone is trying to game the system, they can choose to invalidate blocks.

So basically this is close to impossible, even if a single person has a HUGE percentage of DCR.

But then we come to the stake pools. Stake pools, while not having access to any of their users' funds, do have the ability to change votes on tickets assigned to them. This is why it is suggested that when joining a stake pool, people don't just go for the largest one. Decred is short for 'decentralised credit' so part of the spirit of PoS is ensuring that the PoS stake pools don't get too large in relation to the others. However, even the largest at almost 20% would still only get on average one vote per block.

So Decred was specifically designed to minimise impact from both large PoW and PoS pools as well as individuals (including developers) with large holdings. 

## <i class="fa fa-book"></i> Links 

[^1]: [Paymetheus Ticket Purchasing Guide](/getting-started/user-guides/using-paymetheus.md#-purchase-tickets-tab)
