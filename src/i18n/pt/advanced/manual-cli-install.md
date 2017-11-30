# Instalação Manual da CLI

---

The newest Binary Releases can be found here: [https://github.com/decred/decred-binaries/releases](https://github.com/decred/decred-binaries/releases). With the exception of the `.msi` and `.dmg` files, they are archives of the latest executable binaries for each release. Although most of this will be unzip and go, instructions are provided for macOS, Linux, and Windows below (assumed proficiency for *BSD users).

> macOS

1. Baixe o arquivo correto:

    For 32-bit computers, download the `decred-darwin-386-v1.1.0.tar.gz` file. <br />
    For 64-bit computers, download the `decred-darwin-amd64-v1.1.0.tar.gz` file.

2. Navegue até o local de download e extraia o arquivo .tar.gz:

    Finder: basta clicar duas vezes no arquivo .tar.gz. <br />
    Terminal: use o comando `tar -xvzf filename.tar.gz`.

    ** NOTA **: Se você estiver usando o Safari no macOS Sierra e tiver habilitada a configuração de "abrir arquivos seguros após a transferência", os arquivos .gz e .zip serão automaticamente descompactados após o download. O comando `tar -xvzf filename.tar.gz` resulta neste erro:` tar: Error opening archive: Failed to open 'filename.tar.gz`. Use `tar -xvzf filename.tar` em vez disso (remova o .gz do comando anterior).
    
    Both of these should extract the tar into a folder that shares the same name. (`e.g. tar -xvzf decred-darwin-amd64-v1.1.0.tar.gz` should extract to `decred-darwin-amd64-v1.1.0`). It should include `dcrctl`, `dcrd`, `dcrwallet`, `sample-dcrctl.conf`, `sample-dcrd.conf`, and `sample-dcrwallet.conf`.


> Linux

1. Baixe o arquivo correto:

    For 32-bit computers, download the `decred-linux-386-v1.1.0.tar.gz` file. <br />
    For 64-bit computers, download the `decred-darwin-amd64-v1.1.0.tar.gz` file. <br />
    For 32-bit ARM computers, download the `decred-linux-arm-v1.1.0.tar.gz` file. <br />
    For 64-bit ARM computers, download the `decred-linux-arm64-v1.1.0.tar.gz` file.

2. Abra a pasta onde o arquivo foi baixado e descompacte o arquivo .tar.gz:

   No navegador de arquivos do Ubuntu: simplesmente clique com o botão direito do mouse no arquivo .tar.gz e selecione "Extrair aqui". <br />
    Terminal: use o comando `tar -xvzf filename.tar.gz`.
    
    Both of these should extract the tar.gz into a folder that shares the same name. (`e.g. tar -xvzf decred-darwin-amd64-v1.1.0.tar.gz` should extract to `decred-darwin-amd64-v1.1.0`). It should include `dcrctl`, `dcrd`, `dcrwallet`, `sample-dcrctl.conf`, `sample-dcrd.conf`, and `sample-dcrwallet.conf`.

> Windows

Nota: O Windows 7/8/10 tem suporte nativo a arquivos `.zip`, portanto é preferível que se use este o arquivo `.zip`, a fim de evitar o uso de software de terceiros para extrair arquivos `.tar.gz`. As instruções fornecidas referem-se ao arquivo `.zip`.

1. Faça download do arquivo correto:

    For 32-bit computers, download the `decred-windows-386-v1.1.0.zip` file. <br />
    For 64-bit computers, download the `decred-windows-amd64-v1.1.0.zip` file.

2. Navegue até o local de download e extraia o arquivo `.zip`:

    File Explorer: Clique com o botão direito no arquivo .zip, selecione "Extrair Tudo" e você deverá ver uma janela perguntando em qual pasta os arquivos devem ser extraídos. O padrão é que se extraia o arquivo `.zip` para uma pasta com o mesmo nome. Ela deve incluir os arquivos `dcrctl`, `dcrd`, `dcrwallet`, `sample-dcrtl.conf`, `sample-dcrd.conf` e `sample-dcrd.conf`.

Se você resolver baixar o arquivo `.tar.gz`, precisará realizar duas extrações separadamente em algum programa de terceiros (7-zip, winRAR, etc...) para obter os binários.

---

## Configuração Mínima

Em sua utilização mais básica, `dcrd`, `dcrwallet`, and `dcrctl` precisam ser executados utilizando os mesmos rpcuser/rpcpass para que possam comunicar-se entre si. Para configurar manualmente, por favor, siga estes passos:

1. Se as pastas home do sistema operacional listadas na seção [arquivos de configuração](#configuration-file-locations) acima não existem, por favor, crie-as para `dcrd`, `dcrwallet`, e `dcrctl`.
2. Using your favourite text editor, create a new file enter the text, `[Application Options]` as the first line. Save it as `dcrd.conf` in `dcrd`'s home directory.
3. Create another new file and add the text `[Application Options]` to the first line as before. Save it as `dcrwallet.conf` in `dcrwallet`'s home directory.
4. Create a third text file and save it as `dcrctl.conf` in `dcrctl`'s home directory. You don't need to add anything to this one right now.
5. Escolha um nome de usuário e senha arbitrários, estes só serão utilizados para cada aplicação se comunicar através da chamada de procedimento remoto. A configuração mais fácil é configurá-los todos iguais.
6. Dentro de `dcrd.conf`, abaixo de  `[Opções de Aplicação]`, adicione as seguintes linhas:<br /><br />
        `rpcuser=<chosen-username>`<br />
        `rpcpass=<chosen-password>`<br /><br />
7. Dentro de `dcrwallet.conf`, abaixo de` [Opções de Aplicação] `, adicione as seguintes linhas:<br /><br />
        `username=<chosen-username>`<br />
        `password=<chosen-password>`<br /><br />
8. Dentro de `dcrctl.conf`, adicione as seguintes linhas:<br /><br />
`rpcuser=<chosen-username>`<br />
`rpcpass=<chosen-password>`<br /><br />
9. Salve todos os três arquivos de configuração.

Please see the [sample config](https://github.com/decred/dcrd/blob/master/sampleconfig/sampleconfig.go#L8-L352) for more customisation options.