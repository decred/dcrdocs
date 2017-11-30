# Miscellaneous Improvements 

---

Као и у Биткоину, субвенција се експоненцијално распада са висином блока. Међутим, декодирани алгоритам, мада такође изузетно једноставан, боље интерполира овај распад током времена како не би произвео тржишни шок са стрмим субвенцијама, сличним КриптНотеу[^1]. Као Пиркоин[^2], тежина PoW-а се рачуна из експоненцијално пондерисаног просека разлика у претходним временима блока. Међутим, ова рачунања су такође интерполирана у  временским периодима попут оних у Биткоину. "Тајмворп" грешка у Биткоину је коригована[^3], осигуравајући да свака разлика у блоку укључује у израчунавање тешкоћа.

Такође треба напоменути да многи добро познати истраживачки напади, попут себичног истраживања[^4] и тврдоглавог истраживања[^5], више неће функционисати повољно у систему у којем постоји ефективна децентрализација учешћа истраживача и не PoW-PoS истраживача. Ово је једноставно зато што је немогуће генерисати тајна проширења за блокаде без помоћи истраживача. Отпорност на претходно описане истраживачке нападе и новонастале истраживачке нападе специфичне за наш систем биће плодно подручје за будућа истраживања.

---

## <i class="fa fa-book"></i> Референце 

[^1]: Buterin V. 2014. [A next-generation smart contract and decentralized application platform](https://decred.org/research/buterin2014.pdf).
[^2]: King S. and Nadal S. 2012. [PPCoin: Peer-to-peer crypto-currency with proof-of-stake](https://decred.org/research/king2012.pdf).
[^3]: ArtForz. 2011. [Re: Possible way to make a very profitable 50 plus-ish attack for pools?](https://decred.org/research/artforz2011.pdf)
[^4]: Eyal I. 2015. [The miner's dilemma](https://decred.org/research/eyal2015.pdf).
[^5]: Nayak K., Kumar S., Miller A., Shi E. 2015. [Stubborn mining: Generalizing selfish mining and combining with an eclipse attack](https://decred.org/research/nayak2015.pdf).
