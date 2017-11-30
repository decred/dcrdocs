# <i class="fa fa-hdd-o"></i> Memorizzazione dei dettagli di accesso 

Tutti i parametri che vengono specificati nella riga di comando durante l'avvio di dcrd,
anche dcrwallet e dcrctl possono essere conservati nei file di configurazione. Questo è
un buon modo per memorizzare le credenziali di accesso in modo che non ti serve
per includerli negli script o digitarli nel terminale tutto il
tempo.

---

## <i class="fa fa-laptop"></i> Elementi del file di configurazione 

Se non si conoscono le basi dei file di configurazione, si prega di consultare le informazioni contenute nella nostra pagina [Startup Options Intro](/getting-started/startup-basics.md#configuration-files) .

---

## <i class="fa fa-terminal"></i> dcrd.conf 

Scegliere il nome utente e la password desiderati nei passaggi seguenti. Non è necessario registrarli
Ovunque e saranno utilizzati solo per consentire a `dcrwallet` e `dcrctl` di comunicare con `dcrd`.

> Utilizzo del file di configurazione campione

Seguire la procedura descritta di seguito se hai già copiato i file di configurazione di esempio nelle rispettive directory.

1. Passare alla cartella di applicazione `dcrd` come descritto nei nostri [Startup Options Intro](/getting-started/startup-basics.md#configuration-files). 
2. Aprire `dcrd.conf` in un editor di testo.
3. Trovare le seguenti righe:

    `;rpcuser=` <br />
    `;rpcpass=`

4. Annullare le righe rimuovendo il semi-colon e aggiungere il nome utente e la password scelti alle linee appropriate.

> Creazione di un nuovo file di configurazione

Seguire i passaggi che seguono se avete **non** copiati i file di configurazione di esempio nelle loro directory appropriate.

1. Passare alla cartella di applicazione `dcrd` come descritto sopra nei nostri [Startup Options Intro](/getting-started/startup-basics.md#configuration-files).
2. Creare un nuovo file di testo.
3. Rinominarlo `dcrd.conf`.
3. Aprire `dcrd.conf` in un editor di testo.
4. Aggiungere le seguenti righe:

```no-highlight
[Application Options]

rpcuser=<username>
rpcpass=<password>
```

---

## <i class="fa fa-terminal"></i> dcrwallet.conf 

La procedura per `dcrwallet.conf` è molto simile alla procedura per `dcrd.conf`. 

Si noti che se i valori di `username=` e `password=` in `dcrwallet.conf` non corrispondono ai valori di `rpcuser=` e `rpcpass=` in  `dcrd.conf`, sarà necessario impostare `dcrdusername=` e `dcrdpassword=`  in `dcrwallet.conf` nei valori `rpcuser`/`rpcpass` trovati in `dcrd.conf` (è più semplice impostare tutti le username/password uguali)..

> Utilizzo del file di configurazione campione

Seguire la procedura descritta di seguito se hai già copiato i file di configurazione di esempio nelle rispettive directory.

1. Passare alla cartella di applicazione `dcrwallet` come descritto nei nostri [Startup Options Intro](/getting-started/startup-basics.md#configuration-files). 
2. Aprire `dcrwallet.conf` in un editor di testo.
3. Trovare le seguenti righe:

    `;username=` <br />
    `;password=`

4. Annullare le righe rimuovendo il semi-colon e aggiungere il nome utente e la password scelti alle linee appropriate.

> Creazione di un nuovo file di configurazione

Seguire i passaggi che seguono se avete **non** copiati i file di configurazione di esempio nelle loro directory appropriate.

1. Passare alla cartella di applicazione `dcrwallet` come descritto nei nostri [Startup Options Intro](/getting-started/startup-basics.md#configuration-files).
2. Creare un nuovo file di testo.
3. Rinominarlo `dcrwallet.conf`.
3. Aprire `dcrwallet.conf` in un editor di testo.
4. Aggiungere le seguenti righe:

```no-highlight
[Application Options]

username=<username>
password=<password>
```

Se si imposta la password pubblica opzionale per il portafoglio (la seconda password
durante la creazione di un portafoglio) è anche possibile aggiungere a `dcrwallet.conf`:

```no-highlight
walletpass=<yourwalletpassword>
```

Non è possibile specificare la tua passphrase di portafogli privati ​​nei file di configurazione. Deve essere inserito manualmente con `dcrctl`. 

---

## <i class="fa fa-terminal"></i> dcrctl.conf 

È ancora più facile impostare il nome utente/le password uguali tra `dcrd.conf`, `dcrwallet.conf`, e `dcrctl.conf`. Se hai utilizzato credenziali diverse per dcrwallet, dovrai specificare uno qui e l'altro nella riga di comando quando rilasci i comandi.

> Utilizzo del file di configurazione campione

Seguire la procedura descritta di seguito se hai già copiato i file di configurazione di esempio nelle loro directory appropriate.

1. Passare alla cartella di applicazione `dcrctl` come descritto nei nostri [Startup Options Intro](/getting-started/startup-basics.md#configuration-files). 
2. Aprire `dcrctl.conf` in un editor di testo.
3. Trovare le seguenti righe:

    `;rpcuser=` <br />
    `;rpcpass=`

4. Annullare le righe rimuovendo il semi-colon e aggiungere il nome utente e la password scelti alle linee appropriate.

> Creazione di un nuovo file di configurazione

Seguire i passaggi che seguono se avete **non** copiati i file di configurazione di esempio nelle loro directory appropriate.

1. Passare alla cartella di applicazione `dcrctl` come descritto nei nostri [Startup Options Intro](/getting-started/startup-basics.md#configuration-files).
2. Creare un nuovo file di testo.
3. Rinominarlo `dcrctl.conf`.
3. Aprire `dcrctl.conf` in un editor di testo.
4. Aggiungere le seguenti righe:

```no-highlight
[Application Options]

rpcuser=<username>
rpcpass=<password>
```

---

## <i class="fa fa-tasks"></i> Opzioni di configurazione aggiuntive 

Tutte le opzioni della riga di comando possono essere inserite nel file di configurazione.
I file di configurazione di esempio nel pacchetto di rilascio forniscono ulteriori informazioni
O è possibile eseguire uno dei programmi con il flag `-h` per visualizzare un elenco e una descrizione di tutte le opzioni dell'applicazione specificata.

C'è anche un elenco completo di opzioni per ogni applicazione che si trova [qui](/advanced/program-options.md).
