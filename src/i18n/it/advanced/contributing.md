# Richieste di richiamo e contributi decred 

---

Tutto il codice per Decred è mantenuto su GitHub. Questo documento fornisce alcune informazioni di base su come gestire i contributi di codice e alcune informazioni di base su come contribuire. Si basa parzialmente su un documento simile da [btcsuite](https://github.com/btcsuite).

---

## Preparazione iniziale 

Un buon primo passo consiste nel leggere la documentazione [Code Contribution Guidelines documentation](https://github.com/decred/dcrd/blob/master/docs/code_contribution_guidelines.md) per avere una buona comprensione delle politiche utilizzate dal
progetto. Questo documento è principalmente focalizzato sul Go code base, ma è comunque un buon inizio.

I seguenti esempi verranno suddivisi in due sezioni: uno per i progetti Go (dcrd, dcrwallet, gominer, ecc.) E uno per i progetti che non utilizzano Go (decredito, Paymetheus, dcrdocs, ecc.). In ogni caso, assicurati di controllare il README.md in ogni progetto se hai bisogno di aiuto per impostare il progetto in corso.

---

## Modello Generale 

Con questo processo stiamo cercando di contribuire, semplicemente mantenendo al contempo un alto livello di qualità dei codici e una storia pulita. I membri del team Decred devono seguire le stesse procedure dei contributori esterni.

Il nostro modello per l'hacking del codice nella forma in uscita è il seguente. Se uno di questi non ha senso, non si preoccupi, sarà spiegato in dettaglio nelle sezioni successive.

1. Trovare un problema su cui si desidera lavorare. Se non c'è nessuno che descrive il tuo problema, apri uno con quello che farai.
1. Effettuare modifiche di codice su un ramo.
1. Spingere queste modifiche al proprio repo GitHub forgiato.
1. Quando il codice è pronto per essere riveduto o quando si desidera solo l'input da altri devs aprire una richiesta di richiamo (PR) sul repo principale dalla pagina web GitHub.
1. Aggiungi un commento sul PR che dice che problema stai risolvendo. Inserisci il testo chiude # o Fixe # seguito dal numero del problema su una singola riga. Ciò consentirà a GitHub di collegare automaticamente il PR al problema e chiudere il problema quando il PR è chiuso.
1. È possibile richiedere un recensore specifico dalla pagina Web di GitHub oppure è possibile chiedere a qualcuno di irc/slack di rivedere.
1. TUTTI i codici devono essere riesaminati e ricevere almeno un'approvazione prima che possa essere ammesso. Solo i membri del team possono dare l'approvazione ufficiale, ma i commenti di altri utenti sono incoraggiati.
1. Se  sono richieste modifiche, apportare tali modifiche e assegnarle al tuo ramo locale.
1. Inserire  queste modifiche nello stesso ramo su cui  stai effettuando l' hacking. In questo modo saranno visualizzati nel PR e il revisore può quindi confrontarlo con la versione precedente.
1. Once your code is approved, it can be merged into master.  To keep history clean, we only allow non-fast-forward merges (that means we want a linear history).  Most PRs also must be squashed to a single commit (although if there is reason to have it as multiple commits that can be considered on a case by case basis).
1. Se il tuo PR è un unico commit (o può essere compresso da GitHub automaticamente) e viene captato con il master, il revisore unisce il tuo PR. Se il tuo ramo era troppo distante, ti verrà chiesto di rimediare al commit. Una volta che viene fatto e spinto, il revisore unisce il commit.

---

## Vai 

Per i progetti che utilizzano Go, è possibile seguire questa procedura. Il Dcrd verrà utilizzato come esempio. Ciò presuppone che hai già installato go1.6 o versione successiva e un lavoro `$GOPATH`.

### Configurazione una tantum
- Fork dcrd su GitHub
- Eseguire i seguenti comandi per ottenere dcrd, tutte le dipendenze e installarlo:

```bash
$ mkdir -p $GOPATH/src/github.com/decred/
$ git clone https://github.com/decred/dcrd $GOPATH/src/github.com/decred/dcrd
$ cd $GOPATH/src/github.com/decred/dcrd
$ go dep ensure
$ go install . ./cmd/...
```

- Aggiungi un telecomando git per la tua fork:

```bash
$ git remote add <yourname> https://github.com/<yourname>/dcrd.git
```

## Altri progetti 

Per i progetti non scritti in Go, l'installazione iniziale dipende dal progetto. Utilizzo qui i dcrdocs come esempio, ma i passi fondamentali sono uguali per tutti i progetti. Impostazioni specifiche possono essere visualizzate nel progetto README.md (ad esempio come installare mkdocs per lavorare su dcrdocs o electron per decrediton).

### Configurazione una tantum 
- Fork dcrdocs su GitHub
- Eseguire i seguenti comandi per ottenere dcrd, tutte le dipendenze e installarlo:

```bash
$ mkdir -p code/decred
$ cd code/decred
$ git clone https://github.com/decred/dcrdocs
$ cd dcrdocs
```

- Aggiungi un telecomando git per la tua fork:

```bash
$ git remote add <yourname> https://github.com/<yourname>/dcrdocs.git
```

## Creazione di una nuova richiesta di richiamo delle funzionalità 
- Trovare o creare un problema sul repo GitHub (l'originale, non la fork) per la funzionalità su cui si desidera lavorare.
- Controlla un nuovo ramo di funzioni per contenere le modifiche che farai:

```bash
$ git checkout -b <feature_branch>
```
- Effettuare le modifiche necessarie per la funzionalità e impegnarle
- Spingere il ramo di funzioni alla fork:

```bash
$ git push <yourname> <feature_branch>
```
- Con il tuo browser, vai a https://github.com/decred/dcrd
- Creare una richiesta di tiro con l'UI GitHub. Puoi richiedere un recensore sulla pagina web di GitHub oppure puoi chiedere a qualcuno irc/slack.

## Rimbalzare una delle tue esigenze di tiro esistenti 

A volte ti verrà richiesto di rimuovere e comprimere la richiesta di richiamo all'ultimo ramo master.

- Assicurarsi che il ramo principale sia aggiornato:

```bash
$ git checkout master
$ git pull
```
- Verificare il ramo di funzionalità esistente e rimediarlo con la bandiera interattiva:

```bash
$ git checkout <feature_branch>
$ git rebase -i master
```
- Follow the directions presented to specify 's' meaning squash for the additional commits (the first commit must remain 'p' or 'pick').
- Scrivere un messaggio di commit singolo nell'editor che hai impostato per coprire tutti gli impegni inclusi.
- Salvare e chiudere l'editor e il git dovrebbe generare un singolo commit con il messaggio specificato e tutti gli impegni aggiunti. Puoi controllare il commit con il comando ```git show```.
- Forza spingere il ramo alla fork:

```bash
$ git push -f <yourname> <feature_branch>
```

## Altre considerazioni 

Ci sono altre cose da considerare quando si effettua una richiesta di tiro. Nel caso del codice Go, è già presente una notevole copertura del test. Se state aggiungendo codice, dovresti aggiungere test. Se state sistemando qualcosa, è necessario assicurarsi di non interrompere alcun test esistente. Per il codice Go, c'è uno script ```goclean.sh``` in ogni repo per eseguire i test e le eventuali dime statiche che abbiamo. Il codice NO verrà accettato senza passare tutti i test. Nel caso del codice node.js (decredito) tutto il codice deve passare eslint. Puoi controllare ciò con il comando ```npm run lint```.

Infine, ogni repo ha una LICENZA. Il nuovo codice deve essere sotto la stessa LICENZA del codice esistente e assegnato il diritto d'autore a 'The Decred Developers'. Nella maggior parte dei casi la licenza ISC è molto liberale, ma alcuni repos sono diversi. Controllare il repo per essere sicuri.

Se hai domande per contribuire, non esitare a chiedere a irc / slack o GitHub. I membri del team decreed (e probabilmente anche i membri della comunità) saranno felici di aiutarti.
