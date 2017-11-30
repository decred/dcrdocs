# A Wallet Paymetheus para Windows

Esse guia assume que você já tenha configurado a carteira Paymetheus utilizando [este guia] (paymetheus.md).

---

## Visão geral

A aba Overview oferece um resumo do total de DCR que você possui (tanto liberado quanto bloqueado), número de contas e as transações realizadas, assim como uma listagem
das atividades recentes.

![Overview tab](/img/Paymetheus-overview.png)  

---

## Contas

A aba Contas mostra as contas existentes na sua carteira e permite que você adicione novas.
Contas no Decred funcionam como contas em um banco.
Elas permitem que você mantenha registros sobre seus DCR separadamente. Essa funcionalidade é especialmente útil para que tem empresas e prefere manter contas separadas
para controle de impostos, por exemplo. A trasnferência de DCR entre suas contas vai criar uma transação na blockchain.

![Overview tab](/img/Paymetheus-accounts.png) 

---

## Scripts

Atualmente são utilizados para mineração PoS em uma pool. Na versão 0.8.0
a configuração de scripts foi automatizada. Veja a seção Purchase Tickets abaixo para mais informações.
Serão usados para funções mais avançadas no futuro.

![Scripts tab](/img/Paymetheus-import-script.png)  

---

## Criar transação

É nessa aba que você envia DCR para outro endereço. Basta copiar o endereço
do destinatário na caixa e texto e especificar a quantidade de DCR você deseja enviar.
A taxa estimada será exibida. Você pode clicar no botão '+' para
enviar DCR para vários endereços de uma só vez.

![Create transaction tab](/img/Paymetheus-send.png)

---

## Tela para Compra de Tickets

