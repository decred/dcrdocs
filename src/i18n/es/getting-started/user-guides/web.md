# <i class="fa fa-firefox"></i> Guía del usuario del cliente Web

---

Una carpeta web simple está disponible para los usuarios que no quieren instalar
el software adicional en su computadora. Está basado en
[Copay] (https://github.com/bitpay/copay) con cambios específicos de Decred
agregados y se puede encontrar en
[https://wallet.decred.org](https://wallet.decred.org)

There are a couple of things you need to know about the web client
before you use it:

* No puedes
  [Minar la estaca](/mining/proof-of-stake.md)
  con esto
* Su billetera se mantiene completamente en el almacenamiento local de su navegador
  de web. Esto significa que si elimina su almacenamiento local,
  borrará su billetera y deberá volver a crear desde la semilla.
* La seguridad de su billetera depende enteramente de la seguridad de su
  navegador web.
* Usted puede poner un pin en su billetera para evitar el envío de fondos, pero cualquier
  otro acceso depende enteramente de los controles de acceso de su
  computadora, no en el servidor o cualquier información de inicio de sesión.

---

## <i class="fa fa-plus-circle"></i> Crea tu billetera de clientes web

> Paso Uno

Go to [https://wallet.decred.org](https://wallet.decred.org). You will
be presented with the `Terms and Conditions` screen. Pay extra
attention to the following:

Just like the command-line wallet, if you lose your seed words or your
password for sending funds you will lose access to your wallet. There
is no password reset. Also note that all transactions on Decred are
irreversible by design. If you accidentally send funds to the wrong
address, you will need to ask the recipient to send them back. The
developers are unable to reverse transactions.

Click `I Agree` once you have read the `Terms and Conditions`. You
will now see the welcome screen. If this is the first time you
have used Decred, click `Get Started`. If you want to restore a
previously used wallet, click `Import Backup`. This guide will
assume you are just starting out so click `Get Started`.

> Segundo paso

Click the dropdown in the top left, then click `Add wallet`. Click
`Create New Wallet`. Give your wallet a name then click `Create New Wallet`.

A wallet will be generated for you.


> Paso tres

Your wallet is now created and ready to use. However, before you do
anything else, you should add a password for sending funds and backup
the seed words that were used to create your wallet. This is doubly
true for the web client which does not store a permanent record of
your wallet. Your wallet data is stored in the browser cache and
can be deleted quite easily. If you are running in incognito mode,
it will be deleted as soon as you close the browser. **WITHOUT THIS
SEED PHRASE YOU LOSE ACCESS TO ALL FUNDS IN YOUR WALLET** should
the wallet data be deleted. The funds themselves still exist in
the blockchain, however, without the seed you cannot access them.

<i class="fa fa-exclamation-triangle"></i> **DO NOT USE THE SAME SEED IN MULTIPLE WALLETS! Visit [Wallets and Seeds FAQ](/faq/wallets-and-seeds.md#3-can-i-run-multiple-wallets) to see why this matters. It is recommended that where possible a new wallet should mean generating a new seed.** 

Haga clic en el botón `Preferencias` en el lado derecho opuesto al nombre de su cartera. En realidad, sólo hay tres cosas que le interesarán:

Opción                                | Descripción
---                                   | ---
`Alias de la billetera`                        | Puede cambiar el nombre de la cartera si lo desea.
`Solicitar la contraseña para fondos de gasto` | Since your wallet is saved in the browser cache, there is no extra password required to access it. By setting a password here, you ensure that only you can send funds if someone else accesses your browser. Type a password in and click `Set`. Note the alert that says passwords cannot be recovered. There is no password reset feature on the wallet. If you lose the password, you will never be able to move your coins out of the wallet or use them for proof-of-stake voting.
`Copia de seguridad`                              | Aquí es donde encontrarás tus palabras de semilla.

> Cuarto paso

Haga clic en `Copia de seguridad`. Verá esta pantalla:

First of all, read the note. Only use ONE wallet at a time with a
given seed (See: [FAQ](#)). You can have multiple wallets installed on
different machines, but only one of them should be running at any
given time. Click `Show Wallet Seed`. Write this down somewhere safe,
or put it in an encrypted document to which you will not forget the
password. This list of words is used to generate the authentication
key for your wallet. Anyone who possesses this list can access the
funds in your wallet.

> ** MUY IMPORTANTE **

** NO HAGA, BAJO NINGUNA CIRCUNSTANCIA, DAR SUS PALABRAS DE SEMILLA A NADIE! ¡NI LOS DESARROLLADORES! **

Una vez que hayas escrito las palabras abajo (y has comprobado que son correctas, la capitalización es importante), pasa al siguiente paso.

> Paso cinco

Now that you have written down your seed words and checked them, do it
again. Seriously. This step is critical. Without this list your wallet
cannot be reconstructed and no one, not even the developers, can
restore it. Now that you are sure the list is stored correctly, click
`Delete Words`. Click `Back` twice to get to the main wallet screen.

---

## <i class="fa fa-long-arrow-right"></i> Enviar fondos con el cliente web

> Paso Uno

On the main web wallet page, click the `Send` button at the
bottom. You will be taken to this page. Note the `Advanced Options`
section has already been expanded. In the `To` field, put in the
Decred address of the recipient.

> Segundo paso

In `Amount`, enter the value in DCR to send to the recipient. If you
wish you can type an optional message in the `Note` field. Press
`Send`. The `Use Unconfirmed Funds` option lets you use funds that the
network knows are being sent to you but have not yet been confirmed by
[proof-of-work miners](/mining/proof-of-work.md). If
this is turned on and the amount specified can only be covered by
using unconfirmed funds, the transaction will not proceed until the
required funds have been confirmed.

---

## <i class="fa fa-long-arrow-left"></i> Recibe fondos con el cliente web

> Paso Uno

Haga clic en el botón `Receive` en la parte inferior de la ventana. 
Verá esta pantalla:

De a la persona que le envía la dirección DCR que se muestra (se iniciará
con `Ds`) o pueden usar el código QR si su cartera o servicio
los acepta. Puede utilizar la misma dirección tan a menudo como desee, pero
para la privacidad se recomienda que genere una nueva dirección cada
hora. No te preocupes por que te den una dirección duplicada. Existen
alrededor de `2.08x10^93` posibles direcciones, por lo que probablemente llegaremos al
calor de la muerte del universo antes de que nos quedemos sin direcciones Decred.

