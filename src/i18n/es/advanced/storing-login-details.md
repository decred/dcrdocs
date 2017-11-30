# **<i class="fa fa-hdd-o"></i> Almacenamiento de Datos de Acceso**

Todos los parámetros que son especificados en la linea de comando  mientras se inicia dcrd,

dcrwallet y dcrctl pueden también guardarse en archivos de configuración. Esto es una buena manera de almacenamiento de tu acceso de credenciales para que no necesite a incluirlos en scripts o tipo de ellos en la terminal todo el tiempo.
---

## **<i class="fa fa-laptop"></i> Archivos de Configuración Básica**

Si no esta familiarizado con los archivos básicos de configuración, porfavor revise la información puesta en nuestra página [Startup Options Intro](/getting-started/startup-basics.md#configuration-files) .

---

## **<i class="fa fa-terminal"></i> dcrd.conf**

Elija cualquier nombre de usuario y contraseña que desee en los siguientes pasos. No se necesita registrarse a cualquier lugar y solo se usarán para permitir `dcrwallet` y `dcrctl` para comunicarte con `dcrd`.

> Usando la Muestra de Archivo de Configuración

Porfavor siga los pasos de abajo si tiene copiado la muestra de configuración de documentos en sus directorios apropiados.

1. Navege a su carpeta de aplicación `dcrd` tal como es describido en nuestro [Startup Options Intro](/getting-started/startup-basics.md#configuration-files). 
2. Abra `dcrd.conf` en el editor de texto.
3. Encuentre las siguientes lineas:

    `;rpcuser=` <br />
    `;rpcpass=`

4. Descomente las lineas removiendo punto-coma y agregue un nombre de usuario escogida y contraseña a las lineas apropiadas.

> Creando un Nuevo archivo de Configuración

Porfavor sigas los pasos de abajo si **no** tiene copiado la muestra de archivo de configuración en sus directorios apropiados.

1. Navege a su `dcrd` carpeta de aplicación tal como es describido debajo en nuestro [Startup Options Intro](/getting-started/startup-basics.md#configuration-files).
2. Crea un nuevo archivo de texto.
3. Renombralo `dcrd.conf`.
3. Abra `dcrd.conf` en el editor de texto.
4. Agregue las siguientes lineas:

```no-highlight
[Application Options]

rpcuser=<username>
rpcpass=<password>
```

---

## **<i class="fa fa-terminal"></i> dcrwallet.conf**

El procedimiento para`dcrwallet.conf` es muy similar al procedimiento para `dcrd.conf`. 

Porfavor note si los valores de `username=` y `password=` en `dcrwallet.conf` no coinciden los valores de `rpcuser=` y `rpcpass=` en `dcrd.conf`,necesitará establecer`dcrdusername=` y `dcrdpassword=` en `dcrwallet.conf` al  `rpcuser`/`rpcpass`valores encontrados en `dcrd.conf` (Es más fácil establecer todos los mismos nombre de usuario/claves)

> Usando la Muestra de Documento de Configuración

Porfavor siga los pasos de abajo si tiene copiado la muestra de configuración de documentos en sus directorio apropiados.

1. Navege a su `dcrwallet` carpeta de aplicación tal como es describido en nuestro [Startup Options Intro](/getting-started/startup-basics.md#configuration-files). 
2. Abra `dcrwallet.conf` en el editor de texto.
3. Encuentre las siguientes lineas:

    `;username=` <br />
    `;password=`

4. Descomente las lineas removiendo punto-coma y agregue un nombre de usuario escogida y contraseña a las lineas apropiadas.

> Creando un Nuevo archivo de Configuración

Porfavor sigas los pasos de abajo si **no** tiene copiado la muestra de archivo de configuración en sus directorios apropiados.

1. Navege a su `dcrwallet` carpeta de aplicación tal como se describió en nuestro [Startup Options Intro](/getting-started/startup-basics.md#configuration-files).
2. Cree un nuevo archivo de texto.
3. Renombrelo `dcrwallet.conf`.
3. Abra `dcrwallet.conf` en un editor de texto.
4. Agregue las siguientes lineas:

```no-highlight
[Application Options]

username=<username>
password=<password>
```

Si establece la contraseña pública opcional para la cartera (la segunda contraseña durante la creación de la cartera)Puede también agregar eso a`dcrwallet.conf`:

```no-highlight
walletpass=<yourwalletpassword>
```

No puedes especificar la cartera privada de paso de clave en el archivo de configuración. Esto deberá ser puesto manualmente con `dcrctl`. 

---

## **<i class="fa fa-terminal"></i> dcrctl.conf**

Denuevo y más fácil para establecer tu usuario/claves lo mismo e ingrese`dcrd.conf`, `dcrwallet.conf`, y `dcrctl.conf`. Si usó credenciales diferentes para dcrwallet necesitará especificar uno aquí y otro en la linea de comando cuando emita los comandos.

> Usando la Muestra de Documento de Configuración

Porfavor siga los pasos de abajo si tiene copiado la muestra de configuración de documentos en sus directorio apropiados.

1. Navega a su `dcrctl` carpeta de aplicación tal como es describido en nuestro [Startup Options Intro](/getting-started/startup-basics.md#configuration-files). 
2. Abra `dcrctl.conf` en el editor de texto.
3. Encuentre las siguientes lineas:

    `;rpcuser=` <br />
    `;rpcpass=`

4. Descomente las lineas removiendo punto-coma y agregue un nombre de usuario escogida y contraseña a las lineas apropiadas.

> Creando Un Nuevo Archivo de Configuración

Porfavor siga los pasos de abajo si **no** tiene copiado la muestra de configuración de documentos en sus directorios apropiados.

1. Navega a su `dcrctl` carpeta de aplicación tal como es describido en nuestro [Startup Options Intro](/getting-started/startup-basics.md#configuration-files).
2. Cree un nuevo documento de texto.
3. Renombrelo `dcrctl.conf`.
3. Abra`dcrctl.conf` en el editor de texto.
4. Agregue las siguientes lineas:

```no-highlight
[Application Options]

rpcuser=<username>
rpcpass=<password>
```

---

## **<i class="fa fa-tasks"></i> Opciones adicionales de configuración**

todos las opciones lineales de comandos pueden ser puestos en el archivo de configuración.
La muestra de archivos de configuración en el paquete de liberación da opciones adicionales o puede correr uno de los programas con la opción `-h` muestra una lista y descripción de todas las opciones para la aplicación especificada.

Hay también a lista llena de opciones para cada aplicación cual puede ser encontrado [here](/advanced/storing-login-details.md).
