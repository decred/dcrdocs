# Errori e problemi comuni 

## Paymetheus 

#### 1. Ho appena iniziato a utilizzare Paymetheus, ma sembra essere bloccato. 

La prima volta che si avvia Paymetheus, scaricherà il blockchain. Questo può richiedere fino
ad un'ora e Paymetheus sembrerà non fare nulla.

#### 2. Passphrase non valida per la chiave privata master. 

Questo è solo un lungo modo di dire, "Password non corretta". Hai inserito la password errata per il tuo
portafoglio.

#### 3. "Impossibile acquistare biglietti: insufficienti fondi disponibili ..." ma il portafoglio dice che ho abbastanza. 

C'è un bug noto in Paymetheus dove i fondi immature sono contati come disponibili. Dopo un voto dei biglietti, c'è un
256 blocco finestra dove i fondi sono ancora bloccati. In questo stato, essi sono conosciuti come immaturi. Quando il periodo scade
saranno ancora utilizzabili.

#### 4. Paymetheus sta visualizzando un errato equilibrio. 

> Queste istruzioni sono valide a partire dalla versione 0.8.x e potrebbero non funzionare con versioni successive.

Se Paymetheus visualizza un saldo errato, è possibile risolvere il problema utilizzando l'utilità della riga di comando per sovrascrivere alcuni file.
Alcuni di questi elementi possono essere confusi se non si conosce la riga di comando, ma seguite semplicemente la riga di istruzioni per riga. Dove si vedono i comandi che `look like this`, basta copiarli e incollarli esattamente mentre sono nella riga di comando.
Non dimenticate di premere <ENTER> dopo ogni comando. Se rimani bloccato, entra nel nostro canale [Slack channel](https://decred.slack.com) e qualcuno aiuterà,
Ma innanzitutto, controllare il comando e assicurarsi di averlo inserito correttamente. Avrete bisogno del vostro portafoglio. Questo processo dovrebbe richiedere circa 15 minuti.

1. Apriremo tre finestre PowerShell. Premere il tasto Finestra. Digita 'powershell' (non digitare le virgolette qui o in futuro) e premere ENTER.
2. Fai questo ancora due volte.
3. Spostare le finestre in modo da poterle vedere tutte.
4. Copiare e incollare il comando seguente: `cd $env:programfiles/decred/paymetheus` (Nota, in powershell, premere CTRL+V o fare clic destro per incollare). Premere ENTER.
5. Esegui lo stesso comando nelle altre due finestre.
6. Aprire Esplora risorse.
7. Incolla `%localappdata%/decred/paymetheus` nella barra di posizione. Premere ENTER.
8. Eliminare la cartella 'mainnet'.
9. Passare a una delle finestre PowerShell e incollare `./dcrd -u <username> -P <password>`. Premere ENTER.
10. Vai a una delle altre finestre Powershell e incolla `./dcrwallet --appdata=$env:localappdata/decred/paymetheus --create`
11. Seguire i prompt e importare il tuo seme. Dite no quando viene chiesto un ulteriore livello di crittografia e sì quando viene chiesto se hai un seme.
12. Al prompt, immettere le tue parole di seme e premere due volte ENTER.
13. Incollare il seguente comando nella stessa finestra: `./dcrwallet -u <username> -P <password> --appdata=$env:localappdata/decred/paymetheus`. Premere ENTER.
14. Immettere la passphrase privata utilizzata durante la creazione del portafoglio.
15. Vai alla terza finestra di PowerShell e incolla `./dcrctl -u <username> -P <password> --wallet -c $env:localappdata/decred/paymetheus/rpc.cert getbalance`. Premere ENTER.
16. Premere CTRL+C nelle prime due finestre per chiudere i programmi (dcrd e dcrwallet).
17. È possibile chiudere tutte e tre le finestre PowerShell.
18. Torna alla finestra Esplora. Eliminare i due file, rpc.cert e rpc.key.
19. Avviare il programma Decred per iniziare a utilizzare Paymetheus nuovamente.

-----

## Proof-of-Stake 

#### 1. Alcuni dei miei biglietti mancati / scaduti sono ancora bloccati dopo più di un giorno. 

1. Avviare il processo del portafoglio con la flag `--enablevoting` . Non rilascerà revoche senza di essa.
2. Sbloccare il portafoglio con `dcrctl --wallet walletpassphrase <yourpassphrase> 0`. Il portafoglio deve essere sbloccato affinché possa essere in grado di creare le revoche e di firmarle.
3. Inserire dcrd per informare nuovamente il portafoglio sui biglietti persi in modo da emettere le revocazioni con `dcrctl rebroadcastmissed`.


A quel punto, dovresti vedere alcuni dettagli sulle transazioni di revoca nel registro portafogli.
Una volta che queste operazioni di revoca vengono estratte in un blocco (che dovrebbe essere il blocco successivo)
Vedrai che i fondi si spostano nella categoria di immatricolazione nel `dcrctl --wallet`
Uscita output. Infine, dopo 256 blocchi, passeranno alla categoria spesa e quindi saranno disponibili per spendere.
