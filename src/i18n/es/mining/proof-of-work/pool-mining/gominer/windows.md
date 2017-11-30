# <i class="fa fa-windows"></i> * gominer * Guía del usuario de Windows Pool Mining

Esta guía está destinada a la configuración inicial básica de gominer en una piscina de minería de la elección mediante un archivo de configuración, opciones más avanzadas están disponibles.

Última actualización para gominer v1.0.0.

---

### <i class="fa fa-download"></i> Descargar y extraer * gominer * Binario


> Descargar archivo .zip

Visite [https://github.com/decred/decred-binaries/releases/tag/v1.0.0](https://github.com/decred/decred-binaries/releases/tag/v1.0.0) para descargar el Gominer binarios de Windows. Dentro de la sección "Descargas" debe ver los siguientes archivos:

- `gominer-windows-amd64-cuda-v1.0.0.zip`,
- `gominer-windows-amd64-opencl-v1.0.0.zip`,
- `gominer-windows-amd64-opencladl-v1.0.0.zip`.

Para tarjetas gráficas NVIDIA, descargue el archivo `*-cuda-*.zip` <br />
Para las tarjetas gráficas AMD de las líneas Radeon y FirePro, descargue el archivo `*-opencladl-*.zip` <br />
Para otras tarjetas gráficas, descargue el archivo `*-opencl-*.zip`

Extraiga o copie todos los archivos en una nueva carpeta. Recuerde la ruta de acceso a esta carpeta o abra una nueva ventana del Explorador de archivos para ver el contenido de la carpeta (Para el resto de este tutorial, usaremos `C:\decred\gominer\` como un ejemplo). El contenido de esta carpeta debe ser `blake256.cl`, `gominer.exe`, `LICENSE`, `README.md` y `sample-gominer.conf`.

> Notas del símbolo del sistema

Para aquellos que son nuevos, familiarícese con algunos métodos para abrir un símbolo del sistema en un directorio específico (carpeta):

- En el Explorador de archivos, navegue a la carpeta específica, escriba `cmd` en la barra de direcciones y pulse Enter.
- En el Explorador de archivos, desplácese hasta la carpeta específica, haga clic en el menú desplegable "Archivo", vaya a la opción "Abrir el símbolo del sistema" y seleccione "Abrir el símbolo del sistema".
- Haga clic en el menú Inicio o presione la tecla Windows en el teclado, escriba `cmd` y abra la aplicación de escritorio "Símbolo del sistema" que debe aparecer en los resultados de búsqueda. Cambie el directorio actual a una carpeta específica mediante el comando`cd` ejemplo  `e.g. cd C:\decred\gominer\`. El comando `dir` por sí mismo puede usarse para ver el contenido del directorio actual.

### Configuración * gominer * Archivo de configuración

> Paso 1: Elija una piscina de minería

Antes de comenzar este paso, es importante que ya se haya registrado en una cuenta de grupo de minería (si lo requiere el grupo de minería de su elección, deberá crear un trabajador en el sitio web del grupo). Registre el inicio de sesión y la contraseña de su trabajador y el stratum+tcp address:port para uso posterior.

Si esto es nuevo para usted, aquí hay algunas guías para crear trabajadores en algunas de las comunidades de minería de Decred (AVISO: no olvide su PIN que estableció durante la creación de la cuenta - no podrá retirar ninguna DCR extraída sin ella):

- [https://dcr.maxminers.net/index.php?page=gettingstarted](https://dcr.maxminers.net/index.php?page=gettingstarted)
- [https://dcr.suprnova.cc/index.php?page=gettingstarted](https://dcr.suprnova.cc/index.php?page=gettingstarted)
- [https://www2.coinmine.pl/dcr/index.php?page=gettingstarted](https://www2.coinmine.pl/dcr/index.php?page=gettingstarted)
- [https://pool.mn/dcr/index.php?page=gettingstarted](https://pool.mn/dcr/index.php?page=gettingstarted)

> Paso 2: Verificar ID de dispositivo #

Antes de configurar el archivo de configuración, es vital que averigüe qué dispositivos, como identificado por gominer, desea utilizar para extraer (especialmente si desea evitar la extracción con su CPU o IGP). Para ello, abra el símbolo del sistema en la ubicación de `gominer.exe` (`por ejemplo, C:\decred\gominer\`), escriba `gominer.exe -l`, pulse Intro y una lista de los dispositivos que puede minar con lo que se mostrará. Anote los ID de dispositivos que desea usar. Sugerencia: Las tarjetas de video se pueden enumerar por su nombre de código.

> Paso 3: Editar archivo de configuración

Abra el archivo `sample-gominer.conf`. Para cada ajuste que estamos a punto de cambiar, borre el punto y coma antes de la variable de configuración después del signo `=`.

Dentro de la sección "Configuración general":

- Establezca `devices=` al Device ID#(s) que se graba utilizando el comando `gominer.exe -l` en el paso 2. Los dispositivos múltiples deben estar separados por comas, ejemplo `devices=2,3`.

Dentro de la sección "Configuración de minería":

- Defina `pool=` en el stratum+tcp address:port del grupo de minería de su elección, ejemplo decredpool.org utiliza `stratum+tcp://stratum.decredpool.org:3333` (ADVERTENCIA: el http://address:port no funcionará con gominer - stratum+tcp *debe* ser utilizado).
- Defina `pooluser=` en el inicio de sesión de su trabajador.
- Defina `poolpass =` en la contraseña de su trabajador.

Una vez realizados estos cambios, Guarde como o Guardar + Renombrar el archivo como gominer.conf.

> Paso 4: Copie gominer.conf a la carpeta AppData local

Dentro de un nuevo Explorador de archivos, escriba `%localappdata%\Gominer\` en la barra de direcciones. Copie `gominer.conf` desde su ubicación original, `ejemplo. C:\decred\gominer\`, en `%localappdata%\Gominer\`.

### Lanzar gominer.exe

Vaya de nuevo al directorio que contiene `gominer.exe` y `blake256.cl`, `por ejemplo. C:\decred\gominer\`, y ejecute `gominer.exe`. Si todo se hace correctamente, gominer debe leer desde el archivo de configuración, conectarse a la piscina, y comenzar el hashing con los dispositivos especificados. Comenzará a ver mensajes de desplazamiento, incluyendo estadísticas sobre su hashrate de cada dispositivo y aceptado, rechazado, obsoleto y total de las acciones enviadas.

Si hay un error de conexión, es probable que el `pool`,`pooluser` o `poolpass` esté configurado incorrectamente.

Si gominer empieza el hashing en un dispositivo que no quería usar, es probable que la configuración `devices` esté configurada incorrectamente.

Si ambos problemas existen, es probable que el archivo de configuración tenga un nombre incorrecto (debe denominarse `gominer.conf`) o que se encuentre en el directorio incorrecto (debe estar en`%localappdata%\Gominer\`).

### Familiarícese con el sitio web de su piscina

Ahora que su gominer es hashing lejos para usted, usted tiene tiempo para comprobar hacia fuera su website de su piscina. La mayoría de las piscinas tienen un panel en su sitio web que puede utilizar para encontrar estadísticas sobre la piscina, la red y la ronda actual (el tiempo transcurrido entre cada bloque encontrado por la piscina). Además, una vez que reciba un pago lo suficientemente grande, puede retirar sus monedas a través de la página Editar Cuenta configurando una dirección de pago de DCR y estableciendo un umbral de Pago Automático o eligiendo Reembolsar el balance total de su cuenta.

### Consejos útiles

* Para las versiones OpenCL y OpenCL ADL del gominer*, gominer calcula automáticamente un WorkSize que da como resultado que el algoritmo de trabajo se ejecute cada 500ms. El cambio de los ajustes de Intensidad / Tamaño de trabajo dentro de `gominer.conf`resultará en un problema conocido - el algoritmo se ejecutará a un ritmo mucho más rápido debido a la disminución de WorkSize (esto no resultará en más acciones que se generan), resultando en un mayor uso de memoria a veces tan alto como 10MB/seg. Esto eventualmente conduce a que su sistema se quede sin espacio RAM y automáticamente terminando gominer. Lo mejor es dejar estos ajustes solos y permitir que gominer calcule su propio WorkSize.