A Paymetheus pode comprar tickets para mineração Proof of Stake utilizando sua ferramenta de compra de tickets manual. Repare que a Paymetheus é capas apenas de *comprar* tickets, mas não de
realizar votos. Para isso, você precisará configurar uma [solo PoS](/mining/proof-of-stake.md)
o usar uma PoS [stake pool](/mining/proof-of-stake.md#list-of-stakepools).

> Para se juntar a uma pool, forneça o endereço de chave pública que será usado para gerar um
> script de 1-0f-2 multisignature. O script de multisignature será gerado pela
> pool e retornará a você juntamente com um endereço P2SH que lhe dará poder de voto.

Não se preocupe se você você não entender o trecho destacado acima. O que ele quer dizer é que você cria
um endereço que pode ser acessado por duas carteiras. Apenas uma delas precisa estar disponível para utilizar esse endereço. Isso significa que a pool pode votar por você e que você pode votar
usando sua própria Carteira se a pool deixar de funcionar.

Isso NÃO DÁ à pool acesso a seus DCR. A única coisa que você dá à pool é direito de
votar por você. A pool nem encosta nos seus DCR.

As stake pools oficiais estão  [listadas aqui](/mining/proof-of-stake.md#list-of-stakepools).
Todas as stake pools rodam basicamente o mesmo código, mas podem se diferenciar pela quantidade de redundância disponível.
Mais redundância significa menos chance de votos serem perdidos (lembrando que em todas as pools alguns votos serão perdidos
por conta dos mineradores PoW. Algumas vezes eles encontram uma solução para os blocos
tão rapidamente que os votos nem tem tempo de serem propagados pela rede). Para garantir que uma pool
não torne-se grande demais, é recomendado que você junte-se a uma pool menor. Apesar de não poderem fazer nada com seus fundos, uma pool PODE votar diferentemente do que você tenha estabelecido. Mas se uma delas fizesse algo assim, entraria rapidamente em uma lista negra. Evitar que pools cresçam demais torna mais difícil que alguém consiga manipular votos. Distribuir tickets entre várias pools ajuda a rede a manter-se mais descentralizada.

![Creating voting account](/img/Paymetheus-create-voting-account.png)

Aqui há um pouco de informação, então vamos passar por cada uma das opções.

* **Ticket difficulty** - O preço atual de um ticket.
* **Blocks until retarget** - Quando isso atingir a 0, é calculado um novo preço para os tickets.
* **Conta de origem** - Esta é a conta que irá comprar os tickets e receber as recompensas.
* **Tickets para comprar** - O número de tickets para comprar.
* **Taxa por ticket (DCR/kB)** - Tickets são selecionados de acordo com o valor de suas taxas. Se houver alta demanda,
                        você precisará aumentar o valor da taxa para que seus tickets sejam aceitos.
                        Você pode conferir as taxas atuais para tickets [aqui](https://www.dcrstats.com).
* **Split fee (DCR/kB)** - Paymetheus usa uma transação "Split" para evitar bloquear o seu saldo, dividindo o
                       total exato necessário de saldo em sua carteira para o ticket. A Transação "split"
                       precisa ser confirmada pelo menos uma vez antes de poder reutilizar seu saldo. Isso pode bloquear seu
                       saldo durante alguns minutos enquanto esta confirmação ocorre. Sem `split`, você
                       teria que aguardar a confirmação da transação do ticket, o que poderia demorar algumas horas.
                       Isso pode ser deixado em 0.01. Isso não afeta suas chances de comprar tickets ou votar com eles.

* **Validade (blocos)** - Muitas vezes as taxas dos tickets podem subir durante uma janela e você pode não conseguir ter seu ticket selecionado. Configurando uma validade, tickets que não foram minerados até uma determinada altura do bloco serão cancelados para que você possa tentar de novo com taxas mais elevadas, se desejar. Se estiver vazio, eles não expirarão até o final da janela.

* **Configuração da stake pool** - Automatize a configuração com as pools da PoS. Veja abaixo para mais informações.
* **Endereço de votação** - O endereço Decred é o que fará a votação. É somente para mineradores Solo e pool personalizada.
* **Endereço da taxa pool** - Para aqueles que usam uma pool personalizada.
* **Taxas da pool (%)** - Para aqueles que usam uma pool personalizada.

![Purchasing tickets](/img/Paymetheus-ticket-purchasing.png)  

Para configurar faxilmente a compra de tickets para stake pools, clique no botão 'Manage pools'. Se você ainda não tiver
se registrado em uma stake pool (veja como acima), você deverá fazê-lo. Uma vez registrado, faça login, encontre sua API Key a e copie.
Selecione no menu a pool na qual você se registrou. Cole a key na caixa de texto 'API key' e clique em 'Save'.
Você deverá ver um monte de letras e número na caixa de baixo. Clique em 'Close'. Agora você já pode comprar
tickets clicando no botão 'Purchase'!

![Manage stake pools](/img/Paymetheus-manage-stake-pool.png)

NOTA: Apesar de poder comprar tickets por meio do Paymetheus, ele não consegue votar por você, portanto, você deve usar uma pool
ou rodar sua própria carteira para votos, que precisará estar online 24h por dia. Se você preferir fazer sua mineração PoS independentemente,
dê uma olhada no  [Guia de Configuração do dcrd](/getting-started/user-guides/dcrd-setup.md), no [Guia de Configuração do dcrwallet](/getting-started/user-guides/dcrd-setup.md) e no  [Guia de Mineração PoS](/mining/proof-of-stake.md) para mais informações.

---

## Solicitar Pagamento

É aqui que você gera os endereços com os quais receberá seus pagamentos. Basta selecionar a conta para qual quer que os DCR sejam enviados e clicar em Generate Address.
Copie o endereço (é o da linha de cima, o que começa com 'Ds') e compartilhe com outras pessoas.
Endereços Decred podem ser usados quantas vezes você quiser. Mas por questões de privacidade, é melhor
que você gere um endereço para cada transação. No total há algo em torno de 1.4e48 (14 seguido de 47 zeros) endereços disponíveis, então você não precisa ficar preocupado que eles acabem.

![Request Payment](/img/Paymetheus-receive.png)  

---

## Histórico das transações

Nessa aba você pode ver uma lista com todas as transações que foram realizadas e recebidas por você. Um hash de transação pode ser usado no
[block explorer](/getting-started/using-the-block-explorer.md) para consultar mais informações sobre ela.

![Transaction History](/img/Paymetheus-transactions.png)  

---

## Stake Mining

Nessa aba são exibidas estatísticas sobre a rede PoS:

Item                         | Descrição
:-----------------------------:|:------------------------------------------------------------:
Número de tickets live       | A quantidade total de tickets que estão elegíveis para votar pela rede
Número de tickets dentro da mempool | A quantidade total de tickets aguardando para entrar na POS
Dificuldade do ticket            | O custo de um ticket (reembolsado quando o ticket é votado ou expira)
Tickets adquiridos na mempool     | O número de tickets que você possui na mempool
Tickets adquiridos e ativos           | A quantidade de tickets que você possui que já podem exercer voto
Tickets adquiridos e imaturos       | Número de tickets aguardando para amadurecer antes de ser ativo (256 blocks, ~17 hours)
Tickets perdidos               | Os tickets que perderam a votação porque a carteira ou a pool de votação estavam desconectadas ou até mesmo a mineração PoW não foi minerada corretamente.
Tickets revogados              | Tickets que tenham perdido a oportunidade de votar e que tiveram seus valores devolvidos (menos as taxas pelo ticket). Deve ser a mesma quantidade de tickets perdidos.
Tickets votados                | O total de tickets votados por esta carteira desde o inicio.
Total de subsídio recebido         | O total de subsídio em DCR recebido por essa wallet desde o inicio.
