# Diferencias de línea de comandos a través de los sistemas operativos

Esta página fue actualizada por última vez para v1.0.0.

---

The purpose of this page is to explain the key differences for running the cross-platform command-line applications on Windows, Linux, and macOS.

---

> Comandos de lanzamiento

La primera diferencia importante en las aplicaciones de línea de comandos (`dcrd`,`dcrwallet`,`dcrctl`) es cómo iniciarlas desde la línea de comandos. Esto no es tanto de un sistema operativo como lo es una diferencia en las conchas. Windows viene con el símbolo del sistema y PowerShell instalado. MacOS utiliza Bash dentro de la aplicación Terminal y muchas distribuciones de Linux también utilizan Bash. A continuación se muestran ejemplos de los comandos de ejecución básicos para Bash y el símbolo del sistema.

**Command Prompt:** `dcrd.exe`, `dcrwallet.exe`, `dcrctl.exe` <br />
**Bash:** `./dcrd`, `./dcrwallet`, `./dcrctl`

Algunas de nuestras guías pueden ser agnósticas con los comandos de lanzamiento. Si una guía dice que ejecuta  `dcrctl --wallet getbalance`, se refiere a usar `dcrctl.exe --wallet getbalance`  para Command Prompt y `./dcrctl --wallet getbalance` para Bash.

> Directorio de aplicaciones

La otra forma en la que los clientes de la línea de comandos son diferentes es la ubicación de cada directorio de aplicación (bloques, billeteras, archivos de configuración están almacenados en el directorio de datos). A continuación se muestra una tabla de los directorios de aplicaciones predeterminados para cada aplicación.

| OS      | dcrd, dcrwallet, dcrctl Directorios de aplicaciones      | 
| -------:|:--------------------------------------------- |
| Windows | `C:\Users\<your-username>\AppData\Local\dcrd\`      |
|         | `C:\Users\<your-username>\AppData\Local\dcrwallet\` | 
|         | `C:\Users\<your-username>\AppData\Local\dcrctl\`    |
| macOS   | `~/Library/Application Support/dcrd/`         |
|         | `~/Library/Application Support/dcrwallet/`    |
|         | `~/Library/Application Support/dcrctl/`       |
| Linux   | `~/.dcrd/`                                    |
|         | `~/.dcrwallet/`                               |
|         | `~/.dcrctl/`                                  |

