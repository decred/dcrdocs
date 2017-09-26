# Instalación Manual CLI

---

The newest Binary Releases can be found here: [https://github.com/decred/decred-binaries/releases](https://github.com/decred/decred-binaries/releases). With the exception of the `.msi` and `.dmg` files, they are archives of the latest executable binaries for each release. Although most of this will be unzip and go, instructions are provided for macOS, Linux, and Windows below (assumed proficiency for *BSD users).

> macOS

1. Descargue el archivo correcto :

    For 32-bit computers, download the `decred-darwin-386-v1.1.0.tar.gz` file. <br />
    For 64-bit computers, download the `decred-darwin-amd64-v1.1.0.tar.gz` file.

2. Navegue hasta la ubicación de descarga y extraiga el archivo .tar.gz:

    Buscador: simplemente haga doble click en el archivo .tar.gz . <br />
    Terminal: utilice el comando `tar -xvzf nombredearchivo.tar.gz`.

   **NOTA**: Si está usando Safari en MacOS Sierra y tiene los archivos 'Open' seguros 'después de descargar', los archivos .gz y .zip se descomprimen automáticamente después de la descarga. El comando `tar -xvzf nombrearchivo.tar.gz` da como resultado este error:` tar: Error al abrir el archivo: Error al abrir 'nombrearchivo.tar.gz'`. Use `tar -xvzf nombrearchivo.tar` (quite el .gz del comando anterior).
    
    Both of these should extract the tar into a folder that shares the same name. (`e.g. tar -xvzf decred-darwin-amd64-v1.1.0.tar.gz` should extract to `decred-darwin-amd64-v1.1.0`). It should include `dcrctl`, `dcrd`, `dcrwallet`, `sample-dcrctl.conf`, `sample-dcrd.conf`, and `sample-dcrwallet.conf`.


> Linux

1. Descargue el archivo correcto:

    For 32-bit computers, download the `decred-linux-386-v1.1.0.tar.gz` file. <br />
    For 64-bit computers, download the `decred-darwin-amd64-v1.1.0.tar.gz` file. <br />
    For 32-bit ARM computers, download the `decred-linux-arm-v1.1.0.tar.gz` file. <br />
    For 64-bit ARM computers, download the `decred-linux-arm64-v1.1.0.tar.gz` file.

2. Navegue hasta la ubicación de descarga y extraiga el archivo .tar.gz:

    Explorador de Archivos Ubuntu: simplemente haga click derecho en el archivo .tar.gz y presione "Extraer Aqui". <br />
   Terminal: utilice el comando `tar -xvzf nombredearchivo.tar.gz`.
    
    Both of these should extract the tar.gz into a folder that shares the same name. (`e.g. tar -xvzf decred-darwin-amd64-v1.1.0.tar.gz` should extract to `decred-darwin-amd64-v1.1.0`). It should include `dcrctl`, `dcrd`, `dcrwallet`, `sample-dcrctl.conf`, `sample-dcrd.conf`, and `sample-dcrwallet.conf`.

>Windows

Nota: Windows 7/8/10 proporciona soporte nativo para los archivos `.zip`, por lo tanto es preferible usar el archivo` .zip` para que las aplicaciones de terceros no sean necesarias para el archivo `.tar.gz`. Se proporcionan instrucciones para el archivo `.zip`.

1. Descargue el archivo correcto:

    For 32-bit computers, download the `decred-windows-386-v1.1.0.zip` file. <br />
    For 64-bit computers, download the `decred-windows-amd64-v1.1.0.zip` file.

2. Navegue hasta la ubicación de descarga y descomprima el archivo `.zip`:

    Explorador de archivos: Haga clic con el botón derecho del ratón en el archivo .zip, seleccione "Extraer todo .." y se abrirá un mensaje pregntando cual directorio usar. El valor predeterminado extraerá el `.zip` en una carpeta con el mismo nombre. Debe incluir `dcrctl`,` dcrd`, `dcrwallet`,` sample-dcrctl.conf`, `sample-dcrd.conf` y` sample-dcrwallet.conf`.

Si decide descargar el archivo `.tar.gz`, necesitará dos extracciones separadas en alguna aplicación de terceros (7-zip, winRAR, etc.) para acceder a los binarios reales.

---

## Configuración Mínima

Como mínimo, para que `dcrd`,` dcrwallet` y `dcrctl` puedan comunicarse entre sí, necesitan ser lanzados con la misma combinación rpcuser / rpcpass. Para la configuración manual, siga estos pasos:

1. Si no existen los directorios principales dependientes del sistema operativo enumerados en la sección anterior [archivos de configuración] (# configuración-archivo-ubicación), creelos para `dcrd`,` dcrwallet` y `dcrctl`.
2. Using your favourite text editor, create a new file enter the text, `[Application Options]` as the first line. Save it as `dcrd.conf` in `dcrd`'s home directory.
3. Create another new file and add the text `[Application Options]` to the first line as before. Save it as `dcrwallet.conf` in `dcrwallet`'s home directory.
4. Create a third text file and save it as `dcrctl.conf` in `dcrctl`'s home directory. You don't need to add anything to this one right now.
5. Elija un nombre de usuario y contraseña arbitrarios, éstos sólo se utilizarán para que cada aplicación se comunique a través de una llamada a procedimiento remoto. La configuración más fácil es establecerlas todas iguales.
6. Dentro de `dcrd.conf`, debajo de` [Application Options] `, agregue las siguientes líneas: <br /> <br />
        `rpcuser=<chosen-username>`<br />
        `rpcpass=<chosen-password>`<br /><br />
7. Dentro de `dcrwallet.conf`, debajo de` [Opciones de aplicación] `, agregue las siguientes líneas: <br /> <br />
        `username=<chosen-username>`<br />
        `password=<chosen-password>`<br /><br />
8. Dentro de `dcrctl.conf`, agregue las líneas siguientes: <br /> <br />
        `rpcuser=<chosen-username>`<br />
        `rpcpass=<chosen-password>`<br /><br />
9. Guarde los tres archivos de configuración.

Please see the [sample config](https://github.com/decred/dcrd/blob/master/sampleconfig/sampleconfig.go#L8-L352) for more customisation options.