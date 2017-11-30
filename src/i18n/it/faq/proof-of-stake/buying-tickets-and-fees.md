# <i class="fa fa-ticket"></i> Acquisti di biglietti e tariffe 

---

#### 1. C'è un modo per vedere i biglietti acquistati da un portafoglio locale? 

Utilizza il seguente comando per mostrare tutti i tuoi biglietti[^9987]:

```no-highlight
dcrctl --wallet gettickets true
```

---

#### 2. Paghi una commissione di transazione per la transazione ssgen? 

No, le transazioni di questo tipo non impongono una tassa[^10219] (a differenza delle transazioni originali di acquisto del biglietto che concorrono per uno spazio limitato in ogni blocco). Sono effettivamente come transazioni di coinbase di prova del lavoro a questo proposito.

---

#### 3. Come faccio a cambiare la quota del biglietto? 

```no-highlight
dcrctl --wallet setticketfee <fee>
```

---

#### 4. Come acquistare i biglietti manualmente?

```no-highlight
dcrctl --wallet purchaseticket <fromaccount> <spendlimit> <minconf>
```

Dove:

Opzione        | Spiegazione
---           | ---
`fromaccount` | Di solito "default" (a meno che non sia stato creato un altro).
`spendlimit`  | Numero massimo di DCR che si desidera spendere per i biglietti.
`minconf`     | Questo può essere impostato su 0.

---

#### 5. How should I set the ticketfee? 

Il `ticketfee` (o la tariffa del biglietto) determina l'ordine in cui i biglietti mempool entrano nel pool di voto. Le tasse più elevate incoraggiano i miners dimostrativi di lavorare per mettere i tuoi biglietti nella parte anteriore della coda. Se si imposta la quota superiore alla media i biglietti sono più probabili essere inclusi nel blocco successivo. Il txfee predefinito è 0.01 DCR. Sembra quindi che l'idea migliore è impostare il tuo txfee in alto in modo che tu sia nella parte anteriore della linea. Ma non è sempre una buona idea. Infatti, raramente è una buona idea semplicemente perché la coda di mempool è molto breve o zero la maggior parte del tempo. Non dimenticate che il txfee preleva  dal tuo profitto DCR come  addebitato su ogni biglietto e non è rimborsabile se non voti.

Considera un prezzo costante del biglietto di 10 DCR. Ogni blocco 20 biglietti possono entrare nel pool di voto dal membro. Questo è un valore di 200 DCR. Ogni blocco genera circa 30 DCR e restituisce 50DCR agli elettori. 3 DCR viene inviato agli sviluppatori per aiutare a finanziare lo sviluppo di Decred così solo 27 finisce nelle mani dei minatori. Ciò significa che 77 DCR viene liberato ogni blocco per tornare in biglietti, supponendo che tutti i ritorni vengono reinvestiti. Che è meno della metà di quello che il blocco può gestire. L'unico modo in cui più DCR può entrare nel membro è l'investimento esterno (cioè, l'acquisto da uno scambio) o da minatori che hanno salvato la loro DCR in attesa che il prezzo del biglietto scenda.

Nel caso di un calo del prezzo del biglietto, un miner sta cercando di entrare nel pool prima che il prezzo cambia di nuovo. Ciò accade ogni 144 blocchi (circa 12 ore). Non importa se sia nel primo blocco o nel 100 °. In 144 blocchi saranno accettati 2.880 biglietti con un valore di 28.800 DCR. In quel momento non c'è quel tipo di volume nella rete di prova. Vi è uno scenario in cui si potrebbe desiderare di impostare la tassa più alta. Se il costo della stake sta per cambiare in pochi blocchi, la memoria non è vuota e si desidera assicurarsi di ottenere il prezzo corrente, può contribuire a impostare la tassa un po 'più in media per assicurarsi di entrare, specialmente se La prossima modifica significa che si perde un biglietto.

Continuare a [PoS Solo Mining FAQ](/faq/proof-of-stake/solo-mining.md)

---

## <i class="fa fa-book"></i> Sorgenti 

[^9987]: Decred Forum, [Post 9,987](https://forum.decred.org/threads/582/page-2#post-9987)
[^10219]: Decred Forum, [Post 10,219](https://forum.decred.org/threads/180/page-6#post-10219)
