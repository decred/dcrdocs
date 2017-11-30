# <i class="fa fa-windows"></i> Guia para Usuários Windows

---

## <i class="fa fa-download"></i> Baixe e extraia o cgminer 

Visite https://github.com/decred/cgminer/releases para encontrar a versão mais recente do cgminer. Para Windows de 64bits, baixe e extraia `cgminer-decred-w64 _ *. Zip`. Para Windows de 32bits, baixe e extraia `cgminer-decred-w32 _ *. Zip`. Extraia todos os arquivos para uma nova pasta e abra a nova pasta para visualizar os arquivos.

## <i class="fa fa-play-circle"></i> Inicialize e execute o cgminer 

> Passo 1

Abra o prompt de comando digitando `cmd` na barra de endereços na parte superior do explorador de arquivos que possui os novos arquivos do cgminer, então, pressionando o `Enter`. No prompt de comando digite a instrução abaixo para listar seu hardware capaz de minerar:

```no-highlight
C:\Decred> cgminer -n
```

Você deverá ver suas placas de vídeo listadas pelo seu nome de código GPU ou o nome do driver. A última linha de saída deve mostrar o número de GPUs compatíveis com as quais você pode explorar.

> Passo 2 (Opcional)

Para comparar seu sistema e descobrir o hashrate que pode executar, use o comando:

```no-highlight
C:\Decred> cgminer --blake256 --benchmark
```

> Passo 3

Registre-se em um dos sites Pool operacionais e configure um novo minerador para cada um dos seus computadores de mineração. Consulte o site da pool de sua escolha para obter instruções, se necessário. Na sua janela de linha de comando do primeiro passo, digite o seguinte comando para iniciar cgminer (ignorar colchetes):

```no-highlight
C:\Decred> cgminer --blake256 -o <pool url>:<port number> -u <web login>.<worker name> -p <worker password>
```

Exemplo:

```no-highlight
C:\Decred> cgminer --blake256 -o http://dcr.maxminers.net:7727 -u DecredMiner.miner1 -p 7@!x5L1
```

> Passo 4

Cgminer agora deverá ser iniciado. Crie um arquivo de configuração do cgminer pressionando as seguintes teclas: `S` para (Configurações),` W` para (Escrever o arquivo de configuração), `Enter` para (Salvar arquivo de configuração como` cgminer.conf`). Observe que `cgminer.conf` será colocado no mesmo diretório que` cgminer.exe`. Para adicionar quaisquer outras pools ao seu arquivo de configuração, basta abrir o `cgminer.conf` com o bloco de notas ou um editor de texto semelhante. Use a seguinte sintaxe para fazer alterações na seção "pools" do arquivo de configuração (observe a vírgula entre cada entrada de pool individual):

```no-highlight
"pools" : [
   {
      "url" : "http://dcr.maxminers.net:7727",
      "user" : "Login.Worker",
      "pass" : "password"
   },
   {
      "url" : "http://dcr.suprnova.cc:9110",
      "user" : "Login.Worker",
      "pass" : "password"
   }
]
```

> Passo 5

Salve o `cgminer.conf` e feche o `cgminer.exe`. Clique duas vezes no programa cgminer e ele irá iniciar e carregar o arquivo de configuração recém-criado. Isso conclui o guia básico de configuração do pool cgminer. Para obter mais informações sobre o uso do cgminer e explicações detalhadas sobre as funções do programa, consulte o [README Cgminer] (https://github.com/decred/cgminer/blob/3.7/README).
