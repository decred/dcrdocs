# <i class="fa fa-linux"></i> Guía del usuario de Linux

---

##  <i class="fa fa-download"></i>Descarga y extraíga el cgminer

Visite https://github.com/decred/cgminer/releases para encontrar la última versión de cgminer. Para descargar y extraer los archivos a través del terminal, ejecute los siguientes comandos. Tenga en cuenta que este ejemplo descarga cgminer v0.0.4.

```no-highlight
~/Decred/$ wget "https://github.com/decred/decred-release/releases/download/v0.0.4_cgminer/cgminer-decred-linux-x86_64-20160208.tar.gz"
~/Decred/$ tar -xvf cgminer*
```

Diríjase al nuevo directorio de cgminer:

```
~/Decred/$ cd cgminer*
```

## <i class="fa fa-play-circle"></i> Inicializar y ejecutar cgminer

> Paso Uno

Escriba lo siguiente en la ventana del terminal para enumerar su hardware con capacidad de minería:

```no-highlight
~/Decred/$ ./cgminer -n
```

Debería ver sus tarjetas de vídeo enumeradas por su nombre de código de la GPU o el nombre del controlador. La última línea de salida debe mostrar el número de GPUs compatibles con las que puede explorar.

> Segundo paso (Opcional)

Para el punto de su referencia de su sistema y averiguar el hashrate que sus GPUs son capaces de usar, use este comando:

```no-highlight
~/Decred/$ ./cgminer --blake256 --benchmark
```

> Paso tres

Registrarse en uno de los sitios web de la piscina y configurar un nuevo minero para cada uno de sus equipos de minería. Consulte el sitio web de la piscina de su elección para obtener instrucciones, si es necesario. En la ventana de terminal desde el paso uno, escriba el siguiente comando para iniciar cgminer (ignore los corchetes):

```no-highlight
~/Decred/$ ./cgminer --blake256 -o <pool url>:<port number> -u <web login>.<worker name> -p <worker password>
```

Example:

```no-highlight
~/Decred/$ ./cgminer --blake256 -o http://dcr.maxminers.net:7727 -u DecredMiner.miner1 -p 7@!x5L1
```

> Cuarto paso

El Cgminer debe lanzarse ahora. Cree un archivo de configuración de cgminer pulsando las siguientes teclas: `S` (Configuración), `W` (Archivo de configuracíon escrita), `Enter` (Guardar archivo de configuración como `cgminer.conf`). Tenga en cuenta que `cgminer.conf` se colocará en el mismo directorio que `cgminer`. Para agregar otras piscinas al archivo de configuración, abra `cgminer.conf` con Gedit (GUI) / Pico (CLI) o un editor de texto similar. Pueden agregarse múltiples agrupaciones siguiendo esta sintaxis en la sección "pools" del archivo de configuración (observe la coma entre cada entrada individual de la piscina):

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

Guardar `cgminer.conf` y cerrar` cgminer`. Reinicie cgminer utilizando el comando:

```no-highlight
~/Decred/$ ./cgminer
```

Esto concluye la guía básica de configuración del pool de cgminer. Para obtener más información sobre el uso de cgminer y explicaciones detalladas sobre las funciones del programa, consulte el [README oficial de cgminer] (https://github.com/decred/cgminer/blob/3.7/README).
