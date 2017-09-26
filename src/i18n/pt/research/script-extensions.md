# Extenções Script

---

Além do mencionado anteriormente OP_CHECKSIGALT e OP_CHECKSIGALTVERIFY, outras modificações no script do Bitcoin foram feitas. Um byte de versão por exemplo foi adicionado aos scripts de saída para permitir bifurcação simples para facilitar em novas linguagens de script, como sugerido pela primeira vez por Wuille[^1]. Todos os códigos OP relacionados a matemática e lógica foram reativados e agora operam em registros int32.  Vários códigos de OP de manipulação e seqüência de bytes também foram implementados e reativados. Os códigos do Bitcoin OP restantes não que foram utilizados serão reutilizados para  futuros Soft Fork,  Além disso, alguns erros antigos na linguagem do script do Bitcoin também foram corrigidos[^2] [^3].

---

## <i class="fa fa-book"></i> References

[^1]: Wuille P. 2015. [Segregated witness for Bitcoin](https://prezi.com/lyghixkrguao/segregated-witness-and-deploying-it-for-bitcoin/).
[^2]: Todd P. [The difficulty of writing consensus critical code: The SIGHASH_SINGLE bug](https://decred.org/research/todd2014.pdf).
[^3]: Franco P. Understanding Bitcoin, 6.3: Multisignature (M-of-N) Transactions.
