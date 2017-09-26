# <i class="fa fa-hdd-o"></i> Eliminazione del tuo portafoglio

Ci sono alcune ragioni di cui potresti aver bisogno  per eliminare il portafoglio.

* È necessario ripristinare il portafoglio dal seed.
* Non hai più il seed e vuoi creare un nuovo portafoglio.
* Vuoi rimuovere il portafoglio da un determinato computer.

In primo luogo è necessario trovare la directory di applicazione dcrwallet che varia da piattaforma.
Questa è la stessa directory che ospita i file [configuration files](/getting-started/startup-basics.md#configuration-files).

In quella directory, è necessario eliminare il file `mainnet/wallet.db`.
Questo rimuoverà completamente il portafoglio da quel computer. Per accedere
Ancora una volta dovrai ripristinare dal seed originale.

È importante notare che è possibile (ma non certo) che a
Il file cancellato può essere recuperato utilizzando gli strumenti di recupero di file. Se lo stai
eliminando  per motivi di sicurezza, probabilmente è necessario utilizzare una strumento di  protezione
 di eliminazione come
[GNU shred](https://www.gnu.org/software/coreutils/manual/html_node/shred-invocation.html).


