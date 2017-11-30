# <i class="fa fa-ticket"></i> Comprando Tickets e Taxas 

---

#### 1. Existe uma forma de visualizar os bilhetes comprados pela carteira local?

Use o seguinte comando para mostrar todos os seus tickets[^9987]:

```no-highlight
dcrctl --wallet gettickets true
```

---

#### 2. Eu pago uma taxa de transação pela transação ssgen? 

Não, transações ssgen não exigem taxas[^10219] (ao contrário das transações originais para compra de tickets que estão disputando um espaço limitado em cada bloco). Nesse aspecto elas efetivamente são como transações de moedas proof-of-work. 

---

#### 3. Como eu altero a taxa do ticket?

```no-highlight
dcrctl --wallet setticketfee <fee>
```

---

#### 4. Como eu compro tickets manualmente? 

```no-highlight
dcrctl --wallet purchaseticket <fromaccount> <spendlimit> <minconf>
```

Onde:

Opção        | Descrição
---           | ---
`fromaccount` | Geralmente "default" (a não ser que tenha criado uma diferente). 
`spendlimit`  | Número máximo de DCR que pretende gastar em tickets.
`minconf`     | Pode ser configurado para 0.

---

#### 5. Qual valor devo colocar na ticketfee?

A `ticketfee` (ou taxa para tickets) determina a ordem na qual os tickets no pool de memória entram no pool de votação. Taxas mais altas incentivam os mineradores a colocarem seus tickets à frente na fila. Se você colocar uma taxa mais alta que a média há mais chances de seus tickets serem inclusos já no próximo bloco. A taxa padrão é de 0.01 DCR. Sendo assim, a melhor opção é colocar uma txfee alta para que esteja na frente da fila. Mas essa nem sempre é uma boa ideia. Na verdade, raramente é uma boa ideia simplesmente porque a fila do pool de memória é muito pequena ou inexistente na maioria do tempo. Não se esqueça que a txfee será descontada do seu lucro em DCR já que ela é cobrada em todos os tickets e não é reembolsável, independente se o ticket seja ou não votado.   

Considere um preço constante de tickets em 10 DCR. A cada bloco 20 tickets podem sair do pool de memória para o pool de votação. Este é um valor de 200DRC. Cada bloco gera cerca de 30 DCR e retorna 50DCR aos votantes. 3DCR são enviadas para os desenvolvedores como auxílio para financiar o desenvolvimento da Decred então apenas 27 acabam na mão dos mineradores. Isso significa que 77DCR são liberadas a cada bloco para voltar em forma de tickets, assumindo que todos os retornos são reinvestidos. Isso é menos da metade do que o bloco suporta. A única forma de mais DCR entrarem no pool de memória é por meio de investimentos externos (comprando de uma exchange, por exemplo) ou por mineradores que venham guardando suas DCR por esperarem uma queda no preço do ticket.    

No caso de uma queda no preço do ticket, um minerador está atento para entrar no pool antes que o valor mude outra vez. Isso acontece a cada 144 blocos (aproximadamente 12 horas). Não importa se está no primeiro ou no bloco de número 100. Em 144 blocos 2,880 tickets serão aceitos num valor de 28,800 DCR. Não há esse volume na rede proof-of-stake nesse momento. Existe um cenário onde talvez queira deixar sua fee mais alta. Se os custos de staking estiverem prestes a mudar em poucos blocos, o pool de memória não estiver vazio e você quiser se certificar de pegar o preço atual, pode ser de ajuda colocar a fee um pouco mais alta que a média para assegurar sua entrada, principalmente se a próxima mudança implicar na perda de um ticket seu.    

Continue para [PoS Solo Mining FAQ](/faq/proof-of-stake/solo-mining.md)

---

## <i class="fa fa-book"></i> Fontes

[^9987]: Fórum da Decred, [Post 9,987](https://forum.decred.org/threads/582/page-2#post-9987)
[^10219]: Fórum da Decred, [Post 10,219](https://forum.decred.org/threads/180/page-6#post-10219)
