# <i class="fa fa-linux"></i> Guía del usuario de Linux

---

## <i class="fa fa-cloud"></i> Conecta dcrd a la red Decred

> Primer paso

Tenga en cuenta que todos los comandos `dcrd`,` dcrwallet` y `dcrctl` deben ejecutarse en el directorio donde están sus archivos Decred! Iniciar `dcrd`:

```no-highlight
~/Decred/$ ./dcrd -u <username> -P <password>
```

Iniciar dcrwallet:

```no-highlight
~/Decred/$ ./dcrwallet -u <username> -P <password>
```

> Segundo paso

Generar una nueva dirección de cartera:

```no-highlight
~/Decred/$ ./dcrctl -u <username> -P <password> --wallet getnewaddress default
```

Copia la nueva dirección (salida del último comando). Cierre / detenga `dcrd` y` dcrwallet` pulsando `ctrl+c` en cada ventana.

> Paso tres

Reinicie `dcrd` usando el comando:

```no-highlight
~/Decred/$ ./dcrd -u <username> -P <password> --miningaddr <new address from step two or your web client wallet address>
```

> Cuarto paso

Configure TLS security copiando rpc.cert a /usr/share/ca-certificates:

```no-highlight
sudo cp /home/<username>/.dcrd/rpc.cert /usr/share/ca-certificates/dcrd.crt
```

Utilice un editor de texto para agregar la línea "dcrd.crt" (sin comillas) a /etc/ca-certificates.conf:

```no-highlight
sudo gedit /etc/ca-certificates.conf
```

Actualizar la lista de certificados de CA:

```no-highlight
sudo update-ca-certificates
```

---

## <i class="fa fa-download"></i> Descarga y extrae cgminer

Visite https://github.com/decred/cgminer/releases para encontrar la última versión de cgminer. Para descargar y extraer a través de su terminal Linux, utilice los siguientes comandos:

```no-highlight
wget https://github.com/decred/decred-release/releases/download/v0.0.4_cgminer/cgminer-decred-linux-x86_64-20160208.tar.gz
tar -xvf cgminer-decred-linux-x86_64-20160208.tar.gz
```

---

## <i class="fa fa-play-circle"></i> Inicializar y ejecutar cgminer

> Primer paso

Si `dcrd` no ha terminado de sincronizarse con el blockchain, espere a que finalice y continúe con el siguiente paso. Cuando haya terminado, mostrará:

```no-highlight
[INF] BMGR: Processed 1 block in the last 5m34.49s
```

> Segundo paso

En su directorio cgminer, inicie cgminer con el comando:

```no-highlight
~/Decred/$ ./cgminer --blake256 -o https://127.0.0.1:9109 -u <username> -p <password>
```

Cree un archivo de configuración de cgminer presionando las siguientes teclas: `S` (Ajustes),` W` (Escribe el archivo de configuración), `Enter` (Guardar archivo de configuración como` cgminer.conf`). Tenga en cuenta que `cgminer.conf` se colocará en el mismo directorio que cgminer. Cgminer ahora se puede iniciar simplemente ejecutando el comando:

```no-highlight
~/Decred/$ ./cgminer
```

Esto concluye la guía básica de configuración del solo cgminer. Para obtener más información sobre el uso de cgminer y explicaciones detalladas sobre las funciones del programa, consulte el [README] oficial de cgminer (https://github.com/decred/cgminer/blob/3.7/README).
