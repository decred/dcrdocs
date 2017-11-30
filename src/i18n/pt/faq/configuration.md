# <i class="fa fa-desktop"></i>Configuração

---

#### 1. Como posso ver a informação sobre quais números de porta o `dcrd` utiliza?

Você pode obter os números das portas [^8929] usando os parâmetros `-h` ou `--help` em `dcrd`

```no-highlight
dcrd -h
```

Procure a seguinte linha:

```no-highlight
--rpclisten=  Add an interface/port to listen for RPC connections (default port: 9109, testnet: 19109)
```

Isso também é registrado quando você inicia o `dcrd`:

```no-highlight
12:01:46 2016-02-08 [INF] RPCS: RPC server listening on [::1]:9109
12:01:46 2016-02-08 [INF] RPCS: RPC server listening on 127.0.0.1:9109
```

---

#### 2. O que você quer dizer com arquivos de configuração do `dcrd`, `dcrwallet` e `dcrctl`?

Cada aplicação (`dcrd`, `dcrwallet`, `dcrcrtl`) pode ter seu próprio arquivo de configuração[^9055]. Utilize `-h` e verifique a localização padrão do arquivo de configuração ao lado de (`-C`, `--configfile`). Crie um arquivo de texto nessa pasta e nomeie-o de acordo com a localização que você acabou de ver.

Você pode utilizar [esse modelo do arquivo de configuração](https://github.com/decred/dcrd/blob/master/sample-dcrd.conf) do `dcrd` e [esse modelo aqui](https://github.com/decred/dcrwallet/blob/master/sample-dcrwallet.conf) do arquivo de configuração do `dcrwallet` para configurar as opções que você quiser. Você pode fazer a mesma coisa para o `dcrctl`. O formato é o mesmo. Todos as opções de comandos listados por `-h` podem ser configuradas nos arquivos de configuração (mas neles deve-se usar o nome longo das opções)

Uma vez que esses arquivos tenham sido devidamente criados, você não precisará mais adicionar opções aos comandos o tempo todo. Por exemplo, você pode executar `dcrctl` sem precisar passar nenhum parâmetro via linha de comando.

```no-highlight
dcrctl getnetworkhashps
2547036949350
```

---

#### 3. Posso executar daemons mainnet e testnet e carteiras ao mesmo tempo na mesma máquina?

Sim[^9264], você só precisa adicionar a flag `--testnet` aos spots apropriados (`dcrd`, `dcrwallet`, `dcrctl`) e tudo vai correr bem. É por isso que usamos portas e pastas para dados/logs diferentes!

---

#### 4. Quais são as implicações, do ponto de vista de segurança, de usar as mesmas senhas de autenticação do servidor RPC para `dcrd` e `dcrwallet`? 

Você consegue fazer muito menos coisa acessando `dcrd` do que acessando `dcrwallet`. Importante: o acesso do RPC[^11480] a `dcrwallet`, quando a wallet está desbloqueada, pode ser usado para transferir coins.

Quando `dcrd` e `dcrwallet` estão na mesma máquina, isso provavelmente não importa muito. Mas quando você está rodando setups mais seguros onde a wallet está em uma máquina separada de `dcrd`, você obviamente vai querer usar credenciais diferentes para cada uma. Lembre-se que `dcrd` precisa estar em uma máquina conectada à internet para permanecer conectado à rede (baixar os dados da blockchain, transmitir transações, essas coisas).

Por outro lado, a `dcrwallet` onde estão suas coins, por questões de segurança, deveria estar em um sistema sem acesso à internet, já que é muito mais difícil que alguém roube suas coins  se essa wallet estiver em uma máquina onde não há acesso à internet. Obviamente, se você está deixando suas coins em stake, você vai precisar de pelo menos uma instância de `dcrwallet` conectada à internet. Portanto, o setup mais seguro seria ter uma instância "cold" de `dcrwallet` em uma máquina sem conexão com a internet e uma segunda instância, uma que seja "hot", de `dcrwallet` (usando uma seed diferente, é claro) para a qual a instância cold de dcrwallet  delega poder de voto por meio do parâmetro `--ticketaddress`, ambas usando credenciais diferentes.

---

#### 5. Por que eu estou conectando somente em 8 outbound peers? 

Há um limite intencional não configurável de 8 outbound peers[^15399]. Mais outbound peers do que isso não o ajuda de nenhuma forma e na verdade é pior tanto para você quanto para a rede. Isso foi testado extremamente bem no Bitcoin, incluindo o btcsuite (o projeto upstream para Decred). Tudo o que você faria ao aumentar suas conexões outbound é o desperdício de slots valiosos dos relativamente poucos public peers que existem (há sempre um número muito maior de "leechers" do que "seeders").

Por outro lado, o aumento de suas conexões máximas, que na verdade só aumenta o número de conexões de entrada permitidas, contribui com a rede, garantindo a existência de mais slots disponíveis para novos nodes e clientes SPV.

---

## <i class="fa fa-book"></i>Fontes

[^8929]: Fórum da Decred, [Post 8,929](https://forum.decred.org/threads/600/#post-8929)
[^9055]: Fórum da Decred, [Post 9,062](https://forum.decred.org/threads/472/page-12#post-9062)
[^9264]: Fórum da Decred, [Post 9,264](https://forum.decred.org/threads/626/#post-9264)
[^11480]: Fórum da Decred, [Post 11,480](https://forum.decred.org/threads/428/#post-11480)
[^15399]: Fórum da Decred, [Post 15,399](https://forum.decred.org/threads/1371/page-2#post-15399)
