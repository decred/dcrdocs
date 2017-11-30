# <i class="fa fa-linux"></i> Guia para Usuários Linux

---

## <i class="fa fa-cloud"></i> Conectando o dcrd à rede Decred

> Passo 1

Observe que todos os comandos `dcrd`, `dcrwallet`, e `dcrctl` devem ser executados no diretório onde seus arquivos da Decred estão! Comece com `dcrd`:

```no-highlight
~/Decred/$ ./dcrd -u <username> -P<password>
```

Inicie o dcrwallet:

```no-highlight
~/Decred/$ ./dcrwallet -u <username> -P<password>
```

> Passo 2

Gere um novo endereço da carteira:

```no-highlight
~/Decred/$ ./dcrctl -u <username> -P <password> --wallet getnewaddress default
```

Copie o novo endereço (saída do último comando). Close/stop `dcrd` e `dcrwallet` pressionando `ctrl+c` em cada janela.

> Passo 3

Reinicie o `dcrd` usando o comando:

```no-highlight
~/Decred/$ ./dcrd -u <username> -P <password> --miningaddr <new address from step two or your web client wallet address>
```

> Passo 4

Configure a segurança TLS copiando rpc.cert para /usr/share/ca-certificates:

```no-highlight
sudo cp /home/<username>/.dcrd/rpc.cert /usr/share/ca-certificates/dcrd.crt
```

Use um editor de texto para adicionar a linha "dcrd.crt" (sem aspas) para /etc/ca-certificates.conf:

```no-highlight
sudo gedit /etc/ca-certificates.conf
```

Atualize a lista de certificados CA:

```no-highlight
sudo update-ca-certificates
```

---

## <i class="fa fa-download"></i> Baixe e extraia o cgminer 

Visitehttps://github.com/decred/cgminer/releases para encontrar a versão mais recente do cgminer. Para fazer o download e extrair através do seu terminal Linux, use os seguintes comandos:

```no-highlight
wget https://github.com/decred/decred-release/releases/download/v0.0.4_cgminer/cgminer-decred-linux-x86_64-20160208.tar.gz
tar -xvf cgminer-decred-linux-x86_64-20160208.tar.gz
```

---

## <i class="fa fa-play-circle"></i> Inicialize e execute o cgminer 

> Passo 1

Se `dcrd` não tiver terminado de sincronizar com a blockchain, aguarde até que ele termine, então vá para o próximo passo. Quando isso terminar, mostará:

```no-highlight
[INF] BMGR: Processed 1 block in the last 5m34.49s
```

> Passo 2

No seu diretório do cgminer, inicie o cgminer com o comando:

```no-highlight
~/Decred/$ ./cgminer --blake256 -o https://127.0.0.1:9109 -u <username> -p <password>
```

Crie um arquivo de configuração do cgminer pressionando as seguintes teclas: `S` (Settings), `W` (Write Config File), `Enter`, (Salve o arquivo como `cgminer.conf`). Observe que `cgminer.conf` será colocado no mesmo diretório que o cgminer. O Cgminer agora pode ser iniciado executando um simples comando:

```no-highlight
~/Decred/$ ./cgminer
```

Isso conclui o guia básico de instalação solo cgminer. Para obter mais informações sobre o uso do cgminer e explicações detalhadas sobre as funções do programa, consulte o doc oficial [cgminer README](https://github.com/decred/cgminer/blob/3.7/README).
