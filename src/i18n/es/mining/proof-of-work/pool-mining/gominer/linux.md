# **<i class="fa fa-linux"></i> *gominer* Guía de Usuario Red de Minería Linux **

Esta guía está destinada a la configuración inicial básica de gominer con la red de minería de elección mediante un archivo de configuración; opciones más avanzadas están disponibles.

Última actualización el 28 de abril de 2017.

---

### **<i class="fa fa-download"></i> Descargue y Extraiga el  *gominer* Binario**


> Descargar Archivo .tar.gz

Visite [https://github.com/decred/decred-binaries/releases](https://github.com/decred/decred-binaries/releases) para descargar los últimos binarios Linux de gominer. Solamente las versiones de 64 bits de gominer están disponibles. Los últimos lanzamientos actuales son:

- `gominer-linux-amd64-cuda-v1.0.0.tar.gz`,
- `gominer-linux-amd64-opencl-v1.0.0.tar.gz`,
- `gominer-linux-amd64-opencladl-v1.0.0.tar.gz`.

Para tarjetas gráficas NVIDIA, descargue el archivo `*-cuda-*.tar.gz`. <br />
Para tarjetas gráficas AMD de las líneas Radeon y FirePro, descargue el archivo `*-opencladl-*. tar.gz`. <br />
Para otras tarjetas gráficas, descargue el archivo `*-opencl-*.tar.gz`.

Para los amantes de la línea de comandos, aquí están los enlaces directos para v1.0.0:

```no-highlight
$ wget https://github.com/decred/decred-binaries/releases/download/v1.0.0_gominer/gominer-linux-amd64-cuda-v1.0.0.tar.gz
$ wget https://github.com/decred/decred-binaries/releases/download/v1.0.0_gominer/gominer-linux-amd64-opencl-v1.0.0.tar.gz
$ wget https://github.com/decred/decred-binaries/releases/download/v1.0.0_gominer/gominer-linux-amd64-opencladl-v1.0.0.tar.gz
```

> Extraer el archivo .tar.gz

Extraiga o copie todos los archivos en un nuevo directorio. Para este tutorial usaremos `~/ decred/` como nuestro directorio de trabajo. Desde la línea de comandos:

```no-highlight
$ tar -xzf gominer-linux-amd64-cuda-v1.0.0.tar.gz -C ~/decred/
```

Cuando descomprime el tar, creará un directorio llamado `gominer-linux-amd64-opencladl-v1.0.0`. El contenido de este directorio debe ser `blake256.cl`,` blake256-old.cl`, `gominer`,` LICENSE`, `README.md` y` sample-gominer.conf`.

Para la versión CUDA, ahora se incluye la biblioteca de tiempo de ejecución CUDA. Los archivos de esta versión también incluirán `libcudart.so.8.0` y` rungominer.sh`. La secuencia de comandos se utiliza para iniciar gominer con la biblioteca de tiempo de ejecución incluida para su conveniencia. Debe tener controladores instalados para su tarjeta gráfica que soporten CUDA 8, sin embargo. Los controladores más antíguos harán que gominer se bloquee en el lanzamiento.

### ** Configurar el *gominer* Archivo de Configuración**

> Paso 1: Elija una Red de Minería

Antes de comenzar con este paso, es importante que ya se haya registrado con una cuenta de red de minería (si lo requiere la red de minería de su elección, deberá crear un trabajador en el sitio web de la red). Registre el inicio de sesión y la contraseña de su trabajador y el stratum+tcp dirección:puerto de la red para uso posterior.

Si esto es nuevo para usted, aquí hay algunas guías para crear trabajadores en algunas de las redes de minería de Decred (AVISO: no olvide su PIN que estableció durante la creación de la cuenta - no podrá retirar ningun DCR minado sin el):

- [https://dcr.maxminers.net/index.php?page=gettingstarted](https://dcr.maxminers.net/index.php?page=gettingstarted)
- [https://dcr.suprnova.cc/index.php?page=gettingstarted](https://dcr.suprnova.cc/index.php?page=gettingstarted)
- [https://www2.coinmine.pl/dcr/index.php?page=gettingstarted](https://www2.coinmine.pl/dcr/index.php?page=gettingstarted)
- [https://pool.mn/dcr/index.php?page=gettingstarted](https://pool.mn/dcr/index.php?page=gettingstarted)

> Paso 2: Verificar el Número de ID del Dispositivo 

Antes de configurar el archivo de configuración, es vital que averigüe qué dispositivos, como identificados por gominer, desea utilizar para minar. Para ello, abra una ventana de terminal, navegue a la ubicación que instaló gominer arriba (por ejemplo `~/ decred/gominer-linux-amd64-cuda-v1.0.0`), escriba` ./gominer -l` o `./rungominer.sh -l` si está utilizando la versión CUDA, presione Enter, y se mostrará una lista de los dispositivos con los que puede minar. Registre los ID de dispositivos que desea usar. Sugerencia: Las tarjetas de video se pueden enumerar por su nombre de código.

> Paso 3: Editar Archivo de Configuración

Abra el archivo `sample-gominer.conf` con el editor de texto de su elección. Para cada ajuste que estamos a punto de cambiar, borre el punto y coma antes de la variable de configuración después del signo `=`.

Dentro de la sección "Configuraciónes Generales":

- defina `devices=` en el número de ID(s) de dispositivo registrado usando el comando `./gominer -l` o` ./rungominer.sh -l` en el paso 2. Múltiples dispositivos deben estar separados por comas, p. `dispositivos=2,3`.

Dentro de la sección "Configuración de Minería":

- Defina `pool=` en el stratum+tcp dirección:puerto de la red de minería de su elección, p. decredpool.org utiliza `stratum+tcp://stratum.decredpool.org:3333` (ADVERTENCIA:   http://dirección:puerto no funcionará con gominer - stratum+tcp *debe* ser utilizado).
- Defina `pooluser=` con el inicio de sesión de su trabajador.
- Defina `poolpass=` con la contraseña de su trabajador.

Después de realizar estos cambios, guarde el archivo. Haga una copia del mismo y llámelo gominer.conf en el directorio gominer config:

```no-highlight
$ mkdir -p ~/.gominer
$ cp sample-gominer.conf ~/.gominer/gominer.conf
```

### **Lanzar gominer**

Vaya de nuevo al directorio que contiene `gominer` y` blake256.cl`, `por ejemplo. ~/decred/gominer-linux-amd64-cuda-v1.0.0/`, y ejecútelo -` ./gominer` o `./ rungominer.sh`. Si todo se hizo correctamente, gominer debe leer desde el archivo de configuración, conectarse a la red, y comenzar el hash con los dispositivos especificados. Comenzará a ver mensajes desplazándose, incluyendo estadísticas sobre el hashrate de cada dispositivo y si fue aceptado, rechazado, obsoleto y el total de las acciones enviadas.

Si hay un error de conexión, es probable que el `pool`,` pooluser` o `poolpass` esté configurado incorrectamente.

Si gominer empieza a hashing en un dispositivo que no quería usar, es probable que la configuración `devices` esté configurada incorrectamente.

Si existen ambos problemas, es probable que el archivo de configuración tenga un nombre incorrecto (debe denominarse `gominer.conf`) o que se encuentre en el directorio incorrecto (debe estar en` ~/.gominer/`).

### **Familiarícese con el Sitio Web de su Red de Minería**

Ahora que su gominer esta ejecutando hashs para usted, usted tiene tiempo para visitar es sitio web de su red. La mayoría de las redes tienen un panel en su sitio web que puede utilizar para encontrar estadísticas sobre la red y la ronda actual (el tiempo transcurrido entre cada bloque encontrado por la red). Además, una vez que reciba un pago lo suficientemente grande, puede retirar sus monedas a través de la página Editar Cuenta configurando una dirección de pago de DCR y estableciendo un umbral de pago automático o eligiendo retirar el saldo total de su cuenta.

### **Consejos útiles**

*Para las versiones OpenCL y OpenCL ADL de gominer*, gominer calcula automáticamente un WorkSize que da como resultado que el algoritmo de trabajo se ejecute cada 500ms. El cambio de los ajustes de Intensidad/WorkSize dentro de `gominer.conf` resultará en un problema conocido - el algoritmo se ejecutará a un ritmo mucho más rápido debido a la disminución de WorkSize (esto no resultará en más acciones siendo generadas), resultando en un mayor uso de memoria a veces tan alto como 10MB/seg. Esto eventualmente lleva a que su sistema se quede sin espacio RAM y automáticamente terminando gominer. Lo mejor es dejar estos ajustes y permitir que gominer calcule su propio WorkSize.
