# Princípios básicos de inicialização

Este guia foi atualizado pela última vez para v1.0.0.

---

Este guia destina-se aos usuários e aplicação por linha de comando. Já os usuários da Paymetheus e Decrediton podem ignorar com segurança o uso de arquivos de configuração, pois a Paymetheus e a Decrediton instalam as configurações básicas automaticamente. Mas também vale a pena notar que alguns de nossos guias mostram arquivos de configurações e outros guias mostram comandos para inicialização da aplicação.

---

## Locais dos arquivos de configuração

Todos os softwares da Decred, quando iniciado, lê a partir de um arquivo de configuração para determinar quais configurações ele deve ativar/desativar/configurar durante essa carga inicial. Todos os flags de inicialização por linha de comando `(e.g. dcrwallet --testnet)` podem ser substituídos por configurações dentro de um arquivo de configuração apropriado `(e.g. dcrwallet --testnet could be replaced by testnet=1 in dcrwallet.conf)`.

Esses arquivos de configuração estão localizados dentro do diretório inicial da aplicação. O local desses diretórios iniciais são default para o Windows, macOS e Linux, listados abaixo:

Windows:

    C:\Users\<username>\AppData\Local\Dcrwallet\
    C:\Users\<username>\AppData\Local\Dcrd\
    C:\Users\<username>\AppData\Local\Dcrctl\ 
    C:\Users\<username>\AppData\Local\Decred\Paymetheus

macOS: 

    ~/Library/Application Support/Dcrwallet/
    ~/Library/Application Support/Dcrd/
    ~/Library/Application Support/Dcrctl/
    ~/Library/Application Support/decrediton/
    
Linux: 
    
    ~/.dcrwallet/
    ~/.dcrd/
    ~/.dcrctl/
    ~/.config/decrediton

Cada uma dessas pastas permite o seu próprio arquivo `.conf`, nomeado após a aplicação individual (`e.g. dcrd uses dcrd.conf`). Observe também que o `Dcrd` e `Dcrwallet` são criados nos diretórios iniciais automaticamente quando cada aplicativo é iniciada pela primeira vez. Para `Dcrctl` você terá que criar manualmente um diretório inicial para utilizar um arquivo de configuração.

O [dcrinstall](/getting-started/user-guides/cli-installation.md) o método de instalação cria automaticamente arquivos de configuração, com o[Definições de configuração mínimas](/advanced/manual-cli-install.md#minimum-configuration) já habilitado.

O [Manual de Instalação](/advanced/manual-cli-install.md#installation) inclui amostras simples para a configuração de arquivos dentro do .zip/.tar.gz. Recomenda-se copiar esses arquivos de configuração para o diretório apropriado descrito acima E renomeie-os para remover 'sample-'. Esses arquivos têm muitas configurações comentadas (os comentários não são lidos pelo aplicação durante o tempo de execução) então, todas essas configurações estão efetivamente desabilitadas. Você pode ativar essas configurações pré-escritas simplesmente eliminando o ponto e vírgula antes da linha.

---

## Flags de comandos de Inicialização

A maioria das configurações você mesmo pode definir através do arquivo de configuração,  pode também ser passado como parâmetros durante a inicialização do aplicativo. Por exemplo, os seguintes comandos são específicos do sistema operacional e abrirão o `dcrd` para o uso do Testnet, uma alternativa para usar `testnet=1` no seu arquivo de configuração:

    Windows: dcrd.exe --testnet
    macOS: ./dcrd --testnet
    Linux: ./dcrd --testnet

O exemplo acima é o primeiro a ser olhado para configurar o arquivo de configuração  `dcrd`, em seguida, veja o comando do executável para habilitar a configuração testnet.

---

## Uso Avançado

[Storing Login Details in Config Files](/advanced/storing-login-details.md) <!-- Esta mesma informação é encontrada acima na seção de configuração mínima. Provavelmente poderia ser excluida. -->

[Lista completa de opções para cada aplicativo](/advanced/program-options.md)
