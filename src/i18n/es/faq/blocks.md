# <i class="fa fa-cubes"></i> Bloques

---

#### 1. ¿Puede un bloque quedar huérfano después de haber sido confirmado varias veces?

Sólo si hay un reorg suficientemente largo [^8918]. Para que eso suceda, necesita más poder de hash trabajando en el otro lado de un fork que el poder de hash que está trabajando en la mejor cadena actual.

---

#### 2. ¿Podemos eliminar el explorador de bloque testnet dado que uno por mainnet está disponible?

Testnet continuará siendo un campo de pruebas para nuevas características, por lo que tiene sentido mantener el testnet block explorer [^ 9621].

---

#### 3. ¿Qué significan los mensajes "[INF] CHAN: Añadiendo bloque huérfano"?

Sólo significa que un bloque que no tiene el padre para fue recibido [^ 14660]. Casi siempre ocurre cuando se reinicia `dcrd` debido a la forma en que funciona la sincronización. Todavía estás sincronizado hasta el último bloque, pero el compañero remoto, que está delante de ti, envió una notificación de que apareció un bloque nuevo, uno para el cual aún no posee el padre.

En lugar de ignorarlo, una vez que están lo suficientemente cerca de ser sincronizado, que esencialmente guarda para más tarde, así que una vez que tenga los bloques de los padres de los bloques más nuevos automáticamente conectados.

---

#### 4. ¿Debo descargar el blockchain de nuevo con cada nueva versión de software?

Usted casi nunca tendrá que descargar la cadena de nuevo [^ 14788] en una actualización a menos que sea sólo un cambio súper masivo donde tiene sentido empezar de nuevo. Normalmente, sin embargo, debe migrar las cosas por lo que sólo funciona.

---

#### 5. ¿Cuál es el número de bloque de genesis?

El bloque de genesis [^ 16987] es la altura del bloque 0 (bloque número 0). Cada bloque después de eso aumenta en 1.

---

#### 6. ¿Qué significan los mensajes "[INF] CHAN: FORK: Block 000 ..."?

Aquí hay un ejemplo de mensaje:

```no-highlight
[INF] CHAN: FORK: Bloque 0000000000001aedcf1b82b087a1d05ef787550174da1012e473e8ee8c178937 (height 17879) los forks de altura 17878/bloque 000000000000150f863186cab6ef5c433bcc155d2f683394f8e65cb037f80b16, pero no causa un reorganizamiento
```

Significa que dos mineros encontraron una solución a un bloque al mismo tiempo  y ambos presentaron sus bloques resueltos a la red [^17791]. Ambos son igualmente válidos, sin embargo su nodo vio la otra solución primero ([000000000000147d33cde5e9823122924fb43405418712720eb6457956d8edbb](https://mainnet.decred.org/block/000000000000147d33cde5e9823122924fb43405418712720eb6457956d8edbb)) asi que desde su punto del nodo de vista , el nuevo bloque ([0000000000001aedcf1b82b087a1d05ef787550174da1012e473e8ee8c178937](https://mainnet.decred.org/block/0000000000001aedcf1b82b087a1d05ef787550174da1012e473e8ee8c178937)) fue sobre un lado de la cadena

Debido a que toma tiempo para retransmitir bloques, otros nodos podrían haber visto 0000000000001aedcf1b82b087a1d05ef787550174da1012e473e8ee8c178937 primero lo que significa para ellos la otra solución que su nodo vio por primera vez ([000000000000147d33cde5e9823122924fb43405418712720eb6457956d8edbb](https://mainnet.decred.org/block/000000000000147d33cde5e9823122924fb43405418712720eb6457956d8edbb)) fue el en la cadena lateral.

Esto es totalmente normal y se resuelve cada vez que se encuentra el siguiente bloque, ya que ahora definirá la cadena más larga y la solución que no se haya construido será huérfana.

En este caso, el bloque # 17880 ([000000000000154c6091747245e3c2620447c71b346aed09548e74b4543d0d66](https://mainnet.decred.org/block/000000000000154c6091747245e3c2620447c71b346aed09548e74b4543d0d66)) terminó la construcción en la parte superior de 000000000000147d33cde5e9823122924fb43405418712720eb6457956d8edbb, por lo que la otra solución ([0000000000001aedcf1b82b087a1d05ef787550174da1012e473e8ee8c178937](https://mainnet.decred.org/block/0000000000001aedcf1b82b087a1d05ef787550174da1012e473e8ee8c178937)) quedó huérfano.

---

## <i class="fa fa-book"></i>Fuentes

[^8918]: Decred Forum, [Post 8,918](https://forum.decred.org/threads/557/#post-8918)
[^9621]: Decred Forum, [Post 9,621](https://forum.decred.org/threads/651/#post-9621)
[^14660]: Decred Forum, [Post 14,660](https://forum.decred.org/threads/1333/#post-14660)
[^14788]: Decred Forum, [Post 14,788](https://forum.decred.org/threads/1336/#post-14788)
[^16987]: Decred Forum, [Post 16,987](https://forum.decred.org/threads/1852/#post-16987)
[^17791]: Decred Forum, [Post 17,791](https://forum.decred.org/threads/2925/#post-17791)
