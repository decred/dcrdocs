# Pull Requests da Decred e Contribuições

---

Todos os códigos da Decred são mantidos no GitHub. Esse documento contem informações básicas sobre como nós lidamos com a distribuição dos códigos e como contribuir. Baseia-se parcialmente em um documento similar encontrado em  [btcsuite](https://github.com/btcsuite).

---

## Preparação inicial

Um bom primeiro passo é ler o [Guia para contribuição no código](https://github.com/decred/dcrd/blob/master/docs/code_contribution_guidelines.md) para ter um bom entendimento das politicas utilizadas no projeto. O documento foca inicialmente no código-base Go, mas continua sendo um bom início.

O seguinte exemplo vai ser dividido em duas seções, uma para os projetos Go (dcrd, dcrwallet, gominer, etc), e uma para os projetos que não utilizam Go (decrediton, Paymetheus, dcrdocs, etc). Em todos os casos, certifique-se de ler o LEIAME.md em cada projeto se você precisar de ajuda para configurar o projeto em questão.

---

## Modelo geral

Com esse processo, nós estamos tentando criar uma contribuição de maneira simples, enquanto mantemos um alto nível na qualidade do código e um histórico limpo. Membros do time Decred devem seguir os mesmos procedimentos que os contribuintes externos.

Nosso modelo de esboço para hacking do código é como se segue. Se algum desses modelos não fizer sentido, não se preocupe, isso será explicado com mais detalhes nas próximas seções.

1. Encontre um problema no qual você queira trabalhar. Se não tiver nenhuma descrição do seu problema, crie uma com o que você irá fazer.
1. Faça modificações no código em um branch à parte
1. Importe essas mudanças para o seu próprio repositório, o que você deu fork, no GitHub.
1. Quando o seu código estiver pronto para ser revisado ou se você quiser opiniões de outros desenvolvedores, faça um Pull Request (PR) no repositório principal na página do GitHub.
1. Adicione um comentário no Pull Request que descreva o problema que você está consertando. Coloque no texto Closes # ou Fixes # seguido do número do problema em uma única linha. Isso permite que o GitHub automaticamente vincule o Pull Request ao problema e feche o problema quando ela for fechada.
1. Você pode requisitar um revisor especifico da página do GitHub ou você pode pedir a alguém do irc/slack para revisar.
1. TODO código deve ser revisado e receber, pelo menos, uma aprovação antes de ser publicado. Somente membros da equipe podem dar uma aprovação oficial, mas comentários de outros usuários são bem vindos.
1. Se existirem mudanças requisitadas, faça essas mudanças e as envie para o seu branch local.
1. Faça Push dessas mudanças para o mesmo branch no qual você estava trabalhando. Ele vai aparecer assim na Pull Request e o revisor pode comparar com a versão anterior.
1. Once your code is approved, it can be merged into master.  To keep history clean, we only allow non-fast-forward merges (that means we want a linear history).  Most PRs also must be squashed to a single commit (although if there is reason to have it as multiple commits that can be considered on a case by case basis).
1. Se o seu PR for um único commit (ou pode ser squashed automaticamente pelo GitHub) e é  alcançado o master, o revisor irá fundir seu PR. Se sua ramificação estava muito atrasada, você pode ser solicitado a fazer o rebase do seu commit. Uma vez que é feito e empurrado, o revisor irá combinar seu commit.

---

## Go

Para projetos usando GO, você pode seguir esse procedimento. dcrd será usado como exemplo. Isto assuma que você tenha go1.6 ou mais recente instalado e um `$GOPATH` em funcionamento.

### Configuração única
- Fork dcrd no GitHub
- Execute os seguintes comandos para obter o dcrd, todas as dependências e instalá-lo:

```bash
$ mkdir -p $GOPATH/src/github.com/decred/
$ git clone https://github.com/decred/dcrd $GOPATH/src/github.com/decred/dcrd
$ cd $GOPATH/src/github.com/decred/dcrd
$ go dep ensure
$ go install . ./cmd/...
```

- Adicione um git remote para seu fork:

```bash
$ git remote add<yourname> https://github.com/<yourname>/dcrd.git
```

## Outros projetos

Para projetos não escritos em Go, a configuração inicial vai depender do projeto. Usarei o dcrdocs como exemplo aqui mas os passos básicos são os mesmos para qualquer um dos projetos. Configurações específicas podem ser vistas no projeto README.md (por exemplo como instalar mkdocs para usar no dcrdocs ou electron para decrediton).

### Configuração única
- Fork dcrd no GitHub
- Execute os comandos abaixo para obter dcrd, além de todas as dependências e instale-o:

```bash
$ mkdir -p code/decred
$ cd code/decred
$ git clone https://github.com/decred/dcrdocs
$ cd dcrdocs
```

- Adicione um git remote para seu fork:

```bash
$ git remote add <yourname>  https://github.com/<yourname>/dcrdocs.git
```

## Criando um novo recurso de pull request
- Encontre ou publique um novo no repositório do GitHub (o original, e não o seu fork) para a funcionalidade em que você deseja trabalhar.
- Marque a nova funcionalidade para armazenar as mudanças que você estará fazendo:

```bash
$ git checkout -b <feature_branch>
```
- Faça as mudanças necessárias para a funcionalidade e o commit.
- Empurre sua funcionalidade para o seu fork:

```bash
$ git push <yourname> <feature_branch>
```
- Com o seu navegador, visite https://github.com/decred/dcrd
- Crie uma pull request com GitHub UI. Você pode solicitar um revisor na página web do GitHub ou pode pedir a alguém no irc/slack.

## Rebase um pull requests dos seus pedidos existentes.

Às vezes, você será solicitado para rebase e squash a pull request para o ultimo master branch.

- Certifique-se de que o master branch esteja atualizado:

```bash
$ git checkout master
$ git pull
```
- Confira o recurso de ramificação existente e rebase-o com um flag interativo:

```bash
$ git checkou<feature_branch>
$ git rebase -i master
```
- Siga as instruções apresentadas para especificar 's' para squash e para os commits adicionais(o primeiro commit deve permanecer 'p' or 'pick').
- Escreva uma única mensagem de commit no editor que você definiu para incluir todos os commits incluídos.
- Salve e feche o editor, então, o git deve gerar um único commit com a mensagem que você especificou e todos os commits que você adicionou. Você pode verificar o commit com o comando ```git show```.
- Impulsione o branch para o Fork:

```bash
$ git push -f <yourname> <feature_branch>
```

## Outras considerações

Existem algumas outras coisas a serem consideradas ao fazer um pull requestr. No caso do código Go, já existe uma segurança de teste significativa. Se você esta adicionando o código, você também deve adicionar testes. Se você está corrigindo algo, você precisa ter certeza que você não quebre nenhum teste existente. Para o código Go, nós possuímos verificadores estáticos e um script ```goclean.sh``` em cada repo para executar os testes. Nenhum código será aceito sem passar por todos os testes. No caso do código node.js (decrediton), todo o código deve passar pelo eslint. Você pode verificar isso com o comando ```npm run lint```.

Finalizando, cada repo tem uma LICENÇA. Seu novo código deve estar sob a mesma LICENÇA que o código existente e os direitos autorais atribuídos ao 'The Decred Developers'. Na maioria dos casos, esta licença ISC é muito liberal, mas alguns repos são diferentes. Verifique o repo para ter certeza.

Se você tiver alguma dúvida para contribuir, sinta-se à vontade para perguntar no irc/slack ou GitHub. Os membros do time Decred (e provavelmente os membros da comunidade também) estarão felizes em ajudá-lo.
