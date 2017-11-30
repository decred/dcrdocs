# Problemas e Erros Comuns

## Paymetheus 

#### 1. Acabei de começar a usar a Paymetheus mas parece que ela está travada.

Será feito o download da blockchain na primeira vez que você rodar a Paymetheus. Isso pode levar até
uma hora e dará a impressão que a Paymetheus está inativa.

#### 2. Frase de acesso inválida para chave privada master. 

Essa é apenas uma forma mais longa de dizer "Senha incorreta". Você digitou uma senha errada para sua
carteira.

#### 3. "Unable to purchase tickets: insufficient funds available..." mas a carteira diz que eu tenho o bastante.

Existe um bug conhecido na Paymetheus no qual fundos imaturos são contabilizados como disponíveis. Depois que um ticket é votado
respeita-se um período de 256 blocos onde os fundos ainda estão bloqueados. Nessa fase eles são chamados de imaturos. Quando esse prazo termina
os fundos poderão ser utilizados novamente. 

#### 4. A Paymetheus está mostrando um balanço errado. 

> Estas instruções são válidas até a versão 0.8.x e podem não funcionar em versões mais recentes.

Se a Paymetheus mostra um balanço errado, pode-se consertar isso usando o comando line utility para sobrescrever alguns arquivos.
Uma parte disso pode ser confusa se você não estiver familiarizado com a linha de comando mas apenas siga as instruções linha a linha
e tudo dará certo. Onde você vir comandos que `se parecem como este`, só os copie e cole na linha de comando, exatamente como aparecem.
Não se esqueça de digitar <ENTER> após cada comando. Se tiver problemas, acesse nosso [Slack channel](https://decred.slack.com) para que alguém te ajude,
porém, antes, verifique o comando e certifique-se de tê-lo inserido corretamente. Você precisará da seed de sua carteira. Esse processo levará cerca de 15 minutos.

1. Estamos prestes a abrir três janelas PowerShell. Aperte a tecla Window. Digite 'powershell' (não digite as aspas nem aqui e nem depois) e em seguida aperte ENTER.    
2. Faça isso por mais duas vezes.
3. Movimente as janelas de forma que consiga ver todas elas.
4. Copie e cole o seguinte comando: `cd $env:programfiles/decred/paymetheus` (Nota: na powershell aperte CTRL+V ou clique com o botão direito do mouse para colar). Aperte ENTER.
5. Execute o mesmo comando nas outras duas janelas.
6. Abra o Windows Explorer.
7. Cole `%localappdata%/decred/paymetheus` na barra de procura. Dê ENTER.
8. Apague a pasta 'mainnet'.
9. Vá até uma das janelas PowerShell e cole `./dcrd -u <username> -P <password>`. Aperte ENTER.
10. Vá até a outra janela Powershell e cole `./dcrwallet --appdata=$env:localappdata/decred/paymetheus --create`
11. Siga as mensagens na tela e importe sua seed. Selecione 'não' ao ser solicitada uma camada adicional de criptografia e 'sim' ao ser perguntado se você possui uma seed.
12. No prompt, insira as palavras de sua seed e aperte ENTER duas vezes. 
13. Cole o seguinte comando na mesma janela: `./dcrwallet -u <username> -P <password> --appdata=$env:localappdata/decred/paymetheus`. Aperte ENTER.
14. Insira a frase de acesso privada que usou ao criar a carteira.
15. Vá até a terceira janela PowerShell e cole `./dcrctl -u <username> -P <password> --wallet -c $env:localappdata/decred/paymetheus/rpc.cert getbalance`. Aperte ENTER.
16. Pressione CTRL+C nas duas primeiras janelas para fechar os programas (dcrd and dcrwallet).
17. Pode fechar todas as três janelas PowerShell.
18. Volte à janela do Explorer. Apague os dois arquivos, rpc.cert e rpc.key.
19. Inicie o programa Decred para começar a utilizar de novo a Paymetheus.

-----

## Proof-of-Stake 

#### 1. Alguns de meus tickets perdidos/expirados ainda estão bloqueados por mais de um dia. 

1. Inicie o processo da carteira utilizando o marcador `--enablevoting`. Não serão classificadas revogações sem isso.
2. Desbloqueie a carteira com `dcrctl --wallet walletpassphrase <yourpassphrase> 0`. A carteira deverá estar desbloqueada para ser possível criar as revogações e assinalá-las.
3. Oriente o dcrd para notificar novamente a carteira a respeito de tickets perdidos para que as revogações, dessa forma, sejam marcadas com `dcrctl rebroadcastmissed`.


À essa altura você já deverá ver alguns detalhes sobre as transações de revogação no log da carteira.
Uma vez que essas transações forem mineradas em um bloco (o qual deverá ser justamente o próximo),
os fundos serão movidos para a categoria immaturestakegeneration no `dcrctl --wallet`
getbalance output. Finalmente, após 256 blocos, os fundos irão para a categoria spendable, ficando assim disponíveis para serem gastos.
