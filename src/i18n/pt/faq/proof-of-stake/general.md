# <i class="fa fa-ticket"></i>FAQ Geral PoS

---

#### 1. O que é o sistema Proof-of-Stake da Decred?

O sistema Proof-of-Stake (PoS) permite que quem tem Decred possa opinar na governança da moeda. O objetivo é que os usuários tenham voz juntamente aos mineradores.
Para participar, os usuários devem comprar "tickets", que entram na loteria. A cada bloco, 5 tickets são escolhidos na loteria PoS. Se pelo menos 3 desses tickets validarem o bloco minerado anteriormente,
o bloco recém-minerado é adicionado à blockchain, e tanto os mineradores PoW e os  stakers PoS recebem por isso. Se o bloco não for validado pelos stakers PoS, os mineradores PoW não recebem, mas os stakers PoS sim. O objetivo disso
é incentivar que o mineradores PoW minerem de acordo com as vontades dos stakers PoS.

Esse sistema PoS tem várias vantagens que resolvem problemas que sistemas exclusivamente PoW costumam encontrar. Por exemplo, já que os stakers PoS têm que validar os blocos minerados pelos mineradores PoW, estes não podem decidir por conta própria mudar as regras da rede (o famoso ataque de 51%). Ou quando a blockchain da Decred sofre um hardfork, a chain menor, mais antiga, é deixada de lado rapidamente já que os stakers PoS não a validam.

O sistema PoS recompensa os participantes por fazerem o stake. Cada bloco de Decred tem uma recompensa PoS que é distribuída para os tickets escolhidos para votar naquele bloco. O sistema é projetado de uma
forma que o tempo médio de espera para que um ticket seja selecionado é de 28 dias. Se um ticker não for selecionado após 40960 blocos (pouco menos de 5 meses), ele será revogado pelo sistema. Os DCR usados para comprar o ticket é devolvido independente dele ter realizado voto ou não.

Outra característica interessante do sistema PoS é a possibilidade de votar em uma agenda. Uma vez que a validação de bloco pode ser considerada um voto, ao adicionar componentes votebit extra ao ticket, o sistema consegue acompanhar e contar votos ao longo de uma série de blocos. Esses votos podem dizer respeito a qualquer coisa.

No sistema Proof-of-Stake do Decred, qualquer um que tenha DCR pode participar por meio da compra de um ticket.

---

#### 2. O que são tickets?

Um ticket é um token que você compra para participar no sistema PoS. Você pode comprar tickets pela interface de linha-de-comando do dcrctl ou por meio de um app com interface gráfica, como o Paymetheus[^1] ou o Decrediton. Sempre que você compra um
ticket, você paga o preço desse ticket e mais uma taxa usando seus DCR. Quando um ticket é comprado, ele vai para uma "mempool" temporária. 20 tickets podem ser minerados em cada bloco e eles são escolhidos
para serem minerados baseado nas taxas pagas por kilobyte. Uma vez que existe um número limitado de tickets que podem ser minerados por bloco por um determinado preço (2880), pode haver competição na mineração dos tickets. Nesse caso,
você pode aumentar a taxa que está disposto a pagar para ter seu(s) ticket(s) minerados. Uma vez que seu ticket é minerado, ele é transferido da  "allmempool" atual para a pool de tickets "immature". Depois de 256 blocos (algo em torno de 20 horas), ele estará maduro e vai para a pool de tickets live. onde ele pode ser escolhido para votar.

---

#### Eu preciso estar constantemente conectado à rede para participar do PoS?

