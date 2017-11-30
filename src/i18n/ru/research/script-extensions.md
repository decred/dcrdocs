# Расширения скриптов 

---

AПомимо упомянутых ранее OP_CHECKSIGALT и OP_CHECKSIGALTVERIFY были произведены и другие изменения в скриптах Bitcoin. Байт версии был добавлен в выходные скрипты, чтобы обеспечить адаптацию скриптов к новым языкам, как это первым предложил Wuille[^1]. Вся математика и логика, касающаяся OP кодов, были заново активированы и теперь работают с регистрами int32. Также были реализованы и снова включены различные ОР-коды операций с байтовыми строками. Остающиеся неиспользованными OP коды Bitcoin были переориентированы для будущих форков софта. Также были исправлены некоторые давние ошибки в языке сценариев Bitcoin[^2] [^3].

---

## <i class="fa fa-book"></i> References

[^1]: Wuille P. 2015. [Segregated witness for Bitcoin](https://prezi.com/lyghixkrguao/segregated-witness-and-deploying-it-for-bitcoin/).
[^2]: Todd P. [The difficulty of writing consensus critical code: The SIGHASH_SINGLE bug](https://decred.org/research/todd2014.pdf).
[^3]: Franco P. Understanding Bitcoin, 6.3: Multisignature (M-of-N) Transactions.
