# <i class="fa fa-info-circle"></i> Pregled 

---

Distribuiranim vremenskeoznakama protokoli prvo se primjenjuju na decentralizaciju financijske mreže u najnovijem radu na Bitcoinu Nakamoto[^1]. Polje je vidjelo eksplozivno praćenje istraživanja amatera i stručnjaka, natječući se za ponudu ekstenzija, prilagodbi, poboljšanja i preciziranja postojećeg protokola. Značajne implementacije novih ideja uključuju Ethereum[^2],koji je proširio skriptiranje, CryptoNote[^3], koji je pročišćavao privatnost, a Sidechains[^4], koji su istraživali dvosmjerne krakove s 1: 1 Bitcoin oznakama. Ti protokoli koriste sve dokaze o radu (PoW) kao što je izvorno opisano u dokumentu Bitcoin.

Uobičajeno proširenje Bitcoin protokolom mijenja mehanizam konsenzusa da potpuno ili djelomično koristi dokaz o ulozi (PoS) ili upotrebu vlastitog udjela (tokena), a ne računalne moći da sudjeluje u procesu vremenskogoznačavanja. Prvo blokiranje blokova temeljenog na Bitcoin protokolu 2012. provodili su King i Nadal[^5], a obuhvaća i PoW i PoS koji se tijekom vremena skreću prema kompletnom PoS-u. Kritike čistih PoS sustava konsenzusa same su bile u izobilju[^6] [^7], s najozbiljnijim opozicijama koje dolaze od onih koji rade s čistim PoW blokovima. Najčešći argument protiv PoS-a za distribuirano vremensko označavanje je "ništa za ulog" ili "bezrezervna simulacija", što opisuje sustavnu nestabilnost koja rezultira dionicima koji mogu stvarati alternativnu povijest s vremenom bez ikakvih troškova za sebe.

Unatoč kontroverzi, očito je da sustavi s PoS prekrivanjem ovise o PoW vremenskomoznačavanju sustava mogu biti u stanju samostalno postići konsenzus. Bentov i njegovi kolege[^8] matematičari istražuju članak o njihovoj shemi, dokazu aktivnosti (PoA), i čini se da je održivo produženje PoW protokola koji mogu omogućiti neka zanimljiva nova svojstva. Sličan dizajn nazvan MC2 je ranije predložio Mackenzie u 2013[^9]. Ovdje opisujemo izgradnju i implementaciju sličnog sustava konsenzusa koji smo nazvali "Decred".

Istraživački rad u Decredu trenutno se organizira oko sljedećih pododjeljaka:

* [Hibridni dizajn](hybrid-design.md)
* [Decentralizirano udruživanje udjela](decentralized-stake-pooling.md)
* [Algoritmi potpisa eliptičkih krivulja](elliptic-curve-signature-algorithms.md)
* [BLAKE-256 Ključna funkcija](blake-256-hash-function.md)
* [Skripta proširenja](script-extensions.md)
* [Izolacija potpisnih skripti i dokazi o prijevari](signature-script-isolation-and-fraud-proofs.md)
* [Proširenja transakcija](transaction-extensions.md)
* [Schnorr potpisi](schnorr-signatures.md)
* [Razno poboljšanje](miscellaneous-improvements.md)

## <i class="fa fa-book"></i> Preooruke 

[^1]: Nakamoto S. 2008. [Bitcoin: Elektronički gotovinski sustav peer-to-peer](https://decred.org/research/nakamoto2008.pdf).
[^2]: Buterin V. 2014. [[Pametni ugovor za sljedeću generaciju i decentralizirana aplikacijska platforma](https://decred.org/research/buterin2014.pdf).
[^3]: von Saberhagen N. 2013. [CryptoNote v2.0](https://decred.org/research/saberhagen2013.pdf).
[^4]: Back A., Corallo M., Dashjr L., Friedenbach M., Maxwell G., Miller A., Poelstra A., Timon A., Wuille P. 2014. [Omogućavanje inovativnih Bitcoina s spojenim sidechainovima](https://decred.org/research/back2014.pdf).
[^5]: King S. and Nadal S. 2012. [PPCoin: Kriptopedarijska peer-to-peer s dokazom uloga](https://decred.org/research/king2012.pdf).
[^6]: Bentov I., Gabizon A., Mizrahi A. 2015. [Kripto-valute bez dokaza o radu](https://decred.org/research/bentov2015.pdf).
[^7]: Poelstra A. 2015. [Na kocki i konsenzus](https://decred.org/research/poelstra2015.pdf).
[^8]: Bentov I., Lee C., Mizrahi A., Rosenfeld M. 2014. [Proof-of-activity: Proširivanje Bitcoinovog dokaza o radu preko dokaznog uloga](https://decred.org/research/bentov2014.pdf).
[^9]: Mackenzie A. 2013. [MEMCOIN2: Hibridni dokaz o radu, dokaz o ulozi kripto-valute](https://decred.org/research/mackenzie2013.pdf).
