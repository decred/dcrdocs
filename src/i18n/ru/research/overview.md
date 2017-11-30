# <i class="fa fa-info-circle"></i> Обзор 

---

Распределенные протоколы временных меток были впервые применены Накамото для децентрализации финансовой сети в новаторской статье о Bitcoin[^1]. За этим последовали активные изыскания в данной области, проводимые как любителями, так и профессионалами, соревнующимися и предлагающими расширения, корректировки, усовершенствования и уточнения существующего протокола. Значительные новые идеи привнесли Ethereum[^2], расширив скрипты, CryptoNote[^3], улучшив конфиденциальность, и Sidechains[^4], исследовав механизмы двусторонней привязки токенов Bitcoin 1:1. Все эти протоколы применяют систему Доказательство выполнения работы, или (PoW) в таком виде, как она изначально описана в технической документации Bitcoin.

Общее расширение протокола Bitcoin изменяет механизм консенсуса, чтобы полностью или частично применять механизм (proof-of-stake или PoS), использование своей ставки (токенов), а не своих вычислительных мощностей для участия в процессе создания временных меток (timestamping). Первый PoS блокчейн на основе протокола Bitcoin было реализован в 2012 году Кингом и Надалем (King and Nadal)[^5], и включает в себя как PoW, так и PoS, которые постепенно переходят к полному PoS спустя какое-то времени. Консенсусные системы, использующие сугубо PoS, подвергались масштабной критике[^6] [^7],  причем наиболее яростная оппозиция происходила от тех, кто работает с чисто PoW-блокчейнами. Наиболее распространенным аргументом против PoS за распределенные временные метки является "ничего-на-кону" или "ничего не стоящая симуляция", описывающее систематическую нестабильность, возникающую из-за того, что держатели доли способны генерировать истории с альтернативными временными метками без каких-либо затрат для себя.

Несмотря на противоречие, очевидно, что системы с PoS, взаимно зависящие от системы временных меток PoW, могут быть способны достичь консенсуса самостоятельно. Это математически изучено Bentov и его коллегами[^8] в статье об их схеме, доказательстве деятельности или PoA), которая, по всей видимости, является перспективным расширением для протоколов PoW, что может позволить проявиться некоторым интересным новым свойствам. Похожая конструкция, названная MC2, была предложена Mackenzie в 2013 году[^9]. Здесь мы описываем создание и реализацию подобной консенсусной системы, которую мы назвали "Decred".

В настоящее время исследовательская работа в Decred организована в следующих подразделах:

* [Гибридный дизайн](hybrid-design.md)
* [Децентрализованный пул ставок](decentralized-stake-pooling.md)
* [Алгоритмы подписи эллиптических кривых](elliptic-curve-signature-algorithms.md)
* [BLAKE-256 Hash Function](blake-256-hash-function.md)
* [Расширения скрипта](script-extensions.md)
* [Изоляция подписи скрипта и проверки мошенничества](signature-script-isolation-and-fraud-proofs.md)
* [Расширения транзакций](transaction-extensions.md)
* [Schnorr-подписи](schnorr-signatures.md)
* [Прочие улучшения](miscellaneous-improvements.md)

## <i class="fa fa-book"></i> Ссылки 

[^1]: Nakamoto S. 2008. [Bitcoin: A peer-to-peer electronic cash system](https://decred.org/research/nakamoto2008.pdf).
[^2]: Buterin V. 2014. [A Next-generation smart contract and decentralized application platform](https://decred.org/research/buterin2014.pdf).
[^3]: von Saberhagen N. 2013. [CryptoNote v2.0](https://decred.org/research/saberhagen2013.pdf).
[^4]: Back A., Corallo M., Dashjr L., Friedenbach M., Maxwell G., Miller A., Poelstra A., Timon A., Wuille P. 2014. [Enabling Bitcoin innovations with pegged sidechains](https://decred.org/research/back2014.pdf).
[^5]: King S. and Nadal S. 2012. [PPCoin: Peer-to-peer crypto-currency with proof-of-stake](https://decred.org/research/king2012.pdf).
[^6]: Bentov I., Gabizon A., Mizrahi A. 2015. [Cryptocurrencies without proof-of-work](https://decred.org/research/bentov2015.pdf).
[^7]: Poelstra A. 2015. [On stake and consensus](https://decred.org/research/poelstra2015.pdf).
[^8]: Bentov I., Lee C., Mizrahi A., Rosenfeld M. 2014. [Proof-of-activity: Extending Bitcoin's proof-of-work via proof-of-stake](https://decred.org/research/bentov2014.pdf).
[^9]: Mackenzie A. 2013. [MEMCOIN2: A hybrid proof-of-work, proof-of-stake crypto-currency](https://decred.org/research/mackenzie2013.pdf).
