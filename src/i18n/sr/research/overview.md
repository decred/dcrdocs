# <i class="fa fa-info-circle"></i> Преглед 

---

Дистрибуирани протоколи за временски жиг су први пут примењени на децентрализацији финансијске мреже у револуционарном раду о Биткоину од стране Накамотоа[^1]. Ова област је доживела појаву експлозивних истраживања како аматера тако и професионалаца, који се такмиче да понуде проширење, прилагођавање, побољшања и побољшања постојећег протокола. Значајне имплементације нових идеја укључују Етхереум [^2], који је продужио скрипте, КриптНоут[^3], који је рафинисао приватност, и Сајдчејнс[^4], који су истраживали двосмерне клинове са 1: 1 Биткоин токенсом. Ови протоколи користе све доказе о раду (PoW) као што је првобитно описано у штампи Биткоина.

Заједнички наставак Биткоиновог протокола модификује консензусни механизам и објашњава потпуно или дјелимично доказни предмет (PoS), или кориштење сопственог удела (токенс), а не рачунарске моћи да учествује у процесу временских жигова. Први блокчејн за доказивање улога заснован на Биткоиновом протоколу имплементиран је 2012. године од стране Кинга и Надала[^5], а укључује и PoW и PoS који постепено теже ка потпуном PoS током времена. Критике у чистим системима консензуса ПоС-а сами по себи су били богати[^6] [^7], са најсевернијом опозицијом која долази од оних који раде само са ПВ блокчејновима. Најчешћи аргумент против PoS за дистрибуирану временску ознаку је "ништа у питању" или "бескрајна симулација", описујући систематску нестабилност која је последица тога да заинтересоване стране могу генерисати алтернативне временске историје без икаквих трошкова за себе.

Упркос полемици, очигледно је да системи са прекривачем PoS који зависе од система за одређивање временских ознака PoW могу самостално PoSтићи консензус. Ово је математички испитано од стране Бентова и колега[^8] у раду о њиховој шеми, доказној активности (ПоА) и изгледа да је одрживо продужење PoW протоколима који могу омогућити неке занимљиве нове особине. Сличан дизајн назван МЦ2 раније је предложио Мекензи 2013[^9]. Овдје описујемо изградњу и имплементацију сличног консензусног система који смо назвали "Decred".

Истраживачки рад у Декреду је тренутно организован по следећим подсекцијама:

* [Hybrid Design](hybrid-design.md)
* [Decentralized Stake Pooling](decentralized-stake-pooling.md)
* [Elliptic Curve Signature Algorithms](elliptic-curve-signature-algorithms.md)
* [BLAKE-256 Hash Function](blake-256-hash-function.md)
* [Script Extensions](script-extensions.md)
* [Signature Script Isolation and Fraud Proofs](signature-script-isolation-and-fraud-proofs.md)
* [Transaction Extensions](transaction-extensions.md)
* [Schnorr Signatures](schnorr-signatures.md)
* [Miscellaneous Improvements](miscellaneous-improvements.md)

## <i class="fa fa-book"></i> Референце 

[^1]: Nakamoto S. 2008. [Bitcoin: A peer-to-peer electronic cash system](https://decred.org/research/nakamoto2008.pdf).
[^2]: Buterin V. 2014. [A Next-generation smart contract and decentralized application platform](https://decred.org/research/buterin2014.pdf).
[^3]: von Saberhagen N. 2013. [CryptoNote v2.0](https://decred.org/research/saberhagen2013.pdf).
[^4]: Back A., Corallo M., Dashjr L., Friedenbach M., Maxwell G., Miller A., Poelstra A., Timon A., Wuille P. 2014. [Enabling Bitcoin innovations with pegged sidechains](https://decred.org/research/back2014.pdf).
[^5]: King S. and Nadal S. 2012. [PPCoin: Peer-to-peer crypto-currency with proof-of-stake](https://decred.org/research/king2012.pdf).
[^6]: Bentov I., Gabizon A., Mizrahi A. 2015. [Cryptocurrencies without proof-of-work](https://decred.org/research/bentov2015.pdf).
[^7]: Poelstra A. 2015. [On stake and consensus](https://decred.org/research/poelstra2015.pdf).
[^8]: Bentov I., Lee C., Mizrahi A., Rosenfeld M. 2014. [Proof-of-activity: Extending Bitcoin's proof-of-work via proof-of-stake](https://decred.org/research/bentov2014.pdf).
[^9]: Mackenzie A. 2013. [MEMCOIN2: A hybrid proof-of-work, proof-of-stake crypto-currency](https://decred.org/research/mackenzie2013.pdf).
