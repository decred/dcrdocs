# Guía de Instalación dcrd

Última actualización para v1.0.0.

Esta guía está diseñada para ayudarle a configurar la aplicación `dcrd` utilizando [startup flags](/ get-started / startup-basics.md # startup-command-flags).

** Requisitos previos: **

- Utilice la última [dcrinstall](/getting-started/user-guides/cli-installation.md) para instalar `dcrd`. Se requerirán pasos adicionales si se utilizó otro método de instalación.
- Review how the launch commands for the Command Prompt (Windows) and Bash (macOS/Linux) shells differ [here](/getting-started/cli-differences.md).

---

`Dcrd` es el daemon de nodo para Decred. Un daemon es un programa que funciona en segundo plano con el cual usted no interfiere directamente. `dcrd` mantiene todo el registro pasado de transacciones (o cadena de bloques) de Decred y permite la retransmisión de transacciones a otros nodos Decred en todo el mundo. Usted puede pensar en ello como su propio servidor personal de cadena de bloques Decred. La cadena de bloques se guarda en la carpeta `data` dentro del directorio inicial de` dcrd`.

** Usuarios Avanzados: Si está ejecutando en modo sin cabeza a través de SSH, ** usted
necesitará usar una terminal multiplexer tal como [screen] (http://www.howtogeek.com/howto/ubuntu/keep-your-ssh-session-running-when-you-disconnect/)
O [tmux] (https://tmux.github.io/). Donde vea la instrucción para
mover a otro shell, necesitará iniciar una nueva ventana en `screen`
O `tmux`.

---

## <i class="fa fa-cloud"></i> Conectarse a la Red Decred

La primera vez que se inicia `dcrd`, se conectará a la red Decred y comenzará a descargar la cadena de bloques. Para permitir que `dcrwallet` y` dcrctl` se comuniquen con `dcrd`, los archivos de configuración deben tener la configuración `rpcuser` y` rpcpass` habilitada.

> Configurar el Nombre de Usuario y Contraseña de RPC

Si usó [`dcrinstall`](/getting-started/user-guides/cli-installation.md), sus archivos de configuración ya están configurados con el nombre de usuario/contraseña de RPC para` dcrd`, `dcrwallet` y` dcrctl` .

Si no utilizó `dcrinstall`, deberá habilitar la configuración mínima en sus archivos de configuración. Siga [this guide](/advanced/manual-cli-install.md#minimum-configuration) para hacerlo.

> Iniciar dcrd

Con los archivos de configuración correctamente configurados, abra otra ventana de shell en su directorio Decred (o use la última ventana si acaba de crear su cartera). Escriba el siguiente comando (revise los requisitos previos de esta guía para determinar el comando correcto para su aplicación OS/Shell):

```no-highlight
dcrd
```

> Espere a que dcrd sincronice con la Cadena de bloques de Decred

Cuando `dcrd` se lanza correctamente, debería ver que su ventana de shell comienza a llenarse de mensajes cuando el daemon se conecta a la red y comienza a procesar bloques. Espere hasta que se complete - toda la cadena de bloques se está descargando en el directorio de datos `dcrd`.

Verá una línea al comienzo de esta forma:

```no-highlight
22:58:04 2016-02-09 [INF] BMGR: Syncing to block height 617 from peer 104.236.167.133:9108
```

Entonces, mientras sigue descargando bloques, verá líneas como esta:

```no-highlight
22:58:16 2016-02-09 [INF] BMGR: Processed 321 blocks in the last 10.03s (544 transactions, height 322, 2016-02-09 09:50:34 +1000 EST)
```

La cadena de bloques se sincronizará completamente una vez que el bloque procesado más recientemente sea la altura actual del bloque. Puede saber comparando la fecha y la hora en el mensaje de registro o comparando la altura del último bloque procesado con la última altura del bloque en [the official block explorer](https://mainnet.decred.org/).

Tenga en cuenta que esta conexión se utilizará en el futuro. Debe dejar esta instancia de `dcrd` ejecutándose para usar` dcrwallet`.

---

Ahora que ha configurado `dcrd`, visite la guía [dcrwallet Setup](/getting-started/user-guides/dcrwallet-setup.md).
