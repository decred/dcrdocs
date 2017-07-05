# Guía para Principiantes

Última actualización para v1.0.1

---

## Bienvenido a Decred

¡Bienvenido a Decred! Estamos muy contentos de tenerle. Como usted puede o puede no saber ya, Decred es diferente. Hay un muchas cosas nuevas para aprender y entender completamente cómo funcionan las cosas. Esta documentación intentará hacer las cosas un poco más fáciles de entender.

Esta guía para principiantes es un camino para poner en marcha el software Decred. Puede elegir entre varios clientes para obtener un nodo en la red y Decred en su cartera. En concreto, aprenderá cómo instalar, configurar y utilizar las aplicaciones Decred; Cómo obtener DCR; Cómo votar a través de Prueba-de-Participación; y cómo usar el explorador de bloques.

Tendrá que seguir una [Guía de instalación] (# guía de instalación) y, a continuación, siga la ruta de la aplicación de su elección a continuación. Después de que su aplicación esté configurada, vaya a través de las [Guías generales] (#general-guides) en la parte inferior de esta página. Si tiene alguna pregunta en el camino, únase a nosotros en nuestro [Slack](/support-directory.md#join-us-on-slack).

** NOTA: El uso de Testnet es altamente recomendable para aprender a usar el software Decred sin el temor de cometer un error y perder dinero real. Después de seguir las guías para configurar su elección de software, visite la guía [Using Testnet guide] (/getting-started/using-testnet.md) para aprender cómo iniciar su aplicación en la testnet de Decred. **

---

## Aplicaciones

A continuación encontrará una lista de las aplicaciones disponibles actualmente, con un gráfico que muestra su compatibilidad con diferentes sistemas operativos.

**Paymetheus**: The only Windows GUI client as of v1.1.0. <br />
**dcrd**: The node daemon, this command-line application handles block management and consensus. <br />
**dcrwallet**: The wallet daemon, this command-line application handles address and transaction management. <br />
**dcrctl**: The remote procedure call (RPC) client, this command-line application is used to control dcrd and dcrwallet via RPC commands. <br />
**Decrediton**: Cross-platform GUI client as of v1.1.0.

|           | Paymetheus | dcrd | dcrwallet | dcrctl | Decrediton |
| ---------:|:----------:|:----:|:---------:|:------:|:-----------:|
| Windows   | X          | X    | X         | X      |             |
| macOS     |            | X    | X         | X      | X           |
| Linux     |            | X    | X         | X      | X           |
| Otros UNIX|            | X    | X         | X      |             |

"Otros UNIX" incluye actualmente varios * BSD y Solaris/illumos.

Nota: Pronto podrá notar una de las muchas diferencias entre Decred y otros
criptomonedas populares: el daemon de cartera y el daemon de nodo son separados.
Muchas otras monedas ejecutan estas funciones juntas en un solo daemon.
Para aquellos que opten por utilizar las interfaces de línea de comandos, esto significa que debe
ejecutar `dcrd` para la funcionalidad completa del nodo y` dcrwallet` para almacenar sus DCR,
crear transacciones y participar en minado/votación de Prueba-de-Participación.

---

## Guías de Instalación

Para empezar, elija una opción para las instalaciones disponibles para su sistema operativo a continuación:

* [Paymetheus](/getting-started/user-guides/paymetheus.md)
* [Command Line Suite **via dcrinstall**](/getting-started/user-guides/cli-installation.md) - NOTA: El método `dcrinstall` es la forma más rápida y fácil de ejecutar un nodo y cartera de línea de comandos. Se recomienda y las guías de configuración de ruta de la línea de comandos a continuación asumirán que ha utilizado este método.
* [Decrediton (ALPHA)](/getting-started/user-guides/decrediton-setup.md)

---

** NOTA: ** Todas las guías siguientes se pueden encontrar en el menú de navegación con los mismos nombres.

## Método Paymetheus

Las siguientes guías, en orden, le ayudarán a comenzar con Paymetheus:

* [Configuración de Paymetheus](/getting-started/user-guides/paymetheus.md)
* [Usando Paymetheus](/getting-started/user-guides/using-paymetheus.md)

## Método Decrediton 

La siguiente guía le ayudará a cargar Decrediton:

* [Configuración de Decrediton](/getting-started/user-guides/decrediton-setup.md)

## Método de Línea de Comandos

Las siguientes guías, en orden, le ayudarán a comenzar con las Aplicaciones de Línea de Comandos (`dcrd`,` dcrwallet`, `dcrctl`):

* [Diferencias de la Línea de Comandos](/getting-started/cli-differences.md)
* [Conceptos básicos de las opciones de inicio](/getting-started/startup-basics.md)
* [Configuración de dcrd](/getting-started/user-guides/dcrd-setup.md)
* [Configuración de dcrwallet](/getting-started/user-guides/dcrwallet-setup.md)
* [Dcrctl Uso Básico](/getting-started/user-guides/dcrctl-basics.md)

## Guías Generales

Las siguientes guías son independientes de las diferentes aplicaciones:

* [Usando Testnet](/getting-started/using-testnet.md)
* [Obteniendo DCR](/getting-started/obtaining-dcr.md)
* [Usando el Explorador de Bloques](/getting-started/using-the-block-explorer.md)
* [Guía de Prueba-de-Participación](/mining/proof-of-stake.md)
* [Guía de Votación de Mainnet](/getting-started/user-guides/agenda-voting.md)
