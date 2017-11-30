# Simnet 

---

## Visión de conjunto

Al desarrollar aplicaciones de Decred o probar cambios potenciales, a menudo es extremadamente útil tener una red de prueba donde los niveles de dificultad son lo suficientemente bajos como para generar bloques según sea necesario.

Para facilitar estos escenarios, dcrd proporciona una red de simulación (`--simnet`). La siguiente es una visión general de las propiedades más importantes que lo distinguen de la red principal:

* La dificultad comienza extremadamente baja para permitir la minería rápida de CPU de bloques
* Cambios en la red:
    * All code related to peer discovery and IP address dissemination is disabled to help ensure the network remains private
    * El peer y la red RPC son puertos diferentes
    * Una secuencia de bytes de red única se utiliza en el protocolo de mensajes peer-to-peer para que los bloques no se puedan cruzar accidentalmente con la red principal
* Todos los parámetros de dirección de cadena y pago son únicos para evitar la confusión con la red principal:
    * Diferente bloque de genesis 
    * Las direcciones de pago comienzan con prefijos diferentes:
        * Standard pay-to-pubkeyhash (P2PKH) comienza con mayúsculas `S`
        * El estándar pay-to-scripthash (P2SH) comienza con minúsculas `s`
    * Las claves extendidas deterministas jerárquicas exportadas (BIP32) comienzan con prefijos diferentes:
        * Las claves extendidas públicas comienzan con `spub`
        * Las claves privadas extendidas comienzan con `sprv`
    * El tipo de moneda BIP44 utilizado en las rutas de las teclas HD es `s` en minúsculas

  ---

## Empezando

Ejecutando un único nodo `dcrd` en simnet esta simplemente el inicio de ` dcrd` con el indicador `--simnet`. Sin embargo, para ser realmente útil, que normalmente desea ser capaz de enviar monedas entre las direcciones que implica que los bloques necesitarán ser minado y la interfaz con una cartera será necesario.

Además, ya que efectivamente no hay monedas aún en la nueva red privada, una serie inicial de bloques tendrá que ser minado para pagar a una dirección que usted posee por lo que hay monedas utilizables para gastar.

Como se mencionó anteriormente, simnet utiliza direcciones únicas para evitar confusiones con la red principal. Por lo tanto, significa que debe utilizarse una cartera que admita el formato de dirección. Para ello, `dcrwallet` con el indicador` --simnet` puede ser usado.

Lo siguiente es una referencia de comando para empezar:

** NOTA: Todos estos comandos pueden ser simplificados creando archivos de configuración y haciendo uso de ellos, sin embargo los comandos aquí usan todos los switches en la línea de comandos para mostrar exactamente lo que se necesita para cada uno. **

* Iniciar dcrd en simnet:

    `$ dcrd --simnet --rpcuser=<username> --rpcpass=<password>`

* Crear una nueva cartera simnet:

    `$ dcrwallet --simnet --create`

* Iniciar dcrwallet en simnet:

    `$ dcrwallet --simnet --username=<username> --password=<password>`

* Crear un nueva dirección simnet Decred :

    `$ dcrctl --simnet --wallet --rpcuser=<username> --rpcpass=<password> getnewaddress`

* Detenga el proceso dcrd inicial y reinícielo con la dirección de minería establecida en la salida del comando anterior:

    `$ dcrd --simnet --rpcuser=<username> --rpcpass=<password> --miningaddr=<S....>`

* Instruya el dcrd para generar suficientes bloques iniciales para que la primera base coincida:

    `$ dcrctl --simnet --rpcuser=<username> --rpcpass=<password> generate 100`

* Compruebe el balance de la cartera para asegurarse de que las monedas están disponibles:

    `$ dcrctl --simnet --wallet --rpcuser=<username> --rpcpass=<password> getbalance`
  
En este punto, hay un simnet privado completamente funcional con monedas disponibles para enviar a otras direcciones de simnet. Cada vez que se envían una o más transacciones, se debe emitir un RPC `generate 1` para minar un bloque nuevo con las transacciones incluidas.
