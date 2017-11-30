# Guia de Instalação da Paymetheus

Paymetheus é uma carteira gráfica e simples para usar Decred. Com ela, você pode enviar e receber DCR, 
para comprar tickets [PoS voting](/mining/proof-of-stake.md), obtenha o histórico de todas as suas transações e muito mais.
Única coisa sobre a Paymetheus é que ela não faz a votação PoS.

---

## Download e Instalação

The Windows Installer (`.msi` file) is located here: [https://github.com/decred/decred-binaries/releases/tag/v1.1.0](https://github.com/decred/decred-binaries/releases/tag/v1.1.0). It will install Paymetheus to your computer's Program Files folder. Installation is pretty straightforward, but instructions are provided below:

1. Baixe o arquivo correto:

    For 32-bit computers, download the `decred_1.1.0-release_x86.msi` file. <br />
    For 64-bit computers, download the `decred_1.1.0-release_x64.msi` file.

2. Navegue até o local do download e clique duas vezes no arquivo `.msi`.

3. Siga as etapas de instalação. Neste processo, você será solicitado a aceitar os termos de Licença de Usuário Final.

4. Após a instalação, os recursos devem estar salvos na sua pasta `..\Program Files\Decred\` e acessível através do menu iniciar (procure por `Decred` na lista de programas)

---

## Inicie a Paymetheus 
Pronto, agora você pode começar a usar Decred! Clique no programa/ícone "Decred". Agora você verá a tela de conexão:

![Paymetheus connection screen](../../img/Paymetheus-dcrd-login.png)  

>Atualmente dois programas são executados quando Decred é iniciado. Há 'Paymetheus', que é a carteira gráfica que falaremos mais sobre
>e 'dcrd' que é o daemon de comunicação (pronunciado DAY-mon; um programa que é executado em segundo plano e que não interage diretamente
> com um usuário) que atualmente fala com a rede Decred. Isso significa que você pode executar dcrd
>Em outro computador (atuando sempre como um servidor) e, em seguida, use Paymetheus para se conectar remotamente.

Vamos usar o local que a Paymetheus iniciou, então, apenas pressione Continuar.

> Na primeira vez que a Paymetheus é iniciada, ela baixará a blockchain em segundo plano. Isso pode demorar até uma hora.

---

## Criar ou Restaurar a Carteira
Agora você terá a opção de criar uma nova carteira ou restaurar uma carteira usando uma seed. Se você está lendo isso, provavelmente você é novo e não
tenha uma carteira, então vamos criar uma nova. Se você clicar em restaurar, você precisará  inserir suas 33 palavras da seed em vez de criar uma nova Seed.
O resto do processo é o mesmo. Clique em "Criar uma nova carteira". Você verá a seguinte tela:

![Tela de criação da carteira Paymetheus](/img/Paymetheus-seed-window.png)

<i class="fa fa-exclamation-triangle"></i> **ESPERE AQUI!!! NÃO CLIQUE EM CONTINUAR!**

**Esta é a parte mais importante para usar Decred. Na caixa branca, suas palavras da seed são exibidas. Essas palavras são a chave para sua carteira.  **
 **SEM ESTAS PALAVRAS OU A REPRESENTAÇÃO EM HEX VOCÊ PERDERÁ PERMANENTEMENTE O ACESSO AOS SEUS FUNDOS!**  

**NÃO COMPARTILHE ISSO COM NINGUÉM, NEM MESMO COM OS DESENVOLVEDORES DA DECRED!**

Com essas palavras, outra pessoa pode recriar sua carteira em outro computador e transferir todos os fundos para outra carteira. Não é possível reverter uma transação em Decred, então, se alguém roubar seu Decred, não há como recuperá-lo.

<i class="fa fa-exclamation-triangle"></i> **NÃO USE A MESMA SEED EM MÚLTIPLAS CARTEIRAS! Visite [Wallets and Seeds FAQ](/faq/wallets-and-seeds.md#3-can-i-run-multiple-wallets) para ver o porque da importância. Recomenda-se que, que crie uma nova carteira e gere uma nova seed.** 

Decred e outras moedas digitais são frequentemente descritas como se fosse uma conta bancária. Contudo, ao contrário dos serviços online banking, no sistema Decred não há intermediários confiáveis e que detém seu dinheiro é você mesmo em seu nome. Você e   só você controlam suas DCR, assim como um dinheiro físico. Quando o dinheiro ou o DCR é perdido, deslocado, ou roubado, é provável que permaneçam assim.

Se você perder o acesso a sua carteira, você perde o que tinha e ninguém, nem mesmo os desenvolvedores da Decred podem recuperá-la. Portanto, é muito importante que você tome um tempo para ler esta página e ESCREVA as palavras da semente em um lugar seguro. Uma boa idéia é escrevê-las em um pedaço de papel e armazená-los em algum lugar seguro e também armazená-las em um arquivo criptografado no seu computador. O armazenamento em nuvem, como Dropbox ou OneDrive, é bom quando as precauções são tomadas. Uma vez que as contas podem serem invadidas, você deve criptografar fortemente seu arquivo da carteira (o MS Word ou Libre/OpenOffice podem fazer isso) antes de enviá-lo para um serviço de armazenamento em nuvem.

Pronto, se você garantiu a segurança e salvou as suas palavras seed em pelo menos dois lugares diferentes. Clique em Continuar. Agora você precisa digita-las novamente para garantir que você as gravou corretamente e também no caso de você precisar restaurar sua carteira algum dia. Observe que você não pode colá-las; Você precisará digitá-las. Isto é para se certificar de que você tenha as palavras salvas em algum lugar além da área de transferência. Faça isso e clique em Confirmar.

---

## Escolha uma senha privada para a Carteira
Parar criar uma transação na rede você precisará digitar a senha privada. Enquanto sua carteira estiver bloqueada com esta senha privada, seus fundos da carteira estão inacessíveis para qualquer pessoa que tenha controle sobre o arquivo da carteira. Há também a opção de senha pública. Ela é usada para criptografar todos os dados públicos (transações e endereços) dentro do seu arquivo da carteira, então, se for roubado, um adversário não pode conectar-se às suas transações. Para a maioria das pessoas, uma senha pública geralmente é excessiva, então você pode deixá-la desmarcada. Uma vez inserido a nova senha privada (e publica opcional), clique em criptografar.

Agora sua carteira criará e sincronizará a blockchain. Isso pode demorar alguns minutos em computadores mais lentos. Observe que as palavras da seed que você escreveu vão 
funcionar em qualquer aplicação de carteira Decred, não apenas na Paymetheus.

Continue para [Using Paymetheus](using-paymetheus.md)
