# Errores y problemas comunes

## Paymetheus 

#### 1. Acabo de empezar a usar Paymetheus, pero parece estar atascado.

La primera vez que inicie Paymetheus, descargará el blockchain. Esto puede tomar
una hora y Paymetheus parecerá no estar haciendo nada.

#### 2. Frase de acceso no válida para la clave privada master.

Esta es sólo una manera larga de decir, "Contraseña incorrecta". Ha introducido la contraseña incorrecta para su
billetera.

#### 3. "Incapaz de comprar boletos: fondos insuficientes disponibles ..." pero la billetera dice que tengo suficiente.

Existe un error conocido en Paymetheus donde los fondos inmaduros se cuentan como disponibles. Después de un voto, hay unos
256 bloques de la ventana donde los fondos todavía están bloqueados. En este estado, se les conoce como inmaduros. Cuando expira el período
ellos serán utilizables otra vez.

#### 4. Paymetheus está mostrando el equilibrio equivocado.

> Estas instrucciones son válidas a partir de la versión 0.8.x y pueden no funcionar con versiones posteriores.

Si Paymetheus muestra el equilibrio incorrecto, puede corregirlo utilizando la utilidad de línea de comandos para sobrescribir algunos archivos.
Parte de esto puede ser confuso si no está familiarizado con la línea de comandos, pero simplemente siga las instrucciones línea por línea
y usted estará bien. Donde vea los comandos que `look like this`, solo copie y pegue exactamente como están en la línea de comandos.
No olvide presionar <ENTER> después de cada comando. Si te quedas atascado, únete a nuestro [Slack channel] (https://decred.slack.com) y alguien te ayudará,
pero primero, compruebe el comando y asegúrese de haberlo ingresado correctamente. Necesitará su semilla de billetera. Este proceso debe tomar cerca de 15 minutos.

1. Vamos a abrir tres ventanas de PowerShell. Presione la tecla Window. Escriba 'powershell' (no escriba las comillas aquí o en el futuro) y presione ENTER.
2. Haga esto dos veces más.
3. Mueve las ventanas para que puedas verlas todas.
4. Copie y pegue el siguiente comando: `cd $env:programfiles/decred/paymetheus` (Nota, en powershell, presione CTRL+V o haga clic derecho para pegar). Pulse ENTER.
5. Ejecute el mismo comando en las otras dos ventanas.
6. Abra Windows Explorer.
7. Pegue `%localappdata%/decred/paymetheus` en la barra de ubicación. Pulse ENTER.
8. Elimine la carpeta 'mainnet'.
9. Vaya a una de las ventanas de PowerShell y pegue `./dcrd -u <username>-P<password>`. Pulse ENTER.
10. Vaya a una de las otras ventanas de Powershell y pegue `./dcrwallet --appdata=$env:localappdata/decred/paymetheus --create`
11. Siga las indicaciones e importe su semilla. Diga no cuando se le pregunte por una capa adicional de encriptación y sí cuando se le pregunte si tiene una semilla.
12. En el mensaje, escriba sus semillas y presione ENTER dos veces.
13. Pegue el siguiente comando en la misma ventana: `./dcrwallet -u <username>  -P<password>   --  appdata=$env:localappdata/decred/paymetheus`. Pulse ENTER.
14. Introduzca la contraseña privada que utilizó al crear la billetera.
15. Vaya a la tercera ventana de PowerShell y pegue `./dcrctl -u <username> -P <password>  --wallet -c $env:localappdata/decred/paymetheus/rpc.cert getbalance`. Pulse ENTER.
16. Presione CTRL+C en las dos primeras ventanas para cerrar los programas (dcrd y dcrwallet).
17. Puede cerrar las tres ventanas de PowerShell.
18. Vuelva a la ventana del Explorer. Elimine los dos archivos, rpc.cert y rpc.key.
19. Inicie el programa Decred para comenzar a usar Paymetheus nuevamente.

-----

## Prueba de estaca

#### 1. Algunos de mis tickets perdidos/caducados aún están bloqueados después de más de un día.

1. Inicie el proceso de cartera con el indicador `--enablevoting`. No emitirá revocaciones sin ella.
2. Desbloquea la cartera con `dcrctl - walletpassword de la billetera <yourpassphrase> 0`. La billetera debe estar desbloqueada para poder crear las revocaciones y firmarlas.
3. Instruya a dcrd para que notifique la billetera sobre los tickets perdidos de nuevo para que emita las revocaciones con `dcrctl rebroadcastmissed`.


En ese momento, debería ver algunos detalles sobre las transacciones de revocación en el registro de la billetera.
Una vez que las transacciones de revocación se extraen en un bloque (que debería ser el siguiente bloque),
verá que los fondos se mueven a la categoría immaturestakegeneration en el `dcrctl - wallet`
Salida de equilibrio. Finalmente, después de 256 bloques, se moverán a la categoría spendable y estarán así disponibles para pasar.
