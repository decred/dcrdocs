# Diferenças de linha de comando em sistemas operacionais

Esta página foi atualizada pela última vez para v1.0.0.

---

O objetivo desta página é explicar as principais diferenças para a execução da aplicação por linha de comando nas diferentes plataformas Windows, Linux e MacOS.

---

> Comandos de inicialização

A maior grande diferença entre as aplicações por linha de comando (`dcrd`,`dcrwallet`,`dcrctl`) é como você executa a partir da linha de comando. Isso não é tanto de um sistema operacional como é uma diferença em shells. O Windows vem com o Command Prompt e o PowerShell instalados. O macOS dentro do aplicativo Terminal usa o Bash e muitas distribuições Linux usam o Bash também. Abaixo estão exemplos dos comandos de execução básicos para Bash e Prompt de Comando.

**Prompt de comando:** `dcrd.exe`, `dcrwallet.exe`, `dcrctl.exe` <br />
**Bash:** `./dcrd`, `./dcrwallet`, `./dcrctl`

Alguns de nossos guias podem ser OS-agnostic com a execução dos comandos. Se um guia diz para executar `dcrctl --wallet getbalance`, está se referindo ao uso de`dcrctl.exe --wallet getbalance` para Command Prompt e `./dcrctl --wallet getbalance` para Bash.

> Local do Diretório de Aplicativos

A outra maneira para os clientes que usam linha de comando é a localização de cada diretório (blocos, carteiras, arquivos de configuração são todos armazenados no diretório de dados). Abaixo está uma tabela dos diretórios padrões para cada aplicação.

| Sistema operacional      | dcrd, dcrwallet, dcrctl Diretórios de aplicativos      | 
| -------:|:--------------------------------------------- |
| Windows | `C:\Users\<your-username>\AppData\Local\dcrd\`      |
|         | `C:\Users\<your-username>\AppData\Local\dcrwallet\` | 
|         | `C:\Users\<your-username>\AppData\Local\dcrctl\`    |
| macOS   | `~/Library/Application Support/dcrd/`         |
|         | `~/Library/Application Support/dcrwallet/`    |
|         | `~/Library/Application Support/dcrctl/`       |
| Linux   | `~/.dcrd/`                                    |
|         | `~/.dcrwallet/`                               |
|         | `~/.dcrctl/`                                  |

