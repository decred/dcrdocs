# <i class="fa fa-info-circle"></i>Yleiskatsaus

---

Jaotellut aikaleimaprotokollat esiteltiin ensimmäistä kertaa keskittämättömälle valuuttaverkolle Nakamoton[^1] uraauurtavassa tutkielmassa Bitcoinista. Alalle on sen jälkeen tullut suuri määrä lisätutkimusta sekä amatöörien että ammattilaisten toimesta, kilpaillen tarjota muutoksia, parannuksia, lisäyksiä ja kehitystä olemassa olevaan protokollaan. Huomioonotettavia parannusuudistuksia ovat Ethereum[^2], joka edisti scriptausta, CryptoNote[^3], joka paransi yksityisyyttä, ja Sidechains[^4], joka tutki kaksisuuntaista vaihtosuhdetta 1:1 Bitcoiniin nähden. Nämä protokollat hyödyntävät proof-of-work:ia (PoW) kuten Bitcoinin alkuperäinen raportti sen kuvaili.

Yleinen lisä Bitcoinin protokollaan joka muokkaa äänestysmekanismia täysin tai osittain käyttämään proof-of-stake:a (PoS), tai yksilön omaa omistusta (kolikoita) osallistuakseen aikaleimaprosessiin tietokoneresurssien antamisen sijaan. Ensimmäinen proof-of-stake:a käyttävä, Bitcoiniin perustuva lohkoketju otetiin käyttöön 2012 Kingin and Nadalin[^5] toimesta, ja sisältää sekä PoW:n että PoS:n joka pikkuhiljaa muuttuu täydeksi PoS:ksi. Puhdas PoS:iin perustuva konsensusjärjestelmä on saanut paljon kritiikkiä osakseen[^6] [^7], yleensä tahoilta jotka itse käyttävät puhtaasti PoW-lohkoketjua. Yleisimmät PoS:n vastaiset argumentit "nothing-at-stake" tai "costless simulation" johtuvat systeemin epätasaisuudesta stakeholdereiden voidessa luoda toisarvoisia aikaleimattuja historioita ilman seuraamuksia itselleen.

Kiistanalaisuudesta huolimatta, on nähtävissä että järjestelmät joissa PoS on riippuvainen PoW timestampingista saattavat itsenäisesti saavuttaa konsensuksen. Tätä on tutkittu matemaattisesti Bentovin ja kollegoiden[^8] toimesta heidän järjestelmäänsä, proof-of-activityyn (PoA) liittyen, ja vaikuttaisi olevan toimiva jatke PoW-protokollalle ja saattaa mahdollistaa kiintoisia uusia ominaisuuksia. Mackenzie ehdotti 2013[^9] samankaltaista designia nimeltään MC2. Tässä kuvailemme samankaltaisen konsensusjärjestelmän rakentamista, jolle olemme antaneet nimeksi "Decred".

Tutkimustyö Decredissä on tällä hetkellä organisoitu seuraavien momenttien ympärille:

* [Hybrid Design](hybrid-design.md)
* [Keskittämätön Stake Pooling](decentralized-stake-pooling.md)
* [Elliptic Curve Signature Algoritmit](elliptic-curve-signature-algorithms.md)
* [BLAKE-256 Hash Funktio](blake-256-hash-function.md)
* [Scriptien Laajennukset](script-extensions.md)
* [Signature Script Isolation ja Huijauksen Esto](signature-script-isolation-and-fraud-proofs.md)
* [Siirtojen Laajennukset](transaction-extensions.md)
* [Schnorr Signaturet](schnorr-signatures.md)
* [Sekalaiset Parannukset](miscellaneous-improvements.md)

## <i class="fa fa-book"></i> Lähteet

[^1]: Nakamoto S. 2008. [Bitcoin: A peer-to-peer electronic cash system](https://decred.org/research/nakamoto2008.pdf).
[^2]: Buterin V. 2014. [A Next-generation smart contract and decentralized application platform](https://decred.org/research/buterin2014.pdf).
[^3]: von Saberhagen N. 2013. [CryptoNote v2.0](https://decred.org/research/saberhagen2013.pdf).
[^4]: Back A., Corallo M., Dashjr L., Friedenbach M., Maxwell G., Miller A., Poelstra A., Timon A., Wuille P. 2014. [Enabling Bitcoin innovations with pegged sidechains](https://decred.org/research/back2014.pdf).
[^5]: King S. and Nadal S. 2012. [PPCoin: Peer-to-peer crypto-currency with proof-of-stake](https://decred.org/research/king2012.pdf).
[^6]: Bentov I., Gabizon A., Mizrahi A. 2015. [Cryptocurrencies without proof-of-work](https://decred.org/research/bentov2015.pdf).
[^7]: Poelstra A. 2015. [On stake and consensus](https://decred.org/research/poelstra2015.pdf).
[^8]: Bentov I., Lee C., Mizrahi A., Rosenfeld M. 2014. [Proof-of-activity: Extending Bitcoin's proof-of-work via proof-of-stake](https://decred.org/research/bentov2014.pdf).
[^9]: Mackenzie A. 2013. [MEMCOIN2: A hybrid proof-of-work, proof-of-stake crypto-currency](https://decred.org/research/mackenzie2013.pdf).
