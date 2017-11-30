# <i class="fa fa-linux"></i> Guia para Usuários Linux

---

## <i class="fa fa-download"></i> Baixe e extraia o cgminer 

Visite https://github.com/decred/cgminer/releases para encontrar a versão mais recente do cgminer. Para baixar e extrair os arquivos através do terminal, execute os seguintes comandos. Note que este exemplo faz o download do cgminer v0.0.4.

```no-highlight
~/Decred/$ wget "https://github.com/decred/decred-release/releases/download/v0.0.4_cgminer/cgminer-decred-linux-x86_64-20160208.tar.gz"
~/Decred/$ tar -xvf cgminer*
```

Mude para o novo diretório cgminer:

```
~/Decred/$ cd cgminer*
```

## <i class="fa fa-play-circle"></i> Inicialize e execute o cgminer 

> Passo 1

Digite o seguinte na janela do terminal para listar se seu hardware é capaz de suportar a mineração:

```no-highlight
~/Decred/$ ./cgminer -n
```

Você deverá ver suas placas de vídeo listadas pelo seu nome de código GPU ou o nome do driver. A última linha de saída deve mostrar o número de GPUs compatíveis com as quais você pode explorar.

> Passo 2 (Opcional)

Para comparar seu sistema e descobrir o hashrate para sua GPUs e executar, use o comando:

```no-highlight
~/Decred/$ ./cgminer --blake256 --benchmark
```

> Passo 3

Registre-se em um dos sites Pool operacionais e configure um novo minerador para cada um dos seus computadores de mineração. Consulte o site da pool de sua escolha para obter instruções, se necessário. Na sua janela de linha de comando do primeiro passo, digite o seguinte comando para iniciar cgminer (ignorar colchetes):

```no-highlight
~/Decred/$ ./cgminer --blake256 -o<pool url>:<port number>-u <web login>.<worker name> -p <worker password>
```

Exemplo:

```no-highlight
~/Decred/$ ./cgminer --blake256 -o http://dcr.maxminers.net:7727 -u DecredMiner.miner1 -p 7@!x5L1
```

> Passo 4

Cgminer agora deve iniciar. Crie um arquivo de configuração do cgminer pressionando as seguintes teclas: `S` (Settings),`W` (Write Config File), `Enter` (Salve o arquivo de configuração como `cgminer.conf`). Observe que `cgminer.conf` será colocado no mesmo diretório que o `cgminer`. Para adicionar quaisquer outras pools ao seu arquivo de configuração, abra o arquivo `cgminer.conf` com Gedit (GUI) / Pico (CLI) ou um editor de texto semelhante. Podem ser adicionados várias pools seguindo esta sintaxe na seção "pools" do arquivo de configuração (observe a vírgula entre cada entrada de pool individual):

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

Salve o `cgminer.conf` e feche o `cgminer`. Reinicie o cgminer usando o comando:

```no-highlight
~/Decred/$ ./cgminer
```

Isso conclui o guia básico de instalação pool cgminer. Para obter mais informações sobre o uso do cgminer e explicações detalhadas sobre as funções do programa, consulte o doc oficial [cgminer README](https://github.com/decred/cgminer/blob/3.7/README).
