# <i class="fa fa-info-circle"></i> Огляд 

---

Розподілені протоколи часових міток були вперше застосовані Накамото для децентралізації фінансової мережі в новаторській статті про Bitcoin[^1]. Після цього мав місце шалений ажіотаж щодо дослідженнь у цій сфері як з боку любителів, так і фахівців, які змагалися і пропонували свої розширення, коригування, покращення та вдосконалення існуючого протоколу. Вагомі реалізації нових ідей привнесли Ethereum[^2], розширивши скрипти, CryptoNote[^3], покращивши конфіденційність, і Sidechains[^4], дослідивши механізми двосторонньої прив`язки токенів Bitcoin 1:1. Всі ці протоколи використовують систему "Доказ виконання роботи" (proof-of-work, чи PoW) в такому вигляді, як вона була описана в технічній документації Bitcoin.

Загальне розширення протоколу Bitcoin змінює механізм консенсусу для того, щоб повністю або частково застосовувати механізм "доказ частки володіння" (proof-of-stake або PoS), використання своєї ставки (токенів) (stake (tokens)), а не своїх обчислювальних потужностей для участі у процесі створення часових міток (timestamping). Перший PoS blockchain, що базувався на протоколі Bitcoin, був реалізований у 2012 році Кингом та Надалем (King and Nadal)[^5], і включає в себе як PoW, так і PoS, які поступово переходять до повної PoS з плином часу. Консенсусні системи, які використовують суто PoS, піддавалися чималій критиці[^6] [^7], причому найбільш затята опозиція проявлялася з боку тих, хто працює з чисто PoW-blockchain. Найбільш поширеним аргументом проти PoS за розподілені часові мітки є "нічого-на-кону" або "нічого не варта симуляція", що описує систематичну нестабільність, яка виникає внаслідок того, що власники частки здатні створювати історії з альтернативними часовими мітками без будь-яких витрат для себе.

Незважаючи на суперечності, очевидно, що системи з PoS, які навзаєм залежать від системи часових міток PoW, спроможні самостійно досягти консенсусу. Це математично досліджено Bentov та його колегами[^8] у статті про їхню схему, "доказ діяльності" (proof-of-activity або PoA), що, як видається, є перспективним розширенням для протоколів PoW, що може дозволити проявитися деяким цікавим новим властивостям. Схожа конструкція, під назвою MC2, раніше була запропонована Mackenzie у 2013 році[^9]. Тут ми описуємо побудову та реалізацію подібної консенсусної системи, яку ми назвали "Decred".

Наразі науково-дослідницька робота в Decred організована у таких підрозділах:

* [Гібридний дизайн](hybrid-design.md)
* [Децентралізований пул ставок](decentralized-stake-pooling.md)
* [Алгоритми підпису еліптичних кривих](elliptic-curve-signature-algorithms.md)
* [BLAKE-256 Hash Function](blake-256-hash-function.md)
* [Розширення сценаріїв](script-extensions.md)
* [Ізоляція підписів скрипта та перевірки шахрайства](signature-script-isolation-and-fraud-proofs.md)
* [Розширення транзакцій](transaction-extensions.md)
* [Schnorr-підписи](schnorr-signatures.md)
* [Інші вдосконалювання](miscellaneous-improvements.md)

## <i class="fa fa-book"></i> Посилання 

[^1]: Nakamoto S. 2008. [Bitcoin: A peer-to-peer electronic cash system](https://decred.org/research/nakamoto2008.pdf).
[^2]: Buterin V. 2014. [A Next-generation smart contract and decentralized application platform](https://decred.org/research/buterin2014.pdf).
[^3]: von Saberhagen N. 2013. [CryptoNote v2.0](https://decred.org/research/saberhagen2013.pdf).
[^4]: Back A., Corallo M., Dashjr L., Friedenbach M., Maxwell G., Miller A., Poelstra A., Timon A., Wuille P. 2014. [Enabling Bitcoin innovations with pegged sidechains](https://decred.org/research/back2014.pdf).
[^5]: King S. and Nadal S. 2012. [PPCoin: Peer-to-peer crypto-currency with proof-of-stake](https://decred.org/research/king2012.pdf).
[^6]: Bentov I., Gabizon A., Mizrahi A. 2015. [Cryptocurrencies without proof-of-work](https://decred.org/research/bentov2015.pdf).
[^7]: Poelstra A. 2015. [On stake and consensus](https://decred.org/research/poelstra2015.pdf).
[^8]: Bentov I., Lee C., Mizrahi A., Rosenfeld M. 2014. [Proof-of-activity: Extending Bitcoin's proof-of-work via proof-of-stake](https://decred.org/research/bentov2014.pdf).
[^9]: Mackenzie A. 2013. [MEMCOIN2: A hybrid proof-of-work, proof-of-stake crypto-currency](https://decred.org/research/mackenzie2013.pdf).
