# Conceptos básicos de inicio

Esta guía se actualizó por última vez en v1.0.0

---

Esta guía se aplica a los usuarios de aplicaciones de línea de comandos. Los usuarios de Paymetheus y Decrediton pueden ignorar con seguridad el uso de archivos de configuración - Paymetheus y Decrediton manejan la configuración básica de forma automática. También vale la pena señalar que algunas de nuestras guías muestran configuración de archivos de configuración y otras guías muestran indicadores de comandos de inicio.

---

## Ubicaciones de archivos de configuración

Todo el software de Decred, cuando se inicia, lee desde un archivo de configuración para determinar qué configuraciones debe activar / desactivar / configurar durante esa carga inicial. Todos los indicadores de inicio de línea de comandos `(por ejemplo, dcrwallet - testnet)` pueden ser reemplazados por configuraciones dentro del archivo de configuración apropiado `(por ejemplo, dcrwallet --testnet podría ser reemplazado por testnet=1 en dcrwallet.conf)`.

These configuration files are located within the application home directory of the application. The location of these default home directories for Windows, macOS, and Linux are listed below:

Windows:

    C:\Users\<username>\AppData\Local\Dcrwallet\
    C:\Users\<username>\AppData\Local\Dcrd\
    C:\Users\<username>\AppData\Local\Dcrctl\ 
    C:\Users\<username>\AppData\Local\Decred\Paymetheus

macOS: 

    ~/Library/Application Support/Dcrwallet/
    ~/Library/Application Support/Dcrd/
    ~/Library/Application Support/Dcrctl/
    ~/Library/Application Support/decrediton/
    
Linux: 
    
    ~/.dcrwallet/
    ~/.dcrd/
    ~/.dcrctl/
    ~/.config/decrediton

A cada una de estas carpetas se le permite su propio `.conf file`, llamado después de la aplicación individual (` por ejemplo dcrd usa dcrd.conf`). Tenga en cuenta también que los directorios de inicio `Dcrd` y` Dcrwallet` se crean automáticamente cuando se inicia cada aplicación. Tendrá que crear manualmente un directorio base `Dcrctl` para utilizar un archivo de configuración.

El método de instalación [dcrinstall] (/get-started/user-guides/cli-installation.md) crea automáticamente los archivos de configuración, con [configuración mínima de configuración] (/advanced/manual-cli-install.md#minimum-configuration) Ya habilitado.

El método [Instalación manual](/ advanced/manual-cli-install.md #) incluye archivos de configuración de ejemplo dentro de .zip/.tar.gz. Se recomienda copiar estos archivos de configuración en el directorio apropiado descrito anteriormente, y renombrarlos para eliminar 'sample-'. Estos archivos tienen muchas configuraciones comentadas (los comentarios no son leídos por el programa durante el tiempo de ejecución) de modo que todas estas configuraciones se desactivan de forma efectiva. Puede activar estas configuraciones preescritas simplemente eliminando el punto y coma antes de la línea.

---

## Banderas de comandos de inicio

La mayoría de los ajustes que puede establecer a través del archivo de configuración también se pueden pasar a la aplicación como parámetros durante el inicio. Por ejemplo, los siguientes comandos específicos de OS abrirían `dcrd` para el uso de Testnet, una alternativa a usar` testnet = 1` en su archivo de configuración:

    Windows: dcrd.exe --testnet
    macOS: ./dcrd --testnet
    Linux: ./dcrd --testnet

El ejemplo anterior se vería primero en el archivo de configuración de `dcrd` para la configuración y luego buscar en el comando ejecutable para habilitar la configuración testnet.

---

## Uso Avanzado

[Almacenar detalles de inicio de sesión en los archivos de configuración] (/advanced/storing-login-details.md) <!-- Esto tiene la misma información que se encuentra en la sección Configuración mínima. Probablemente podría borrar. -->

[Lista completa de opciones para cada aplicación](/advanced/program-options.md)
