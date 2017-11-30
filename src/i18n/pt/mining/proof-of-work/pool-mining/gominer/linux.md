# **<i class="fa fa-linux"></i> Guia do usuário Linux para mineração *gominer* **

Este guia é destinado para a configuração inicial básica do gominer com a Pool de mineração escolhida, usando um arquivo de configuração; opções mais avançadas também estão disponíveis.

Atualizado pela última vez em 28 de Abril, 2017.

---

### **<i class="fa fa-download"></i> Baixe e extraia o *gominer* Binary**


>Baixe o arquivo .tar.gz

Visite [https://github.com/decred/decred-binaries/releases](https://github.com/decred/decred-binaries/releases) para baixar os últimos binários Linux do gominer. Apenas versões 64 bits do gominer estão disponíveis. Os últimos lançamentos recentes são:

- `gominer-linux-amd64-cuda-v1.0.0.tar.gz`,
- `gominer-linux-amd64-opencl-v1.0.0.tar.gz`,
- `gominer-linux-amd64-opencladl-v1.0.0.tar.gz`.

Para placas gráficas NVIDIA, baixe o arquivo `*-cuda-*.tar.gz`. <br />
Para as placas gráficas AMD das linhas Radeon e FirePro, baixe o arquivo `*-opencladl-*.tar.gz`.<br />
Para outras placas gráficas, baixe o arquivo `*-opencl-*.tar.gz`.

Para você amante de linha de comando, aqui estão os links direcionados para v1.0.0:

```no-highlight
$ wget https://github.com/decred/decred-binaries/releases/download/v1.0.0_gominer/gominer-linux-amd64-cuda-v1.0.0.tar.gz
$ wget https://github.com/decred/decred-binaries/releases/download/v1.0.0_gominer/gominer-linux-amd64-opencl-v1.0.0.tar.gz
$ wget https://github.com/decred/decred-binaries/releases/download/v1.0.0_gominer/gominer-linux-amd64-opencladl-v1.0.0.tar.gz
```

>Extraia o arquivo .tar.gz

Extraia ou copia todos os arquivos para um novo diretório. Para este tutorial usaremos `~/decred/` como nosso diretório de trabalho. A partir da linha de comando:

```no-highlight
$ tar -xzf gominer-linux-amd64-cuda-v1.0.0.tar.gz -C ~/decred/
```

Quando você descompactar o tar, ele criará um diretório chamado `gominer-linux-amd64-opencladl-v1.0.0`. O conteúdo deste diretório deve conter `blake256.cl`, `blake256-old.cl`, `gominer`, `LICENSE`, `README.md`, e `sample-gominer.conf`.

Por causa da versão CUDA, é incluída agora a biblioteca de tempo de execução CUDA. Os arquivos nesta versão também incluirão `libcudart.so.8.0` e `rungominer.sh`. O script é usado para iniciar o gominer com a biblioteca de tempo de execução incluída para sua vantagem. Você deve ter drivers instalados na sua placa gráfica que suportam CUDA 8, no entanto. Os drivers mais antigos causarão a falha ao iniciar o gominer.

### **Configurar o arquivo de configuração do *gominer * **

> Passo 1: Escolha a Pool de Mineração

Antes de iniciarmos este passo, é muito importante que você já tenha criado uma conta para na pool de mineração (Se preciso, no site da Pool, você terá que criar um worker/minerador). Grave o login e a senha do seu worker/minerador além do stratum+tcp address:port: para uso posterior.

Se isso for novidade para você, aqui vão alguns guias para criar workers/mineradores em algumas Pools de mineração Decred. (AVISO: Não esqueça o PIN que você configurou durante a criação da conta - não será possível sacar nenhuma Decred minerada sem ele):

- [https://dcr.maxminers.net/index.php?page=gettingstarted](https://dcr.maxminers.net/index.php?page=gettingstarted)
- [https://dcr.suprnova.cc/index.php?page=gettingstarted](https://dcr.suprnova.cc/index.php?page=gettingstarted)
- [https://www2.coinmine.pl/dcr/index.php?page=gettingstarted](https://www2.coinmine.pl/dcr/index.php?page=gettingstarted)
- [https://pool.mn/dcr/index.php?page=gettingstarted](https://pool.mn/dcr/index.php?page=gettingstarted)

> Passo 2: Verifique o ID do dispositivo

Antes de configurar o arquivo de configuração, é fundamental descobrir quais os dispositivos, conforme identificado pelo gominer você deseja usar para minerar. Para fazer isso, abra uma janela do terminal, navegue até a localização que você instalou o gominer acima, por exemplo (`~/decred/gominer-linux-amd64-cuda-v1.0.0`), digite `./gominer -l` ou `./rungominer.sh -l` - Se você estiver usando a versão CUDA, pressione Enter, e uma lista dos dispositivos com os quais você pode minerar será exibida. Registre quais IDs de dispositivo você gostaria de usar. Dica: suas placas de vídeo podem ser listadas pelo seu nome de código.

> Passo 3: Edite o arquivo de configuração

Abra o arquivo `sample-gominer.conf` com o editor de texto de sua escolha. Para cada configuração que estamos prestes fazer a mudança, apague o ponto e vírgula antes da variável de configuração após o sinal `=`.

Dentro da seção "Configurações Gerais":

- Configure `devices =` para os ID#(s) do dispositivo gravado usando o comando `./gominer -l` ou `./rungominer.sh -l` no passo 2. Para mais dispositivos, devem ser separados por vírgulas, Exemplo: `devices=2,3`.

Dentro da seção "Mining settings":

- configure `pool=` para o stratum+tcp address:port da pool de mineração de sua escolha, ex. a decredpool.org use `stratum+tcp://stratum.decredpool.org:3333` (ATENÇÃO: O endereço http://address:port não funcionará com o gominer - *deve* ser usado - stratum+tcp).
- Configure `pooluser=` para o login do seu trabalhador/minerador.
- Configure `poolpass=` para a senha do seu trabalhador/minerador.

Depois que essas mudanças foram feitas, salve o arquivo. Faça uma cópia do arquivo e chame-o de gominer.conf no diretório de configuração do gominer:

```no-highlight
$ mkdir -p ~/.gominer
$ cp sample-gominer.conf ~/.gominer/gominer.conf
```

### **Inicie o gominer**

Navegue de volta até o diretório que contém tanto o `gominer` e `blake256.cl`, `e.g. ~/decred/gominer-linux-amd64-cuda-v1.0.0/`, e inicie-o `./gominer` ou `./rungominer.sh`. Se tudo foi feito corretamente, o gominer deverá ler o arquivo de configuração, conectar-se a pool e começar a hashing com os dispositivos especificados.  Você vai começar a ver mensagens rolarem pela tela, incluindo estatísticas sobre sua hashrate de cada dispositivo bem como as shares aceitas, rejeitadas, antigas e totais submetidas.

Se houver um erro de conexão é provável que a `pool`, `pooluser` ou `poolpass` estejam configurados inadequadamente.

Se o gominer começar a "hashing" em um dispositivo que você não quer usar, é provável que a configuração `devices` não esteja feita da forma correta.

Se ambos os problemas citados acima existirem, pode ser que o arquivo de configuração esteja nomeado incorretamente (deve estar nomeado `gominer.conf`) ou localizado no diretório errado (deve estar em `~/.gominer/`).

### **Familiarize-se com o site da Pool escolhida**

Agora que seu gominer está hasheando para você, você tem tempo de verificar o site da sua pool. A maioria das pools tem um painel em seus sites onde você pode usar para ter estatísticas sobre a pool, a rede e a rodada atual (tempo decorrido entre cada bloco encontrado pela pool). Além disso, caso você tenha recebido um pagamento grande o suficiente, você pode sacar suas moedas através da página Edit Account definindo um endereço de pagamento em DCR e, ou configurando um limite de pagamento automático e por fim optar por retirar a quantidade total de sua conta.

### **Dicas úteis**

*Para as versões OpenCL e OpenCL ADL do gominer*, o gominer calcula automaticamente um WorkSize que resulta no algoritmo de trabalho sendo executado a cada 500ms. Alterar as configurações de Intensity/WorkSize dentro do `gominer.conf` resultará em um problema conhecido - o algoritmo será executado em um ritmo muito mais rápido devido a diminuição do WorkSize (isso não resultará mais em shares sendo geradas), resultando em um uso acentuado de memória às vezes tão alto quanto 10MB/seg. Isso eventualmente poderá fazer com que seu sistema acuse falta de espaço RAM e feche automaticamente o gominer. É melhor não mexer nessas configurações e deixar o gominer calcular seu próprio WorkSize.
