# Uso de la Guía Testnet

última actualización de testnet2

---

## ¿Por qué utilizar Testnet?

El testnet es un lugar maravilloso donde puedes experimentar con las aplicaciones Decred sin preocuparte de que un error te cueste dinero real. En realidad, se recomienda que la gente use testnet para aprender los conceptos básicos del software Decred y las nuevas características.

Decred está actualmente en su segundo Testnet, también conocido como testnet2. Los testnets se resetean periódicamente para ayudar a mantener un tamaño de archivo de blockchain manejable.

---

## Cómo ejecutar un nodo Testnet

Ejecutar un nodo testnet2 es increíblemente fácil. Su aplicación de elección tendrá que descargar el blockchain de testnet2, y tendrá que crear un nuevo archivo de billetera para usar testnet2. Sus archivos de blockchain mainnet y su billetera permanecerán intactos. Cambiar entre los dos es increíblemente fácil.

---

## Paymetheus

Para lanzar `Paymetheus` en testnet2, simplemente inicie la aplicación` Decred Testnet` en lugar de la aplicación `Decred`. A continuación, se pasará a través de la creación de billetera (los mismos pasos en la [Guía de configuración de Paymetheus] (/getting-started/user-guides/paymetheus.md)). Después de `dcrd` finaliza la sincronización en segundo plano, entonces podrá llenar su billetera`Paymetheus` con testnet DCR y familiarizarse con el software.

---

## Decrediton 

Para iniciar `Decrediton` en testnet2, debe iniciar` Decrediton` desde la línea de comandos con el indicador `--testnet`. Tenga en cuenta que el uso de la bandera una vez hará que siempre empiece en ese modo hasta que use el indicador `--mainnet` para volver al blockchain mainnet.

Para Linux,

1. Abra su terminal y navegue hasta el directorio con el ejecutable decrediton.
2. Emita el comando `./decrediton --testnet`.
3. Decrediton lanzará e intentará conectarse a testnet2.

For macOS,

1. Abra su terminal y emita el siguiente comando: `/Applications/decrediton.app/Contents/MacOS/decrediton --testnet`
2. Decrediton lanzará e intentará conectarse a testnet2.

Recuerde, si desea cambiar Decrediton de nuevo a mainnet, tendrá que emitir esos comandos con el indicador `--mainnet`.

___ 

## Suite de línea de comandos

Para iniciar `dcrd` y `dcrwallet` en testnet, simplemente agregue el indicador `- testnet` a su comando de lanzamiento. Alternativamente, puedes poner `testnet=1` en todos tus archivos de configuración, pero normalmente es mucho más rápido usar el indicador de inicio.

En el primer lanzamiento de `dcrd --testnet`, `dcrd` comenzará a descargar el blockchain de testnet2 en la carpeta `data/testnet2` del directorio inicial de` dcrd`.

Antes de poder iniciar `dcrwallet` con el indicador` --testnet`, debe crear una billetera testnet independiente usando el comando `dcrwallet --testnet --create`. Los pasos son los mismos que los que se encuentran en la [Guía de instalación de dcrwallet](/getting-started/user-guides/dcrwallet-setup.md). 

Para emitir comandos tanto `dcrwallet` como` dcrd`, también debe agregar el indicador `--testnet` a cualquiera de los comandos` dcrctl` que utilice. ej. emitir el comando `dcrctl --testnet - wallet getbalance` para comprobar su balance testnet.

---

## Adquirir monedas Testnet

Usted puede adquirir monedas a través de [Decred Testnet Faucet] (https://faucet.decred.org). Por favor, devuelve las monedas a la dirección que aparece en la parte inferior de esa página cuando hayas terminado de jugar con el testnet.

---

