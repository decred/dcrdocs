# Guia de Instalação dcrd

Última atualização para v1.0.0.

Este guia destina-se a ajudá-lo a instalar o aplicativo `dcrd` usando [flags de inicialização] (/ get-started/startup-basics.md#startup-command-flags).

**Pré-requisitos:**

- Use o último [dcrinstall](/getting-started/user-guides/cli-installation.md) para instalar `dcrd`. Atenção: Serão necessários passos adicionais se for utilizado outro método de instalação.
- Revise como enviar os comandos para o prompt de comando (Windows) e Bash (macOS/Linux) colchetes diferem [here](/getting-started/cli-differences.md).

---

`Dcrd` é o nó daemon para a Decred. Um daemon é um programa que trabalha em segundo plano com o qual você não faz interface diretamente. `Dcrd` mantém todo o passado transacional (blockchain) da Decred e permite a retransmissão de transações para outros nós/nodes Decred no mundo todo. Você pode pensar como se fosse o seu próprio servidor pessoal da blockchain/Decred. A blockchain é salva na pasta `data` no diretório inicial do `dcrd`.

**Usuários avançados: se você estiver executando no modo headless via SSH,** você
Precisará usar um multiplexador terminal, como [screen](http://www.howtogeek.com/howto/ubuntu/keep-your-ssh-session-running-when-you-disconnect/)
ou [tmux](https://tmux.github.io/). Onde você vê as instruções para
mude para outra shell, você precisará iniciar uma nova janela em `screen`
or `tmux`.

---

## <i class="fa fa-cloud"></i> Conectando a rede Decred 

The first time launching `dcrd`, it will connect to the Decred network and begin downloading the blockchain. To allow `dcrwallet` and `dcrctl` to communicate with `dcrd`, the configuration files must have `rpcuser` and `rpcpass` settings enabled. 

> Configurar o nome de usuário e senha RPC

Se você usou [`dcrinstall`](/getting-started/user-guides/cli-installation.md), seus arquivos de configuração de username/password já estão configurados no RPC para `dcrd`, `dcrwallet`, e `dcrctl`.

Se você não usou `dcrinstall`, você precisará habilitar as configurações mínimas em seus arquivos de configuração. Para isso siga [este guia](/advanced/manual-cli-install.md#minimum-configuration) para fazê-lo.

> Iniciar dcrd 

Com os arquivos configurados corretamente, abra outra janela shell no seu diretório Decred (ou use a última janela se você acabou de criar sua carteira). Digite o seguinte comando para (rever os pré-requisitos do guia para determinar qual o comando certo para sua aplicação OS/Shell):

```no-highlight
dcrd
```

> Aguarde que o dcrd seja sincronizado com a blockchain da Decred

Quando o `dcrd` inicializar com sucesso, você dever visualizar sua janela shell começando a preencher as mensagens à medida que o daemon se conecta à rede e começa a processar os blocos. Aguarde até que conclua  - toda a blockchain está sendo baixada no diretório de dados `dcrd`.

Você verá uma linha parecida com isso:

```no-highlight
22:58:04 2016-02-09 [INF] BMGR: Syncing to block height 617 from peer 104.236.167.133:9108
```

Então, continuando o download dos blocos, você verá linhas como estas:

```no-highlight
22:58:16 2016-02-09 [INF] BMGR: Processed 321 blocks in the last 10.03s (544 transactions, height 322, 2016-02-09 09:50:34 +1000 EST)
```

A blockchain será totalmente sincronizada uma vez que o último bloco for processado, ou seja, o atual bloco minerado. Para ter certeza, você pode visualizar e comparar com a data e a hora na mensagem do log ou comparando o atual bloco processado no [explorador de bloco oficial] (https://mainnet.decred.org/).

Note que esta conexão será usada no futuro. Você deve deixar a instância `dcrd` em execução para usar `dcrwallet`.

---

Agora que você configurou o `dcrd`, visite o guia [dcrwallet Setup](/getting-started/user-guides/dcrwallet-setup.md).
