# Guida all'installazione di Decred 

Ultimo aggiornamento per v1.0.0.

---

`Decrediton` è un'interfaccia utente grafica per `dcrwallet`. Quando viene avviata questa applicazione, inizia automaticamente la propria istanza di `dcrd` e `dcrwallet` in background - non si apre se c'è già un'istanza in esecuzione di `dcrd`.

NOTA: se in qualsiasi punto il programma non risponde o si blocca su una schermata di caricamento, questo può essere solitamente risolto con un riavvio dell'applicazione.

---

## Scarica e installa 

Decrediton is released with the Binary Releases and can be found here: [https://github.com/decred/decred-binaries/releases/tag/v1.1.0](https://github.com/decred/decred-binaries/releases/tag/v1.1.0). As of v1.1.0, Decrediton is only available for Linux and macOS.

> macOS

1. Download the `decrediton-1.1.0.dmg` file.

2. Double click the `decrediton-1.1.0.dmg` file once downloaded to mount the disk image.

3. Trascinare il decred.app nel collegamento alla cartella Applicazioni nell'immagine del disco.

> Linux

1. Download the `decrediton-1.1.0.tar.gz` file.

2. Navigare per scaricare la posizione e estrarre il file .tar.gz

    Ubuntu File Browser: basta cliccare con il tasto destro del mouse sul file .tar.gz e premere "Extract Here". <br />
    TTerminale: utilizzare il comando `tar -xvzf filename.tar.gz` .

    Both of these should extract the tar.gz into a folder that shares the same name. (`e.g. tar -xvzf decrediton-v1.1.0.tar.gz` should extract to `decrediton-v1.1.0`). If successful, this new folder should include a `decrediton` executable.

---

## Informazioni critiche 

Durante il processo di creazione del portafoglio, verrà assegnata una sequenza di 33 parole conosciuta come una frase di seed. Questa frase di seed è essenzialmente la chiave privata per il tuo portafoglio. Sarai in grado di utilizzare questa frase di seed per ripristinare le chiavi private, la cronologia delle transazioni ei saldi utilizzando un portafoglio Decred su qualsiasi computer. 

Ciò significa in ultima analisi che *chiunque* che conosca il tuo seme possa utilizzarlo per ripristinare i tuoi chiavi privati, la cronologia delle transazioni e i saldi a un portafoglio Decred nel computer senza la tua conoscenza. Per questa ragione, è di massima importanza mantenere la tua frase di seed sicura. Trattare questo seed nello stesso modo in cui si tratta una chiave fisica in una cassaforte. Se perdi la tua frase di seed, perdi permanentemente l'accesso al portafoglio e tutti i fondi in esso contenuti. Non può essere recuperato da nessuno, inclusi gli sviluppatori Decred. Si raccomanda di scrivere su carta e memorizzare in qualche luogo sicuro. Se decidi di tenerlo sul tuo computer, sarebbe meglio mantenerlo in un documento crittografato (non dimenticare la password) nel caso in cui il file o il computer venga rubato.

**RICORDA: MAI DARE,IN NESSUNA CIRCOSTANZA,  IL TUO SEED  O LA CHIAVE HEX ASSOCIATA  CON  NESSUNO! NEANCHE CON GLI  SVILUPPATORI!**

---

## Creazione di un nuovo portafoglio 

Dopo aver cliccato su "OK, intendo" alla dichiarazione di responsabilità, vedrai la finestra di dialogo "Crea un raccoglitore".

La finestra di dialogo "Crea un raccoglitore" predefinita è l'opzione "Nuovo seed". Basta cliccare su "Seed  esistente" se si dispone già di un seed che si intende utilizzare e segui i passaggi presentati. Questa guida presume che non abbiate un seme e continui ad usare l'opzione "Nuovo Seed". Si prega di consultare la [Critical Information](#critical-information) sui seed, sopra.

1. Registrare il seme visualizzato nella casella di testo (dovrai rientrare nella schermata successiva).

2. Premere "Continua"

3. Conferma il tuo seed e crea una passphrase di un portafoglio privato. Questa passphrase verrà utilizzata per sbloccare il portafoglio quando crea transazioni.

4. Premere "Crea portafoglio"

5. Dovresti poi vedere un cerchio azzurro di filatura. Questo gira fino a che `dcrd` abbia completamente sincronizzato la blockchain. Sui computer che non sono stati caricati su `dcrd` questo dovrebbe richiedere 1-2 ore con hardware più recente (potrebbe richiedere più tempo con hardware più vecchio). È possibile controllare l'applicazione di monitor di processo per un'istanza in esecuzione di `dcrd` - se utilizza una percentuale sostanziale della tua CPU, sta sincronizzando. Se non è così, Decred potrebbe richiedere un riavvio per andare oltre questa schermata.

## Aprire il portafoglio 

Dopo che la blockchain è stata sincronizzata, dovrebbe essere visualizzata una pagina "Apri il portafoglio". Qui dovrai inserire la tua passphrase privata e il portafoglio recupererà i blocchi recenti per le transazioni che appartengono ai tuoi indirizzi. Attendere che la barra di avanzamento venga riempita. Dovrebbe quindi caricare la pagina Panoramica con il tuo saldo disponibile e le transazioni recenti visualizzate.

---
