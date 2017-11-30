# Guia de Configuração da dcrwallet

Última atualização para v1.0.0.

Este guia destina-se a ajudá-lo a configurar a aplicação `dcrwallet` usando [startup flags](/getting-started/startup-basics.md#startup-command-flags).

**Pré-requisitos:**

- Use a última [dcrinstall](/getting-started/user-guides/cli-installation.md) para instalar a `dcrwallet`. Serão necessários passos adicionais se for usado outro método de instalação.
- Revise os comandos de inicialização diferentes para cada Prompt de comando (Windows) e Bash (macOS/Linux) e os diferentes diretórios iniciais [Aqui](/getting-started/cli-differences.md).
- [Instalar o dcrd](/getting-started/user-guides/dcrd-setup.md) e executá-lo em segundo plano.

---

`dcrwallet` é o daemon que controla a funcionalidade da carteira Decred para um único usuário. Ele gerencia todas as suas contas, endereços e transações; rastreia saldos através de endereços; e permite que stakeholders participem na votação Proof-of-Stake.

Para executar `dcrwallet`, um `wallet.db` deve existir no diretório-raiz da `dcrwallet`. Para que esse arquivo exista, você deve criar uma nova carteira. `dcrinstall` inicia o processo de criação automaticamente. Se você deletar sua wallet.db ou utilizou outro processo de instalação, você terá que recorrer ao [comando de criação manual de carteira](#manual-wallet-creation-command).

---

## Informação Crítica

Durante o processo de criação da sua carteira, você receberá uma sequência de 33 palavras, conhecida como seed phrase. Essa seed phrase é basicamente a chave privada da sua carteira. Você deverá usar a seed phrase para restaurar suas chaves privadas, histórico de transações e seu saldo utilizando qualquer carteira Decred em qualquer computador.

Isso significa que *qualquer um* que tenha sua seed phrase pode usá-la para restaurar suas chaves privadas, histórico de transação e saldo em uma carteira Decred em qualquer computador sem que você saiba. Por isso é de extrema importância que você mantenha sua seed phrase em segurança. Trate a seed phrase com o mesmo cuidado que trataria uma chave para um cofre. Se você perder sua seed phrase, você perderá permanentemente acesso à sua carteira e todos os fundos que nela estiverem. Ela não pode ser recuperada por ninguém, incluindo os desenvolvedores do Decred. É recomendado que você escreva-a em um papel e guarde-a em algum lugar seguro. Se você decidir salvá-la no seu computador, o ideal seria que fosse em um documento criptografado (não se esqueça a senha) caso o arquivo ou seu computador sejam roubados.

Toda seed phrase está associada a um seed hexadecimal de 64 caracteres. A seed hexadecimal funciona da mesma forma que a seed phrase - `dcrwallet` a aceitará quando você estiver restaurando sua carteira. É importante que você também mantenha segura essa seed hexadecimal.

**LEMBRE-SE: NÃO DÊ, SOB NENHUMA CIRCUNSTÂNCIA A SEED OU A CHAVE HEX ASSOCIADA A SUA CARTEIRA A QUALQUER UM! NEM MESMO PARA OS DESENVOLVEDORES DECRED!**

---

## Comando manual de criação de carteira 

Se você ainda não tem um arquivo `wallet.db` na pasta-raiz da `dcrwallet`, você deve executar o comando `dcrwallet --create`. Os passos a seguir para tal podem ser encontrados abaixo.

1. Abra uma nova janela shell (Bash/Command Prompt/etc,..).
2. Navegue até o diretório do executável `dcrwallet`.
3. Digite o comando `dcrwallet --create` (reveja os pré-requisitos acima se não tiver certeza de como usar o comando anterior `./dcrwallet` ou `dcrwallet.exe`).

---

## Passo a passo para a criação da carteira

Durante este processo, você definirá uma senha pessoal e, opcionalmente, uma senha pública, e guardará sua seed. Para relizar isto, siga os passos a seguir:

> Defina a senha para sua Carteira

Se o comando `dcr wallet --create` for executado com sucesso, você deve visualizar o seguinte texto:

```no-highlight
Insira a senha privada para a sua nova carteira:
```

Esta primeira senha, a senha privada, é a que você vai precisar para desbloquear sua carteira quando criar transações ou votar via Proof-of-Stake. Por favor, utilize uma senha única e forte. Essa senha também protege as chaves privadas de sua carteira, protegendo-a contra roubo.

Depois que você verificou sua senha privada, você deve ver o seguinte prompt:

```no-highlight
Deseja adicionar uma camada adicional de criptografia para dados públicos? (n/no/y/yes) [no]:
```

A senha pública é opcional. É utilizada para criptografar todos os dados públicos (transações e endereços) de sua carteira. Então, se ela for roubada, o ladrão tem como ligar você a suas transações.

> Registre sua Seed

Antes de criar uma nova SEED para sua carteira, revise a seção [Informação crítica](/getting-started/user-guides/dcrwallet-setup.md#critical-information).

Depois de colocar a sua senha privada e senha pública "opcional", você verá o seguinte prompt:

```no-highlight
Você tem uma Seed de uma carteira existente que deseja usar? (n/no/y/yes) [no]:
```

Esse guia parte do princípio de que você não tem uma seed, então continue pressionando `Enter`, o que irá responder `[não]`. NOTA: Se você quiser restaurar sua carteira utilizando sua seed, você só precisa apertar `[sim]` aqui e prosseguir com as instruções exibidas.

<i class="fa fa-exclamation-triangle"></i>**NÃO USE A MESMA SEED EM MÚLTIPLAS CARTEIRAS! Para entender a importância, visite [FAQs de Wallets e Seeds](/faq/wallets-and-seeds.md#3-can-i-run-multiple-wallets). Recomenda-se que, sempre que possível, ao criar uma nova carteira, gere-se uma nova seed**

Após responder `[não]`, sua seed phrase (seed de geração da carteira) e sua string hexadecimal serão exibidas na tela. Por favor, leia a seção IMPORTANTE exibida imediatamente após a seed hexadecimal.

Não é possível enfatizar o bastante o quão importante é que você salve sua seed phrase em um lugar seguro. Se você ainda não entendeu isso direito, por favor, leia novamente a [Seção de Informações Críticas](/getting-started/user-guides/dcrwallet-setup.md#critical-information).

Uma vez que você tenha anotado sua seed phrase e sua seed hexadecimal, digite `OK` e pressione `Enter`. NOTA: Se você não anotou sua seed phrase antes de prosseguir, você deveria [recomeçar esse processo](/getting-started/user-guides/dcrwallet-setup.md#create-a-new-wallet) após [deletar seu arquivo wallet](/advanced/deleting-your-wallet.md)

Depois de pressionar `Enter`, você deve ver a seguinte mensagem:

```no-highlight
Criando a carteira...
A carteira foi criada com sucesso.
```

A carteira então será criada. Isso pode levar alguns minutos se você tiver um computador lento.

---

## Iniciando a dcrwallet

Para executar `dcrwallet`, você precisa primeiro ter [criado sua carteira](#wallet-creation-walkthrough) e
[conectado o dcrd à rede Decred](/getting-started/user-guides/dcrd-setup.md#connect-to-the-decred-network).

> Configurar o nome de usuário e senha RPC

Se você usou [`dcrinstall`](/getting-started/user-guides/cli-installation.md), seus arquivos de configuração de username/password já estão configurados no RPC para `dcrd`, `dcrwallet`, e `dcrctl`.

Se você não utilizou `dcrinstall`, você precisará habilitar as configurações mínimas nos arquivos de configuração. Siga [este guia](/advanced/manual-cli-install.md#minimum-configuration) para fazê-lo.

> Inicie o dcrwallet

Com os arquivos configurados corretamente, abra outra janela da shell na pasta-raiz do Decred (ou utilize a última shell se você tiver acabado de criar sua carteira). Digite o seguinte comando (dê uma olhada no guia de Pré-requesitos para saber qual o comando certo para o seu OS/ sua Shell): 

```no-highlight
dcrwallet
```

Seu `dcrwallet` agora conectará a rede via `dcrd`. Começará a escanear a rede para seus endereços ativos e que podem demorar alguns minutos em computadores lentos. Eventualmente, ela começará exibindo linhas como:

```no-highlight
[INF] WLLT: Connecting block 0000000000002004ea8fa74af334cb291a22832642b5be603995683534bbb97b, height 9990
```

Isso significa que sua carteira está conectada com sucesso à rede
através do seu daemon.

---

Para aprender como usar `dcrd` e` dcrwallet`, visite o guia[dcrctl Basics](/getting-started/user-guides/dcrctl-basics.md). Você aprenderá a desbloquear sua carteira, enviar e receber DCR usando `dcrctl`, visualizar seu saldo e verificar várias estatísticas da rede.
