# <i class="fa fa-desktop"></i> Configuración

---

#### 1. ¿Cómo puedo ver información sobre los números de puerto `dcrd`?

Puede obtener los números de puerto [^ 8929] de los parámetros `-h` o` --help` pasados ​​a `dcrd`:

```no-highlight
dcrd -h
```

Busque la siguiente línea:

```no-highlight
--rpclisten=  Agregue una interface/puerto para oir las conecciones RPC (default port: 9109, testnet: 19109)
```

También se registra al iniciar `dcrd`:

```no-highlight
12:01:46 2016-02-08 [INF] RPCS: RPC server listening on [::1]:9109
12:01:46 2016-02-08 [INF] RPCS: RPC server listening on 127.0.0.1:9109
```

---

#### 2. ¿Qué quieres decir con los archivos de configuración de `dcrd`,` dcrwallet` y `dcrctl`?

Cada aplicación (`dcrd`,` dcrwallet`, `dcrctl`) puede tener sus propios archivos de configuración [^ 9055]. Utilice `-h` y observe la ruta de acceso entre paréntesis de la opción del archivo de configuración (` -C`, `--configfile`) para ver la ruta predeterminada. Cree un archivo de texto en la ruta de acceso y nombre de acuerdo con la ruta que acaba de buscar.

A continuación, puede utilizar `dcrd` [archivo de configuración de ejemplo] (https://github.com/decred/dcrd/blob/master/sample-dcrd.conf) y` dcrwallet` [archivo de configuración de ejemplo] (https: // Github.com/decred/dcrwallet/blob/master/sample-dcrwallet.conf) para establecer las opciones que desee. Puedes hacer lo mismo con `dcrctl`. El formato es el mismo. Todas las opciones de la línea de comandos listadas por `-h` se pueden especificar en los archivos de configuración (sólo use el nombre de la opción larga).

Una vez que se crean y en su lugar, no tiene que agregar todas las opciones a la línea de comandos todo el tiempo. Por ejemplo, puede ejecutar `dcrctl` sin pasar ningún parámetro en la línea de comandos:

```no-highlight
dcrctl getnetworkhashps
2547036949350
```

---

#### 3. ¿Puedo ejecutar daemons de testnet y carteras al mismo tiempo y en la misma máquina?

Sí [^ 9264], simplemente añada `- testnet` a los lugares apropiados (` dcrd`, `dcrwallet`,` dcrctl`) y todo funcionará. Es por eso que utilizan diferentes puertos y directorios de datos / registro!

---

#### 4. ¿Cuáles son las implicaciones de seguridad de usar las mismas contraseñas de autenticación de servidor RPC con `dcrd` y` dcrwallet`?

Hay mucho menos que puedes hacer con el acceso a `dcrd` que puedes con acceso a` dcrwallet`. Es importante destacar que el acceso RPC [^ 11480] a `dcrwallet`, cuando la cartera está desbloqueada, puede utilizarse para gastar monedas.

Cuando `dcrd` y` dcrwallet` están en la misma máquina, probablemente no importa mucho, pero cuando se están ejecutando configuraciones más seguras donde la cartera se encuentra en una máquina distinta de `dcrd`, sería bastante claro que no Desea utilizar las mismas credenciales para ambos. Recuerde que `dcrd` tiene que estar en una máquina orientada a Internet para mantenerse sincronizado con la red (descargue los datos de la cadena de bloque, las transacciones de difusión, etc.).

Por otro lado, el `dcrwallet` que contiene sus fondos, para una mejor seguridad, realmente no debe estar en un sistema que tiene acceso a Internet, ya que es mucho más difícil para alguien robar sus monedas si la cartera que los contiene no es ni siquiera En una máquina que es accesible a través de Internet. Obviamente, si está estacando sus monedas, necesitará al menos una instancia `dcrwallet` de Internet. Por lo tanto, la configuración más segura consiste en tener una instancia "cold"  `dcrwallet` que está en una máquina que no está accesible a Internet, y una segunda instancia "hot" `dcrwallet` (usando una semilla diferente, por supuesto) a la que el frío los delegados de instancia de dcrwallet votan a la derecha a través del parámetro `--ticketaddress`, los cuales utilizan credenciales diferentes.

---

#### 5. ¿Por qué me estoy conectando a sólo 8 pares de salida?

Hay un límite intencional e inconfigurable de 8 pares de salida [^ 15399]. Más pares de salida que eso no le ayuda de ninguna manera y es realmente peor para usted y la red. Esto ha sido probado extremadamente en Bitcoin, incluyendo btcsuite (el proyecto de upstream para Decred). Todo lo que haría subiendo sus conexiones de salida es el desperdicio de ranuras valiosas de los relativamente pocos compañeros públicos que hay (siempre hay un número mucho mayor de "leechers" que hay "seeders").

Por otro lado, el aumento de las conexiones máximas, que realmente sólo aumenta el número de conexiones entrantes permitidas, ayuda a la red asegurando que hay más ranuras disponibles para nuevos nodos y clientes SPV.

---

## <i class="fa fa-book"></i> Fuentes

[^8929]: Decred Forum, [Post 8,929](https://forum.decred.org/threads/600/#post-8929)
[^9055]: Decred Forum, [Post 9,062](https://forum.decred.org/threads/472/page-12#post-9062)
[^9264]: Decred Forum, [Post 9,264](https://forum.decred.org/threads/626/#post-9264)
[^11480]: Decred Forum, [Post 11,480](https://forum.decred.org/threads/428/#post-11480)
[^15399]: Decred Forum, [Post 15,399](https://forum.decred.org/threads/1371/page-2#post-15399)
