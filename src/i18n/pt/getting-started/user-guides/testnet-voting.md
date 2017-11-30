# Guia do Hard Fork Voting na Testnet

Este guia foi atualizado pela última vez para v1.0.1

O mecanismo de hard-fork foi implementado na Testnet do Decred na versão v0.8.0 em 13 de fevereiro de 2017. O voto de teste deve começar no dia 25 de fevereiro de 2017 por volta das 15h GMT–3 e deve durar 7 dias. Se você quiser participar, tutoriais para utilização do Paymetheus e das aplicação em linha-de-comando podem ser encontrados aqui.

---

## Introdução

Existe um processo de duas fases para votação implementar as mudanças de consenso, que criam um Hard Fork. Nota: os seguintes intervalos dos bloco são para testnet, eles serão diferentes para mainnet.

O primeiro passo é atingir o mínimo de upgrades na rede. Depois que o código do hard fork for liberado, a maioria dos nodes da rede participando em PoW/PoS precisam atualizar antes que a votação tenha início. Para Proof-of-Work, pelo menos 75% dos últimos 100 blocos devem ter a versão mais recente do bloco. Para Proof-of-Stake, pelo menos 75% dos votos exercidos dentro do intervalo de 2016 blocos precisam ter a versão mais recente de voto.

O segundo passo desse processo é a votação em si. O último intervalo de 2016 blocos está em algum lugar dentro do intervalo maior de 5040 blocos e a rede deve esperar que esse intervalo maior termine. Por conta da diferença do tamanho dos intervalos, *pode ser* que demore mais 5040 blocos até que a janela de votação seja aberta. Depois disso, um intervalo estático de 5040 é o tempo para que as mudanças propostas sejam implementadas caso pelo menos 75% dos votos sinalizem "sim". A implementação total acontece após mais 1 bloco (para dar chance a todos os nodes atualizarem para que não sejam forked para fora da blockchain). Você confere abaixo um gráfico somplificado que explica cada intervalo de blocos na ordem em que acontecem.

Descrição do Intervalo | Tipo de Intervalo | Número de blocos
---------------------|-------------|---------------
O mínimo de 75% dos blocos devem ser da versão mais nova | Rolling | 100
O mínimo de 75% dos votos devem ser da versão mais nova | Estático | 2016
Intervalo conhecido após os requisitos de atualização | Estático | Até 5040
Intervalo real de votação - 75% dos votos devem sinalizar um "sim" para avançar | Estático | 5040
Intervalo de pré-implementação se o voto avançar | Estático | 5040

Se uma proposta não atingir pelo menos 10% de votos 'sim' ou 'não', os stakeholders poderão votar nela novamente durante o próximo intervalo de votação, até que o mínimo seja atingido ou que a proposta expire.

Abaixo estão instruções para participar da votação de demonstração na Testnet usando uma stakepool com Paymehteus e/ou as aplicações de linha-de-comando `dcrd`, `dcrwallet`, and `dcrctl`. A aplicação de linha-de-comando utiliza arquivos de configuração para passar parâmetros no momento da inicialização. Flags também podem ser usadas ao inicializar uma aplicação, mas isso não será tratado nesse documento.

## Paymetheus

> Passo 1: Baixe e instale a Paymetheus

If you haven't already updated your Decred binaries to v1.1.0, visit the [Installation Guide](/getting-started/user-guides/paymetheus.md) and follow the directions for the Windows Installer.

> Passo 2: Execute o Decred Testnet

No menu, abra `Decred Testnet`. Isso irá abrir o `Paymetheus`. Uma nova interface de linha-de-comando será aberta e executará `dcrd.exe`. Se for a primeira execução do daemon da testnet, levará algum tempo para que a blockchain dela seja sincronizada.

Na janela `Paymetheus`, você será apresentado à opção "Conectar ao dcrd". Mantenha as configurações default e clique no botão continuar. Na próxima tela haverá dois botões, "Criar uma nova carteira" e "Restaurar uma carteira a partir da seed". Este tutorial parte do princípio de que você ainda não tem uma seed para restaurar.

