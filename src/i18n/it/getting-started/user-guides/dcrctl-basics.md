# Dcrctl Nozioni di base 

Ultimo aggiornamento per v1.0.0.

Questa guida ha lo scopo di aiutarti a conoscere i comandi di base dell'applicazione `dcrctl` utilizzando un file di [minimal configuration file](/advanced/manual-cli-install.md#minimum-configuration). 

**Prerequisiti:**

- Utilizzare le ultime [dcrinstall](/getting-started/user-guides/cli-installation.md) per installare `dcrctl`. Ulteriori passaggi saranno richiesti se è stato utilizzato un altro metodo di installazione.
- Review how the launch commands for the Command Prompt (Windows) and Bash (macOS/Linux) shells differ [here](/getting-started/cli-differences.md).
- [Setup dcrd](/getting-started/user-guides/dcrd-setup.md) e l'esecuzione in background.
- [Setup dcrwallet](/getting-started/user-guides/dcrwallet-setup.md) e l'esecuzione in background.

---

`dcrctl` è il client che controlla `dcrd` e `dcrwallet` tramite la procedura di chiamata remota (RPC). È possibile utilizzare `dcrctl` per molte cose come il controllo del saldo, l'acquisto di biglietti, la creazione di transazioni e la visualizzazione delle informazioni sulla rete.

**REMINDER:** Questa guida utilizza esempi OS-agnostici per i comandi. Esaminare i prerequisiti per determinare se si dovrebbe utilizzare `./dcrctl` o `dcrctl.exe` invece di `dcrctl`.

---

> Configurare il nome utente e la password RPC

I comandi inviati a `dcrd` o `dcrwallet` richiedono che il nome utente/le password RPC sia impostato nei file di configurazione.

Se hai utilizzato [`dcrinstall`](/getting-started/user-guides/cli-installation.md), i file di configurazione sono già configurati con il nome utente/la password RPC per `dcrd`, `dcrwallet`, e `dcrctl`.

Se non si è utilizzato `dcrinstall`, è necessario abilitare le impostazioni minime nude nei file di configurazione. Seguire [this guide](/advanced/manual-cli-install.md#minimum-configuration) per farlo.

---

## dcrctl Comandi

Dovresti eseguire i comandi dcrctl in una finestra di shell separata (prompt dei comandi/bash).

Per inviare comandi a `dcrwallet`, sarà necessario utilizzare `dcrctl --wallet <command>`.

Per inviare comandi a `dcrd`, sarà necessario utilizzare `dcrctl <command>`.

Per visualizzare un elenco completo dei comandi che `dcrctl` può inviare a `dcrd` e `dcrwallet`, digitare il seguente comando nella shell:

```no-highlight
dcrctl -l
```

Ciò restituirà un elenco molto lungo di comandi, separati dall'applicazione. I comandi nella sezione superiore sono per `dcrd` e i comandi nella sezione inferiore sono per `dcrwallet`. Per maggiori informazioni su un singolo comando, digitare quanto segue per i comandi `dcrwallet` :

```no-highlight
dcrctl help --wallet <command>
```

O il seguente per i comandi `dcrd` :

```no-highlight
dcrctl help <command>
```

---

## Sbloccare il tuo portafoglio

Alcune funzionalità di `dcrwallet` richiedono che il portafoglio sia sbloccato.

Il comando per sbloccare il portafoglio segue:

```no-highlight
dcrctl --wallet walletpassphrase <private passphrase set during wallet creation> 0
```

Qui specifichiamo per `dcrctl` inviare il comando a `dcrwallet` usando la bandiera `--wallet` . Il comando effettivo è `walletpassphrase` che accetta due parametri, la tua passphrase privata e un limite di tempo. Specificando `0` per un limite di tempo sblocca `dcrwallet` senza un limite di tempo. Si noti tuttavia che questo solo sblocca il portafoglio per la sessione corrente. Se si chiude la finestra in cui il portafoglio è in esecuzione o si arresta/riavvia il `dcrwallet`, sarà necessario sbloccarlo la prossima volta che si avvia. 

Se il comando è riuscito, non riceverai una conferma da `dcrctl`, ma se esamini la sessione `dcrwallet` dirà:

```no-highlight
[INF] RPCS: The wallet has been unlocked without a time limit.
```

NOTA: poiché per sbloccare il portafoglio è necessario per molte funzioni di `dcrwallet`, `dcrwallet` può essere avviato con il flag `--promptpass` o l'impostazione `promptpass=true` in `dcrwallet.conf` (discussed [here](/advanced/storing-login-details.md#dcrwalletconf)).

---

## Controllo del saldo

Per inviare il comando `getbalance` a `dcrwallet` con `dcrctl`, immettere quanto segue nella shell:

```no-highlight
dcrctl --wallet getbalance
```

Questo restituirà tutti i saldi per tutti i tuoi account.

---

## Ottenere un nuovo indirizzo di ricezione

Per inviare il comando `getnewaddress` a `dcrwallet` utilizzando `dcrctl`, immettere quanto segue nella shell:

```no-highlight
dcrctl --wallet getnewaddress
```

Ciò genererà e restituisce un nuovo indirizzo di pagamento. Per ridurre al minimo il riutilizzo degli indirizzi, utilizzare questo comando per ottenere un nuovo indirizzo per ogni transazione da ricevere.

---

## Invio di DCR

Per inviare DCR a un indirizzo, emettere il comando `sendtoaddress` a `dcrwallet` usando `dcrctl`. Immettere quanto segue nella shell, compilando l'indirizzo e l'importo ricevente da inviare:

```no-highlight
dcrctl --wallet sendtoaddress <address> <amount>
```

Se è riuscito, `dcrctl` restituirà un hash di transazione che può essere utilizzato per guardare la transazione sul funzionario [Decred Block Explorer](/getting-started/using-the-block-explorer.md).

---

## Controllare le statistiche di rete

Ci sono molti comandi diversi per controllare diverse statistiche di rete. Qui copriamo l'invio di `getinfo` a `dcrd` e `getstakeinfo` a `dcrwallet`.

Per ottenere informazioni sul nodo `dcrd` locale, emettere il comando `getinfo` a `dcrd` usando `dcrctl`. Immettere quanto segue nella shell:

```no-highlight
dcrctl getinfo
```

Per ottenere informazioni sulla rete Proof of Stake, specificare il comando `getstakeinfo` a `dcrwallet` usando `dcrctl`. Immettere quanto segue nella shell:

```no-highlight
dcrctl --wallet getstakeinfo
```

---

## Comandi aggiuntivi

Altri comandi possono essere trovati anche nella pagina [Program Options](/advanced/program-options.md) .

---
