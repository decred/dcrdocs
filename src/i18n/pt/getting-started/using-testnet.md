# Guia de uso da Testnet

Última atualização para a testnet2

---

## Por que usar a Testnet?

A testnet é um lugar maravilhoso onde você pode experimentar aplicações Decred sem se importar que um erro irá te custar dinheiro de verdade. É recomendado que as pessoas usem a testnet para aprender os básicos do software Decred e suas eventuais novas funcionalidades.

A Decred está atualmente na sua segunda Testnet, também conhecida como testnet2. As testnets são periodicamente resetadas para ajudar a manter o arquivo da blockchain em um tamanho razoável.

---

## Como rodar um Node na Testnet:

Rodar um node na testnet2 é incrivelmente fácil. Sua aplicação escolhida precisará baixar a blockchain da testnet2 e você precisará criar um novo arquivo de carteira para uso na testnet2. Sua blockchain da mainnet e seus arquivos de carteira permanecerão inalterados. Alternar entre os dois é extremamente fácil.

---

## Paymetheus

Para rodar a `Paymetheus` na testnet2, simplesmente execute a aplicação `Decred Testnet` ao invés da usual `Decred`. Em seguida você será guiado até a criação da carteira (os mesmos passos no [Paymetheus Setup guide](/getting-started/user-guides/paymetheus.md)). Após o término da sincronização da `dcrd` ao fundo já será possível preencher usa carteira `Paymetheus` com as DCR da testnet e se familiarizar com o software.  

---

## Decrediton 

Para usar a `Decrediton` na testnet2, você terá de rodar a `Decrediton` a partir da linha de comando com a identificação `--testnet`. Lembre-se de que usar essa identificação fará sempre com que ela inicie nesse modo até que você use a identificação `--mainnet` para voltar à blockchain da mainnet.

Para Linux, 

1. Abra seu terminal e navegue até o diretório com o executável da decrediton.
2. Execute o comando `./decrediton --testnet`.
3. A Decrediton irá iniciar e tentará se conectar à testnet2.

Para macOS,

1. Abra seu terminal e execute o comando abaixo: `/Applications/decrediton.app/Contents/MacOS/decrediton --testnet`
2. A Decrediton irá iniciar e tentará se conectar à testnet2.

Lembre-se, se quiser voltar da Decrediton para a mainnet, você precisará executar aqueles comandos com a identificação `--mainnet`.

___ 

## Suite de Linha de Comando

Para executar `dcrd` e `dcrwallet` na testnet, simplesmente acrescente a identificação `--testnet` ao seu comando de execução. Como alternativa você também pode colocar `testnet=1` em todos os seus arquivos de configuração, porém, geralmente é muito mais rápido usar a identificação de startup.

Na primeira execução da `dcrd --testnet`, a `dcrd` irá começar automaticamente a baixar a blockchain da testnet2 para a pasta `data/testnet2` do diretório `dcrd`'. 

Antes que consiga rodar a `dcrwallet` com a identificação `--testnet`, você deve criar uma carteira testnet separada usando o comando `dcrwallet --testnet --create`. Os passos são os mesmos encontrados no [dcrwallet Setup Guide](/getting-started/user-guides/dcrwallet-setup.md). 

Ao executar comandos para ambas `dcrwallet` e `dcrd`, você também deve acrescentar a identificação `--testnet` a qualquer um dos comandos `dcrctl` que for usar. Por exemplo, você executaria o comando `dcrctl --testnet --wallet getbalance` para checar seu balanço na testnet. 

---

## Adquirindo moedas da Testnet

Você pode adquirir moedas por meio do [Decred Testnet Faucet](https://faucet.decred.org). Por favor retorne quaisquer moedas ao endereço citado na parte inferior desta página quando tiver terminado na testnet.

---

