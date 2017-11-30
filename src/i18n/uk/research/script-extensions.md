# Розширення скриптів 

---

Окрім згаданих вище OP_CHECKSIGALT та OP_CHECKSIGALTVERIFY, у скрипти Bitcoin були внесені інші модифікації. Байт версії був доданий до скриптів виводу, щоб уможливити адаптацію сценаріїв (soft forking) до нових мов, як першим запропонував Wuille[^1]. Вся математика та логіка, що стосується OP кодів, були заново активовані і тепер працюють в регістрах int32. Також було реалізовано і повторно включено різні ОР-коди маніпуляцій з байтовими рядками. Залишок невикористаних OP кодів Bitcoin були переорієнтовані для майбутніх форків софту. Також були виправлені деякі застарілі помилки в мові сценаріїв Bitcoin[^2] [^3].

---

## <i class="fa fa-book"></i> References

[^1]: Wuille P. 2015. [Segregated witness for Bitcoin](https://prezi.com/lyghixkrguao/segregated-witness-and-deploying-it-for-bitcoin/).
[^2]: Todd P. [The difficulty of writing consensus critical code: The SIGHASH_SINGLE bug](https://decred.org/research/todd2014.pdf).
[^3]: Franco P. Understanding Bitcoin, 6.3: Multisignature (M-of-N) Transactions.
