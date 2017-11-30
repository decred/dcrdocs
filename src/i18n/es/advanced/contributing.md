# Solicitudes de extracciones de Decred y contribuciones

---

Todo el código para Decred se mantiene en GitHub. Este documento proporciona información básica sobre cómo manejamos las contribuciones de código y alguna información básica sobre cómo contribuir. Se basa parcialmente en un documento similar de [btcsuite](https://github.com/btcsuite).

---

## Preparación inicial

Un buen primer paso es leer la [Documentación de las Directrices de Contribución al Código] (https://github.com/decred/dcrd/blob/master/docs/code_contribution_guidelines.md) para obtener una buena comprensión de las políticas utilizadas por el
proyecto. Ese documento se centra principalmente en la base de código Go, pero sigue siendo un buen comienzo.

Los siguientes ejemplos se dividirán en dos secciones, una para los proyectos Go (dcrd, dcrwallet, gominer, etc) y otra para proyectos que no utilicen Go (decrediton, Paymetheus, dcrdocs, etc.). En todos los casos, asegúrese de consultar el archivo README.md de cada proyecto si necesita ayuda para configurar el proyecto concreto.

---

## Modelo General

Con este proceso estamos tratando de hacer que la contribución sea sencilla al mismo tiempo que se mantiene un alto nivel de calidad de código y de historia limpia. Los miembros del equipo Decred deben seguir los mismos procedimientos que los colaboradores externos.

Nuestro modelo para hackear el código en forma de esquema es el siguiente. Si algo de esto no tiene sentido, no se preocupe, se explicará con más detalle en las siguientes secciones.

1. Encuentre un problema en el que desee trabajar. Si no hay ninguno que describa su problema, abra uno con lo que va a hacer.
1. Realizar cambios de código en una sucursal.
1. Empuje estos cambios a su propio reporte de GitHub bifurcado.
1. Cuando su código esté listo para ser revisado o cuando sólo desee que la entrada de otros desarrolladores abra una solicitud de extracción (PR) en el reporte principal de la página web de GitHub.
1. Añade un comentario sobre el PR que dice que tema estás arreglando. Ponga el texto Cierra # o Correcciones # seguido del número del problema en una sola línea. Esto permitirá que GitHub vincule automáticamente al PR al problema y cierre el problema cuando el PR se cierra.
1. Puede solicitar un revisor específico de la página web de GitHub o puede pedirle a alguien en irc/slack que lo revise.
1. TODO código debe ser revisado y recibir al menos una aprobación antes de que pueda entrar. Sólo los miembros del equipo pueden dar la aprobación oficial, pero los comentarios de otros usuarios son alentados.
1. Si hay cambios solicitados, realice esos cambios y confírmelos a su sucursal local.
1. Empuje esos cambios a la misma rama en la que ha estado hackeando. Aparecerán en el PR de esa manera y el revisor puede comparar a la versión anterior.
1. Once your code is approved, it can be merged into master.  To keep history clean, we only allow non-fast-forward merges (that means we want a linear history).  Most PRs also must be squashed to a single commit (although if there is reason to have it as multiple commits that can be considered on a case by case basis).
1. Si su PR es un solo compromiso (o puede ser aplastado por GitHub automáticamente) y se encuentra con el maestro, el revisor se fusionará su PR. Si su rama estuviera muy atrás, se le podría pedir que rebase su compromiso. Una vez que se hace y se empuja, el revisor se fusionará su comisión.

---

## Go 

Para proyectos que utilicen Go, puede seguir este procedimiento. Dcrd se utilizará como ejemplo. Esto supone que usted ya tiene go1.6 o más reciente instalado y un trabajo `$GOPATH`.

### Configuración de una sola vez
- Fork en dcrd para GitHub
- Ejecute los siguientes comandos para obtener dcrd, todas las dependencias e instalarlo:

```bash
$ mkdir -p $GOPATH/src/github.com/decred/
$ git clone https://github.com/decred/dcrd $GOPATH/src/github.com/decred/dcrd
$ cd $GOPATH/src/github.com/decred/dcrd
$ go dep ensure
$ go install . ./cmd/...
```

- Añadir un control remoto git para su fork:

```bash
$ git remote add <yourname> https://github.com/<yourname>/dcrd.git
```

## Otros proyectos

Para proyectos no escritos en Go, la configuración inicial dependerá del proyecto. Voy a utilizar dcrdocs como un ejemplo aquí, pero los pasos básicos son los mismos para cualquiera de los proyectos. Configuración específica se puede ver en el proyecto README.md (por ejemplo, cómo instalar mkdocs para trabajar en dcrdocs o electrón para decrediton).

### Configuración de una sola vez
- Fork en dcrdocs para GitHub
- Ejecute los siguientes comandos para obtener dcrd, todas las dependencias e instalarlo:

```bash
$ mkdir -p code/decred
$ cd code/decred
$ git clone https://github.com/decred/dcrdocs
$ cd dcrdocs
```

- Añadir un control remoto git para su fork:

```bash
$ git remote add <yourname> https://github.com/<yourname>/dcrdocs.git
```

## Creación de una nueva solicitud de extracción de entidades
- Buscar o crear un problema en el reporte de GitHub (el original, no su fork) para la característica que desea trabajar.
- Compruebe una nueva rama de la característica para albergar los cambios que usted estará haciendo:

```bash
$ git checkout -b <feature_branch>
```
- Realice los cambios necesarios para la entidad y confírmelos
- Empuje su rama característica a su bifurcación:

```bash
$ git push <yourname> <feature_branch>
```
- Con su navegador, vaya a https://github.com/decred/dcrd
- Cree una solicitud de extracción con la interfaz de usuario de GitHub UI. Puede solicitar un revisión en la página web de GitHub o puede preguntar a alguien sobre irc/slack.

## Reajuste una de sus solicitudes de extracción existentes

A veces se le pedirá reajuste y aplaste la solicitud de extracción a la última rama principal.

- Asegúrese de que la rama principal esté actualizada:

```bash
$ git checkout master
$ git pull
```
- Revise la rama de la función existente y calculos con la bandera interactiva:

```bash
$ git checkout <feature_branch>
$ git rebase -i master
```
- Follow the directions presented to specify 's' meaning squash for the additional commits (the first commit must remain 'p' or 'pick').
- Escriba un solo mensaje de confirmación en el editor que ha configurado para cubrir todos las asignaciones incluidas.
- Guarde y cierre el editor y git debería generar una sola asignación con el mensaje que especificó y todos las asignaciones que ha agregado. Puede comprobar la asignación con el comando `` `git show```.
- Fuerza empujar la rama a su fork:

```bash
$ git push -f <yourname> <feature_branch>
```

## Otras Consideraciones

Hay algunas otras cosas a considerar al hacer una solicitud de extracción. En el caso del código Go, ya hay una cobertura de prueba significativa. Si está agregando el código, también debe agregar pruebas. Si usted está arreglando algo, usted necesita cerciorarse de que usted no rompa ninguna prueba existente. Para el código Go, hay un guión `` `goclean.sh``` en cada reporte para ejecutar las pruebas y los correos que tenemos. NO se aceptarán códigos sin pasar todas las pruebas. En el caso del código node.js (decrediton) todo el código debe pasar eslint. Puede comprobar esto con el comando `` `npm run lint```.

Finalmente, cada reporte tiene una LICENCIA. Su nuevo código debe estar bajo la misma LICENCIA que el código existente y los derechos de autor asignados a 'The Decred Developers'. En la mayoría de los casos esta es la licencia ISC muy liberal, pero algunos reportes son diferentes. Compruebe el reporte para estar seguro.

Si tiene alguna pregunta para contribuir, no dude en preguntar sobre irc/slack o GitHub. Los miembros del equipo (y probablemente miembros de la comunidad) también estarán encantados de ayudarle.
