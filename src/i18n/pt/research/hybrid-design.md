# Design Híbrido

---

O maior contraste em seguir o esquema de satoshi descrito anteriormente[^1] é um novo sistema de loteria em que os tickets devem ser comprados e depois aguardam um período de maturidade antes de serem sorteados e gastos. O sorteio dos tickets para um bloco é realizada lexicograficamente a partir de uma pool (Ex de pool: https://stake.decredbrasil.com) para ser maduro baseado em um processo pseudo randômico, que é um processo que parece ser aleatório, mas não é. As seqüências de pseudo randômico tipicamente exibem aleatoriedade estatística enquanto são geradas por um processo causal completamente determinado. Esse processo é mais fácil de produzir do que um autêntico, e tem o benefício de que ele pode ser usado uma e outra vez para produzir exatamente os mesmos números, o que é útil para testar e corrigir o software. Como a manipulação deste processo pseudo randômico é difícil em um sistema PoW, a manipulação da seleção de ticket está associada a um custo fundamental para os mineradores PoW. O sorteio dos tickets durante um período de tempo pode ser descrita por uma função de densidade de probabilidade semelhante à probabilidade de obter um bloco em PoW a uma taxa de hash constante ao longo do tempo em uma dificuldade constante [^2], produzindo uma distribuição de probabilidade com um modo aproximadamente igual a metade do tamanho do pool de tickets. O preço para comprar um ticket é regulado por uma nova dificuldade de participação, determinada pela quantidade média ponderada exponencialmente de tickets comprados e pelo tamanho da pool dos tickets maduros em blocos anteriores.

A validação dos blocos PoW é explicada pelas seguintes etapas:

1. Um bloco é minerado por um mineiro PoW, que seleciona as transações para colocar dentro dela. As transações relacionadas ao sistema stake são inseridas no conjunto UTXO (Unspent Transaction Output) - Saída de transação não impressa
2. Os mineiros de PoS votam no bloco, produzindo uma transação de voto do seu ingresso (Ticket). O voto permite que um bloco seja construído em cima do bloco anterior e seleciona ou não as transações regulares da árvore anterior (Contendo as transações relacionadas com a moeda e sem participação) é válida.
3. Outro minerador PoW começa construindo um bloco, inserindo os votos dos mineiros PoS. A maioria dos votos emitidos deve ser incluída no seguinte bloco para que esse bloco seja aceito pela rede. Das transações de votação neste novo bloco, o mineiro PoW sinaliza uma flag para ver se o mineiro PoS indicou se a árvore de transações regular do bloco era válida. Essas flags de votação são compostas com base no voto maioritário, então, um sinalizador de bits é definido neste bloco para indicar se a árvore de transações regulares do bloco anterior é válida.
4. Um número arbitrário (nonce) é encontrado para satisfazer a dificuldade da rede, e o bloco é inserido na cadeia de blocos (blockchain). Se a árvore das transações regulares do bloco anterior foi validada, insira essas transações no conjunto UTXO. Vá para 1.

Para desencorajar a manipulação dos votos incluídos, uma penalidade de subsídio linear é aplicada ao bloco atual se eles não incluirem todas as transações de votação em seu bloco. A penalidade "suave" de invalidar a árvore de transações anterior ajuda a evitar o descarte de trabalho, que é necessário para garantir o sistema, e faz a suposição de que o próximo bloco será obtido por um minerador que está desinteressado em preservar o subsídio do bloco anterior em seu próprio favor. Mesmo no caso de que isso não seja verdade, um minerador malicioso com uma taxa de hash alta ainda precisará pelo menos \((\text{number for majority}/2)+1\) votos a favor da árvore de transação de seu bloco anterior em ordem de produzir um bloco que lhes dê qualquer subsídio do bloco anterior.

As bandeiras de bits são explicitamente adicionadas tanto ao cabeçalho do bloco quanto aos votos, assim qualquer mineiro possa facilmente votar em novos garfos fortes ou rígidos.

---

## <i class="fa fa-book"></i> Referências 

[^1]: Bentov I., Lee C., Mizrahi A., Rosenfeld M. 2014. [Proof-of-activity: Extending Bitcoin's proof-of-work via proof-of-stake](https://decred.org/research/bentov2014.pdf).
[^2]: Nakamoto S. 2008. [Bitcoin: A peer-to-peer electronic cash system](https://decred.org/research/nakamoto2008.pdf).
