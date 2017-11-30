# Blockchain Parameters

---

## Blockchain parameters

Parâmetro               | Valor        | Descrição
---                     | ---          | ---
Recompensa do bloco inicial    | 31.1958      | Esta foi a recompensa inicial por minerar um bloco.
Block reward multiplier | 100/101      | A recompensa por bloco é multiplicada por este valor sempre que o preço do bloco muda. Basicamente o que isso significa é que a cada ciclo de recompensa (veja abaixo), a recompensa pela mineração de um bloco é reduzida em aproximadamente 1%.
Block reward change     | 6.144 blocos | O número de blocos entre recompensas muda. Isso acontece aproximadamente a cada 3 semanas. A Decred usa tem um ciclo menor (comparado com o ciclo de 4 anos do Bitcoin), mas o impacto de cada mudança é muito menor (em torno de 1% por ciclo ao passo que a do Bitcoin é de 50%). Isto foi feito desta forma para reduzir o impacto no mercado quando uma mudança acontece.
Compartilhar recompensa do bloco      | 60/30/10     | A recompensa por bloco minerado é dividida entre os mineradores e o time de desenvolvimento da Decred da seguinte forma: mineradores PoW recebem 60% da recompensa como forma de recompensá-los pelos gastos com eletricidade e hardware. Cada minerador PoS recebem 6% da recompensa (30% divididos pelos 5 votos)<what happens if less than 5 vote?>. Isso encoraja as pessoas a guardarem seus fundos e investirem na rede Decred. O time de desenvolvimento recebe 10% para garantir o futuro da Decred por meio do financiamento do desenvolvimento.

---

## PoS network parameters

Parâmetro               | Valor              | Descrição
---                     | ---                | ---
`MinimumStakeDiff`      | 2                  | O preço mínimo para minerar um ticket.
`MinimumStakeDiff`        | 8.192              | Isso é multiplicado pelo TicketsPerBlock para obter o tamanho desejado da pool de votação (40.960).
`TicketsPerBlock`       | 5                  | Estes numerosos tickets serão escolhidos para votar em cada bloco.
`TicketMaturity`        | 256                | Tempo em blocos (cerca de um dia) até que um ticket possa votar depois de ter sido comprado.
`TicketExpiry`          | 40.960             | Tickets que não houverem votado após essa quantidade de blocos serão suspensos (aproximadamente 142 dias)
`CoinbaseMaturity`      | 256                | Histórico. Antes deste bloco, as moedas não podiam ser transferidas.
`SStxChangeMaturity`    | 1                  | Após votar, essa quantidade de blocos deve passar antes que as recompensas e o dinheiro pago pelo ticket sejam pagos aos mineradores PoS.
`TicketPoolSizeWeight`  | 4                  | Tickets não terão seus preços mudados além deste multiplicador em uma atualização.
`StakeDiffAlpha`        | 1                  | Esse é o valor do cálculo EMA alpha (suave) de dificuldade de stake. Ele é diferente de um EMA alpha comum. Masi próximo de 1 --> mais suave.
`StakeDiffWindowSize`   | 144                | O número de blocos em uma janela. A média é através da janela usada abaixo.
`StakeDiffWindows`      | 20                 | Uma média móvel exponencial sobre estas numerosas janelas é usada para calcular o custo da mineração.
`MaxFreshStakePerBlock` | 20                 | Essa quantidade de tickets será adicionada da mempool à pool de votação a cada bloco.
`StakeEnabledHeight`    | 256 + 256          | Histórico. Essa é a altura na qual o primeiro ticket poderá estar maduro. Como as moedas estiveram bloqueadas até o bloco 256, nenhum ticket pôde ser comprado até então. Depois disso, passaram-se outros 256 blocos antes que eles estivessem maduros.
`StakeValidationHeight` | 4.096              | Histórico. A mineração POS não ocorreu antes deste bloco.
`StakeBaseSigScript`    | []byte{0x00, 0x00} | This is the consensus stakebase signature script for all votes on the network. This isn't signed in any way, so without forcing it to be this value, miners/daemons could freely change it. Ensures the block is on the right network.
