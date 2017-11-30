# Pool de Ações Decentralizado 

---

Um problema que vem desde projetos PoS anteriores é como realizar pooling em mineração PoS semelhante ao pooling na mineração PoW.

Decred resolve esse problema ao permitir múltiplas entradas em uma transação de compra de tickets e compromete-se com o valor do subsídio UTXO para cada entrada proporcionalmente, ao mesmo tempo em que se compromete com uma nova chave ou script público de saída para essas recompensas proporcionais. O subsídio é dado aqueles que geram o ticket sem prioridades, e o ticket pode ser assinado pelo algoritmo de round robin antes da submissão à rede. Mas o importante é o controle sobre a produção do voto em si que é dado a outra chave pública ou script que não pode manipular o subsídio dado aos destinatários. A produção do voto é pensado de forma distribuída e usando um script no sistema de ticket que permite vários assinantes.
