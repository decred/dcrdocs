# Guía de instalación de CLI

Esta página fue actualizada para v1.0.1.

---

## dcrinstall 

`d-crinstall` es el método recomendado para instalar las herramientas de interfaz de línea de comandos Decred `dcrd`, `dcrwallet` y `dcrctl`.

`dcrinstall` is an automatic installer and upgrader for the Decred software. The newest release can be found here: [https://github.com/decred/decred-release/releases/tag/v1.1.0](https://github.com/decred/decred-release/releases/tag/v1.1.0). Binaries are provided for Windows, macOS, Linux, OpenBSD, and FreeBSD. Executing installer will install `dcrd`, `dcrwallet`, and `dcrctl`. Instructions are provided for macOS, Linux, and Windows below (assumed proficiency for *BSD users).

`Dcrinstall` descargará automáticamente el paquete binario firmado y precompilado que se encuentra en GitHub, verificará la firma de este paquete, copiará los binarios dentro del paquete a una carpeta específica dependiente en OS, creará archivos de configuración con la configuración para permitir que las 3 aplicaciones se comuniquen con Uno al otro, y ejecutar a través del proceso de creación de cartera. Después de ejecutar `dcrinstall`, podrá iniciar el software sin ninguna configuración adicional.

> macOS:

1. Descargue el archivo correcto:

    For 32-bit computers, download the `dcrinstall-darwin-386-v1.1.0` file. <br />
    For 64-bit computers, download the `dcrinstall-darwin-amd64-v1.1.0` file.

2. Haga dcrinstall-darwin-xxxx-vx.x.x un ejecutable dentro de su terminal y ejecútelo:

    Navegue hasta el directorio donde se descargó el archivo dcrinstall con el comando `cd` , ejecute chmod con el modo u+x en el archivo dcrinstall y ejecute el archivo ejecutable que se crea. A continuación se muestra un ejemplo de los comandos (cambiar directorios o nombre de archivo según sea necesario):
    
    `cd ~/Downloads/` <br />
    `chmod u+x dcrinstall-darwin-amd64-v1.1.0` <br />
    `./dcrinstall-darwin-amd64-v1.1.0`
    
3. Los binarios ejecutables de `dcrd`,` dcrwallet` y `dcrctl` ahora se pueden encontrar en el directorio `~/decred/`. Antes de completar el proceso `dcrinstall`, se le llevará al indicador de creación de cartera. Siga los pasos que se indican en [Wallet Creation Walkthrough](/getting-started/user-guides/dcrwallet-setup.md#wallet-creation-walkthrough) de la guía de instalación de dcrwallet para finalizar.

> Linux:

1. Descargue el archivo correcto:

    For 32-bit computers, download the `dcrinstall-linux-386-v1.1.0` file. <br />
    For 64-bit computers, download the `dcrinstall-linux-amd64-v1.1.0` file. <br />
    For 32-bit ARM computers, download the `dcrinstall-linux-arm-v1.1.0` file. <br />
    For 64-bit ARM computers, download the `dcrinstall-linux-arm64-v1.1.0` file.

2. Haga dcrinstall-linux-xxxx-vx.x.x un ejecutable dentro de su terminal y ejecútelo:

    Navegue hasta el directorio donde se descargó el archivo dcrinstall con el comando `cd` , ejecute chmod con el modo u+x en el archivo dcrinstall y ejecute el archivo ejecutable que se crea. A continuación se muestra un ejemplo de los comandos (cambiar directorios o nombre de archivo según sea necesario):
    
    `cd ~/Downloads/` <br />
    `chmod u+x dcrinstall-linux-amd64-v1.1.0` <br />
    `./dcrinstall-linux-amd64-v1.1.0`
    
3. Los binarios de `dcrd`,` dcrwallet` y `dcrctl` ahora se pueden encontrar en el directorio` ~ / decred / `. Antes de completar el proceso `dcrinstall`, se le llevará al indicador de creación de cartera. Siga los pasos que se indican en [Wallet Creation Walkthrough](/getting-started/user-guides/dcrwallet-setup.md#wallet-creation-walkthrough) de la guía de instalación de dcrwallet para finalizar.

> Windows:

1. Descargue el archivo correcto:

    For 32-bit computers, download the `dcrinstall-windows-386-v1.1.0.exe` file. <br />
    For 64-bit computers, download the `dcrinstall-windows-amd64-v1.1.0.exe` file. <br />

2.  Ejecute el archivo ejecutable dcrinstall.

    Puede hacer doble clic en él o ejecutarlo desde el símbolo del sistema.
    
3. Los binarios de `dcrd`,` dcrwallet` y `dcrctl` ahora se pueden encontrar en el directorio `%HOMEPATH%\decred\` (usualmente %HOMEPATH% es `C:\Users\<username>`). Antes de completar el proceso `dcrinstall`, se le llevará al indicador de creación de billetera. Siga los pasos que se indican en [Wallet Creation Walkthrough](/getting-started/user-guides/dcrwallet-setup.md#wallet-creation-walkthrough) de la guía de instalación de dcrwallet para finalizar.
