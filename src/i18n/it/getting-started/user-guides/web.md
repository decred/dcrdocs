# <i class="fa fa-firefox"></i> Guida per l'utente di Web Client

---

Un semplice portafoglio web è disponibile per gli utenti che non vogliono installare software aggiuntivo sul proprio computer. È basato su
[Copay](https://github.com/bitpay/copay) con modifiche specifiche Decred aggiunto e può essere trovato a
[https://wallet.decred.org](https://wallet.decred.org)

Ci sono un paio di cose che devi sapere sul client web
Prima di utilizzarlo:

* Non puoi
  [stake mine](/mining/proof-of-stake.md)
  con esso.
* Il tuo portafoglio è conservato interamente nell'archivio locale del tuo web
  browser. Ciò significa che se si elimina l'archiviazione locale, lo farai
  Cancellare il portafoglio e ricrearlo dal seed.
* La sicurezza del tuo portafoglio dipende interamente dalla sicurezza del tuo
  programma di navigazione in rete.
* Puoi mettere un perno sul tuo portafoglio per impedire l'invio di fondi ma qualsiasi
  L'altro accesso dipende interamente dai controlli di accesso
  Computer, non sul server o altri dettagli di accesso.

---

## <i class="fa fa-plus-circle"></i> Crea il tuo portafoglio clienti web

> Passo uno

Vai a [https://wallet.decred.org](https://wallet.decred.org). Accederai  alla schermata `Terms and Conditions` . Attenzione a quanto segue:

Proprio come il portafoglio di riga di comando, se perdi le tue parole seed o la tua password per l'invio di fondi perderai l'accesso al tuo portafoglio. 
Non è reimpostata la password. Si noti inoltre che tutte le transazioni su Decred sono irreversibili. Se accidentalmente invii i fondi ad un indirizzo errato, dovrai chiedere al destinatario di inviarli. 
Gli sviluppatori non sono in grado di invertire le transazioni.

Fai clic su `I Agree` dopo aver letto i `Terms and Conditions`. Vedrai ora la schermata di benvenuto. Se questa è la prima volta che tu usi Decred, fai clic su `Get Started`. Se si desidera ripristinare un precedentemente  portafoglio utilizzato, fare clic su `Import Backup`. Si supponga che si stia appena iniziando, fare clic su `Get Started`.

> Secondo passo

Click the dropdown in the top left, then click `Add wallet`. Click
`Create New Wallet`. Give your wallet a name then click `Create New Wallet`.

A wallet will be generated for you.


> Fase tre

Il portafoglio è ora creato e pronto per l'uso. Tuttavia, prima di fare qualsiasi altra cosa, si dovrebbe aggiungere una password per l'invio di fondi e backup
Le parole del seed che sono state usate per creare il tuo portafoglio. Questo è doppiamente vero per il client Web che non memorizza un record permanente del tuo portafoglio. I dati del portafoglio sono memorizzati nella cache del browser e
può essere cancellato abbastanza facilmente. Se si esegue in modalità incognito,verrà eliminato non appena si chiude il browser. **WITHOUT THIS
SEED PHRASE YOU LOSE ACCESS TO ALL FUNDS IN YOUR WALLET** I dati del portafoglio vengono cancellati. I fondi stessi esistono ancora nel blockchain, tuttavia, senza il seed non è possibile accedervi.

<i class="fa fa-exclamation-triangle"></i> **NON UTILIZZARE LA SAME SEED IN MULTIPLE WALLETS! Visita [Wallets and Seeds FAQ](/faq/wallets-and-seeds.md#3-can-i-run-multiple-wallets) per vedere perché questo è importante. Si raccomanda che, se possibile, un nuovo portafoglio dovrebbe significare generare un nuovo seed.** 

Fai clic sul pulsante `Preferences` sulla destra  del nome del portafoglio. Ci sono effettivamente solo tre cose che ti interesseranno qui:

Opzione                                | Descrizione
---                                   | ---
`Wallet Alias`                        | Alias ​​del portafoglio Puoi rinominare il portafoglio se lo desideri.
`Request Password for Spending Funds` | Dal momento che il portafoglio viene salvato nella cache del browser, non è richiesta alcuna password aggiuntiva per accedervi. Impostando una password qui, assicuratevi che solo tu puoi inviare fondi se qualcun altro accede al tuo browser. Digitare una password e fare clic su `Set`. Notare l'avviso che dice che le password non possono essere recuperate. Non è presente alcuna funzionalità di ripristino della password sul portafoglio. Se perdi la password, non sarai mai in grado di spostare le vostre monete dal portafoglio o li usa per il voto di prova.
`Backup`                              | Questo è dove troverete le tue parole seme.

> Fase quattro

Fai clic su `Backup`. Vedrai questa schermata:

Prima di tutto, legga la nota. Utilizza solo un portafoglio alla volta con un
Dato seme (vedi: [FAQ](#)). Puoi disporre di più portafogli installati
Diverse macchine, ma solo uno di essi dovrebbe funzionare a qualsiasi livello
tempo a disposizione. Fai clic su `Show Wallet Seed`. Scrivere questo da qualche parte sicuro,
O metterlo in un documento crittografato di cui non dimenticherai la parola d'ordine. Questo elenco di parole viene utilizzato per generare l'autenticazione chiave per il tuo portafoglio. Chiunque possiede questo elenco può accedere ai fondi nel tuo portafoglio.

> **MOLTO IMPORTANTE**

**NON, IN NESSUNA CIRCOSTANZA, MANDATE LE VOSTRE PAROLE DI SEED a nessuno! NEANCHE AGLI SVILUPPATORI!**

Una volta scritte le parole (e controllate triplicamente che siano corrette, la capitalizzazione è importante), andare al passo successivo.

> Fase cinque

Ora che hai scritto le tue parole di seED e controllato, procedi con attenzione. Questo passaggio è fondamentale. Senza questa lista il tuo portafoglio non può essere ricostruito e nessuno, nemmeno gli sviluppatori, può ripristinarlo. Ora che siete sicuri che l'elenco sia memorizzato correttamente, fai clic su
`Delete Words`. Fai clic su `Back` due volte per arrivare alla schermata principale del portafoglio.

---

## <i class="fa fa-long-arrow-right"></i> Invia fondi con il client web 

> Passo uno

Nella pagina del portafoglio principale del web, fai clic sul pulsante `Send` nella cartella
parte inferiore. Sarai portato a questa pagina. Si noti le `Advanced Options`
Sezione è già stata ampliata. Nel campo `To` inserisci il file
Indirizzo decreto del destinatario.

> Secondo passo

In `Amount`, immettere il valore in DCR per inviare al destinatario. Se tu desideri che sia possibile digitare un messaggio opzionale nel campo `Note` . Stampa
`Send`. L'opzione `Use Unconfirmed Funds` consente di utilizzare i fondi che la rete  sa che vengono inviati, ma non sono ancora stati confermati
[proof-of-work miners](/mining/proof-of-work.md). Se
Questo è attivato e l'importo specificato può essere coperto solo utilizzando fondi non confermati, l'operazione non procederà fino alla data di scadenza
I fondi necessari sono stati confermati.

---

## <i class="fa fa-long-arrow-left"></i> Ricevi i fondi con il client web 

> Passo uno

Fai clic sul pulsante `Receive` nella parte inferiore della finestra. Vedrai
Questa schermata:

Dare alla persona che ti invia DCR l'indirizzo visualizzato (inizia
Con `Ds`) o possono utilizzare il codice QR se il loro portafoglio o il servizio li accetta. È possibile utilizzare lo stesso indirizzo il più volte che si desidera, ma per la privacy si raccomanda di generare ogni nuovo indirizzo alla volta. Non preoccuparti di avere un indirizzo duplicato. Ci sono
Intorno a `2.08x10^93` gli indirizzi possibili, quindi probabilmente arriveremo fino al
la morte dell'universo prima di uscire dagli indirizzi Decred.