Uma wallet precisa estar online 24h por dia para pode votar caso algum dos seus tickets seja selecionado. Existem duas maneiras de fazer isso; uma wallet de staking solo que você mantém online o tempo todo, ou você
pode usar uma [stake pool](/mining/proof-of-stake.md#solo-mining-or-pool-mining). Uma stake pool é basicamente  uma wallet executada comunitariamente para a qual você pode delegar os direitos de voto dos seus tickets. A pool vai
votar por você por pequenas porcentagens da recompensa de PoS.

É importante deixar claro que você apenas delega direito de voto para a pool, não seus DCR propriamente ditos. Uma stake pool não tem acesso aos seus DCR em momento nenhum.

---

#### 4. O que é o "preço do ticket"?

O preço dos tickets é determinado por um algoritmo que tem como objetivo manter mais ou menos constante a quantidade de tickets na pool de tickets do sistema PoS ao redor de um tamanho médio de 40960 tickets.
O preço do ticket sobe ou desce de acordo com a demanda e com o número de tickets atualmente na pool.

A cada 144 blocos o algoritmo ajusta o valor do ticket. Isso é chamado de janela de compra. Cada bloco pode conter 20 novos tickets comprados. Isso significa que cada janela de compra tem um máximo de 2880 tickets
que podem ser adicionados à pool do sistema PoS.

O valor do ticket é sempre devolvido, não importa se seu ticket foi votado, perdido ou expirou.

---

#### 5. O que são as fees?

O sistema de PoS utiliza dois tipos de fees, a txfee (também conhecida com uma "split" fee) e a ticketfee.
	
A txfee é uma taxa que você paga para a rede pela transação de compra do seu ticket. Essa taxa é, por padrão, definida a um valor baixo (0.01 DCR/kB) e não deve ser alterada.
Ticketfee é a taxa que você paga se seu ticket for minerado. Essa taxa é o que incentiva os mineradores PoW a minerarem seu ticket e adicioná-lo à pool de tickets.

Caso haja mais tickets sendo comprados do que tickets disponíveis para serem minerados, a ticketfee será usada para determinar quais tickets devem ser postos na pool de tickets. Os tickets que tiverem as ticketfees mais altas serão selecionados pelos mineradores PoW.

Taxas são calculadas em DCR por kilobyte. Como um ticket tem mais ou menos 300 (solo) ou 540 (pool) bytes de tamanho, as taxas que são de fato pagas acabam sendo mais baixas do que aquelas que foram especificadas por você.

Ambas txfees e ticketfees não serão devolvidas quando um ticket é votado, expira ou um voto é perdido.

A devolução dos seus DCR à sua wallet depois que um ticket vota ou é revogado não garante uma taxa.

---

#### O que é uma stake pool?

Uma stake pool é o equivalente a uma mining pool, mas do sistema PoS. Nas configurações da sua wallet Decred, você pode dar seus direitos de voto a uma stke pool. Se seu ticket for selecionado para votar,
a stake pool vai realizar o voto por você e você será recomensado com a recompensa por PoS menos a taxa da stake pool (geralmente entre 4-5%). Diferentemente das mining pools, a recompensa por PoS não é dividida entre os usuários da stake pool. A recompensa integral vai para o dono do ticket.

Uma stake pool permite que você compre tickets, mas não permite que você tenha sua própria carteira desbloqueada e sempre online. Importante explicitar que seus DCR nunca deixam sua wallet. Você não envia nada para a pool,
apenas delega a autoridade de votar por você. Uma stake pool não tem como acessar seus DCR.

Stake pools geralmente implementam redundância multi-wallet, distribuindo múltiplas wallets fisicamente ao redor do mundo. Isso significa que as chances de um voto ser perdido por conta de uma wallet ter caído é muito menor.
Isso também reduz a latência entre wallet e rede, o que também reduz a chance de um voto ser perdido.

---

#### 7. O que acontece com meus fundos quando eu compro um ticket?

DCR usados para comprar tickets ficam bloqueados até que o ticket seja selecionado para votar ou que ele expire. Não tem como trasnferi-los. Eles aparecerão na seção "lockedbytickets" da sua wallet.
Se seu ticket for selecionado para votar, você receberá de volta o valor integral pago pelo ticket e mais a recompensa por PoS. 

O único custo de usar esse sistema é o das taxas que você escolhe pagar. A txfee será cobrada pela transação do seu ticket através da rede. O ticketfee será cobrado pela incorporação na
ticket pool e é pago aos mineradores PoW. Se seu ticket não for minerado, não haverá cobrança, já que a transação nunca chegou à rede.

Se seu ticket não for selecionado para votar após 40960 blocos (algo em torno de 4 meses), o sistema vai revogá-lo e os DCR que você usou para pagar por ele (menos as taxas) serão devolvidos para sua carteira.

---

#### 8. Quais são as chances do meu ticket ser votado?

O sistema PoS do Decred utiliza uma distribuição de Poisson para determinar as chances que um ticket tem de votar a qualquer momento. Dado uma quantidade de 40960 tickets em uma pool, qualquer ticket tem 50% de chance de votar
dentro de 28 dias e 99.5% de chance de votar antes de expirar. Repare que esses valores mudam de acordo com o tamanho da pool.


---

#### 9. O que é votação Proof-of-Stake?

Como o processo de validação de blocos executado pelo sistema PoS funciona como um sistema de votação, ele também pode ser usado para votos em outras questões.

Quando selecionados para validar um bloco, os tickets votam se aprovam ou não o bloco minerado anteriormente. São necessários 3 de 5 votos a favor para que o sim vença.

Ao adicionar ao ticket um parâmetro que não interfira com a aprovação dos blocos minerados,  o sistema pode acompanhar a quantidade de tickets utilizando esse parâmetro ao longo de uma quantidade de blocos. Você pode configurar esse parâmetro na sua wallet a qualquer momento antes que o ticket vote.

Por exemplo, você pode escolher que a cor do seu ticket seja vermelha ou azul, configurar essa opção, e o sistema vai contar pelos próximos 1000 blocos quantos tickets vermelhos e quantos azuis existem. Talvez haja 3000 tickets vermelhos, 1500 azuis e 500 que não selecionaram uma cor.

Se você substituir a opção vermelho ou azul por uma opção de sim ou não, você tem um sistema de votação que pode contar votos dentro de um período de tempo. Usando o sistema de voto PoS, qualquer um que tenha DCR pode votar em questões presentes em uma agenda.

Esse sistema de voto pode ser usado em questões de governança. Para o Decred, o uso mais notável será a possibilidade de votações sobre hardforks, que são mudanças técnicas que afeta a forma como a moeda funciona. Alguns exemplos:

- Aumentar o tamanho máximo dos blocos
- Mudar o algoritmo que o PoS utiliza para determinar o preço dos tickets.
- Vote on major new features for the currency (e.g. lightning network, enhanced privacy).
- Mudar o algoritmo de PoS.
- Pretty much anything the community decides would be in the best interest of the currency.

Atualmente, a plataforma usada pela comunidade para enviar e debater ideias de votações ainda está em desenvolvimento.

---

#### 10. O que é votação de hardfork?

Como qualquer outra criptomoeda, Decred pode precisar sofrer um hardfork em algum momento.

Uma dos problemas previstos para o sistema de votação PoS poderia ser um hardfork. Se tal problema se estabelecer, a nova versão do source code do Decred vai incluir o hardfork, mas o hardfork não será ativado até que o sistema de votação PoS tenha votado.

Para que uma votação sobre um hardfork aconteça, duas condições precisam ser satisfeitas:

- Primeiro, 75% dos mineradores PoW precisam atualizar para a última versão da rede de blocos atual. Essa verificação acontece nos últimos 1000 blocos.
- Segundo, 75% dos mineradores PoS devem atualizar para a versão mais recente. Essa verificação acontece nos últimos 2016 blocos.

Uma vez que essas condições são satisfeitas, o processo de votação tem início. Tickets podem ser configurados com parâmetros adicionais de sim/não/abstenção. Você configura isso na sua wallet antes que seus tickets votem. Tickets marcados como "abstenção" não serão entrarão na contagem total de votos.

O sistema PoS começa então a contar os tickets que tenham esses parâmetros configurados ao longo de uma quantidade pré-determinada de blocos. Se após esse intervalo a quantidade de votos "sim" for igual ou superior a 75%, a proposta é aceita. Um lock no período de um determinado número de blocos começará antes que o hardfork seja habilitado, para que todos tenham a chance de atualizar e evitem ser deixados de lado na rede anterior ao hardfork.

Como o código do hardfork já estará na versão mais atual do Decred, não é preciso que os desenvolvedores interfiram nem que a maioria dos mineradores PoW e PoS atualizem após uma tomada de decisão. Se a decisão por um hardfork passar, ela será implementada automaticamente após o período de lock.

A votação por um hardfork pode falhar em vários momentos. A votação pode nem começar se of mineradores PoW ou os PoS não atualizarem. Depois disso, o mínimo de 75% do votos pode nem ser alcançado.

Caso uma votação falhe, um novo turno começa. Isso significa checar novamente se os mineradores PoW e os PoS fizeram atualização e então estabelece-se um novo período para contagem dos votos. Isso continua por uma certa quantidade de turnos, depois da qual, se a votação não se concluir, a votação sobre essa questão será adiada.

---

#### 11. Uma grande exchange poderia usar os DCR de seus clientes para minerar via PoS?

A quantidade de DCR que uma pessoa (ou uma exchange) possui não significa nada pra o sistema PoS. O que importa é a quantidade de tickets que você tem. DCR usados para comprar tickets ficam bloqueados até que esse ticket vote. Isso significa que
DCR envolvidos em PoS são intransferíveis. Para que uma exchange utilizasse os DCR de seus usuários para votar, precisaria transferi-los para carteiras externas e bloqueá-las por até 5 meses. As pessoas
perceberiam que seus saldos mudaram (DCR bloqueados para PoS não aparecerão como transferíveis) e que não poderiam sacar seus DCR, fazendo com que a exchange sofre uma grande perda de liquidez.

Além do mais, existe um limite de 20 tickets adicionados por bloco, então nenhuma exchange conseguiria floodar a pool mais rápido que isso.

E, finalmente: existe um limite no total de tickets na pool. A cada 144 blocos (2880 tickets) o preço do ticket é ajustado com base no número de tickets na pool e na frequência com que novos tickets
foram adicionados na última janela. Eventualmente o preço do ticket ficaria tão alto que mesmo uma exchange não conseguiria comprar muitos deles. E lembre-se que, mesmo que conseguissem, os DCR deles estariam bloqueados, então eles
não poderiam comprar quando o preço do ticket baixasse.

---

#### 12. O sistema PoS é suscetível à influência de quem possui grandes quantidades de DCR como, por exemplo, os primeiros desenvolvedores?

Os limites de tamanho da pool descritos acima são aplicados aqui também. Isso impede uma pessoa/grupo de floodar a pool de PoS com grandes quantidades de tickets. Mesmo que alguém comprasse a pool inteira (pagando taxas altíssimas), o máximo que essa pessoa
receberia seria algo em torno de 4000 tickets (baseado na janela de ticket anterior onde os tickets que custaram ao redor de 30DCR geralmente batem 100 na próxima janela, e o máximo para a janela seguinte é geralmente acima de 300). Então alguém que possua muitos
DCR poderia provavelmente comprar no máximo 2 janelas. A janela em 30 custaria 86.400DCR, a próxima, em 100, custaria 288.000DCR. Então custaria 374.400DCR para comprar 5760 tickets. Considerando o tamanho da pool de 40960 tickets, 374.400 DCR renderia em torno de 14% de todos os tickets.

Now the holder could wait a couple of days for the price to drop then start buying back up again. Except that most of their funds will be locked in the ones they bought earlier (although some will have voted) so their buying power for the new window is greatly reduced. But let's say they have super capital and bought all the decred on all exchanges. So they are able to buy another two windows and replace those tickets that voted and were successful in buying all the tickets (at very high fees and/or prices). Let's say that takes them to about 25% of the tickets.

O tickets para um bloco são escolhidos randomicamente. Para conseguir manipular uma votação, seria necessário ter 3 de cada 5 tickets em um bloco qualquer, ou seja, 60% deles. Mesmo com todo esse gasto de capital,
esse sujeito não chega a ter nem a metade dos tickets que precisaria. E como uma votação não é decidida em um único bloco, seria necessário manipular 60% a 75% dos blocos no período de votação.

E, AINDA ASSIM, você precisa dos mineradores PoW para confirmar os votos. Se eles acharem que alguém está tentando burlar o sistema, eles podem escolher por invalidar blocos.

Então isso é basicamente bem próximo de impossível, mesmo que uma única pessoa tenha uma porcentagem GIGANTESCA de DCR.

But then we come to the stake pools. Stake pools, while not having access to any of their users' funds, do have the ability to change votes on tickets assigned to them. This is why it is suggested that when joining a stake pool, people don't just go for the largest one. Decred is short for 'decentralised credit' so part of the spirit of PoS is ensuring that the PoS stake pools don't get too large in relation to the others. However, even the largest at almost 20% would still only get on average one vote per block.

Decred foi especificamente projetado para minimizar o impacto tanto de grandes pools PoW e PoS, assim como de indivíduos (incluindo os desenvolvedores) que tenham uma grande quantidade de DCR.

## <i class="fa fa-book"></i> Links 

[^1]: [Guia de como comprar tickets pelo Paymetheus](/getting-started/user-guides/using-paymetheus.md#-purchase-tickets-tab)
