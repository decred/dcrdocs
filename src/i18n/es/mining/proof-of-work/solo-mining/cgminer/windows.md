# <i class="fa fa-windows"></i>Guía del usuario de Windows

---

## <i class="fa fa-cloud"></i> Conecta dcrd a la red Decred

> Primer paso

Tenga en cuenta que todos los comandos `dcrd`,` dcrwallet` y `dcrctl` deben ejecutarse en el directorio donde están sus archivos Decred! Iniciar `dcrd`:

```no-highlight
C:\Decred> dcrd -u <username> -P <password>
```

Iniciar dcrwallet:

```no-highlight
C:\Decred> dcrwallet -u <username> -P <password>
```

> Segundo paso

Generar una nueva dirección de cartera:

```no-highlight
C:\Decred> dcrctl -u <username> -P <password> --wallet getnewaddress
```

Copia la nueva dirección (salida del último comando). Cierre / detenga `dcrd` y` dcrwallet` pulsando `ctrl+c` en cada ventana.

> Paso tres

Reinicie `dcrd` usando el comando:

```no-highlight
C:\Decred> dcrd --miningaddr <new address from step two or your web client wallet address>
```

---

## <i class="fa fa-download"></i>Descarga y extrae cgminer

Visite https://github.com/decred/cgminer/releases para encontrar la última versión de cgminer. Para Windows de 64 bit, descargue y extraiga `cgminer-decred-w64_*.zip`. Para Windows de 32 bit, descargue y extraiga `cgminer-decred-w32_*.zip`. Extraiga todos los archivos a una nueva carpeta y abra la nueva carpeta para ver los archivos.

---

## <i class="fa fa-play-circle"></i> Inicializar y ejecutar cgminer

> Primer paso

Haga clic derecho en `start_local.bat` y haga clic en` Editar`. Cambie el nombre de usuario y la contraseña para que coincidan con las credenciales utilizadas en el paso 1. Guarde y cierre start_local.bat Para referencia, aquí está el comando en start_local.bat:

```no-highlight
C:\Decred> cgminer --blake256 -o https://127.0.0.1:9109 -u <username> -p <password> --cert "%LOCALAPPDATA%\Dcrd\rpc.cert"
```

> Segundo paso

Si dcrd no ha terminado de sincronizar con el blockchain, espere a que finalice y continúe con el siguiente paso. Cuando haya terminado, mostrará:

```no-highlight
[INF] BMGR: Processed 1 block in the last 5m34.49s
```

> Paso tres

Haga doble clic en `start_local.bat`. `cgminer` debe abrirse. Cree un archivo de configuración `cgminer` pulsando las siguientes teclas:` S` (Ajustes), `W` (Write Config File),` Enter` (Guardar archivo de configuración como `cgminer.conf`). Tenga en cuenta que `cgminer.conf` se colocará en el mismo directorio que cgminer. 
cgminer ahora puede ser lanzado simplemente haciendo doble clic `cgminer.exe`. Esto concluye la guía básica de configuración del solo cgminer. Para obtener más información sobre el uso de cgminer y explicaciones detalladas sobre las funciones del programa, consulte el [README] oficial de cgminer (https://github.com/decred/cgminer/blob/3.7/README).