Após clicar em "Criar nova Carteira", você verá informações sobre sua a seed da sua nova carteira. Anote sua seed, guarde-a em um lugar seguro e nunca mostre ela a ninguém. Você precisará informá-la aqui assim que clicar no botão CONTINUAR.

Após digitar sua seed, você verá a tela Encriptar Carteira. Escolha uma senha privada. Clique em ENCRIPTAR. O Paymetheus irá então criar sua carteira. Uma vez criada, ela será exibida na página de visão geral da sua carteira.

> Passo 3: Cadastre-se no site da Stakepool

Enquanto espera seu node/wallet sincronizadar, visite visit [https://teststakepool.decred.org](https://teststakepool.decred.org) e registre-se uma nova conta.

> Passo 4: Obter Moedas na Testnet

Em seguida, você precisará adquirir DCR na Testnet para poder comprar tickets nela. Existe uma faucet oficial da Testnet em [https://faucet.decred.org](https://faucet.decred.org). Para obter um novo endereço para o Paymetheus, clique na aba "Requisitar Pagamento" no menu. Ao clicar no botão "GERAR ENDEREÇO", um endereço começado por `Ts` será criado. Copie e cole esse endereço na faucet e você deverá receber seus DCR.

> Passo 5: Comprar tickets na Testnet

Clique na aba "Comprar Tickets" no menu do Paymetheus. Você verá um formulário com 7 campos. Todas as configurações padrão podem ser usadas para comprar tickets, **exceto** a opção "Configuração de stakepool". Clique no botão "Gerenciar pools". Você precisará informar a API key da sua conta na stakepool da testnet. Para obter essa key, vá em [https://teststakepool.decred.org/settings](https://teststakepool.decred.org/settings) - seu API Token deverá ser o primeiro ítem na página. Insira-o no campo API key no Paymetheus e clique em Salvar. Seu script 1-of-2 multi-sig será automaticamente gerado e você pode clicar em Fechar.

Em seguida, selecione  teststakepool.decred.org no menu drop down nas configurações de Stakepool e clique no botão Comprar para adquirir tickets! Nota: ticket difficulty é o preço do ticket, então certifique-se de que você tem DCR suficiente para comprar ao menos 1.

> Passo 6: Defina os Votebits dos seus tickets via Stakepool

Ao usar uma stakepool, os tickets que você compra têm seus direitos de voto delegados à stakepool. Por padrão a pool votará da forma que preferir com seus tickets. Claro que você pode definir o voto dos seus tickets.

Você pode configurar os votebits dos seus tickets pela interface da stakepool. Abaixo você pode ver uma screenshot da [https://teststakepool.decred.org/tickets](https://teststakepool.decred.org/tickets) página. Na parte inferior da seção "Live/Immature" dessa página, você verá as configurações de votebits. Você pode configurar os votebits de *todos* os seus tickets de uma só vez utilizando a interface da stakepool. Os tickets exibidos abaixo foram configurador como "Sim" para "Bloco Anterior Válido?" e "Sim" para "Aumentar o Tamanho do Bloco de 1.0 MiB para 1.25MB", o que resultou em um Votebit de valor 5.

<img src="/img/testnet-voting_votebit-setting.jpg">

Para saber mais informações básicas sobre Votebits, visite [Explicação de Votebits](#an-explanation-of-votebits).

## Instruções de Linha de Comando

> Passo 1: Baixe e instale a Decred

If you haven't already updated your Decred binaries to v1.1.0, visit the [Installation Guide](/getting-started/user-guides/cli-installation.md) and follow the directions for your operating system.

> Passo 2: Crie os arquivos de configuração

Se você já esta familiarizado os arquivos `.conf`, continue no passo 3.

Por favor, veja nossa [Introdução aos Arquivos de Configuração](/getting-started/startup-basics.md#configuration-files) e crie novos arquivos de configuração ou copie os modelos nas pastas especificadas para seu sistema operacional.

> Passo 3: Edite os arquivos de configuração para iniciar na Testnet

Para rodar `dcrd`, `dcrwallet` e `dcrctl` na tetnet, basta adicionar `testnet=true` ou `testnet=1` aos três arquivos de configuração. Se você está usando um dos arquivos de modelo, pode simplesmente deletar o ponto-e-vírgula da linha `;testnet=1` (é a primeira configuração dentro da seção Network Settings).

Isso deve ser feito para todos os três arquivos de configuração.

> Passo 4: Crie uma nova carteira na Testnett

Se você nunca executou uma carteira Testnet antes, você precisará criar uma nova. Com a instalação do `dcrwallet.conf` para testnet** (veja o passo 3) **, execute `dcrwallet` com o flag `--create`.

Para aqueles que não estão familiarizados de como fazer isso, siga o guia específico do sistema operacional abaixo:

**Windows**: <br />
    1. Usando o prompt de comando ou o File Explorer, navegue até o seu diretório do executável `dcrwallet` <br />
    2. Se estiver usando o File Explorer, selecione a opção "Abrir prompt de comando" no menu suspenso do "File" <br />
    3. Digite o comando `dcrwallet.exe --create`

**macOS**: <br />
    1. Usando o Terminal ou Finder, navegue até o seu diretório do executável `dcrwallet`<br />
    2. Se estiver usando o Finder, você pode abrir um novo Terminal em uma localização de pasta clicando com o botão direito do mouse em uma pasta e selecionando Serviços > Novo janela Terminal no menu suspenso<br />
    3. Digite o comando `./dcrwallet --create`

**Linux**: <br />
    1. Usando o que desejar, navegue até o diretório do executável `dcrwallet` <br />
    2. Entre com o comando `./dcrwallet --create`

Isto guiará você pelo processo de criar uma nova carteira. Siga as instruções na tela. Será pedido que você crie uma senha pessoal (você usará ela mais tarde para desbloquear sua carteira ao criar transações). A camada adicional de criptografia é absolutamente opcional. Sua seed pode ser usada para restaurar suas carteira em qualquer outro computador utilizando dcrwallet. Anote sua seed, guarde-a em um lugar seguro e nunca mostre-a a ninguém. A carteira será fechada e o precesso terá terminado.

> Passo 5: Inicie o dcrd na Testnet

Execute o executável `dcrd` com a opção de `testnet=1` ou `testnet=true` dentro do arquivo de configuração para iniciar seu node no testnet. Seu node começará a sincronizar com o resto da rede. A sincronização demorará um tempo.

> Passo 6: Inicie o dcrwallet na Testnet

Execute `dcrwallet` com as opções `testnet=1` ou `testnet=true` definidas no arquivo de configuração para iniciar sua carteira na testnet. Sua carteira irá se conectar ao seu node e começará a sincronizar seus endereços. A sincronização pode demorar um pouco.

> Passo 7: Cadastre-se no site da Stakepool

Enquanto espera que seu node / sua carteira carregue, visite [https://teststakepool.decred.org](https://teststakepool.decred.org) e cadastre-se. Prossiga para o passo 8.

> Passo 8: Aguarde o Node/Wallet para a Testnet sincronizar

Faça uma pausa, isso pode demorar um pouco.

> Passo 9: Crie um endereço de chave pública para usar a Stakepool

O primeiro passo para usar uma sakepool é gerar um novo endereço de chave pública. Ele será usado para gerar o script de 1-of-2 multisignature. Siga as instruções em [https://teststakepool.decred.org/address](https://teststakepool.decred.org/address) para gerar e salvar esse endereço. O processo é o mesmo para criar uma conta em uma stakepool da mainnet.

> Passo 10: Importe o seu script P2SH Multi-Sig da Stakepool

Em seguida, você precisará importar um script que permitirá que você delegue os poderes de voto dos seus tickets a stakepools. Depois de ter completado o passo anterior, esse script deverá estar disponível em [https://teststakepool.decred.org/tickets](https://teststakepool.decred.org/tickets). Siga as instruções de lá novamente para importar o script. O processo é o mesmo se você criou uma conta em uma stakepool na mainnet.

> Passo 11: Obter Moedas na Testnet

Em seguida você precisará adquirir DCR na Testnet para poder comprar tickets nela. Existe uma faucet oficial da Testnet em [https://faucet.decred.org](https://faucet.decred.org). Informe um endereço da Testnet (você pode obter um executando o comando `getnewaddress` - exemplos para cada sistema operacional abaixo).

    Windows: dcrctl.exe --wallet getnewaddress
    macOS/Linux: ./dcrctl --wallet getnewaddress

> Passo 12: Compre tickets na Testnet

[https://teststakepool.decred.org/tickets](https://teststakepool.decred.org/tickets) descreve três maneiras para comprar tickets. Sua melhor opção é usar a compra manual, para que você possa comprar tickets sempre que precisar.

Emita um comando `dcrctl --wallet getstakeinfo` para ver a atual dificuldade. Este é o preço atual do ticket. Ajuste o comando purchaseticket conforme exibido na página da stakepool para adpatar o preço atual do ticket. 

> Passo 13: Aguarde para a votação começar 

Principal, um mínimo de 75% de TODOS os votos emitidos nos últimos 2016 blocos devem ser de um node continuo do último Decred software. Então, um intervalo de blocos de 5040 blocos devem passar antes do início da votação. Verifique[https://hardforkdemo.decred.org](https://hardforkdemo.decred.org) para obter o ultimo status de todo o processo de votação.

> Passo 14: Defina os Votebits dos seus tickets via Stakepool

Ao usar uma stakepool, os tickets que você compra têm seus direitos de voto delegados à stakepool. Por padrão a pool votará da forma que preferir com seus tickets. Claro que você pode definir o voto dos seus tickets.

Você pode configurar os votebits dos seus tickets pela interface da stakepool. Abaixo você pode ver uma screenshot da [https://teststakepool.decred.org/tickets](https://teststakepool.decred.org/tickets) página. Na parte inferior da seção "Live/Immature" dessa página, você verá as configurações de votebits. Você pode configurar os votebits de *todos* os seus tickets de uma só vez utilizando a interface da stakepool. Os tickets exibidos abaixo foram configurador como "Sim" para "Bloco Anterior Válido?" e "Sim" para "Aumentar o Tamanho do Bloco de 1.0 MiB para 1.25MB", o que resultou em um Votebit de valor 5.

<img src="/img/testnet-voting_votebit-setting.jpg">

## Uma Explicação de Votebits

Abaixo está uma captura de tela de todos os valores significativos de votebit para a versão de voto 4:

<img alt="Graph explaining the votebit values of vote version 4." src="/img/testnet-voting_vote-version-4.jpg">

Essa captura de tela é bastante auto-explicativa. Dentro da interface da pool, se um usuário selecionou "Sim" para o aumento do tamanho do bloco e "Sim" para o bloco anterior ser válido, os seus tickets serão definidos como votebits "5".

Abaixo segue a captura de tela que mostra onde o Votebits e a versão do voto podem ser encontrados dentro de uma transação real de voto via explorador de blocos em [https://testnet.decred.org](https://testnet.decred.org). Este voto foi enviado com um valor de Votebit 5, conforme notado pela output da 2nd transação.

<img src="/img/testnet-voting_vote-version-and-votebits.jpg">

Você pode facilmente verificar seus votos emitidos clicando no Hash do Ticket na transação de qualquer um dos seus tickets na seção "Tickets votados" da pagina [https://teststakepool.decred.org/tickets](https://teststakepool.decred.org/tickets). (OBSERVAÇÃO: Seu voto *pode* ser exibido com um V0 [Version 0] devido a um erro no código da Stakepool - este erro está sendo investigado e pode até ser resolvido no momento em que este guia for publicado.)

## Hard Fork Demo Website

Para exibir o status da nova implementação de votação foi criado [https://hardforkdemo.decred.org](https://hardforkdemo.decred.org). Cada passo é visualizado por gráficos e explicações bastante diretas.
