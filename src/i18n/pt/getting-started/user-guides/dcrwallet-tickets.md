# Buying Tickets With dcrwallet

Última atualização para v1.0.0

Esse guia é direcionado para auxiliar a compra de tickets usando a `dcrwallet`. Ele abrangerá tanto compras manuais de tickets como compras de tickets automáticas para solo-voting, bem como configurações de stakepool-voting.

**Pré-requisitos:**

-   Use a mais recente [dcrinstall](/getting-started/user-guides/cli-installation.md) para instalar `dcrd`, `dcrwallet,` e `dcrctl`. Serão solicitados passos adicionais se outro método de instalação foi usado.
-   Review how the launch commands for the Command Prompt (Windows) and Bash (macOS/Linux) shells differ [here](/getting-started/cli-differences.md).
-   [Instalar o dcrd](/getting-started/user-guides/dcrd-setup.md) e executá-lo em segundo plano.
-   [Configure o dcrwallet] (/getting-started/user-guides/dcrwallet-setup.md) e execute-o em segundo plano.
-   Familiarize-se com os [princípios básicos de uso do dcrctl](/getting-started/user-guides/dcrctl-basics.md).
-   Familiarize-se com o [processo POS](/mining/proof-of-stake.md#staking-101) e o [ciclo de vida do ticket](/mining/proof-of-stake.md#ticket-lifecycle)

This guide assumes you have set up `dcrd` and `dcrwallet` using configuration files. If you used `dcrinstall`, you have configuration files already. Using configuration files is highly recommended - it makes for an easier time issuing commands to `dcrwallet` and `dcrd` through `dcrctl`. A guide for minimum configuration (saving your RPC username and RPC password) can be found [here](/advanced/manual-cli-install.md#minimum-configuration).

NOTE: `dcrwallet.conf` is split into two sections labeled `[Application Options]` and `[Ticket Buyer Options]`. Any setting prefixed by 'ticketbuyer.' must be placed within the lower `[Ticket Buyer Options]` section. All other settings go within `[Application Options]`.

---

## Decisions

Algumas decisões devem ser tomadas antes que você prossiga nesse guia. Primeiramente, você usará uma stakepool para delegar os poderes de voto dos seus tickets? Além disso, você comprará tickets manualmente ou pela função ticketbuyer?

A compra de um ticket permite ao stakeholder delegar seus poderes de voto a uma stakepool. Essas stakepools ficam online o tempo todo (24h por dia) e muito raramente perdem um voto. Como elas utilizam transações multi-sig, não conseguem ter acesso a seus DCR. A desvantagem é que a maioria delas recolhe uma pequena porcentagem da sua recompensa por voto em forma de taxas da pool. Tickets delegados a stakepools também exigem uma transação maior (~540 Bytes contra ~300 Bytes de ticket de voto independente) para compras, o que acaba fazendo com que pague-se uma taxa ligeiramente maior por ticket, já que essas taxas são calculadas de acordo com a quantidade de DCR/kB.

Para poder votar independentemente, precisa manter uma carteira para votos deslbloqueada o tempo todo (24h por dia), ou corre o risco de perder votos e, consequentemente, a recompensa pelo voto. Você não precisa pagar taxas para pools e seu ticket tem mais chance de ser minerado por uma quantidade menor de taxas totais (devido à preferência que mineradores dão a tickets que ofereçam maior razão DCR/kB. Tickets independentes possuem um tamanho TXN menor).

A escolha pela compra de tickets manualmente ou pela compra automatizada pelo ticketbuyer é estritamente guiada pela preferência pessoal de cada um. Os benefícios da automação aplicam-se ao tickebuyer, mas muitas pessoas podem ficar incomodadas com a quantidade de variáveis que podem ser configuradas. Além disso, o cálculo da taxa do ticketbuyer nem sempre representa a maior economia possível para o stakeholder.  Algumas pessoas preferem comprar tickets manualmente a cada poucos dias procurando pagar as menores taxas. Ambos os métodos apenas realizam compras de tickets quando sua carteira está desbloqueada.

---

## Solo-voting 

LEMBRETE: Voto independente com uma carteira que não esteja online 24h por dia pode resultar em votos perdidos, assim como suas devidas recompensas.

Para votar independentemente, você só precisa habilitar a opção enablevoting quando incializar a `dcrwallet`, desbloquear a carteira com sua senha pessoal e comprar tickets. Estando enablevoting habilitado e `dcrwallet` desbloqueada, sua carteira irá cuidar dos votos automaticamente.

Para configurar sua `dcrwallet` para votar independentemente, adicione a seguinte linha ao seu arquivo `dcrwallet.conf` na seção `[Application Options]`:

enablevoting=1

Uma vez que tenha reiniciado com aquela linha no arquivo `dcrwallet.conf`, sua carteira estará configurada para realizar votos independentemente evocê poderá começar a [comprar tickets](#ticket-purchasing).

---

## Stakepool-voting 

Para permitir que uma stakepool vote por você, primeiro você precisa se cadastrar em uma. Uma lista delas pode ser encontrada [aqui](/mining/proof-of-stake.md#list-of-stakepools). Após se cadastrar, você vai receber orientações para criar um novo endereço P2SH e importar seu script de voto multi-sig. Uma breve explicação é fornecida aqui:

1.  Com sua carteira aberta, execute o comando `dcrctl --wallet getnewaddress` para receber um novo endereço.
2.  Utilizando esse endereço, execute o comando `dcrctl --wallet validateaddress <address from step 1>`. Isso deverá retornar um objeto JSON que será exibido dessa forma:

```
{
  "isvalid": true,
  "address": "DsExampleAddr1For2Demo3PurposesOnly",
  "ismine": true,
  "pubkeyaddr": "DkExample0Addr1For2Demo4Purposes5Only6Do7Not8Use9Pls0",
  "pubkey": "022801337beefc0ffee1dab8d4ffa898a782466c9a1fc00ca8863de5438dc07dcc",
  "iscompressed": true,
  "account": "voting"
}
```

3.  Copie o `pubkeyaddr` no formuário de "Inserir Endereço" da stakepool e clique no botão de enviar. A página deverá redirecioná-lo para a página de tickets, onde você encontrará mais instruções.
4.  No topo da página de tickets, você deverá ver uma seção chamada "Informações sobre Tickets". Copie seu "Redeem Script" e utilize-o ao executar o comando  `dcrctl --wallet importscript <Insert Redeem Script Here>`.

Tendo configurado seu script de multi-sig e importado sua carteira, você já pode começar a [comprar tickets](#ticket-purchasing).

---

## Ticket Purchasing

Tanto a compra  manual de tickets quanto a automatizada exigem que sua carteira esteja desbloqueada por meio do comando `dcrctl --wallet walletpassphrase <private passphrase> <time limit>`.

Tem três coisas que você provavelmente vai querer entender antes de comprar tickets: o comando `purchaseticket`, quando/por quê um `ticketfee` é imoprtante e o significado de `ticket price`.

Comando > purchaseticket 

O comando `purchaseticket` será usado para comprar tickets tanto manuais ou automáticos. Olhemos com mais atenção aos comandos e seus argumentos:

```
purchaseticket "fromaccount" spendlimit (minconf=1 "ticketaddress" numtickets "pooladdress" poolfees expiry "comment")
```

1.  `fromaccount` = String Necessária: A conta da qual comprar tickets (por exemplo, "default").
2.  `spendlimit`     =  Número Necessário: Limite do valor a ser gasto com tickets (por exmeplo, 50).
3.  `minconf`        =  Número Opcional: Número mínimo de confirmações de blocos (por exemplo, 1).
4.  `ticketaddress`  =  String Opcional: O endereço do ticker para o qual os direitos de voto são delegados
5.  `numtickets`     =  Número Opcional: A quantidade de tickets a serem comprados de uma vez (por exemplo, 1)
6.  `pooladdress`    =  String Opcional: O endereço para o qual enviar as taxas da pool
7.  `poolfees`       =  Número Opcional: A porcentagem de taxas pagas à stake pool (por exemplo, 5)
8.  `expiry`         =  Número Opcional: A altura do bloco no qual tickets que não tenham sido minerados expirarão da mempool, sendo devolvidos os DCR nele investidos para a sua "fromaccount". Se esta opção foi deixada em branco, os tickets na mempool expirarão apenas quando o preço do ticket mudar.
9.  `comment`        =  Optional String: This argument is unused and has no significance.

> Ticket Fees

Seu `ticketfee` é a taxa DCR/kB que você paga pela inclusão de um ticket em um bloco por um minerador. Você vai reparar que o comando `purchaseticket` acima não inclui um argumento `ticketfee`. O argumento `ticketfee` pode ser configurado de duas maneiras.

1.  Você pode adicionar `ticketfee=<fee rate>` às `[Application Options]` do seu arquivo `dcrwallet.conf`. A opção será ativada no momento da inicialização.
2.  Quando sua carteira estiver sendo executada, você pode usar o comando `dcrctl --wallet setticketfee <fee rate>`. Essa não é uma configuração permanente e a taxa será estabelecida pelo default de 0.01 DCR toda vez que sua carteira for inicializada, a menos que você inclua essa opção no seu qruivo `dcrwallet.conf`.

Por que ticketfees são importantes? Geralmente o valor default da taxa de 0.01 é suficiente para que seus tickets sejam minerados. A excessão seria durante uma eventual guerra de taxas. Quando o preço da taxa do ticket cai muito, a demanda sobe além da oferta (existe apenas uma quantidade máxima de 2880 tickets disponíveis a cada intervalo de preço). Isso gera uma guerra de taxas, com stakeholders competindo para ter seus tickets minerados antes que os preços mudem.

Tendo essas duas coisas em mente, prossigamos à duas formas de comprar tickets.

> Ticket Price

Para verificar o preço atual do ticket, execute o comando `dcrctl --wallet getstakeinfo` e procure pelo valor `difficulty`. Este é o preço de cada ticket na atual janela de preços. Você talvez queira configurar o argumento `spendlimit` no comando `purchaseticket` para ser maior que esse valor de `difficulty` ao comprar tickets manualmente.

---

### Manual Ticket Purchase

Before manually purchasing tickets, it is recommended to check for a ticketfee war and adjust your ticketfee before purchase by issuing the `dcrctl --wallet setticketfee <fee rate>` command. Third party sites such as [https://dcrstats.com](https://dcrstats.com) and [https://posmaster.info](http://posmaster.info) can be used to find the average ticketfee in the mempool, although you may oftentimes be able to purchase a ticket with a ticketfee lower than the average.

> Solo Tickets

Para comprar tickets usados em staking independente, você só precisa especificar os argumentos `fromaccount` e `spendlimit` quando utilizar o comando `purchaseticket`. Por exemplo, `dcrctl --wallet purchaseticket "default" 50` utilizaria DCR da sua conta `default` para comprar um ticket se o preço atual do ticket fosse no máximo 50 DCR.

Se você desejar especificar os argumentos `numtickets` ou `expiry`, você deveria especificar uma `minconf` de 1, um `ticketaddress` vazio (""), um `pooladdress` vazio ("") e um `poolfees` vazio (0). Dois exemplos a seguir:

-  `dcrctl --wallet purchaseticket "default" 50 1 "" 5` compraria 5 tickets, já que o quinto argumento (`numtickets`) foi configurado como 5.
-  `dcrctl --wallet purchaseticket "default" 50 1 "" 5 "" 0 100000` compraria 5 tickets expirariam na mempool se não fossem minerados antes do bloco 100,000, já que o 8º argumento (`expiry`) foi configurado como 100000.

Certifique-se de verificar se há alguma guerra de taxas acontecendo e ajuste seu ticketfee antes de realizar uma compra utilizando o comando `dcrctl --wallet setticketfee <fee rate>`.

> Pool Tickets

Para comprar tickets e delegar seus poderes de voto a uma stakepool, é necessário utilizar o comando `purchaseticket` completo.

-  Seu `ticketaddress` é o endereço P2SH encontrado no topo da página de "Tickets" da sua stakepoll, sob a seção "Informações sobre Tickets".
-  Seu `pooladdress` é o endereço para o qual as taxas da pool são enviadas. Isto pode ser encontrado na seção "Instruções sobre Tickets" da página "Tickets da sua stakepool".
-  Your `poolfees` is the percentage of the stake reward that will go to the `pooladdress` when a ticket votes. It is important to match your pool's advertised fee.

A quick example:

`dcrctl --wallet purchaseticket "default" 23 1 DcExampleAddr1For2Demo3PurposesOnly 1 DsExampleAddr1For2Demo3PurposesOnly 7.5` usaria DCR da sua conta `default` para comprar 1 ticket se o preço do ticket fosse no máximo 23 DCR. O endereço P2SH recebido da stakepool é `DcExampleAddr1For2Demo3PurposesOnly` e seu endereço de taxas é `DsExampleAddr1For2Demo3PurposesOnly`. Eles coletarão 7.5% de taxas se esse ticket efetivamente votar. Esse ticket não expirará da mempool até que o preço mude, já que apenas 7 argumentos foram especificados (não foi especificado `expiry`).

---

#### Configuração do Ticketbuyer

To set up your `dcrwallet` to enable its built-in `ticketbuyer` feature, add the following line to your `dcrwallet.conf` config file in the `[Application Options]` section:

  enableticketbuyer=1

Se você está utilizando uma stakepool, você deve também adicionar as seguintes linhas (tudo isso pode ser encontrado na página "Tickets" da sua stakepool):

    ticketaddress=<P2SH Address shared with Stakepool>
    pooladdress=<Stakepool's Fee Collection Address>
    poolfees=<Stakepool's Required Reward Fee>

With this configuration `ticketbuyer` will start running with it's default settings. You may want to modify the `ticketbuyer` configuration to tweak its behaviour - the full set of configuration options and their default values can be found in the chart [below](#full-ticketbuyer-options).

With `ticketbuyer` running and your wallet unlocked, you can watch your `dcrwallet` console to see whether or not tickets are being purchased. It will even display an explanation if tickets weren't purchased.

---

## Full Ticketbuyer Options

We recommended you read
and understand the options available before using the feature as you may set your fees and ticket
prices higher than desired.

All of these options can be specified on the command line or in dcrwallet.conf in the `[Ticket Buyer Options]` section. Note that at
this time there is no way to change settings while dcrwallet is running: you will need to restart it to
adjust your settings.

Parameter|Description|Default|Explanation
:----------:|:---------------------------:|:----------:|:---------------------------:
ticketbuyer.avgpricemode|The mode to use for calculating the average price if pricetarget is disabled (vwap, pool, dual) |vwap|!
ticketbuyer.avgpricevwapdelta|The number of blocks to use from the current block to calculate the VWAP |2880|!
ticketbuyer.maxfee|Maximum ticket fee per KB |0.1 DCR|Tickets are entered into the mempool in order of their fee per kilobyte. This sets the maximum fee you are willing to pay.
ticketbuyer.minfee|Minimum ticket fee per KB |0.01 DCR|The minimum fee per kilobyte you are willing to pay. This should probably be left at 0.01 unless you know what you're doing.
ticketbuyer.feesource|The fee source to use for ticket fee per KB (median or mean) |median|The fee chosen by the ticket buyer will be based off either the median (line all the fees up in order and choose the middle one) or the mean (also known as the average; add all the fees up and divide by 2). It's recommended to leave this at median as there have been instances of fee manipulation where people try to force up the average by buying one ticket with a very high fee.
ticketbuyer.maxperblock|Maximum tickets per block, with negative numbers indicating buy one ticket every 1-in-n blocks |5|Do not buy more than this number of tickets per block. A negative number means buy one ticket every n blocks. e.g. -2 would mean buy a ticket every second block.
ticketbuyer.blockstoavg|Number of blocks to average for fees calculation |11| Fees are calculated using this many previous blocks. You can usually leave this at the default.
ticketbuyer.feetargetscaling|Scaling factor for setting the ticket fee, multiplies by the average fee |1|The average fee is multiplied by this number to give the fee to pay. DO NOT change this until you really know what you're doing. It could raise your fees very high. Remember, fees are non-refundable!
ticketbuyer.dontwaitfortickets|Don't wait until your last round of tickets have entered the blockchain to attempt to purchase more| |By default, the ticket buyer will not buy more tickets until all the previous ones purchased have been entered into the blockchain. You can set this to purchase more even if some are still in the mempool.
ticketbuyer.nospreadticketpurchases|Do not spread ticket purchases evenly throughout the window| | By default `ticketbuyer` spreads out the purchase of tickets which may result in more favourable fees. This setting tells `ticketbuyer` to purchase all tickets at once.
ticketbuyer.maxinmempool|The maximum number of your tickets allowed in mempool before purchasing more tickets |40|If you have this many tickets in the mempool, the ticket buyer will not buy more until some are accepted into the blockchain.
ticketbuyer.expirydelta|Number of blocks in the future before the ticket expires |16|You can set an expiry so that if your tickets are not accepted into the blockchain due to high fees, they will cancel and you can try again by raising your fees.
ticketbuyer.maxpriceabsolute|Maximum absolute price to purchase a ticket |0 DCR| If the ticket price is above this value, you will not buy more tickets. The default of 0 turns this off.
ticketbuyer.maxpricerelative|Scaling factor for setting the maximum price, multiplies by the average price |1.25|If the current window price is significantly higher than the last few windows, do not buy any tickets. E.g. With the default value of 1.25, if the average price of the last few windows is 50DCR, you won't buy any tickets if the current window is over 75DCR.
ticketbuyer.balancetomaintainabsolute|Amount of funds to keep in wallet when stake mining |0 DCR| If your balance is lower than this number, you will not buy tickets. The default of 0 will use all the funds in your account to buy tickets.
ticketbuyer.balancetomaintainrelative|Proportion of funds to leave in wallet when stake mining |0.3|Similar to the last one, except it's based on a percentage of your total funds.

---
