# <i class="fa fa-windows"></i> Guia para Usuários Windows

---

## <i class="fa fa-cloud"></i> Conectando o dcrd à rede Decred 

> Passo 1

Note que todos os comandos`dcrd`, `dcrwallet` e `dcrctl` devem ser executados no diretório onde estão seus arquivos Decred! Inicie `dcrd`:

```no-highlight
C:\Decred> dcrd -u <username> -P <password>
```

Inicie o dcrwallet:

```no-highlight
C:\Decred> dcrwallet -u <username> -P <password>
```

> Passo 2

Gere um novo endereço da carteira:

```no-highlight
C:\Decred> dcrctl -u <username> -P <password> --wallet getnewaddress
```

Copie o novo endereço (output do último comando). Feche/pare `dcrd` e` dcrwallet` pressionando `ctrl+c` em cada janela.

> Passo 3

Reinicie o `dcrd` usando o comando:

```no-highlight
C:\Decred> dcrd --miningaddr <new address from step two or your web client wallet address>
```

---

## <i class="fa fa-download"></i> Baixe e extraia o cgminer 

Visite https://github.com/decred/cgminer/releases para encontrar a última versão do cgminer. Para o Windows 64-bit, baixe e extraia `cgminer-decred-w64_*.zip`. Para o Windows 32-bit, baixe e extraia `cgminer-decred-w32_*.zip`. Extraia todos arquivos para uma nova pasta e abra a nova pasta para visualizar os arquivos.

---

## <i class="fa fa-play-circle"></i> Inicialize e execute o cgminer 

> Passo 1

Clique com o botão direito em `start_local.bat` e clique em `Editar`. Mude o nome de usuário e a senha para que fique igual as credenciais no utilizadas no passo 1. Salve e feche start_local.bat. Para referência, este é o comando em start_local.bat:

```no-highlight
C:\Decred> cgminer --blake256 -o https://127.0.0.1:9109 -u <username> -p <password> --cert "%LOCALAPPDATA%\Dcrd\rpc.cert"
```

> Passo 2

Se dcrd não acabou de sincronizar a blockchain, espere finalizar, então prossiga para o próximo passo. Quando estiver finalizado, será mostrado:

```no-highlight
[INF] BMGR: Processed 1 block in the last 5m34.49s
```

> Passo 3

Clique duas vezes em `start_local.bat`. `cgminer` que deve abrir. Crie um arquivo de configuração `cgminer` pressionando as seguintes teclas: `S` (Settings), `W` (Write Config File), `Enter` (Salve o arquivo como `cgminer.conf`). Observe que `cgminer.conf` será colocado no mesmo diretório que o cgminer. Cgminer agora pode ser iniciado simplesmente clicando duas vezes em `cgminer.exe`. Isso conclui o guia básico de instalação solo cgminer. Para obter mais informações sobre o uso de cgminer e explicações detalhadas sobre as funções do programa, consulte a referência oficial [cgminer README](https://github.com/decred/cgminer/blob/3.7/README).
