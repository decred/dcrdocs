# <i class="fa fa-hdd-o"></i> Armazenar Detalhes de Login

Todos os parâmetros que são especificados na linha de comando enquanto inicia dcrd,
Dcrwallet e dcrctl também podem ser mantidos em arquivos de configuração. Isto é
uma boa maneira de armazenar suas credenciais de login, para que você não precise
incluí-los em scripts ou digitá-los no terminal, a todo
tempo.

---

## <i class="fa fa-laptop"></i> Noções básicas de arquivos de configuração

Se não estiver familiarizado com os conceitos básicos de arquivos de configuração, reveja as informações encontradas em nosso [Introdução as Configurações de Inicialização](/getting-started/startup-basics.md#configuration-files) page.

---

## <i class="fa fa-terminal"></i> dcrd.conf 

Escolha qualquer username e password que você deseja nos seguintes passos. Você não precisa registrar esses itens
em qualquer lugar, pois eles só serão usados para permitir que o `dcrwallet` e` dcrctl` se comuniquem com o  `dcrd`.

> Usando o arquivo de configuração de amostra

Siga os passos abaixo se você já copiou os exemplos dos arquivos de configuração para seus diretórios apropriados.

1. Navegue até a pasta do aplicativo `dcrd` conforme descrito em nossa [Introdução as Configurações de Inicialização](/get-started/startup-basics.md#configuration-files).
2. Abra o `dcrd.conf` em um editor de texto.
3. Procure as seguintes linhas:

    `;rpcuser=` <br />
    `;rpcpass=`

4. Descomente as linhas removendo o ponto e vírgula e adicione o nome de usuário e a senha escolhidos para as linhas apropriadas.

> Criando um novo arquivo de configuração

Siga os passos abaixo se você **não** copiou os exemplos dos arquivos de configuração para seus diretórios apropriados.

1. Navegue até a sua pasta do aplicativo `dcrd` conforme descrito em nosso [Introdução as Configurações de Inicialização](/getting-started/startup-basics.md#configuration-files).
2. Crie um novo arquivo de texto.
3. Renomeie para `dcrd.conf`.
3. Abra o `dcrd.conf` em um editor de texto.
4. Adicione as seguintes linhas:

```no-highlight
[Application Options]

rpcuser=<username>
rpcpass=<password>
```

---

## <i class="fa fa-terminal"></i> dcrwallet.conf 

O procedimento para `dcrwallet.conf` é muito semelhante ao procedimento para` dcrd.conf`.

Por favor observe que se os valores de `username=` e `password=`  no `dcrwallet.conf` não correspondem aos valores de `rpcuser=` e `rpcpass=` no `dcrd.conf`, você precisará configurar o `dcrdusername=` e `dcrdpassword=` no `dcrwallet.conf` para o valores `rpcuser`/`rpcpass` achado no `dcrd.conf` (é mais fácil configurar o mesmo username/passwords).

> Usando o arquivo de configuração de amostra

Siga os passos abaixo se você já copiou os exemplos dos arquivos de configuração para seus diretórios apropriados.

1. Navegue até a sua pasta do aplicativo `dcrwallet` conforme descrito em nosso [Introdução as Configurações de Inicialização](/getting-started/startup-basics.md#configuration-files).
2. Abra o `dcrwallet.conf` em um editor de texto.
3. Procure as seguintes linhas:

    `;username=` <br />
    `;password=`

4. Descomente as linhas removendo o ponto e vírgula e adicione o nome de usuário e a senha escolhidos para as linhas apropriadas.

> Criando um novo arquivo de configuração

Siga os passos abaixo se você **não** copiou os exemplos dos arquivos de configuração para seus diretórios apropriados.

1. Navegue até a sua pasta do aplicativo `dcrwallet` conforme descrito em nosso [Introdução as Configurações de Inicialização](/getting-started/startup-basics.md#configuration-files).
2. Crie um novo arquivo de texto.
3. Renomeie para `dcrwallet.conf`.
3. Abra o `dcrwallet.conf` em um editor de texto.
4. Adicione as seguintes linhas:

```no-highlight
[Application Options]

username=<username>
password=<password>
```

Se você definir a senha pública opcional para a carteira (a segunda senha
durante a criação da carteira), você pode também adicionar ao `dcrwallet.conf`:

```no-highlight
walletpass=<yourwalletpassword>
```

Você não pode especificar a sua senha privada da carteira nos arquivos de configuração. Que isso deve ser inserido manualmente com `dcrctl`.

---

## <i class="fa fa-terminal"></i> dcrctl.conf 

Novamente isso é mais fácil para configurar o mesmo username/passwords juntamente nos `dcrd.conf`,` dcrwallet.conf` e `dcrctl.conf`. Se você usou credenciais diferentes para o dcrwallet, você precisará especificar um aqui e o outro na linha de comando ao emitir comandos.

> Usando o arquivo de configuração de amostra

Siga os passos abaixo se você já copiou os exemplos dos arquivos de configuração para seus diretórios apropriados.

1. Navegue até a sua pasta do aplicativo `dcrctl` conforme descrito em nosso [Introdução as Configurações de Inicialização](/getting-started/startup-basics.md#configuration-files).
2. Abra o `dcrctl.conf` em um editor de texto.
3. Procure as seguintes linhas:

    `;rpcuser=` <br />
    `;rpcpass=`

4. Descomente as linhas removendo o ponto e vírgula e adicione o nome de usuário e a senha escolhidos para as linhas apropriadas.

> Criando um novo arquivo de configuração

Siga as etapas abaixo se você **não** copiou os arquivos de configuração de exemplo para seus diretórios apropriados.

1. Navegue até a sua pasta do aplicativo `dcrctl` conforme descrito em nosso [Introdução as Configurações de Inicialização](/getting-started/startup-basics.md#configuration-files).
2. Crie um novo arquivo de texto.
3. Renomeie para `dcrctl.conf`.
3. Abra o `dcrctl.conf` em um editor de texto.
4. Adicione as seguintes linhas:

```no-highlight
[Application Options]

rpcuser=<username>
rpcpass=<password>
```

---

## <i class="fa fa-tasks"></i> Opções de Configurações Adicionais

Todas as opções de linha de comando podem ser atribuídas no arquivo de configuração.
O exemplo dos arquivos de configuração do pacote de lançamento fornecem opções adicionais
ou você pode executar um dos programas com a flag `-h` para mostrar uma lista e descrição de todas as opções para aplicação especificada.

Existe também uma lista completa de opções para cada aplicação que pode ser encontrada [aqui](/advanced/program-options.md).
