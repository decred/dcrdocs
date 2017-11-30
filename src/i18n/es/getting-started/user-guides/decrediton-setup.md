# Guía de Instalación Decrediton

Última actualización para v1.0.0.

---

`Decrediton` es una interfaz gráfica de usuario para` dcrwallet`. Cuando esta aplicación se inicia, inicia automáticamente su propia instancia `dcrd` y` dcrwallet` en segundo plano - no se abrirá si ya existe una instancia en ejecución de `dcrd`.

NOTA: Si en algún momento el programa deja de responder o se queda atascado en una pantalla de carga, generalmente se puede solucionar al reiniciar la aplicación.

---

## Descargar e Instalar

Decrediton is released with the Binary Releases and can be found here: [https://github.com/decred/decred-binaries/releases/tag/v1.1.0](https://github.com/decred/decred-binaries/releases/tag/v1.1.0). As of v1.1.0, Decrediton is only available for Linux and macOS.

> macOS

1. Download the `decrediton-1.1.0.dmg` file.

2. Double click the `decrediton-1.1.0.dmg` file once downloaded to mount the disk image.

3. Arrastre el decrediton.app en el enlace a su Carpeta de Aplicaciones dentro de la imagen de disco.

> Linux

1. Download the `decrediton-1.1.0.tar.gz` file.

2. Navegue hasta la ubicación de descarga y extraiga el archivo .tar.gz:

    Explorador de Archivos Ubuntu: simplemente haga click derecho en el archivo .tar.gz y presione "Extraer Aqui". <br />
   Terminal: utilice el comando `tar -xvzf nombredearchivo.tar.gz`.

    Both of these should extract the tar.gz into a folder that shares the same name. (`e.g. tar -xvzf decrediton-v1.1.0.tar.gz` should extract to `decrediton-v1.1.0`). If successful, this new folder should include a `decrediton` executable.

---

## Información Crítica

Durante el proceso de creación de su cartera, se le dará una secuencia de 33 palabras conocidas como una frase de semilla. Esta frase de semilla es esencialmente la llave privada para su cartera. Podrá utilizar esta frase semilla para restaurar sus llaves privadas, el historial de transacciones y los saldos utilizando cualquier cartera Decred en cualquier computadora.

En última instancia, esto significa que *cualquier persona* que sepa su semilla puede utilizarla para restaurar sus llaves privadas, el historial de transacciones y los saldos de una cartera Decred en su computadora sin su conocimiento. Por esta razón, es de suma importancia mantener su frase de semilla segura. Trate esta semilla de la misma manera que trataría una llave física de una caja fuerte. Si pierde su frase semilla, pierde permanentemente acceso a su cartera ya todos los fondos dentro de ella. No puede ser recuperado por nadie, incluidos los desarrolladores de Decred. Se recomienda que la escriba en papel y la almacene en algún lugar seguro. Si decide mantenerla en su computadora, sería mejor mantenerlo en un documento cifrado (no olvide la contraseña) en caso de que el archivo o su computadora sea robado.

** RECORDATORIO: ¡BAJO NINGUNA CIRCUNSTANCIA, DE SU SEMILLA O LA LLAVE HEX ASOCIADA A CUALQUIER PERSONA! ¡NI LOS DESARROLLADORES! **

---

## Creando una Nueva Cartera

Después de hacer clic en "Aceptar, entiendo" en la cláusula de exención de responsabilidad, verá el cuadro de diálogo "Crear una Cartera".

El cuadro de diálogo "Crear una Cartera" predetermina a la opción "Nueva Semilla". Simplemente haga clic en "Semilla Existente" si ya tiene una semilla que desea utilizar y siga los pasos que se presentan. Esta guía asume que usted no tiene una semilla y continuará usando la opción "Nueva Semilla". Por favor revise la [Información Crítica] (# información-crítica) sobre las semillas, arriba.

1. Registre la semilla que se muestra en el cuadro de texto (tendrá que introducirla nuevamente en la siguiente pantalla).

2. Presione "Continuar"

3. Confirme su semilla y cree una frase contraseña privada de cartera. Esta frase de contraseña se utilizará para desbloquear su cartera al crear transacciones.

4. Presione "Crear Cartera"

5. A continuación, debe ver un círculo azul girando. Éste girará hasta que `dcrd` haya sincronizado completamente la cadena de bloques. En las computadoras que no han cargado `dcrd`, esto debería durar de 1-2 horas con el hardware más nuevo (puede tardar más tiempo en hardware antiguo). Puede comprobar su aplicación de monitor de proceso para una instancia en ejecución de `dcrd` - si está usando un porcentaje sustancial de su CPU, se está sincronizando. Si no es así, Decrediton puede requerir sr reiniciado para moverse más allá de esta pantalla.

## Abriendo la Cartera

Después de sincronizar la cadena de bloques, debería ver una página "Abriendo la Cartera". Aquí, necesitará introducir su contraseña privada y la cartera volverá a explorar los bloques recientes para las transacciones que pertenecen a sus direcciones. Espere a que la barra de progreso se complete. Decrediton debe cargar y mostrár la página de Resúmen con su Saldo Disponible y Transacciones Recientes.

---
