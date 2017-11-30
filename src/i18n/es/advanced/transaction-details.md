# Detalles de la transacción

---

Transacciones decretadas son transferencias de DCR que existen dentro de bloques. Las transacciones se componen principalmente de entradas y salidas, aunque también tienen algunos otros campos de datos.


## Formato de la transacción

Campo        | Descripción                                                                                    | tamaño
---          | ---                                                                                            | ---
Versión      | Versión de la transacción. Este número se utiliza para indicar cómo debe interpretarse la transacción  | 4 bytes
Cuenta de entrada  | El número de entradas en la transacción codificadas como un entero de longitud variable                   | 1-9 bytes
Entradas       | Lista serializada de todas las entradas de la transacción                                                | Variable
Cuenta de salida | El número de salidas en la transacción codificadas como un entero de longitud variable                  | 1-9 bytes
Salidas      | Lista serializada de todas las salidas de la transacción                                               | Variable
Tiempo de bloqueo    | El momento en que se puede gastar una transacción. (Normalmente cero, en cuyo caso no tiene efecto)       | 4 bytes
Expiración       | La altura del bloque en la que caduca la transacción y ya no es válida                       | 4 bytes


### Entradas
Las entradas gastan salidas hechas previamente. Hay dos tipos de insumos de transacción: Testigo y no testigo.


#### Entradas de no-testigos
Una entrada de transacción no testigo es una referencia a una salida no utilizada y un número de secuencia. Una referencia a una salida no utilizada se denomina "punto de salida". Los puntos de salida tienen tres campos:

Campo            | Descripción                                                                                                                           | tamaño
---              | ---                                                                                                                                   | ---
Hash de transacción | El hash de la transacción que contiene la salida que se gasta                                                                     | 32 bytes
Índice de resultados     | El índice de los resultados que se gasta                                                                                                   | 4 bytes
Árbol             | El árbol en el que se está gastando la salida. Esto es necesario porque hay más de un árbol utilizado para localizar transacciones en un bloque. | 1 byte

Además de un outpoint, las entradas que no son testigos contienen un número de secuencia. Este número tiene más importancia histórica que el uso relevante; Sin embargo, su propósito más relevante es permitir el "bloqueo" de los pagos para que no puedan ser canjeados hasta cierto tiempo.


#### Ingresos de testigos
Una entrada de transacción testigo contiene los datos necesarios para demostrar que se puede gastar una salida. Las entradas de testigos contienen cuatro campos de datos:

Campo            | Descripción
---              | ---
Valor            | La cantidad de monedas que la salida que gasta se transfiere.
Altura del bloque     | La altura del bloque que contiene la transacción en la que se encuentra la salida que se está gastando.
Índice de bloques      | El índice de la transacción en la que se encuentra la salida que se está gastando.
Firma de script | El script que satisface los requisitos del script en la salida que se gasta.


### Salidas
Las salidas son transferencias de DCR que pueden ser gastadas por insumos. Las salidas siempre tienen tres campos de datos:

Campo             | Descripción                                                                                     | tamaño
---               | ---                                                                                             | ---
Valor             | La cantidad de DCR enviada por la salida.                                                     | 8 bytes
Version           | La versión de la salida. Este número se utiliza para indicar cómo debe interpretarse el resultado. | 2 bytes
Clave pública de script | La secuencia de comandos que debe satisfacerse para gastar la salida                                           | Variable

---

## Serialización
El formato mostrado anteriormente no es el formato en el que se envían y reciben las transacciones. Al enviar o recibir transacciones, pueden ser serializadas de varias maneras. La forma en que una transacción debe ser deserializada puede determinarse a partir de su versión. Las versiones de transacción ocupan cuatro bytes, pero esos cuatro bytes se utilizan realmente para almacenar dos valores separados. Los dos primeros bytes de la versión de una transacción indican su número de versión real. Los segundos dos bytes denotan su formato de serialización.


### Formatos de serialización
Al serializar, hay dos partes principales de una transacción: su "prefijo" y sus datos testigos.
El prefijo de la transacción se compone de:

* Entradas (sin datos de testigos)
* Salidas
* Tiempo de bloqueo
* Expiración

Los datos de testigo de una transacción implican solamente sus entradas. Los campos de datos incluidos de sus entradas dependen del formato de serialización específico. Este formato puede ser cualquiera de los siguientes:

* ** 0 (serialización completa) ** - El prefijo de la transacción se encuentra inmediatamente antes de sus datos de testigos.
* ** 1 (Sin testigo) ** - El prefijo de la transacción es el único dato presente.
* ** 2 (Sólo testigo) ** - Los datos de testigos de la transacción son los únicos datos presentes. Para cada entrada, esto incluye su valor, altura de bloque, índice de bloque y firma de script.
* ** 3 (Firma de testigos) ** - Los datos de testigos de la transacción son los únicos datos presentes y se serializan para fines de firma. Para cada entrada, esto incluye sólo su script de firma.
* ** 4 (Firma de testigos con valor) ** - Los datos de testigos de la transacción son los únicos datos presentes y se serializan para fines de firma. A diferencia del formato de firma de Witness, este formato incluye el valor de cada entrada antes de su guión de firma.
