# Інші вдосконалювання 

---

Як і в Bitcoin, субсидія експоненціально зменшується з висотою блоку. Проте алгоритм Decred, хоча і надзвичайно простий, краще інтерполює це убування  на плин часу, щоб не викликати ринкового шоку різким зниженням субсидій, подібно до CryptoNote[^1]. Як і PeerCoin[^2], складність PoW розраховується з експоненціально зваженого середнього значення різниці з попереднім часом блоку. Проте цей розрахунок також інтерполюється на періоди вікон складності, подібно до Bitcoin. Помилка "timewarp" в Bitcoin виправлена[^3], що гарантує, що кожна різниця в часі блоку включена до розрахунку складності.

Слід також зазначити, що багато з відомих майнінг-атак, таких як "егоїстичний майнінг" (selfish mining)[^4] та "впертий майнінг" (stubborn mining)[^5], більше не функціонуватимуть с користю для себе в системі, де відбувається ефективна децентралізація stake mining, а також відсутня змова PoW-PoS майнерів. Просто тому, що неможливо генерувати секретні розширення blockchain без допомоги майнерів. Стійкість до описаних раніше майнінг-атак, а також до нових, розробленим спеціально для нашої системи, стануть перспективною галуззю майбутніх досліджень.

---

## <i class="fa fa-book"></i> Посилання 

[^1]: Buterin V. 2014. [A next-generation smart contract and decentralized application platform](https://decred.org/research/buterin2014.pdf).
[^2]: King S. and Nadal S. 2012. [PPCoin: Peer-to-peer crypto-currency with proof-of-stake](https://decred.org/research/king2012.pdf).
[^3]: ArtForz. 2011. [Re: Possible way to make a very profitable 50 plus-ish attack for pools?](https://decred.org/research/artforz2011.pdf)
[^4]: Eyal I. 2015. [The miner's dilemma](https://decred.org/research/eyal2015.pdf).
[^5]: Nayak K., Kumar S., Miller A., Shi E. 2015. [Stubborn mining: Generalizing selfish mining and combining with an eclipse attack](https://decred.org/research/nayak2015.pdf).
