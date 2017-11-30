# <i class="fa fa-cubes"></i>Blocos

---

#### 1. Um bloco pode se tornar órfão após ser confirmado várias vezes?

Apenas se houver um reorg que seja suficientemente longo[^8918]. Para que isso aconteça, você precisará de mais hash power no outro lado de um fork do que o que já estiver ativo na melhor corrente daquele momento. 

---

#### 2. Podemos remover o explorador de blocos testnet visto que a mainnet está disponível?

A testnet irá continuar como um terreno para teste de novas funcionalidades, então faz sentido manter o explorador de blocos da testnet [^9621] ativo.

---

#### 3. O que a mensagem "[INF] CHAN: Adding orphan block" significa? 

Isso significa apenas que um bloco não tenha recebido o seu anterior[^14660]. Isso sempre acontece quando reinicia o `dcrd` devido à forma como a sincronização funciona. Você ainda está sincronizando com o último bloco, mas o "servidor" remoto, que está à sua frente, enviou uma notificação de que um novo bloco apareceu, para aquele anterior que você ainda não possui.

Ao invés de ignorá-lo, e uma vez que você está suficientemente perto de ser sincronizado, é essencial salvá-los para mais tarde, então, se você tiver o bloco pai, os novos blocos serão conectados automaticamente.

---

#### 4. Devo baixar a blockchain novamente a cada novo lançamento de software?

Você quase nunca terá que baixar a chain novamete[^14788] em uma atualização, a não ser que seja uma mudança massiva, onde faça sentido começar de novo. Tipicamente, deverão ser migradas as mudanças para que ela funcione.

---

#### 5. Qual é o número do bloco gênese?

O bloco gênese[^16987]  é o bloco de altura 0 (bloco número 0). Todos os blocos após esse são acrescidos em 1.

---

#### 6. O que a mensagem "[INF] CHAN: FORK: Block 000..." significa? 

Aqui está uma mensagem de exemplo:

```no-highlight
[INF] CHAN: FORK: Block 0000000000001aedcf1b82b087a1d05ef787550174da1012e473e8ee8c178937 (height 17879) forks the chain at height 17878/block 000000000000150f863186cab6ef5c433bcc155d2f683394f8e65cb037f80b16, but does not cause a reorganize
```

Isso significa que dois mineradores encontraram a solução em torno do bloco ao mesmo tempo e ambos submeteram os seus blocos resolvidos para a red[^17791]. Ambos são igualmente válidos, no entanto, o nó viu a outra solução ([000000000000147d33cde5e9823122924fb43405418712720eb6457956d8edbb](https://mainnet.decred.org/block/000000000000147d33cde5e9823122924fb43405418712720eb6457956d8edbb)) primeiro, então, do ponto de vista do seu nó, o novo bloco ([0000000000001aedcf1b82b087a1d05ef787550174da1012e473e8ee8c178937](https://mainnet.decred.org/block/0000000000001aedcf1b82b087a1d05ef787550174da1012e473e8ee8c178937)) estava em uma chain secundária.

Desde que os blocos levam tempo para serem retransmitidos, outros nós podem ter visto 0000000000001aedcf1b82b087a1d05ef787550174da1012e473e8ee8c178937 primeiro, o que significa para eles que a solução vista primeiro pelo seu nó ([000000000000147d33cde5e9823122924fb43405418712720eb6457956d8edbb](https://mainnet.decred.org/block/000000000000147d33cde5e9823122924fb43405418712720eb6457956d8edbb)) era aquela que estava na chain secundaria.

Isto é totalmente comum e resolve-se sozinho sempre que o próximo bloco é encontrado, pois agora irá definir a cadeia mais extensa e qualquer solução que não tenha sido construída, será órfão.

Nesse caso, o bloco #17880 ([000000000000154c6091747245e3c2620447c71b346aed09548e74b4543d0d66](https://mainnet.decred.org/block/000000000000154c6091747245e3c2620447c71b346aed09548e74b4543d0d66)) acabou sendo construído no topo do 000000000000147d33cde5e9823122924fb43405418712720eb6457956d8edbb, então a outra solução ([0000000000001aedcf1b82b087a1d05ef787550174da1012e473e8ee8c178937](https://mainnet.decred.org/block/0000000000001aedcf1b82b087a1d05ef787550174da1012e473e8ee8c178937)) acabou orfã.

---

## <i class="fa fa-book"></i> Fontes 

[^8918]: Fórum da Decred, [Post 8,918](https://forum.decred.org/threads/557/#post-8918)
[^9621]: Fórum da Decred, [Post 9,621](https://forum.decred.org/threads/651/#post-9621)
[^14660]: Fórum da Decred, [Post 14,660](https://forum.decred.org/threads/1333/#post-14660)
[^14788]: Fórum da Decred, [Post 14,788](https://forum.decred.org/threads/1336/#post-14788)
[^16987]: Fórum da Decred, [Post 16,987](https://forum.decred.org/threads/1852/#post-16987)
[^17791]: Fórum da Decred, [Post 17,791](https://forum.decred.org/threads/2925/#post-17791)
