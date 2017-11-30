# <i class="fa fa-ticket"></i> Compra de Boletos y Tarifas

---

#### 1. ¿Hay una manera de ver los boletos comprados por una cartera local?

Use los siguientes comandos para mostrar todos sus boletos[^9987]:

```no-highlight
dcrctl --wallet gettickets true
```

---

#### 2. ¿Debo pagar una tarifa de transacción por la transacción ssgen?

No, las transacciones ssgen no imponen una tarifa [^ 10219] (a diferencia de las transacciones originales de compra de boletos que compiten por espacio limitado en cada bloque). Son efectivamente como la Prueba-de-Trabajo de transacciones de moneda base en este sentido.

---

#### 3. ¿Como cambio la tarifa de un boleto?

```no-highlight
dcrctl --wallet setticketfee [fee]
```

---

#### 4. ¿Cómo compro manualmente los boletos? 

```no-highlight
dcrctl --wallet purchaseticket <fromaccount> <spendlimit> <minconf>
```

Dónde:

Opción        | Explicación
---           | ---
`fromaccount` | Usualmente "por defecto" (a menos que haya sido creado uno diferente).
`spendlimit`  | Número máximo de DCR que desea gastar en boletos.
`minconf`     | Esto se puede establecer en 0.

---

#### 5. ¿Como debería configurar el ticketfee?

El `ticketfee` (o la tarifa del boleto) determina el orden en el cual los boletos mempool ingresan al pool de votación.Tarifas más altas estimulan a los mineros de Prueba-de-Trabajo a poner sus boletos al frente de la fila. Si establece la tarifa más alta que el promedio, es más probable que los boletos se incluyan en el siguiente bloque. El txfee predeterminado es 0.01 DCR. Parecería entonces que la mejor idea es fijar su txfee alto así estaria al frente de la fila. Pero eso no siempre es una buena idea. De hecho, rara vez es una buena idea simplemente porque la cola de mempool es muy corta o nula la mayor parte del tiempo. No se olvide que el txfee comerá de su ganancia DCR, ya que se cobra en cada boleto y no es reembolsable, ya sea que vote o no.

Considere un constante stake de costo de 10 DCR. Cada bloque de 20 tickets pueden pasar al pool de votación desde el mempool. Que es un valor de 200 DCR. Cada bloque genera acerca de 30 DCR y regresa 50DCR a los votantes.to 3 DCR es enviado a los desarrolladores para ayudar al desarrollo de fondos Decred asi solamente 27 termina en las manos mineras.  Esto significa que 77 DCR es liberado cada bloque para devolver a los tickets, asumiendo que todo retorna son reinvertidos. Eso es menos que la mitad lo que el bloque puede manejar. La sola manera demás DCR puede entrar al mempool es por inversión externa (i.e., comprando desde un exchange) o desde las mineras quienes han estado guardando sus DCR esperando por el costo de stake caiga.

En caso que el costo caiga, un minero esta buscando para entrar en el pool antes que el costo cambie de nuevo. Esto pasa cada 144 bloques (acerca de 12 horas). No importa si esta en el primer bloque  o el 100th. En 144 bloques 2,880 tickets serán aceptados con un valor de 28,800 DCR. No hay ese tipo de volume en la red de prueba-de-stake en este momento.  Hay un escenario en el que podría querer configurar su tarifa más alta. Si el costo de stake es acerca de cambio en algunos bloques, el mempool no esta vacio y puede asegurar que obtendrá el precio actual, puede ayudar a configurar su tarifa un poco más alta que el promedio para asegurarse estar dentro, especialmente si el siguiente cambio significaría su perdida de un ticket.

Continua en [PoS Solo Mining FAQ](/faq/proof-of-stake/solo-mining.md)

---

## **<i class="fa fa-book"></i> Sources**

[^9987]: Decred Forum, [Post 9,987](https://forum.decred.org/threads/582/page-2#post-9987)
[^10219]: Decred Forum, [Post 10,219](https://forum.decred.org/threads/180/page-6#post-10219)
