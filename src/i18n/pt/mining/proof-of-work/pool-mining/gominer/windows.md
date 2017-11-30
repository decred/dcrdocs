# <i class="fa fa-windows"></i> Guia para mineração *gominer* Windows

Este guia é destinado para a configuração básica inicial de gominer em uma Pool de mineração de escolha usando um arquivo de configuração, opções mais avançadas também estão disponíveis.

Última atualização para gominer v1.0.0.

---

### <i class="fa fa-download"></i> Baixe e extraia o *gominer* Binary 


> Baixe o arquivo .zip

Visite [https://github.com/decred/decred-binaries/releases/tag/v1.0.0](https://github.com/decred/decred-binaries/releases/tag/v1.0.0) para baixar os binários gominer do Windows. Dentro da seção "Downloads" você deve ver os seguintes arquivos:

- `gominer-windows-amd64-cuda-v1.0.0.zip`,
- `gominer-windows-amd64-opencl-v1.0.0.zip`,
- `gominer-windows-amd64-opencladl-v1.0.0.zip`.

Para placas gráficas NVIDIA, baixe o arquivo `* -cuda - *. Zip`. <br />
Para as placas gráficas AMD das linhas Radeon e FirePro, baixe o arquivo `*-opencladl-*.zip`.<br />
Para outras placas gráficas, baixe o arquivo `*-opencl-*.zip`.

Extraia ou copie todos os arquivos para uma nova pasta. Lembre-se do caminho para esta pasta ou então abra uma nova janela do Explorer para visualizar o conteúdo da pasta (Para o restante deste tutorial usaremos `C:\decred\gominer\` como exemplo). O conteúdo desta pasta deve ser os arquivos `blake256.cl`, `gominer.exe`, `LICENSE`, `README.md`, e `sample-gominer.conf`.

> Notas do prompt de comando

Para aqueles que são iniciantes, familiarize-se com alguns métodos para abrir um prompt de comando em um diretório específico na (pasta):

- No File Explorer "Explorador de arquivos", navegue até uma pasta específica, depois digite `cmd` na barra de endereços e pressione enter.
- No File Explorer "Explorador de arquivos", navegue até uma pasta específica, depois clique no menu suspenso em "Arquivo", após isso vá até a opção "Abrir prompt de comando" e selecione "Abrir prompt de comando".
- Click no menu inicial ou selecione a tecla Windows do seu teclado, digite `cmd`, e abra o Aplicativo Desktop do "Prompt de Comando" que deve estar aparecendo nos resultados da busca. Altere o diretório atual para uma pasta específica usando o comando `cd`, `ex. cd C:\decred\gominer\`. O comando `dir` por si só pode ser usado para visualizar o conteúdo do diretório atual.

### Instalação do Arquivo de Configuração *gominer*

> Passo 1: Escolha a Pool de Mineração

Antes de iniciarmos este passo é importante que você já tenho criado uma conta para uma pool de mineração (Se for solicitado, você terá de criar um worker no site da pool de sua escolha). Grave login e senha de seu worker além do stratum+tcp address:port para uso posterior. 

Se isso for novidade para você, aqui vão alguns guias para criar identificadores em alguns pools de mineração da Decred. (AVISO: Não esqueça o PIN que você configurou durante a criação da conta - não será possível sacar nenhuma Decred minerada sem ele):

- [https://dcr.maxminers.net/index.php?page=gettingstarted](https://dcr.maxminers.net/index.php?page=gettingstarted)
- [https://dcr.suprnova.cc/index.php?page=gettingstarted](https://dcr.suprnova.cc/index.php?page=gettingstarted)
- [https://www2.coinmine.pl/dcr/index.php?page=gettingstarted](https://www2.coinmine.pl/dcr/index.php?page=gettingstarted)
- [https://pool.mn/dcr/index.php?page=gettingstarted](https://pool.mn/dcr/index.php?page=gettingstarted)

> Passo 2: Verifique o ID do dispositivo

Antes de configurar o arquivo de configuração, é fundamental qwue descubra quais dispositivos, como identificados pelo gominer, voce deseja usar para minerar (principalmente se quiser evitar minerar com sua CPU ou IGP). Para fazer isso, abra o Prompt de Comando no local do `gominer.exe` (`ex. C:\decred\gominer\`), digite `gominer.exe -l`, aperte Enter e uma lista de dispositivos com os quais você pode minerar será mostrada. Grave quais IDs de dispositivos que você gostaria de usar. Dica: Suas placas de vídeo podem ser listadas pelos seus codinomes.

> Passo 3: Edite o arquivo de configuração

Abra o arquivo `sample-gominer.conf`. Para cada configuração que estamos prestes a alterar, simplesmente apague o semi-colon before the setting variable after the `=` sign. 

Na seção "configurações gerais":

- Configure `devices=` para o dispositivo ID#(s)  gravado usando o comando `gominer.exe -l` no Passo 2. Múltiplos dispositivos devem ser separados por vírgula, p. Ex. `Devices = 2,3`.

Dentro da seção "Mining settings":

- configure `pool=` para o stratum+tcp address:port da pool de mineração de sua escolha, ex. a decredpool.org usa `stratum+tcp://stratum.decredpool.org:3333` (ATENÇÃO: o http://address:port não vai funcionar com gominer - stratum+tcp *deve* ser usado).
- Configure `pooluser=` login do seu trabalhador/minerador.
- Configure `poolpass=` a senha do seu trabalhador/minerador.

Depois que essas alterações foram feitas com cuidado, Salve como OU Salve e renomeie o arquivo como gominer.conf.

> Passo 4: Copie gominer.conf para pasta Local AppData

Dentro de um novo File Explorer "Explorador de arquivos", digite `%localappdata%\Gominer\` na barra de endereços. Copie `gominer.conf` para sua localização original, `e.g. C:\decred\gominer\`, dentro de `%localappdata%\Gominer\`.

### Inicie gominer.exe

Navegue de volta até o diretório que contém tanto o `gominer.exe` como o  `blake256.cl`, `ex. C:\decred\gominer\`, e inicie o `gominer.exe`. Se tudo foi feito corretamente, o gominer deverá ler a partir do arquivo de configuração, conectar-se à pool e começar a "hashing" com os dispositivos especificados. Você vai começar a ver mensagens rolarem pela tela, incluindo estatísticas sobre sua hashrate de cada dispositivo bem como as shares aceitas, rejeitadas, antigas e totais submetidas.

Se houver um erro de conexão é provável que `pool`, `pooluser` ou `poolpass` estejam configurados inadequadamente.

Se o gominer começar a "hashing" em um dispositivo que você não quer usar, é provável que a configuração `devices` não esteja feita da forma correta.

Se ambos os problemas citados acima existirem, pode ser que o arquivo de configuração esteja nomeado incorretamente (deve estar com o nome`gominer.conf`) ou então localizado no diretório errado (deve estar em `%localappdata%\Gominer\`).

### Familiarize-se com o site da Pool escolhida.

Agora que seu gominer está hasheando para você, sobra um tempo para dar uma olhada no site da sua pool. A maioria das pools tem um painel em seus sites, o qual você pode usar para ter estatísticas sobre a pool, a rede e a rodada atual (tempo decorrido entre cada bloco encontrado pela pool). Além disso, uma vez que tenha recebido um pagamento grande o bastante, você pode sacar suas moedas através da página Edit Account por configurar um endereço de pagamentos em DCR  e, ou configurar um limite de pagamento automático ou optar por retirar o balanço total de sua conta.  

### Dicas úteis

*Para versões OpenCL e OpenCL ADL do gominer*, o gominer calcula automaticamente um WorkSize que resulte no algoritmo de trabalho sendo executado a cada 500ms. Alterar as configurações em Intensity/WorkSize sem o `gominer.conf` irá desencadear um problema conhecido - o algoritmo írá rodar em um ritmo bem mais rápido por causa do WorkSize diminuído (Isso não siginficará mais shares sendo geradas), resultando em um uso acentuado de memória, às vezes ultrapassando os 10MB/seg. Isso eventualmente poderá fazer com que seu sistema acuse falta de espaço RAM e feche automaticamente o gominer. É melhor não mexer nessas configurações e deixar o gominer calcular seu próprio WorkSize. 
