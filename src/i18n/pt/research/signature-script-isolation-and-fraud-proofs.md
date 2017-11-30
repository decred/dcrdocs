# Isolamento de Scripts de Assinatura e Prova de Fraude

---

Para evitar a maleabilidade das transações, a capacidade de gerar uma transação com as mesmas referências de entrada e saídas e ainda uma ID de transação diferente, os scripts de entrada foram removidos do cálculo do hash da transação. As origens desta modificação têm sido controversas, embora pareça ter sido implementada em moedas CryptoNote e cadeias laterais no passado [^ 1] [^ 2]. Agora está sendo proposto para Bitcoin um soft fork, conhecido como "Segregated Witness"[^3]. Tal como na implementação das sidechains, os compromissos com os dados da SegWit estão incluídos na árvore merkle do bloco[^2]. Além disso, as provas de fraude, como sugerido para o sft fork do Bitcoin[^3], são definidas pelos mineradores e também comprometidas como parte dos dados na árvore merkle.

---

## <i class="fa fa-book"></i>Referências

[^1]: von Saberhagen N. 2013. [CryptoNote v2.0](https://decred.org/research/saberhagen2013.pdf).
[^2]: Maxwell G. 2015. [Bringing new elements to Bitcoin with sidechains](https://decred.org/research/maxwell2015.pdf).
[^3]: Wuille P. 2015. [Segregated witness for Bitcoin](https://prezi.com/lyghixkrguao/segregated-witness-and-deploying-it-for-bitcoin/).
