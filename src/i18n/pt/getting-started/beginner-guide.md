# Guia do Iniciante

Atualizado pela última vez para v1.0.1

---

## Bem-vindo à Decred  

Seja bem-vindo à Decred! Estamos muito contentes em ver você por aqui. Como talvez já saiba a Decred é diferente. Existe muita coisa nova a se conhecer para compreender o jeito que tudo funciona. Este artigo tentará facilitar um pouco o seu entendimento.

Este guia do iniciante é um caminho para termos o software da Decred pronto e rodando. Pode-se optar por múltiplos clientes para conseguir um node na rede além de Decred na sua carteira. Você vai aprender, especificamente, a como instalar, configurar e usar as aplicações da Decred; como obter Decred; como votar via Proof-of-Stake; e como usar o block explorer.

Você vai precisar seguir um [Guia de Instalação](#guias-de-instalacao), e em seguida seguir o caminho para a aplicação de sua preferência, abaixo. Depois que seu programa estiver configurado, dê uma olhada em [Guias Gerais](#guias-gerais) na parte inferior desta página. Se você tiver quaisquer dúvidas ao longo do processo, junte-se à nós em nosso [Slack](/support-directory.md#join-us-on-slack).

**NOTA: O uso da Testnet é altamente recomendado para aprender a como utilizar o software da Decred sem medo de cometer erros e perder dinheiro real. Após seguir as instruções nos guias para definir sua escolha de software, por favor visite o [Guia de Utilização da Testnet](/getting-started/using-testnet.md) para saber como rodar sua aplicação na testnet da Decred.**

---

## Aplicações

A seguir encontra-se uma lista das aplicações atualmente disponibilizadas, junto com uma tabela mostrando suas respectivas compatibilidades com diferentes sistemas operacionais.

**Paymetheus**: The only Windows GUI client as of v1.1.0. <br />
**dcrd**: The node daemon, this command-line application handles block management and consensus. <br />
**dcrwallet**: The wallet daemon, this command-line application handles address and transaction management. <br />
**dcrctl**: The remote procedure call (RPC) client, this command-line application is used to control dcrd and dcrwallet via RPC commands. <br />
**Decrediton**: Cross-platform GUI client as of v1.1.0.

|           | Paymetheus | dcrd | dcrwallet | dcrctl | Decrediton |
| ---------:|:----------:|:----:|:---------:|:------:|:-----------:|
| Windows   | X          | X    | X         | X      |             |
| macOS     |            | X    | X         | X      | X           |
| Linux     |            | X    | X         | X      | X           |
| Demais UNIX|            | X    | X         | X      |             |

"Demais UNIX" atualmente abrangem vários *BSDs e Solaris/illumos.

Nota: Talvez você logo repare em uma das muitas diferenças entre a Decred e outras 
criptomoedas populares: o daemon da carteira e o daemon dos nodes são separados.
Muitas outras moedas rodam essas funções em um único daemon.
Para aqueles que escolherem as interfaces baseadas em linha de comando, isso quer dizer que deve-se
rodar `dcrd` para a funcionalidade de full node e `dcrwallet` para armazenar  suas DCR,
criar transações e participar tanto nas votações como na mineração Proof-of-Stake.

---

## Guias de instalação

Para começar, escolha abaixo uma opção de instalação dentre as disponíveis para seu sistema operacional:

* [Paymetheus](/getting-started/user-guides/paymetheus.md)
* [Command Line Suite **via dcrinstall**](/getting-started/user-guides/cli-installation.md) - NOTA: O método `dcrinstall` é o jeito mais rápido e fácil para conseguir um node por linha de comando e ter a carteira rodando. É recomendado seu uso e os guias de configurações para linha de comando abaixo presumem que você adotou este método.
* [Decrediton (ALPHA)](/getting-started/user-guides/decrediton-setup.md)

---

**NOTA:** Todos os guias a seguir podem ser encontrados com os mesmos nomes no menu de navegação.

## Instruções para a Paymetheus

Os guias abaixo, em ordem, irão ajudá-lo no começo com a Paymetheus: 

* [Instalação da Paymetheus ](/getting-started/user-guides/paymetheus.md)
* [Usando a Paymetheus](/getting-started/user-guides/using-paymetheus.md)

## Instruções para a Decrediton

O guia abaixo ira ajudá-lo a carregar a Decrediton:

* [Instalação da Decrediton](/getting-started/user-guides/decrediton-setup.md)

## Instruções para Linha de Comando

Os guias abaixo, em ordem, irão ajudá-lo no começo com Aplicações por Linha de Comando (`dcrd`, `dcrwallet`, `dcrctl`):

* [Diferenças nas Linhas de Comando](/getting-started/cli-differences.md)
* [Informações Básicas Sobre Startup Option ](/getting-started/startup-basics.md)
* [Instalação da dcrd](/getting-started/user-guides/dcrd-setup.md)
* [Instalação da dcrwallet](/getting-started/user-guides/dcrwallet-setup.md)
* [Utilização Básica da dcrctl](/getting-started/user-guides/dcrctl-basics.md)

## Guias Gerais

Os guias a seguir são independentes das diferentes aplicações:

* [Utilizando a Testnet](/getting-started/using-testnet.md)
* [Obtendo DCR](/getting-started/obtaining-dcr.md)
* [Utilizando o Block Explorer](/getting-started/using-the-block-explorer.md)
* [Guia sobre Proof-of-Stake](/mining/proof-of-stake.md)
* [Guia de Votações na Mainnet](/getting-started/user-guides/agenda-voting.md)
