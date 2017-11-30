# <i class="fa fa-windows"></i> Guía del usuario de Windows

---

## <i class="fa fa-download"></i> Descarga y extrae cgminer

Visite https://github.com/decred/cgminer/releases para encontrar la última versión de cgminer. Para Windows de 64-bit, descargue y extraiga `cgminer-decred-w64_*. zip`. Para Windows de 32 bit, descargue y extraiga `cgminer-decred-w32_*.zip`. Extraiga todos los archivos a una nueva carpeta y abra la nueva carpeta para ver los archivos.

## <i class="fa fa-play-circle"></i> Inicializar y ejecutar cgminer

> Primer paso

Abra una ventana de símbolo del sistema escribiendo `cmd` en la barra de direcciones en la parte superior del explorador de archivos que tiene los nuevos archivos cgminer y presionando`Enter`. Escriba lo siguiente en la ventana del símbolo del sistema para enumerar su hardware con capacidad de minería:

```no-highlight
C:\Decred> cgminer -n
```

Debería ver sus tarjetas de vídeo enumeradas por su nombre de código de GPU o el nombre del controlador. La última línea de salida debe mostrar el número de GPUs compatibles con las que puede minar.

> Segundo paso (Opcional)

Para comparar su sistema y averiguar el hashrate en el que puede realizar, utilice el comando:

```no-highlight
C:\Decred> cgminer --blake256 --benchmark
```

> Paso tres

Registrarse en uno de los sitios web de la piscina y configurar un nuevo minero para cada uno de sus equipos de minería. Consulte el sitio web de la piscina de su elección para obtener instrucciones, si es necesario. En la ventana de la línea de comandos desde el paso uno, escriba el comando siguiente para iniciar cgminer (ignore los corchetes):

```no-highlight
C:\Decred> cgminer --blake256 -o <pool url>:<port number> -u <web login>.<worker name> -p <worker password>
```

Ejemplo:

```no-highlight
C:\Decred> cgminer --blake256 -o http://dcr.maxminers.net:7727 -u DecredMiner.miner1 -p 7@!x5L1
```

> Cuarto paso

Cgminer debería iniciarse ahora. Cree un archivo de configuración de cgminer presionando las siguientes teclas: `S` (Ajustes),` W` (Write Config File), `Enter` (Guardar archivo de configuración como` cgminer.conf`). Tenga en cuenta que `cgminer.conf` se colocará en el mismo directorio que` cgminer.exe`. Para añadir otras agrupaciones al archivo de configuración, abra `cgminer.conf` con el Bloc de notas o un editor de texto similar. Utilice la sintaxis siguiente para realizar cambios en la sección "pools" del archivo de configuración (observe la coma entre cada entrada de grupo individual):

```no-highlight
"pools" : [
   {
      "url" : "http://dcr.maxminers.net:7727",
      "user" : "Login.Worker",
      "pass" : "password"
   },
   {
      "url" : "http://dcr.suprnova.cc:9110",
      "user" : "Login.Worker",
      "pass" : "password"
   }
]
```

> Paso cinco

Guarde `cgminer.conf` y cierre` cgminer.exe`. Haga doble clic en el programa cgminer y se iniciará y cargará el archivo de configuración recién creado. Esto concluye la guía básica de configuración del pool de cgminer. Para obtener más información sobre el uso de cgminer y explicaciones detalladas sobre las funciones del programa, consulte [cgminer README] (https://github.com/decred/cgminer/blob/3.7/README).
