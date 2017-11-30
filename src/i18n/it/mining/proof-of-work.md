# Prova di lavoro (PoW) Mining 

---

## Panoramica  

L'attività mining di prova, più comunemente denominata mining PoW, è l'attività di impegnare hardware e risorse del computer per elaborare la rete transazioni e costruire i blocchi che costituiscono il blockchain nella  rete Decred . Ogni volta che viene creato un blocco (da un minatore), circa 30 nuove monete Decred sono fatte. Queste monete vengono quindi suddivise come segue:

Sovvenzione | Partito
---     | ---
60%   | Minatori di PoW
30%   | PoS Voters
10%   | Sovvenzione decrescita di sviluppo

In media, riceverai una ricompensa approssimativamente proporzionale alla Hashrate del tuo minatore e il hashrate complessivo della rete quando si impegna il tuo computer nel mining PoW. Per iniziare, è necessario disporre di un computer con una scheda video. La maggior parte delle schede video possono essere utilizzate per l'estrazione (incluso il "mobile"
Tipi trovati in alcuni computer portatili). In generale, le schede video finali superiori eseguono
I hashrates più alti e quindi ricevono premi più alti.
---

## Mining di mining o pool  

> <i class="fa fa-male"></i> Solo Mining

<i class="fa fa-exclamation-triangle"></i> **La mining solo non è raccomandata e non è coperta da questa documentazione!** La rete Decred vede regolarmente una velocità di hash di rete fino a 10.000Gh/s . L'estrazione solo viene generalmente eseguita solo da individui avanzati o da gruppi organizzati con un grosso gruppo di GPU, quindi non viene affrontato qui.

> <i class="fa fa-users"></i> Pool Mining

Quando la mia è in un pool, il tuo hashrate è combinato con tutti gli altri hashrates dei mining di pool per cercare la soluzione corretta per un blocco. Riceverai una ricompensa in base alla quantità di lavoro che il tuo minatore effettua nel pool.
La mining di distribuzione distribuisce quote basate su blocchi trovati in modo da poter guadagnare una quantità costante di Decred, piuttosto che il "tutto o nessuno" dell'attività mining.

---

## Ottenere un indirizzo decred per ricevere fondi  

Segui le istruzioni [dcrctl Basics](/getting-started/user-guides/dcrctl-basics.md) e crea un indirizzo in modo da poter ritirare i premi minimi.

---

## <i class="fa fa-life-ring"></i> Sign up for a Mining Pool 

These mining pools are known to support Decred:

* [<i class="fa fa-external-link-square"></i> http://decredpool.org](http://decredpool.org)
* [<i class="fa fa-external-link-square"></i> http://yiimp.ccminer.org](http://yiimp.ccminer.org)
* [<i class="fa fa-external-link-square"></i> http://coinmine.pl/dcr](http://coinmine.pl/dcr)
* [<i class="fa fa-external-link-square"></i> https://dcr.maxminers.net](https://dcr.maxminers.net)
* [<i class="fa fa-external-link-square"></i> https://dcr.suprnova.cc](https://dcr.suprnova.cc)
* [<i class="fa fa-external-link-square"></i> https://pool.mn/dcr](https://pool.mn/dcr)
* [<i class="fa fa-external-link-square"></i> https://zpool.ca](https://zpool.ca)

Le mining pool funzionano di più o meno lo stesso, ma si potrebbe desiderare di iscriversi a più pools e vedere quale ti soddisfa il meglio.

Scegli una mining pool più piccola per permetterti di estrarre il hashrate della rete per una migliore decentralizzazione del potere mining!

---

## Driver GPU/Software  

I driver GPU di solito contengono le librerie necessarie per l'estrazione. Se hai difficoltà a eseguire il software, puoi reinstallare e verificare in modo specifico che le librerie OpenCL (AMD) o CUDA (NVIDIA) siano selezionate.

---

## <i class="fa fa-download"></i> Seleziona e scarica il software mining  

### Decred Miner ufficiale (gominer)

Gominer è il datore ufficiale Decred sviluppato e supportato dal team Decred. E 'il minatore più facile da impostare e avviare l'estrazione e quindi è consigliato per la maggior parte degli utenti. Attualmente, l'ultima versione di gominer è **<i class="fa fa-github"></i> [v1.0.0](https://github.com/decred/gominer/releases/)** I binari ufficiali possono essere scaricati da **[https://github.com/decred/decred-binaries/releases/tag/v1.0.0](https://github.com/decred/decred-binaries/releases/tag/v1.0.0)**

Assicurarsi di selezionare il sistema operativo corretto (Windows/Linux) e la versione corretta per il tipo di GPU (CUDA per le schede NVIDIA, OpenCL/OpenCLADL per le schede AMD). Gominer è disponibile solo per i sistemi operativi a 64 bit. È possibile trovare le guide utente per avviare l'estrazione con gominer:

- [Windows Pool-Mining](/mining/proof-of-work/pool-mining/gominer/windows.md)

### Miners non ufficiali

* <i class="fa fa-github"></i> [cgminer](https://github.com/kR105-zz/cgminer) - cgminer è un miner famoso per **AMD** GPU che ha un Lunga storia di utilizzo in molti criptocurrencies diversi. È più difficile da usare rispetto al   declin gugino.

* <i class="fa fa-github"></i> [ccminer](https://github.com/tpruvot/ccminer) - ccminer è un miner famoso per **NVIDIA** GPU che ha una lunga storia Di uso in molti criptocurrencies diversi. È più difficile da usare rispetto  al declin gugino.

* <i class="fa fa-github"></i> [sgminer](https://github.com/tpruvot/sgminer) - Coloro che hanno una scheda grafica **AMD** in esecuzione con Windows potrebbero voler scaricare sgminer .

---

## Eseguire il software 

* Decomprimere e installare il software in un luogo di tua scelta.
* Aprire un prompt dei comandi a quel percorso.
* Seguire le istruzioni per le mining pool per l'installazione.
* Esegui il miner.

Continuare a [PoW Mining FAQ](/faq/proof-of-work-mining.md)
