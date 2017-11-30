# Хеш-функція BLAKE-256 

---

SHA256, що використовується в Bitcoin, має ряд технічних недоліків із-за своїй структури Меркла-Дамгарда(Merkle-Damgård construction). Ці вразливості призвели до конкуренції SHA3 за нову хеш-функцією на основі іншої фундаментальної структури. Decred обрав собі за хеш-функцію BLAKE256, як фіналіста цього змагання[^1] [^2]. Ця хеш-функція  базується на конструкції HAIFA, яка включає в себе варіацію шифрування потоку ChaCha від Bernstein. Хеш-функція відрізняється високою продуктивністю на мікроархітектурі x86-64, є більш швидкою для коротких повідомлень, ніж SHA256[^3] незважаючи на те, що вважається, ніби вона має набагато вищий запас міцності на 14-rounds.

---

## <i class="fa fa-book"></i> Посилання 

[^1]: Aumasson J., Henzen L., Meier W., Phan R. 2010. [SHA-3 proposal BLAKE](https://decred.org/research/aumasson2010.pdf).
[^2]: Aumasson J., Henzen L., Meier W., Phan R. 2014. The hash function BLAKE.
[^3]: Bernstein D. and Lange T. 2013. [eBACS: ECRYPT benchmarking of cryptographic systems](http://bench.cr.yp.to).
