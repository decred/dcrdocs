# Minería de prueba de trabajo (PoW)

---

## Visión de conjunto

La minería de prueba de trabajo, más comúnmente conocida como minería PoW, es la actividad
de comprometer el hardware y recursos de su computadora para procesar la red
transacciones y construir los bloques que conforman el blockchain en la
red. Cada vez que un bloque es creado (por un minero), alrededor de 30 nuevas monedas Decred
son hechos. Estas monedas se dividen a continuación de la siguiente manera:

Subvención | Party
---     | ---
60%   | Mineros
30%   | Votantes PoS
10%   | Subvención para el desarrollo

Usted recibirá, en promedio, una recompensa que es aproximadamente proporcional a la
hashrate de su minero y el hashrate total de la red cuando usted asigne
su computadora a PoW minería. Para empezar, debe tener una computadora con un
tarjeta de video. La mayoría de las tarjetas de video se pueden utilizar para la minería (incluyendo el "móvil"
tipos encontrados en algunos ordenadores portátiles). En general, las tarjetas de vídeo de gama
Mayores hashrates y por lo tanto reciben recompensas más altas.
---

## Minería Sola o minería de piscina 

> <i class="fa fa-male"></i> Solo Minería

<i class="fa fa-exclamation-triangle"></i>**La minería sola no es recomendada y no está cubierta por esta documentación!** La red Decred ve regularmente una tasa de hash de la red de hasta 10.000Gh/s . La minería a solas es generalmente hecha solamente por individuos avanzados o los grupos organizados con un racimo grande de GPUs así que no es direccionado aquí.

> <i class="fa fa-users"></i> Pool Mining

Cuando usted mina en una piscina, su hashrate se combina con todos los otros mineros de la piscina' de los hashrates para buscar la solución correcta para un bloque. Usted recibirá una recompensa basada en la cantidad de trabajo que realiza su minero en la piscina.
La minería de la piscina distribuye las partes basadas en los bloques encontrados así que usted puede ganar una cantidad constante de decreto algo que el "todo o ningunos" de la explotación de la minera sola.

---

## Obtener una dirección decred para recibir fondos 

Siga la guía [dcrctl Basics](/get-started/user-guides/dcrctl-basics.md) y cree una dirección para que pueda retirarle las recompensas de la minería.

---

##  <i class="fa fa-life-ring"></i>Inscríbete en un minería de pool

Estas piscinas de minería son conocidos para apoyar Decred:

* [<i class="fa fa-external-link-square"></i> http://decredpool.org](http://decredpool.org)
* [<i class="fa fa-external-link-square"></i> http://yiimp.ccminer.org](http://yiimp.ccminer.org)
* [<i class="fa fa-external-link-square"></i> http://coinmine.pl/dcr](http://coinmine.pl/dcr)
* [<i class="fa fa-external-link-square"></i> https://dcr.maxminers.net](https://dcr.maxminers.net)
* [<i class="fa fa-external-link-square"></i> https://dcr.suprnova.cc](https://dcr.suprnova.cc)
* [<i class="fa fa-external-link-square"></i> https://pool.mn/dcr](https://pool.mn/dcr)
* [<i class="fa fa-external-link-square"></i> https://zpool.ca](https://zpool.ca)

Las piscinas mineras funcionan más o menos igual, pero es posible que desee registrarse en varias piscinas y ver cuál se adapte mejor a usted.

Por favor, elija la mina en una piscina más pequeña para el hashrate de la red se puede extender para una mejor descentralización de la energía de la minería!

---

## GPU Drivers/Software  

Los controladores de GPU normalmente contienen las bibliotecas necesarias para la minería. Si tiene dificultades para ejecutar el software, puede reinstalar y comprobar específicamente que las bibliotecas OpenCL (AMD) o CUDA (NVIDIA) están seleccionadas.

---

## <i class="fa fa-download"></i> Seleccionar y descargar software de minería

### Minería Oficial de Decred (gominer)

Gominer es la minera oficial de Decred desarrollada y apoyada por el equipo Decred. Es el minero más fácil de configurar y comenzar a minar y por lo que se recomienda para la mayoría de los usuarios. En la actualidad, la última versión de gominer es **<i class="fa fa-github"></i>  [v1.0.0](https://github.com/decred/gominer/releases/)**  y los binarios oficiales se pueden descargar desde **[https://github.com/decred/decred-binaries/releases/tag/v1.0.0](https://github.com/decred/decred-binaries/releases/tag/v1.0.0)**

Asegúrese de seleccionar el sistema operativo correcto (Windows/Linux) y la versión correcta para su tipo de GPU (CUDA para tarjetas NVIDIA, OpenCL/OpenCLADL para tarjetas AMD). Gominer sólo está disponible para sistemas operativos de 64-bit. Las guías de usuario para iniciar la minería con gominer se pueden encontrar aquí:

- [Windows Pool-Mining](/mining/proof-of-work/pool-mining/gominer/windows.md)

### Mineros no oficiales

* <i class="fa fa-github"></i>[cgminer](https://github.com/kR105-zz/cgminer) - cgminer es un minería popular para **AMD** GPUs que tiene un largo historial de uso en muchas criptomonedas diferentes. Es más difícil de usar que el gominer decred.

* <i class="fa fa-github"></i>[ccminer](https://github.com/tpruvot/ccminer) - ccminer es un minero muy popular para **NVIDIA** GPU que tiene una largo historial de GPU. Uso en muchas criptomonedas diferentes. Es más difícil de usar que el gominer de decred.

* <i class="fa fa-github"></i>[sgminer] (https://github.com/tpruvot/sgminer) Aquellos con una tarjeta gráfica ** AMD ** que ejecuta Windows pueden querer descargar sgminer.

---

## Ejecución del software

* Descomprima e instale el software en un lugar de su elección.
* Abra un símbolo del sistema a esa ruta de acceso.
* Siga las instrucciones de configuración de las piscinas de minería de datos.
* Ejecutar la minería

Continúe con [PoW Mining FAQ] (/faq/proof-of-work-mining.md)
