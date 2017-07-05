# BLAKE-256 funções de hash criptográficas.  

---

A SHA256, usada no Bitcoin, possui algumas falhas técnicas devido à sua construção em Merkle-Damgård. Tais vulnerabilidades levaram à criação da competição SHA3 para padronizar uma nova função hash baseada em outra construção. A Decred escolheu a BLAKE256 como sua função hash, a qual foi finalista da disputa[^1] [^2]. Essa função é desenvolvida em torno de uma construção HAIFA que incorpora uma variação da cifra de fluxo ChaCha de Bernstein. A BLAKE256 é digna de nota pelo seu alto desempenho na microarquitetura x86-64 e por ser mais rápida para mensagens curtas do que a SHA256[^3] apesar de ser tida como uma função com margem de segurança muito maior em 14 rodadas.     

---

## <i class="fa fa-book"></i>Referências

[^1]: Aumasson J., Henzen L., Meier W., Phan R. 2010. [SHA-3 proposal BLAKE](https://decred.org/research/aumasson2010.pdf).
[^2]: Aumasson J., Henzen L., Meier W., Phan R. 2014. The hash function BLAKE.
[^3]: Bernstein D. and Lange T. 2013. [eBACS: ECRYPT benchmarking of cryptographic systems](http://bench.cr.yp.to).
