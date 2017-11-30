# <i class="fa fa-firefox"></i>Guia do Usuário da Web Wallet

---

Uma web wallet simples está disponível para usuários que não queiram instalar
um programa em seus computadores. Ela é baseada na [Copay](https://github.com/bitpay/copay), com as devidas mudanças para funcionar com Decred.
Pode ser encontrada em [https://wallet.decred.org](https://wallet.decred.org)

Há algumas coisas que você precisa saber sobre a web wallet
antes de usá-la:

* Você não pode fazer
  [PoS](/mining/proof-of-stake.md)
  com ela.
* Sua carteira é mantida inteiramente no armazenamento local do seu navegador
  web. Isso significa que, se você excluir o armazenamento local, você
  apaga sua carteira e deve recria-la com a seed.
* A segurança de sua carteira depende inteiramente na segurança do seu
  Navegador web.
* Você pode definir uma senha para sua carteira para proteger o envio de fundos, mas qualquer
  outro acesso depende inteiramente de acesso ao seu
  computador, não de um servidor ou qualquer login.

---

## <i class="fa fa-plus-circle"></i> Crie sua web wallet

> Primeiro passo

Vá em [https://wallet.decred.org](https://wallet.decred.org). Você será
apresentado aos `Termos e Condições`. Preste atenção dobrada
no seguinte:

Assim como na carteira via linha-de-comando, se você perder suas seed words ou sua
senha, você perderá acesso a sua carteira. Não existe
redefinição de senha. Tenha em mente também que todas as transações do Decred são,
por natureza, irreversíveis. Se você acidentalmente enviar fundos para o endereço errado,
terá que pedir ao destinatário que os envie de volta. Os
desenvolvedores também não são capazes de reverter transações.

Clique em `Eu Aceito` uma vez que tenha lido os `Termos e Condições`. Você
verá a tela de boas-vindas. Se for a primeira vez que você
usa Decred, clique em `Começar`. Se você quiser restaurar uma
carteira previamente utilizada, clique em `Importar Backup`. Este guia
assume que você está começando agora, portanto, clique em `Começar`.

> Segundo Passo

Click the dropdown in the top left, then click `Add wallet`. Click
`Create New Wallet`. Give your wallet a name then click `Create New Wallet`.

A wallet will be generated for you.


> Terceiro Passo

Sua carteira agora está criada e pronta para ser usada. Mas antes de fazer
qualquer coisa, você deveria adicionar uma senha para enviar DCR e fazer um backup
das seed words usadas para criar sua carteira. Fazer isso é duplamente importante para a web wallet, já que ela não guarda nenhum registro permanente da
sua carteira. Os dados dela estão guardados em cache no browser e
podem acabar sendo deletados muito facilmente. Se você estiver no modo Incognito,
os dados serão deletados assim que você fechar o browser. **SEM ESSA
SEED PHRASE VOCÊ PERDE ACESSO A TODOS OS FUNDOS NA SUA CARTEIRA** caso os dados sejam deletados. Os fundos ainda existirão na
blockhain mas, sem a seed, você não consegue acessá-los.

<i class="fa fa-exclamation-triangle"></i>**NÃO USE A MESMA SEED EM MÚLTIPLAS WALLETS! Visite [FAQs de Wallets e Seeds](/faq/wallets-and-seeds.md#3-can-i-run-multiple-wallets) para entender a importância. Recomenda-se que, sempre que possível, ao criar uma nova carteira, gere-se uma nova seed**

Clique no botão `Configurações` no lado oposto ao nome da sua carteira. Existem apenas três coisas com as quais você deve se preocupar aqui:

Opções                                | Descrição
---                                   | ---
`Nome da Carteira`                        | Você pode renomear a carteira da forma que quiser.
`Exigir Senha para Enviar Fundos` | Como sua carteira está salva no cache do browser, não há uma senha extra para acessá-la. Definir uma senha aqui garante que apenas você possa enviar fundos caso alguém acesse seu browser. Escolha uma senha e clique em `Definir`. Preste atenção ao alerta que diz que senhas não podem ser recuperadas. Não existe a opção de redefinir a senha da carteira. Se você perder sua senha, você não conseguirá transferir seus fundos para outras carteiras ou usá-los em votações PoS.
`Backup`                              | É aqui que você encontrará suas seed words

> Quarto Passo

Clique em `Backup`. Você verá esta tela:

Primeiramente, leia o aviso. utilize apenas UMA carteira por vez com uma
determinada seed (Veja: [Perguntas Frequentes](#)). Você pode ter várias carteiras instaladas em
diferentes máquinas, mas apenas uma delas deverá ser executada a qualquer
momento. Clique em `Exibir Seed da Carteira`. Anote essas palavras em algum lugar seguro, ou as coloque em um documento encriptado do qual você não vá esquecer
a senha. Essa lista de palavras é usada para gerar as chaves de autenticação
da sua carteira. Qualquer um que tenha essas palavras poderá acessar
seus fundos.

>** MUITO IMPORTANTE**

**SOB HIPÓTESE NENHUMA, SEJA LÁ QUAL FOR A CIRCUNSTÂNCIA, NUNCA INFORME SUAS SEED WORDS A NINGUÉM! NEM MESMO AOS DESENVOLVEDORES!**

Uma vez que você tenha anotado suas palavras e checado oito vezes se as escreveu corretamente (letras maiúsculas e minúsculas fazem diferença), prossiga para o próximo passo.

> Quinto Passo

Agora que você já anotou suas seed words e as verificou oito vezes, faça isso
novamente. Sério. Essa etapa é crítica. Sem essa lista, sua carteira
não pode ser restaurada e ninguém, nem mesmo os desenvolvedores, podem restaurá-la. Agora que você tem certeza de que as guardou em segurança, clique
em `Deletar Palavras`. Clique em `Voltar` duas vezes para voltar à tela principal da carteira.

---

## <i class="fa fa-long-arrow-right"></i> Enviar fundos utilizando o cliente web

> Primeiro passo

Na página principal da web wallet, clique no botão `Enviar` na parte
inferior. Você será direcionado a esta página. Repare que `Opções Avançadas`
já estarão abertas. No campo `Para`, insira o
endereço Decred do destinatário.

> Segundo Passo

Em `Quantidade`, insira o valor em DCR que deseja enviar ao destinatário. Se você
quiser, pode enviar uma mensagem opcional no campo `Notas`. Clique em
`Enviar`. A opção `Utilizar Fundos Não-Confirmados` permite que você utilize fundos que a rede sabe que estão sendo enviados a você, mas que ainda não foram confirmados  por
[mineradores proof-of-work](/mining/proof-of-work.md). Se
isso for habilitade e o valor especificado só for suficiente se utilizando fundos não-confirmados, a transação não será processada até que
eles tenham sido confirmados.

---

## <i class="fa fa-long-arrow-left"></i> Receber fundos com o cliente web

> Primeiro passo

Clique no botão `Receber` na parte inferior. Você verá
essa tela:

Compartilhe o endereço (é o que começa com `Ds`) exibido com a pessoa que lhe enviará DCR ou então envie a ela o QR Code, caso a carteira ou serviço
que ela usa consiga escaneá-lo. Você pode usar o mesmo endereço quantas vezes quiser, mas,
por razões de privacidade, é recomendado que você gere um novo endereço cada
vez que for receber DCR. Não se preocupe com a possibilidade de gerar um endereço duplicado. Existe
algo em torno de `2.08x10^93` possíveis endereços, então o universo provavelmente vai
morrer antes de esgotarmos as possibilidades de endereços Decred. 

