# <i class="fa fa-money"></i> Carteras y Semillas

---

#### 1. ¿Debo entregar mi semilla de cartera a alguien?

No, nunca debe [^ 8613] compartir su semilla de cartera con nadie. Hacerlo es el equivalente de darles todos sus DCR en esa cartera.

---

#### 2. ¿Cómo puedo convertir mi semilla hex de cartera en palabras de semilla?

Puede utilizar la utilidad [dcrseedhextowords] (https://github.com/davecgh/dcrseedhextowords) [^ 8660] para convertir una semilla Decred hexadecimal en palabras de semilla necesarias para importar en carteras.

---

#### 3. ¿Puedo ejecutar varias carteras con la misma semilla?

La ejecución de múltiples carteras con la misma semilla puede dar lugar a la situación en la que las carteras no verán el mismo saldo. No debe ejecutar varias carteras con la misma semilla. [^ 9731]

El problema es simplemente que las direcciones se generan de forma determinista a partir de la semilla. Así que si usted tiene dos carteras que se ejecutan en la misma semilla, básicamente terminan con una situación como esta:

* Cartera A: Conoce todas las direcciones hasta la dirección # 15
* Cartera B: Conoce todas las direcciones hasta la dirección # 12

Por lo tanto, todas las monedas que hayan sido enviadas a las direcciones # 13, # 14 y # 15 serán conocidas por la Cartera A, pero no por la Cartera B.

Además, si simplemente le dice a la Cartera B que obtenga la siguiente dirección, tampoco verá las monedas porque, desde su punto de vista, esa dirección se acaba crear y no buscará transacciones antes del momento actual. Ésta es una optimización porque, como puede imaginar, la cadena de bloques termina siendo muy grande con el tiempo y sería increíblemente caro (en términos de uso de recursos) analizar toda la cadena cada vez que se genere una nueva dirección.

Hay una excepción a esto y eso es para votar carteras calientes que no tienen fondos propios. Si la cartera está votando ** solamente **  y no comprando boletos o creando otras transacciones, es seguro. [^ 11319]

---

#### 4. ¿Alguien puede robar mis monedas si acceden a wallet.db?

Nadie puede robar sus monedas si tienen acceso al archivo wallet.db [^ 9803] a menos que también tengan su contraseña privada. Si decide utilizar el cifrado público, tampoco podrán acceder a ninguna de las llaves públicas o direcciones extendidas.

---

#### 5. ¿Alguien puede usar un ataque de fuerza bruta en una cartera aleatoria para regenerar sus palabras de semilla (las palabras no son saladas)?

Todas las palabras de semilla son una asignación directa de palabras en inglés a dígitos hexadecimales. La semilla no es más que un número aleatorio criptográficamente seguro de 256 bits (32 bytes). La sal no se aplica aquí en absoluto. No tiene nada que ver con la utilización de fuerza bruta[^ 10452] en números aleatórios.

En otras palabras, ya que cada palabra puede ser 256 posibilidades y hay 32 palabras, que produce 256^32 (o 2^256 dependiendo de cómo usted quiera mirarlo, pero es el mismo número) de posibilidades. Ese número es mayor que el número entero de átomos de hidrógeno en el universo conocido. De hecho, es casi más que el número total de átomos en el universo conocido.

Para poner esto en perspectiva, suponiendo que hay 7 billones de personas en el planeta y cada persona posee 10 computadoras y cada una de esas computadoras podría probar un billon de posibilidades por segundo y que podría encontrar la solución en promedio después de probar sólo el 50% de las posibilidades totales, todavía tomaría 26x10^48 (eso es 26 trillones trillones trillones trillones) de años para utilizar fuerza bruta en una sola semilla.

---

#### 6. Mi semilla no está funcionando. ¿Que puedo hacer?

Asegúrese de que todas las palabras están en una sola línea separada por espacios [^ 10657]. A pesar de que se imprimen en varias líneas para facilitar la lectura, deben introducirse en una sola línea. También compruebe que sus palabras no tienen errores ortográficos comparándolos con las palabras de la [lista de palabras PGP] (https://en.wikipedia.org/wiki/PGP_word_list).

---

#### 7. ¿Cómo puedo importar una llave que esté en el formato de importación de cartera (WIF)?

Es posible importar una llave privada autónoma [^ 10724] en `dcrwallet`. Tenga en cuenta que esto es sólo para direcciones  `--noseed` y no debe ejecutar esto a menos que sepa lo que está haciendo!

Desbloquee la cartera (ignore los paréntesis angulares):

```no-highlight
dcrctl --wallet walletpassphrase <private encryption passphrase> 60
```

Importe la llave privada autónoma (`--noseed`) (ignore los paréntesis angulares):

```no-highlight
dcrctl --wallet importprivkey <put WIF private key here>
```

Ver el saldo de la cuenta importada (darle algún tiempo para volver a buscar y mire el registro en dcrwallet para ver el progreso de la revisión):

```no-highlight
dcrctl --wallet getbalance "imported" 0 all
```

---

#### 8. ¿Cuál es la diferencia entre una dirección testnet y mainnet?

Una dirección de llave pública testnet [^ 11507] comienza con las letras `Tk`. Una dirección mainnet comienza con las letras `Dk`. `T` = Testnet,` D` = (Decred) Mainnet.

---

#### 9. ¿Cuáles son los diferentes tipos de direcciones?

Una dirección Decred [^ 14995] es en realidad sólo una representación de una llave pública (que podría ser un hash de script) junto con un prefijo de 2 bytes que identifica la red y el tipo y un sufijo de suma de comprobación con el fin de detectar direcciones introducidas incorrectamente.

En consecuencia, siempre puede indicar qué tipo de dirección se basa en el prefijo de 2 bytes.

El primer byte del prefijo identifica la red. Esta es la razón por la cual todas las direcciones mainnet comienzan con "D", las direcciones testnet comienzan con "T", y las direcciones simnet comienzan con "S". El segundo byte del prefijo identifica el tipo de dirección que es.

Las direcciones más comunes utilizadas en este momento son secp256k1 pubkey hashes, que se identifican por una "s" minúscula. Representa una sola llave pública y, por lo tanto, tiene una sola llave privada asociada que puede utilizarse para redimirla.

La red de participación, sin embargo, utiliza una dirección de pay-to-script-hash, que se identifica por el segundo byte que es una "c" minúscula (de nuevo que se muestra en los parámetros enlazados). El sabor específico de la secuencia de comandos que genera es una multi-firma 1-de-2, que es la forma en que permite que la red, o usted, voten. Tanto usted como la red de participación tienen sus propias llaves privadas y como la secuencia de comandos sólo requiere una firma de los dos posibles, es decir, cómo permite la delegación de derechos de voto a la red sin que usted renuncie por completo a sus derechos de voto.

---

## <i class="fa fa-book"></i> Fuentes

[^8613]: Foro Decred, [Post 8,613] (https://forum.decred.org/threads/576/#post-8613)
[^8660]: Foro Decred, [Post 8,660](https://forum.decred.org/threads/534/page-3#post-8660)
[^9731]: Foro Decred, [Post 9,731](https://forum.decred.org/threads/657/#post-9731)
[^11319]: Foro Decred, [Post 11,319](https://forum.decred.org/threads/531/page-3#post-11319)
[^9803]: Foro Decred, [Post 9,803](https://forum.decred.org/threads/686/#post-9803)
[^10452]: Foro Decred, [Post 10,452](https://forum.decred.org/threads/734/#post-10452)
[^10657]: Foro Decred, [Post 10,657](https://forum.decred.org/threads/483/#post-10657)
[^10724]: Foro Decred, [Post 10,724](https://forum.decred.org/threads/643/page-3#post-10724)
[^11507]: Foro Decred, [Post 11,507](https://forum.decred.org/threads/792/#post-11507)
[^14995]: Foro Decred, [Post 14,995](https://forum.decred.org/threads/1321/page-2#post-14995)
