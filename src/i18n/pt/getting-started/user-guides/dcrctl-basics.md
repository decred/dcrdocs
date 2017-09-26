# Princípios Básicos do dcrctl

Última atualização para v1.0.0.

Este guia destina-se a ajudá-lo a aprender os comandos básicos do aplicativo `dcrctl` usando um [arquivo de configuração mínimo](/advanced/manual-cli-install.md#minimum-configuration).

**Pré-requisitos:**

- Use o último [dcrinstall](/getting-started/user-guides/cli-installation.md) para instalar `dcrctl`. Atenção: Serão necessários passos adicionais se for utilizado outro método de instalação.
- Revise como enviar os comandos para o prompt de comando (Windows) e Bash (macOS/Linux) eles diferem [Aqui](/getting-started/cli-differences.md).
- [Instalar o dcrd](/getting-started/user-guides/dcrd-setup.md) e executá-lo em segundo plano.
- [Configure o dcrwallet](/getting-started/user-guides/dcrwallet-setup.md) e execute-o em segundo plano.

---

`dcrctl` é o cliente que controla ambas `dcrd` e `dcrwallet` via RPC (Remote Procedure Call). Você pode usar a `dcrctl` para muitas coisas como verificar seu saldo, comprar tickets, criar transações e visualizar informações da rede.

**LEMBRETE:** Esse guia utiliza exemplos comuns à todos os sistemas operacionais para os comandos. Reveja os pré-requisitos para determinar se deveria estar usando `./dcrctl` ou `dcrctl.exe` ao invés de `dcrctl`.

---

> Configurar o nome de usuário e senha RPC

Os comandos enviados para `dcrd` ou `dcrwallet` exigirão que o username/passwords do RPC sejam configurados nos arquivos de configuração. 

Se você usou [`dcrinstall`](/getting-started/user-guides/cli-installation.md), seus arquivos de configuração de username/password já estão configurados no RPC para `dcrd`, `dcrwallet`, e `dcrctl`.

Se você não usou `dcrinstall`, você precisará habilitar as configurações mínimas em seus arquivos de configuração. Siga [este guia](/advanced/manual-cli-install.md#minimum-configuration) para fazê-lo.

---

## Comandos dcrctl 

Você precisará executar comandos dcrctl em uma janela shell aparte (Command Prompt/Bash).

Para enviar comandos ao `dcrwallet`, você precisará usar `dcrctl --walletl<command>.`

Para enviar comandos ao `dcrd`, você precisará usar `dcrctl<command>.`

Para ver uma lista completa de comandos que a `dcrctl` pode enviar à `dcrd` e à `dcrwallet`, execute o seguinte comando no seu shell:

```no-highlight
dcrctl -l
```

Isso vai retornar uma lista de comandos muito extensa, separados por aplicação. Os comandos na parte de cima são para `dcrd` e os comandos na parte de baixo são para `dcrwallet`. Saiba mais sobre um comando individual digitando o seguinte para comandos `dcrwallet`:

```no-highlight
dcrctl help --wallet <command>
```

Ou siga o seguintes comandos para `dcrd`:

```no-highlight
dcrctl help<command>
```

---

## Desbloqueando sua Carteira

Algumas funcionalidades do `dcrwallet` requerem que a carteira seja desbloqueada.

Segue comando para desbloquear sua carteira:

```no-highlight
dcrctl --wallet walletpassphrase<private passphrase set during wallet creation> 0
```

Aqui, estamos especificando para `dcrctl` enviar o comando à `dcrwallet` por usar o sinalizador `--wallet`. O comando atual é o `walletpassphrase`, que aceita dois parâmetros, sua frase de acesso privada e um limite de tempo. Colocar `0` para um limite de tempo desbloqueia a `dcrwallet` sem um limite de tempo. Note, porém, que isso somente desbloqueia a carteira para a sessão atual. Se você fechar a janela na qual a carteira está em execução ou parar/reiniciar a `dcrwallet`, você precisará desbloqueá-la novamente na próxima vez que iniciá-la. 

Se o comando foi bem-sucedido, você não receberá uma confirmação da `dcrctl` mas se você olhar na sessão de sua `dcrwallet`, irá aparecer:

```no-highlight
[INF] RPCS: A carteira foi desbloqueada sem limite de tempo.
```

NOTA: Como o desbloqueio da carteira é necessário para muitas funções da `dcrwallet`, a `dcrwallet` pode ser iniciada ou com o sinalizador `--promptpass` ou por configurar `promptpass=true` no `dcrwallet.conf` (discutido [aqui](/advanced/storing-login-details.md#dcrwalletconf)).

---

## Verificando seu Saldo

Para enviar o comando `getbalance` para` dcrwallet` usando `dcrctl`, digite o seguinte no seu shell:

```no-highlight
dcrctl --wallet getbalance
```

Isso retornará todos os saldos de todas as suas contas.

---

## Obtendo um novo endereço de recebimento

Para enviar o comando `getnewaddress` para` dcrwallet` usando `dcrctl`, digite o seguinte no seu shell:

```no-highlight
dcrctl --wallet getnewaddress
```

Isso vai gerar e retornar um novo endereço de pagamentos. Pensando em diminuir a reutilização de endereços, use este comando para obter um novo endereço para cada transação que deseje receber.

---

## Enviando DCR

Para enviar DCR para um endereço, envie o comando `sendtoaddress` para` dcrwallet` usando `dcrctl`. Digite o seguinte no seu shell, preenchendo o endereço do destinatário para enviar:

```no-highlight
dcrctl --wallet sendtoaddress <address> <amount>
```

Se der tudo certo, a `dcrctl` irá retornar um hash de transação que pode ser usado para acompanhar a transação no -oficial- [Decred Block Explorer](/getting-started/using-the-block-explorer.md).

---

## Verifique o status da rede

Há muitos comandos diferentes para verificar diversas estatísticas da rede. Vamos abordar aqui o envio do `getinfo` para `dcrd` e do `getstakeinfo` para `dcrwallet`.

Para obter informações sobre seu nó `dcrd` local, utilize o comando `getinfo` para `dcrd` usando `dcrctl`. Entre com o seguinte no seu shell:

```no-highlight
dcrctl getinfo
```

Para obter informações de "staking" sobre a rede Proof-of-Stake, utilize o comando `getstakeinfo` para `dcrwallet` usando `dcrctl`. Entre com o seguinte no seu shell:

```no-highlight
dcrctl --wallet getstakeinfo
```

---

## Comandos adicionais

Para mais comandos também podem ser encontrados na página [Opções do programa](/advanced/program-options.md) page.

---
