# Mineração Proof-of-Stake (PoS)

Última atualização para v1.0.0

Esse documento tem como intuito ser um recurso educacional para a mineração Proof-of-Stake (staking) da Decred. Ele vai abordar o propósito do protocolo Proof-of-Stake, uma breve introdução ao processo de "staking", o ciclo de vida de um ticket, além de te ajudar nas primeiras compras de tickets. 

---

## Visão geral.

O protocolo exclusivo da mineração Proof-of-Stake da Decred serve para múltiplos propósitos:

Fornecer uma métrica para stakeholders/suporte ao usuário final de quaisquer atualizações de consenso. Isto é, os stakeholders podem votar em propostas específicas/agendas na blockchain da Decred. As agendas podem incluir decisões sobre se a equipe de desenvolvimento deve gastar tempo implementando algum recurso específico, ativando o código de um recurso já enviado para implementação ou tomando outras decisões tais como de que maneira o subsídio dos desenvolvedores deve ser gasto. Mais informações a respeito das votações podem ser encontradas no nosso [Mainnet Voting Guide](/getting-started/user-guides/agenda-voting.md).

A PoS da Decred também fornece um sistema de verificações e harmonia para mineradores não conformes. Os stakeholders podem sinalizar um bloco como inválido se ele não se encaixar nas regras de consenso da rede.

---

## Staking 101

Para participar na mineração proof-of-stake, os stakeholders bloqueiam algumas DCR em troca de um ticket. Cada ticket de sua propriedade garante ao stakeholder a chance de votar uma vez. Após a votação, cada um dos tickets retorna uma pequena recompensa mais o **Ticket Price** original do ticket. Os tickets são escolhidos aleatoriamente para serem votados, dando uma média de 28 dias para votarem, porém podendo precisar de até 142 dias, com uma probabilidade de .5% de expirarem antes de serem escolhidos (essa expiração retorna o **Ticket Price** original sem uma recompensa). Todo bloco minerado deve incluir 5 votos (os mineradores são punidos com uma diminuição na recompensa se menos de 5 votos forem inclusos). Cada bloco minerado também pode incluir até 20 novas aquisições de tickets. Um novo ticket requer 256 blocos para ficar "mature" antes de entrar na **Ticket Pool* e poder ser chamado na votação.   

Há algumas variáveis importantes com as quais você deve se familiarizar ao fazer "staking". 

A cada 144 blocos (~12 horas), o algoritmo de stake difficulty calcula um novo **Ticket Price** em uma tentativa de manter o tamanho da **Ticket Pool** próximo ao tamanho alvo de 40,960 tickets. Essa janela de 144 blocos é tida como a `StakeDiffWindowSize`.

