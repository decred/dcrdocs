# Tickets de votação 

---

#### 1. Quando a votação proof-of-stake começou? 

A votação POS começou [^7969] no bloco 4.096.

---

#### 2. No código fonte o parâmetro TicketPoolSize está em 8,192 mas o tamanho atual do ticket pool é maior que isso. Por que? 

Isso é proposital e parte integral do ajuste dinâmico para preço de tickets[^8965]. O `TicketPoolSize` é o tamanho alvo para ticket pools e ele funciona muito similarmente à dificuldade alvo na proof-of-work (PoW). O fato de que o tamanho do ticket pool atual é maior do que o alvo é o que ocasiona o aumento no preço dos tickets, o que eventualmente provocará uma queda na compra de tickets e resultará no número de tickets na pool reduzindo até próximo ao alvo. Se chegar abaixo, o preço irá cair para promover mais vendas de tickets com o intuito de aumentar o número de tickets na pool até próximo ao alvo. 

---

#### 3. Se eu não der sorte e meu ticket expirar sem ser votado, eu perco a fee de transação?

Sim[^9806].

---

#### 4. A votação na mainnet estava em 'hold' até o bloco 4,096, com pessoas comprando tickets. Isso significa que esses tickets terão um risco significativamente maior de expirarem? 

Não[^9806], o tempo de expiração não se inicia até que um ticket seja de fato minerado em um bloco. Os tickets estavam apenas em espera na pool de memória até que pudessem ser incluídos em blocos começando com o bloco 4,096.

---

#### 5. O que acontece se nenhum (ou menos de 3) dos votantes selecionados emitirem suas transações ssgen?

Os votos sempre são determinados pela tip atual. Os mineradores não começam a minerar um novo bloco até que pelo menos mais de 3 dos votantes selecionados emitam suas transações ssgen. Assim, se um bloco encontrado não conseguir obter os votos selecionados[^10219], ele simplesmente é deixado órfão pelo próximo bloco que outro minerador encontrar.  

Para um exemplo mais concreto, assuma que a ponta atual da cadeia esta no bloco 5,000. Os votantes selecionados para o bloco 5000 já submeteram seus votos, então os mineradores já começaram a buscar pelo resultado do block 5,001. Agora, um minerador encontra a solução para o bloco 5,001 e o submete para a rede. Todos os daemons (e por conseguinte as carteiras) verão que o bloco 5,001 apareceu. Todavia, os mineradores não iniciam  imediatamente a minerar o 5,001. Em vez disso eles continuam minerando o 5,000 até 3 ou mais votos apareça para o bloco 5,001 . Neste ponto todos eles param e começam a minerar o 5,001. Se aqueles 3 ou mias votos nunca aparecerem, outro candidato para o bloco 5,001 será encontrado por outros mineradores que ainda trabalham no bloco 5,000 que irão submeter à rede sua (diferente) solução para o bloco 5,001. Como cada um dos novos candidatos para o bloco 5,001 tem um hash diferente, tickets diferentes são selecionados. 

---

#### 6. O que acontece se um ticket que tenho perder o voto? 

Sua carteira irá automaticamente revogar o ticket no bloco seguinte ao que ele foi perdido[^13912], de forma que você o pegue de volta logo após eles terem sido perdidos como fundos imaturos (isso significa que eles não vão ficar "spendable" por 256 blocos, quando ficam "mature", ou amadurecem).

Exemplo:

```no-highlight
dcrctl --wallet getstakeinfo
```

Saída          | Descrição
---             |---
`allmempooltix` | Todos os stake tickets na pool de memória (aguardando serem minerados em um bloco).
`ownmempooltix` | Seus stake tickets na pool de memória (esperando para serem minerados em um bloco).

---

#### 7. Qual é a diferença entre tickets perdidos e revogados? 

Tickets perdidos são aqueles chamados para votar, porém, que não votaram. Depois que um ticket for perdido ele pode ser revogado[^14763]. A carteira automaticamente revoga tickets perdidos sob seu controle (assumindo que ela esteja desbloqueada para que consiga liberar a transação de revogação). 

Tudo o que o `rebroadcastmissed` faz é dizer à carteira para pedir ao daemon de rede (`dcrd`) dar outra vez a lista de tickets perdidos para confirmar se algum precisa ser revogado. Isso geralmente não é necessário a não ser que uma tentativa de revogar um ticket tenha sido feita porém falhou devido à carteira estar bloqueada, por exemplo. Em outras palavras, se perceber que os revogados não se igualam aos perdidos, você talvez precise usar o `rebroadcastmissed`. Todavia, como já foi dito, isso raramente é necessário já que a carteira faz isso automaticamente ao iniciar e procura por tickets perdidos em todos os blocos.      

Continuar para [Proof-of-Work Mining](/mining/proof-of-work.md)

---

## <i class="fa fa-book"></i> Fontes

[^7969]: Fórum da Decred, [Post 7,969](https://forum.decred.org/threads/531/#post-7969)
[^8965]: Fórum da Decred, [Post 8,965](https://forum.decred.org/threads/531/page-2#post-8965)
[^9806]: Fórum da Decred, [Post 9,806](https://forum.decred.org/threads/180/page-6#post-9806)
[^10219]: Fórum da Decred, [Post 10,219](https://forum.decred.org/threads/180/page-6#post-10219)
[^13912]: Fórum da Decred, [Post 13,912](https://forum.decred.org/threads/1271/#post-13912)
[^14763]: Fórum da Decred, [Post 14,763](https://forum.decred.org/threads/1335/#post-14763)
