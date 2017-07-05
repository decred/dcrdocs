# <i class="fa fa-money"></i> Carteiras e Seeds 

---

#### 1. Devo passar a seed da minha carteira a alguém? 

Não, você nunca[^8613] deve compartilhar a seed da sua carteira com ninguém. Fazer isso seria o equivalente a dar a outros toda e qualquer DCR naquela carteira.

---

#### 2. Como converto minha seed de carteira hexadecimal para palavras? 

Você pode usar o recurso [dcrseedhextowords](https://github.com/davecgh/dcrseedhextowords)[^8660] para transformar uma seed hexadecimal nas palavras necessárias para importação nas carteiras.

---

#### 3. Posso rodar várias carteiras com a mesma seed? 

Rodar várias carteiras com a mesma seed pode levar a uma situação onde as carteiras não mostrarão o mesmo balanço. Você não deve rodar várias carteiras com a mesma seed.[^9731]

A questão é que os endereços simplesmente são gerados, de forma determinística, a partir da própria seed. Ou seja, duas carteiras rodando com a mesma seed terão como resultado uma situação como essa:

* Carteira A: Reconhece todos os endereços até o #15
* Carteira B: Reconhece todos os endereços até o #12

Assim, quaisquer moedas que tenham sido enviadas aos endereços #13, #14 e #15 serão reconhecidas pela carteira A porém não pela carteira B.  

Além disso, se simplesmente disséssemos para a carteira B pegar o próximo endereço ela não enxergaria as moedas porque, a partir desse ponto de vista, esse endereço acabou de vir à existência e dessa forma ela não procuraria por transações antes do momento atual na linha do tempo. Isso é uma melhoria uma vez que, como pode imaginar, a blockchain naturalmente vai ficando muito grande com o passar do tempo e seria extremamente caro (em termos de utilização de recursos) analisar toda a rede cada vez que fosse gerado um novo endereço. 

Não há exceções nesse caso e isso é válido para carteiras ativas votantes que não possuem fundos próprios. Se a carteira estiver **apenas** votando e não comprando tickets ou gerando quaisquer outras transações, está tudo em segurança.[^11319] 

---

#### 4. Alguém pode roubar minhas moedas se tiverem acesso ao wallet.db? 

Ninguém é capaz de roubar suas moedas se conseguirem acesso ao arquivo wallet.db[^9803] a não ser que também possuam sua frase de acesso privada. Se você optou por usar criptografia pública também não será possível o acesso a nenhuma de suas chaves públicas estendidas ou endereços.

---

#### 5. É possível alguém usar um ataque de força bruta em uma carteira aleatória com o objetivo de gerar novamente as palavras da seed  (as palavras não são protegidas com sais)? 

Todas as palavras da seed são um mapeamento direto de palavras em Inglês para dígitos hexadecimais. A seed nada mais é que um número aleatório criptograficamente seguro de 256 bits (32 bytes). Sais não influenciam em nada aqui. Não tem relação nenhuma com números aleatórios de força bruta[^10452].

Em outras palavras, já que há 256 possibilidades diferentes para uma palavra e existem 32 palavras, quer dizer que há 256^32 (ou 2^256 dependendo de como queira levar em conta porém representam o mesmo). Esse número é maior do que todos os átomos de hidrogênio presentes no universo conhecido.  

Para deixar isso mais claro vamos assumir que há 7 bilhões de pessoas no planeta. Se cada uma possuísse 10 computadores sendo cada um desses computadores capaz de testar um bilhão de possibilidades por segundo e que a solução fosse encontrada depois de ser testada em média somente 50% do total de possibilidades, ainda levaria 26x10^48 (isso é 26 trilhões de trilhões de trilhões de trilhões) de anos para descobrir uma única seed por força bruta.

---

#### 6. Minha seed não está funcionando. O que posso fazer? 

Certifique-se de que todas as palavras estão em uma única linha separadas por espaços[^10657]. Embora estejam dispostas em várias linhas para melhor legibilidade elas devem inseridas em uma linha apenas. Também verifique se suas palavras não tem erros de digitação por compará-las às palavras na [PGP word list](https://en.wikipedia.org/wiki/PGP_word_list).

---

#### 7. Como importo uma chave que está no formato WIF (Wallet Import Format)? 

É possível importar uma chave privada[^10724] standalone na `dcrwallet`. Repare que isso é válido somente para endereços `--noseed` e não deve ser executado a não ser que saiba o que está fazendo!  

Desbloqueie a carteira (ignore os colchetes): 

```no-highlight
dcrctl --wallet walletpassphrase <private encryption passphrase> 60
```

Importe a chave privada standalone (`--noseed`) (ignore os colchetes):

```no-highlight
dcrctl --wallet importprivkey <put WIF private key here>
```

Observe o balanço da conta importada (aguarde um pouco para escanear novamente e veja o log na dcrwallet para checar o progresso do novo escaneamento): 

```no-highlight
dcrctl --wallet getbalance "imported" 0 all
```

---

#### 8. Qual a diferença entre um endereço da testnet e outro da mainnet? 

Um endereço de chave pública[^11507] da testnet começa com as letras `Tk`. Já um endereço da mainnet começa com as letras `Dk`. `T` = Testnet, `D` = Mainnet da (Decred).

---

#### 9. Quais são os diferentes tipos de endereços? 

Um endereço Decred[^14995] é na verdade só uma representação de uma chave pública (o que em si poderia ser um hash de script) junto com um prefixo de 2 bytes que identifica a rede e acrescenta um sufixo de soma de confirmação no intuito de detectar endereços inseridos incorretamente.  

Consequentemente sempre dá para saber o tipo de endereço baseado no prefixo de 2 bytes.

O primeiro byte do prefixo identifica a rede. É por isso que todos os endereços da mainnet começam com "D", endereços da testnet começam com "T" e endereços da simnet começam com "S". O segundo byte do prefixo identifica o tipo do endereço em questão. 

Os endereços mais comuns utilizados atualmente são hashes secp256k1, que são nomeados com um "s" minúsculo. Isso representa uma única chave pública e portanto há apenas uma chave privada associada ao endereço, a qual pode ser usada para recuperá-lo. 

Entretanto, o stake pool usa endereços P2SH, o que fica evidente pelo segundo byte sendo um "c" minúsculo (novamente, isso é mostrado nos parâmetros vinculados). O flavor específico do script que ele gera é um multi-sig 1-of-2, forma essa que é usada como permissão para que o pool, ou você, vote. Tanto você como o stake pool possuem suas próprias chaves privadas e, uma vez que o script exige apenas uma assinatura de duas possíveis, é assim que ele permite a delegação dos direitos de voto ao pool sem que você renuncie completamente aos seus direitos de voto.

---

## <i class="fa fa-book"></i> Fontes 

[^8613]: Fórum da Decred, [Post 8,613](https://forum.decred.org/threads/576/#post-8613)
[^8660]: Fórum da Decred, [Post 8,660](https://forum.decred.org/threads/534/page-3#post-8660)
[^9731]: Fórum da Decred, [Post 9,731](https://forum.decred.org/threads/657/#post-9731)
[^11319]: Fórum da Decred, [Post 11,319](https://forum.decred.org/threads/531/page-3#post-11319)
[^9803]: Fórum da Decred, [Post 9,803](https://forum.decred.org/threads/686/#post-9803)
[^10452]: Fórum da Decred, [Post 10,452](https://forum.decred.org/threads/734/#post-10452)
[^10657]: Fórum da Decred, [Post 10,657](https://forum.decred.org/threads/483/#post-10657)
[^10724]: Fórum da Decred, [Post 10,724](https://forum.decred.org/threads/643/page-3#post-10724)
[^11507]: Fórum da Decred, [Post 11,507](https://forum.decred.org/threads/792/#post-11507)
[^14995]: Fórum da Decred, [Post 14,995](https://forum.decred.org/threads/1321/page-2#post-14995)