O **Ticket Price**/**Stake Difficulty** é o preço que você deve pagar por um ticket durante um único período de 144 blocos.

O **Ticket Pool** é o número total de tickets na rede Decred.

A **Ticket Fee** (`ticketfee`) é a taxa que deve ser embutida na compra do ticket para incentivar os mineradores Proof-of-Work a incluírem aquele ticket em um novo bloco. **Ticket Fee** geralmente se refere à relação DCR/kB para uma transação de compra de tickets. Portanto, com um tamanho de transação maior, você vai acabar pagando uma fee absoluta mais alta. Por exemplo, compras de tickets solo-staking giram em torno de 300 Bytes, o que quer dizer que uma **Ticket Fee** de .3 DCR/kB irá resultar em um gasto de .1 DCR se, e somente se, aquele ticket for incluído em um bloco.

Quando o **Ticket Price** fica relativamente baixo por uma única **Ticket Window**, você geralmente pode esperar que uma concorrência por taxas se forme, com muitos stakeholders tentando comprar tickets antes que a janela termine. Quando o **Ticket Price** não for um preço extremamente baixo e rentável, a **Ticket Fee** padrão de 0.01 DCR/kB é habitualmente alta o bastante para ser incluída em um bloco. 

Quando um ticket é chamado para votação, a carteira que detém os direitos de voto para aquele ticket deve estar online. Se a carteira não estiver online para dar seu voto, o ticket  será marcado como `missed` e você não receberá nenhum valor por esse ticket. Stakepools são oferecidas como uma solução para aqueles que não tem como deixar online 24/7 uma carteira de votação.

As stakepools permitem que stakeholders gerem transações de compra de tickets que deem à ela direitos de voto sobre seus tickets. Elas votam em seu nome, geralmente requerendo uma pequena taxa por participação (abaixo de 7%) a qual cobre o custo de hospedar um mínimo de 3 servidores, exigidos para rodar uma stakepool. Essa taxa é conhecida como a **Pool Fee** e somente é retirada da pequena recompensa PoS. Uma lista de stakepools pode ser encontrada [abaixo](#list-of-stakepools).    

---

## Ciclo de vida do Ticket

Comprar um ticket para PoS é bem simples (veja abaixo) mas o que acontece com ele depois que você o compra?
Um ticket na main net (a test net usa parâmetros diferentes) passará por algumas etapas durante seu tempo de vida:

1. Você compra um ticket usando uma carteira Paymetheus <!--, Decrediton,--> ou uma carteira dcrwallet. O custo total de cada uma das transações de tickets será composto por **Ticket Price** + **Ticket Fee**(`ticketfee`). 
2. Seus tickets entram na `mempool`, ou pool de memória. É aqui que seu ticket aguarda para ser minerado pelos mineradores PoW. Apenas 20 novos tickets são minerados em cada bloco.
3. Os tickets são minerados para um bloco com as transações de **Ticket Fee** mais altas, as quais tem maior prioridade. Note que a **Ticket Fee** é a quantidade de DCR por KB de transação. Alguns tamanhos comuns de transações são 298 Bytes (uma compra solo de tickets) e 539 Bytes (uma compra de tickets através de uma pool). 
4. **A -** Se seu ticket for minerado em um bloco, ele fica "immature". Essa fase dura por 256 blocos (cerca de 20 horas). Durante esse período o ticket não pode ser votado. Nesse estágio, a ticket fee não é reembolsável. <br /> 
**B -** Se seu ticket não for minerado, tanto o **Ticket Price** como a **Ticket Fee** são devolvidas à conta compradora.
5. Depois que seu ticket ficar "mature" (256 blocos), ele entra na **Ticket Pool** e fica elegível para votação. 
6. A probabilidade de um ticket ser votado é baseada em uma distribuição de Poisson com média de 28 dias. Passados 28 dias, um ticket tem 50% de chances de já ter sido votado.
7. Dado um tamanho alvo para a pool size de 40960 tickets, qualquer ticket tem 99,5% de probabilidade de ser votado dentro de ~142 dias (cerca de 4.7 meses). Se, após esse tempo, um ticket não for votado, ele expira. Você recebe um reembolso no **Ticket Price** original. 
8. Um ticket pode perder sua chamada para votação se a carteira não responder ou se dois blocos válidos forem encontrados nas proximidades um do outro. Se isso acontecer, você recebe um reembolso no **Ticket Price** original.
9. Depois que um ticket for votado, perdido, ou expirado, os fundos (preço do ticket e subsídios se aplicável, menos a fee) irão entrar em estado "immature" e ficar assim por mais 256 blocos, depois dos quais são liberados. Se um ticket for perdido ou expirado, uma transação de revogação é enviada pela carteira, que então libera as saídas do ticket bloqueado. **NOTA:** Revogações só podem ser submetidas para um ticket perdido correspondente. Não se pode revogar um ticket até que ele fique como perdido.

---

## Como participar

Uma carteira que esteja aberta e desbloqueada 24/7 é *altamente recomendável* para fazer "staking". Qualquer perda no tempo de operação pode resultar em perdas de votos e recompensas. Stakepools estão disponíveis para aqueles que não conseguem manter sempre online uma carteira pessoal de votações. 

O único requisito para fazer "staking" é comprar um ticket. A seguir você encontra guias para compra de tickets usando [Paymetheus](#paymetheus) e [dcrwallet](#dcrwallet).

Se você pretende usar uma stakepool, deve primeiro criar conta em uma. Links para stakepools oficialmente reconhecidas são fornecidos [aqui](#list-of-stakepools).

---

## Paymetheus

A aplicação Paymetheus não consegue votar por si só, o que significa que os direitos de votação devem ser designados à uma stakepool. 

Por favor veja o [Purchase Tickets tab guide](/getting-started/user-guides/using-paymetheus.md#purchase-tickets-tab) para Paymetheus e saiba como comprar tickets usando a Paymetheus e uma stakepool.

---

## dcrwallet

O guia para [Compra tickets com dcrwallet] dcrwallet](/getting-started/user-guides/dcrwallet-tickets.md) irá mostrar-lhe como comprar bilhetes manualmente e automaticamente para pool ou solo estacando.

---

## <i class="fa fa-life-ring"></i>Lista de Stakepools 

Estas stakepools são oficialmente reconhecidas:

* [<i class="fa fa-external-link-square"></i>https://dcr.stakepool.net ](https://dcr.stakepool.net)
* [<i class="fa fa-external-link-square"></i> https://dcr.stakeminer.com](https://dcr.stakeminer.com)
* [<i class="fa fa-external-link-square"></i> https://pool.d3c.red](https://pool.d3c.red)
* [<i class="fa fa-external-link-square"></i> https://stakepool.dcrstats.com](https://stakepool.dcrstats.com)
* [<i class="fa fa-external-link-square"></i>https://stake.decredbrasil.com ](https://stake.decredbrasil.com)
* [<i class="fa fa-external-link-square"></i>https://stakepool.eu ](https://stakepool.eu)
* [<i class="fa fa-external-link-square"></i>https://dcr.ubiqsmart.com ](https://dcr.ubiqsmart.com)
* [<i class="fa fa-external-link-square"></i> https://ultrapool.eu](https://ultrapool.eu)

Você pode encontrar uma comparação das taxas e estatísticas de cada pool visitando o
[<i class="fa fa-external-link-square"></i> Decred website](https://decred.org)
e clicando no link 'Stakepools' dentro do rodapé na parte inferior da página.

---

<!-- TODO: **Comprar Tickets com Decrediton** -->

## Informação Adicional

[Guia de votação da Mainnet](/getting-started/user-guides/agenda-voting.md)

[Comandos Proof-of-Stake](/advanced/program-options.md#pos-commands)

[FAQ Geral - Proof-of-Stake](/faq/proof-of-stake/general.md)

[FAQ Proof-of-Stake - Comprando de Tickets e Taxas](/faq/proof-of-stake/buying-tickets-and-fees.md)

[FAQ Proof-of-Stake  - Mineração Solo](/faq/proof-of-stake/solo-mining.md)

[FAQ Proof-of-Stake - Stake Pools](/faq/proof-of-stake/stake-pools.md)

[FAQ Proof-of-Stake - Ticket de Votação](/faq/proof-of-stake/voting-tickets.md)

[Parâmetros de Mineração Proof-of-Stake](/advanced/program-options.md#pos-network-parameters)
