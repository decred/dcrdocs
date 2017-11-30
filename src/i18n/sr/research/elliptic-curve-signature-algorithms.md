# Алгоритми елиптичних закривљених потписа 

---

Иако се сматра да сецп256к1 има сигуран избор параметара елиптичне кривине, остају нека питања о пореклу кривине. На пример, избор Коблиц кривуље,

\((y^2 + xy = x^3 + ax^2 + b \text{ and } a = a^2 \text{, } b = b^2 \text{; } a = 1 \text{ or } 2 \text{, } b != 0)\)

Обично се врши набрајањем бинарних екстензија Галоисових поља \ (ГФ (2 ^ м) \) где је \ (м \) приме у опсегу {\ (0 \), \ (... \), висока граница} И \ (к, и \ у ГФ (2 ^ м) \)[^1]. За 128-битну сигурност, \ (м \) мора бити \ (\ гекслант 257 \) и обично је најмањи могући у овом опсегу како би се олакшало брзо израчунавање. У овом случају, очигледан избор за \ (м \) је \ (277 \ тект {,} а = 0 \); Упркос постојању ове одговарајуће $ м $ вредности коју кустоси познају од параметара кривуље[^2] и чињенице да је то најрационалније и ефикасније решење, параметри \ (м = 283 \) и \ (а = 0 \) Изабрани су из три могуће опције:

 \((m = 277\text{, } a = 0\text{; } m = 283\text{, } a = 0\text{; } m = 283\text{, } a = 1)\).

За све друге спецификације кривуље Коблиц, изабрана је најочигледнија \ (м \) вриједност. Иако је то занимљиво, не постоје познати напади који се могу применити употребом нешто веће вриједности од $ м $ за поље Галоис. Такође су подигнуте друге примедбе на параметре које користи сецп256к1 [^3].

Други изузетно популаран алгоритам дигиталног потписа (ДСА) са 128 бита сигурности је Ед25519[^4]. This uses the EdDSA signing algorithm over a curve birationally equivalent to Curve25519 and is widely employed today. Unlike secp256k1's ECDSA, Ed25519 uses simpler Schnorr signatures that are provably secure in a random oracle model (See: [Schnorr Signatures](schnorr-signatures.md)).

нор потписи су такође предложени за Биткоин[^5]. Међутим, умјесто коришћења ОП ексклузивног за Шнор потпис, користећи параметре кривуље за сецп256к1, Декред умјесто тога користи нови ОП код ОП_ЧЕКСИГАЛТ да би потврдио неограничен број нових шема потписа. У тренутној имплементацији, доступни су сецп256к1 Сцхнорр потписи и Ед25519 потписи за допуну сецп256к1 ЕЦДСА потписа. У будућности је тривијално додати нове шеме потписа у 'мекано' унапређење, као што су оне које су квантно сигурне. Имајући на располагању ова два Шнор дијела, такође је омогућено генерисање једноставних групних потписа који заузимају исти простор нормалног потписа[^6],који је у оба имплементирана. У будућности, потписи коришћењем тајне размене без посредника такође ће омогућити т-оф-н праговне потписе који заузимају исту количину простора[^7].

---

## <i class="fa fa-book"></i> Референце

[^1]: Pornin T. 2013. [StackExchange Cryptography: Should we trust the NIST-recommended ECC parameters?](https://decred.org/research/pornin2013.pdf)
[^2]: Solinas J. 2000. [Efficient arithmetic on Koblitz curves](https://decred.org/research/solinas2000.pdf).
[^3]: Bernstein D. and Lange T. 2014. [SafeCurves: Choosing safe curves for elliptic-curve cryptography](http://safecurves.cr.yp.to).
[^4]: Bernstein D., Duif N., Lange T., Schwabe P., Yang B. 2012. [High-speed high-security signatures](https://decred.org/research/bernstein2012.pdf).
[^5]: Osuntokun O. 2015. [OP_SCHNORRCHECKSIG: Exploring Schnorr Signatures as an alternative to ECDSA for Bitcoin](https://decred.org/research/osuntokun2015.pdf).
[^6]: Petersen T. 1992. [Distributed provers and verifiable secret sharing based on the discrete logarithm problem](https://decred.org/research/petersen1992.pdf).
[^7]: Стинсон Д. и Стробл Р. 2001. Провидно сигурни дистрибуирани Шнорр потписи и (т, н) прага шема за имплицитне сертификате.
