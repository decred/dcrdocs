# Guia para Instalação Decrediton

Última atualização para v1.0.0.

---

`Decrediton` é uma interface gráfica de usuário para a `dcrwallet`. Quando esta aplicação é iniciada, ela automaticamente inicia suas próprias instâncias da `dcrd` e `dcrwallet` no plano de fundo - ela não abrirá se já houver uma instância da `dcrd` rodando.

NOTA: se, em qualquer ponto, o programa não responder ou ficar preso em uma tela de carregamento, isso geralmente pode ser corrigido com um reinício da aplicação.

---

## Download e Instalação

Decrediton is released with the Binary Releases and can be found here: [https://github.com/decred/decred-binaries/releases/tag/v1.1.0](https://github.com/decred/decred-binaries/releases/tag/v1.1.0). As of v1.1.0, Decrediton is only available for Linux and macOS.

> macOS/OSX

1. Download the `decrediton-1.1.0.dmg` file.

2. Double click the `decrediton-1.1.0.dmg` file once downloaded to mount the disk image.

3. Arraste o o link decrediton.app para a pasta de Aplicativos na imagem do disco.

> Linux

1. Download the `decrediton-1.1.0.tar.gz` file.

2. Navegue até o local de download e extraia o arquivo .tar.gz

    Ubuntu File Browser: com um simples clique com botão direito no arquivo .tar.gz e selecione "Extract Here". <br />
    Terminal: use o comando `tar -xvzf filename.tar.gz`.

    Both of these should extract the tar.gz into a folder that shares the same name. (`e.g. tar -xvzf decrediton-v1.1.0.tar.gz` should extract to `decrediton-v1.1.0`). If successful, this new folder should include a `decrediton` executable.

---

## Informação Crítica

Durante o processo de criação da sua carteira, você receberá uma sequência de 33 palavras conhecidas como SEED. Esta SEED é essencialmente a chave privada para sua carteira. Com esta SEED você poderá restaurar as suas chaves privadas, histórico de transações e seus saldos usando qualquer carteira Decred em qualquer computador.

Isso significa, em última análise, que *qualquer pessoa* que conhece sua SEED pode usá-la para restaurar suas chaves privadas, histórico das transações e saldos para uma carteira Decred em seu computador, sem o seu conhecimento. Por esta razão, é de extrema importância manter sua seed SEGURA. Trate esta seed da mesma forma que você trataria uma chave física em um cofre. Se você perder sua seed, você perde PERMANENTEMENTE o acesso à sua carteira e a todos os fundos dentro dela. E não poderá ser recuperada por ninguém, incluindo os desenvolvedores da Decred. Recomenda-se que você anote no papel e armazene em algum lugar seguro. Se você decidir mantê-lo no seu computador, seria melhor mantê-lo em um documento criptografado (não esqueça a senha) no caso de o arquivo ou o seu computador ser roubado.

**LEMBRE: NÃO DÊ, SOB NENHUMA CIRCUNSTÂNCIA A SEED OU A CHAVE HEX ASSOCIADA A SUA CARTEIRA A QUALQUER UM! NEM MESMO PARA OS DESENVOLVEDORES DECRED!**

---

## Criando uma Nova Carteira

Depois de clicar em "OK, I Understand" ao aviso legal, você verá uma caixa de diálogo "Create a Wallet". 

A caixa de diálogo  "Criar uma Carteira" é default para a opção "Nova Seed". Basta clicar em "Seed existente" , mas se você já tem uma seed e pretende usa-lá, siga as etapas apresentadas. Este guia pressupõe que você não tenha uma seed e continuará usando a opção "Nova Seed". Por favor, reveja a [Informação com cautela](#critical-information) sobre as seeds acima.

1. Grave a seed que é mostrada na caixa de texto (você precisará digitá-la novamente na próxima tela).

2. Pressione "Continuar"

3. Confirme sua seed e crie uma frase de acesso privada para a carteira. Essa frase de acesso será usada para desbloquear sua carteira ao fazer transações.

4. Pressione "Criar Carteira"

5. Então você deve ver um círculo azul de carregamento. Isso girará até que o `dcrd` sincronize completamente a blockchain. Em computadores que não tiveram o `dcrd` carregado neles, isso deve levar cerca de 1-2 horas com hardware mais recente (pode levar mais tempo com hardware antigo). E você pode verificar este aplicativo no monitor de processos dado a instância de execução do `dcrd` - se estiver usando uma porcentagem substancial de sua CPU, está sincronizando. Se não estiver, a Decrediton pode exigir um reinício, além de parar nesta tela.

## Abrindo a Carteira

Depois que a blockchain for sincronizado, você deve ver uma página "Abrindo a carteira". Aqui, você precisará inserir sua senha privada e a carteira irá efetuar o re-escaneamento dos blocos recentes para as transações que pertencem aos seus endereços. Aguarde até a barra de progresso terminar de preencher. A Decrediton deve então carregar a página d visão geral da sua carteira, com o seu Saldo disponível e exibir as transações recentes .

---
