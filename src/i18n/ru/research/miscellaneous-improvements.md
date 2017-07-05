# Прочие улучшения 

---

Как и в Bitcoin, субсидия экспоненциально убывает с высотой блока. Однако алгоритм Decred, хотя и чрезвычайно простой, лучше интерполирует этот спад на течение времени, чтобы не создавать рыночного шока резкими сокращениями субсидий, подобно CryptoNote[^1]. Как и PeerCoin[^2], сложность PoW вычисляется из экспоненциально-взвешенного среднего значения разницы с предыдущим временем блока. Однако этот расчет также интерполируется на периоды окон сложности, подобные Bitcoin. В Bitcoin исправлена ошибка "timewarp"[^3], что гарантирует, что каждая разница во времени блока включена в расчет сложности.

Следует также отметить, что многие известные майнинг-атаки, такие как эгоистичный майнинг[^4] и упрямый майнинг[^5], более не будут функционировать с выгодой для себя в системе, где происходит эффективная децентрализация stake mining и нет сговора PoW-PoS майнеров. Просто потому, что невозможно генерировать секретные расширения блокчейна без помощи майнеров. Устойчивость к ранее описанным майнинг-атакам и новым, разработанным специально для нашей системы, атакам, станут перспективной областью будущих исследований.

---

## <i class="fa fa-book"></i> Ссылки 

[^1]: Buterin V. 2014. [A next-generation smart contract and decentralized application platform](https://decred.org/research/buterin2014.pdf).
[^2]: King S. and Nadal S. 2012. [PPCoin: Peer-to-peer crypto-currency with proof-of-stake](https://decred.org/research/king2012.pdf).
[^3]: ArtForz. 2011. [Re: Possible way to make a very profitable 50 plus-ish attack for pools?](https://decred.org/research/artforz2011.pdf)
[^4]: Eyal I. 2015. [The miner's dilemma](https://decred.org/research/eyal2015.pdf).
[^5]: Nayak K., Kumar S., Miller A., Shi E. 2015. [Stubborn mining: Generalizing selfish mining and combining with an eclipse attack](https://decred.org/research/nayak2015.pdf).
