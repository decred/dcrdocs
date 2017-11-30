# Guia de instalação CLI

Esta página foi atualizada pela última vez para v1.0.1.

---

## dcrinstall 

`dcrinstall` é o método recomendado para instalar as ferramentas de interface de linha de comando da Decred `dcrd`, `dcrwallet`, and `dcrctl`.

`dcrinstall` is an automatic installer and upgrader for the Decred software. The newest release can be found here: [https://github.com/decred/decred-release/releases/tag/v1.1.0](https://github.com/decred/decred-release/releases/tag/v1.1.0). Binaries are provided for Windows, macOS, Linux, OpenBSD, and FreeBSD. Executing installer will install `dcrd`, `dcrwallet`, and `dcrctl`. Instructions are provided for macOS, Linux, and Windows below (assumed proficiency for *BSD users).

`dcrinstall` irá baixar automaticamente o pacote pré-compilado do pacote assinado encontrado no GitHub, verifica a assinatura deste pacote, copia os binários dentro do pacote para uma pasta específica dependente do sistema operacional, faz a criação dos arquivos de configuração e os configura para permitir que as 3 aplicações se comuniquem um ao outro, e executá-lo através do processo de criação da wallet. Depois de executar `dcrinstall`, você poderá iniciar o software sem configurações adicionais.

> macOS:

1. Faça download do arquivo correto:

    For 32-bit computers, download the `dcrinstall-darwin-386-v1.1.0` file. <br />
    For 64-bit computers, download the `dcrinstall-darwin-amd64-v1.1.0` file.

2. Crie um executável dcrinstall-darwin-xxxx-vx.x.x  dentro do seu terminal e execute-o:

    Navegue até o diretório onde o arquivo dcrinstall foi baixado usando o comando `cd`, execute chmod com o modo u+x no arquivo dcrinstall e rode o executável que foi criado. Abaixo está um exemplo dos comandos (altere os diretórios ou nome dos arquivo conforme for necessário):
    
    `cd ~/Downloads/` <br />
    `chmod u+x dcrinstall-darwin-amd64-v1.1.0` <br />
    `./dcrinstall-darwin-amd64-v1.1.0`
    
3. Os binários executáveis para `dcrd`, ` dcrwallet` e `dcrctl` agora podem ser encontrados no diretório `~/decred/`. Antes de concluir o processo `dcrinstall`, você será direcionado ao prompt de criação da wallet. Siga os passos deste guia de instalação da dcrwallet para finalizar [Wallet Creation Walkthrough](/getting-started/user-guides/dcrwallet-setup.md#wallet-creation-walkthrough).

> Linux:

1. Faça download do arquivo correto:

    For 32-bit computers, download the `dcrinstall-linux-386-v1.1.0` file. <br />
    For 64-bit computers, download the `dcrinstall-linux-amd64-v1.1.0` file. <br />
    For 32-bit ARM computers, download the `dcrinstall-linux-arm-v1.1.0` file. <br />
    For 64-bit ARM computers, download the `dcrinstall-linux-arm64-v1.1.0` file.

2. Crie um executável dcrinstall-linux-xxxx-vx.x.x dentro do seu terminal e execute-o:

    Navegue até o diretório onde o arquivo dcrinstall foi baixado usando o comando `cd`, execute chmod com o modo u+x no arquivo dcrinstall e rode o executável que foi criado. Abaixo está um exemplo dos comandos (altere os diretórios ou nome dos arquivo conforme for necessário):
    
    `cd ~/Downloads/` <br />
    `chmod u+x dcrinstall-linux-amd64-v1.1.0` <br />
    `./dcrinstall-linux-amd64-v1.1.0`
    
3. Os binários para `dcrd`, `dcrwallet` e `dcrctl` agora podem ser encontrados no diretório `~/decred/`. Antes de concluir o processo `dcrinstall`, você será direcionado ao prompt de criação da wallet. Siga os passos deste guia de instalação da dcrwallet para finalizar [Wallet Creation Walkthrough](/getting-started/user-guides/dcrwallet-setup.md#wallet-creation-walkthrough).

> Windows:

1. Baixe o arquivo correto:

    For 32-bit computers, download the `dcrinstall-windows-386-v1.1.0.exe` file. <br />
    For 64-bit computers, download the `dcrinstall-windows-amd64-v1.1.0.exe` file. <br />

2.  Rode o arquivo executável dcrinstall.

    Você pode clicar duas vezes ou executá-lo a partir do prompt de comando.
    
3. Os binários para `dcrd`,` dcrwallet` e `dcrctl` agora podem ser encontrados no diretório`%HOMEPATH%\decred\` (geralmente o diretório é `C:\Users<username>`). Antes de concluir o processo `dcrinstall`, você será direcionado ao prompt de criação da wallet. Siga os passos deste guia de instalação da dcrwallet para finalizar [Wallet Creation Walkthrough](/getting-started/user-guides/dcrwallet-setup.md#wallet-creation-walkthrough).
