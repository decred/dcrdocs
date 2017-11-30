# Simnet

---

## Visão geral

Ao desenvolver aplicações da Decred ou ao testar potenciais alterações, é geralmente muito útil ter uma rede de testes onde os níveis de dificuldade são baixos o suficiente para gerar blocos conforme o necessário.

Com o objetivo de facilitar nessas situações, a dcrd fornece uma rede de simulação (`--simnet`). O que se segue é uma visão geral das características mais importantes que a difere da mainnet.

* A dificuldade começa extremamente baixa para habilitar uma mineração rápida dos blocos utilizando CPU.
* Mudanças de rede:
    * All code related to peer discovery and IP address dissemination is disabled to help ensure the network remains private
    * As portas de rede peer e RPC são diferentes
    * Uma seqüência de byte de uma única rede é usada no protocolo de mensagem P2P para que os blocos não possam ser cruzados acidentalmente com a main network
* Todos os parâmetros da cadeia e do endereço de pagamento são únicos para evitar confusão com a main network::
    * Bloco gênese diferente
    * Endereços de pagamento iniciam-se com prefixos diferentes:
        * Pay-to-pubkeyhash (P2PKH) padrão começa com `S` maiúsculo
        * Pay-to-scripthash (P2SH) padrão começa com `s` minúsculo
    * As chaves estendidas determinísticas hierárquicas exportadas (BIP32) começam com diferentes prefixos:
        * As chaves estendidas públicas começam com `spub`
        * As chaves estendidas privadas começam com `sprv`
    * O tipo de moeda BIP44 é usada em caminhos de chave HD minúscula `s`

  ---

##  Primeiros passos

Executar um único nó `dcrd` no simnet é simples, começando o `dcrd` com flag `--simnet`. No entanto, para ser realmente útil, você normalmente quer poder enviar moedas entre endereços, o que implica que os blocos precisarão ser minerados e a interface com uma carteira necessária.

Além disso, uma vez que ainda não existem moedas na nova rede privada, uma série inicial de blocos precisará ser minerada e pagará para um endereço que você possui para que haja moedas utilizáveis para gastar.

Como mencionado anteriormente, o simnet usa endereços exclusivos para evitar confusão com a main network. Assim, significa que uma carteira que suporte o formato do endereço deve ser usada. Para isso, o `dcrwallet` com flag `--simnet` pode ser usado.

O comando seguinte é uma referência para começar:

**NOTA: Todos esses comandos podem ser simplificados criando arquivos de configuração e fazendo uso deles, no entanto, os comandos aqui usam todos os interruptores na linha de comando para mostrar exatamente o que é necessário para cada um.**

* Inicie o dcrd na simnet:

   `$ dcrd --simnet --rpcuser=<username> --rpcpass=<password>`

* Crie uma nova carteira na simnet:

   `$ dcrwallet --simnet --create`

* Inicie a dcrwallet na simnet:

    `$ dcrwallet --simnet --username=<username> --password=<password>`

* Crie um novo endereço Decred na simnet:

    `$ dcrctl --simnet --wallet --rpcuser=<username> --rpcpass=<password> getnewaddress`

* Pause o processo inicial da dcrd e reinicie-o com o endereço de mineração apontando para a output do comando anterior:

   `$ dcrd --simnet --rpcuser=<username> --rpcpass=<password> --miningaddr=<S....>`

* Instrua dcrd para gerar blocos iniciais suficientes para que a primeira moeda amadureça:

    `$ dcrctl --simnet --rpcuser=<username> --rpcpass=<password> generate 100`

* Verifique o balanço na carteira para assegurar-se de que as moedas estejam disponíveis:

   `$ dcrctl --simnet --wallet --rpcuser=<username> --rpcpass=<password>getbalance` 
  
Neste ponto, existe um simnet privado totalmente funcional com moedas disponíveis para enviar para outros endereços simnet. Em todo momento uma ou mais transações são enviadas, um `generate 1` RPC que deve ser emitido para explorar um novo bloco com as transações incluídas.
