# <i class="fa fa-hdd-o"></i>Eliminación de su billetera

Hay algunas razones que usted puede ser que necesite eliminar su billetera.

* Usted necesita restaurar su billetera desde la semilla.
* Ya no posee la semilla y quieres hacer una nueva cartera.
* Desea quitar la billetera de una computadora determinada.

Primero necesitas encontrar el directorio de la aplicación dcrwallet que varía según la plataforma.
Este es el mismo directorio que es el hogar de sus [archivos de configuración] (/getting-started/startup-basics.md#configuration-files).

En ese directorio, debe eliminar el archivo `mainnet / wallet.db`.
Eso eliminará completamente su cartera de ese equipo. Acceder
de nuevo tendrá que restaurar de la semilla original.

Es importante señalar que es posible (pero no es cierto) que un
archivo eliminado se puede recuperar utilizando herramientas de recuperación de archivos. Si usted esta
eliminando por razones de seguridad es probable que necesite utilizar una
herramienta de eliminación como
[GNU shred] (https://www.gnu.org/software/coreutils/manual/html_node/shred-invocation.html).


