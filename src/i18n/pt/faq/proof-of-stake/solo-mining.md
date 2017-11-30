# <i class="fa fa-male"></i> Mineração Solo

---

#### 1. Eu preciso de poder hash para minerar PoS?

Mineração PoS, não precisa de nenhum poder de hash [^9304]. Pense nisso como se fosse um acionista. Na PoS você bloqueia suas moedas por um período de tempo para comprar um ticket que lhe dá uma alta probabilidade (>99%) de ganhar direitos de voto e receber lucro na troca de um voto, com um custo de fee e possibilidade de não poder usar essas moedas por ~ 4,7 meses.

Se você já comprou os tickets em Stake, no momento essas moedas estão bloqueadas até que os tickets vençam o sorteio ou expirem. Como você esta em solo staking, você DEVE manter sua carteira on-line 24/7, até que todos os seus tickets vençam o sorteio(ou expirem) ou você vai perder as recompensas, uma vez que não pode votar se a carteira não estiver online. Porque essas moedas agora estão bloqueadas e não há como mudar as moedas apostadas de Stake.

A stake pool, por outro lado, permite que você delegue seus direitos de voto para a pool, ela é responsável por estar online 24/7 e votar para você.

---

#### 2. Não é um dos principais motivos da mineração garantir que sempre haja uma quantidade suficiente de pares on-line?

Definitivamente não[^9311]. A mineração não pode impor isso. Uma carteira de estilo SPV poderia facilmente realizar as apostas necessárias por comunicar-se com outros nós completos (instâncias do `dcrd`) na rede. É verdade que a carteira atual exige que o `dcrd` seja executado, mas isso nem sempre será o caso.

Mesmo se o software tentasse impor isso, você não conseguiria impedir que as pessoas escrevessem utilitários e fazê-lo através da rede peer-to-peer sem precisar executar sua própria instância local de qualquer maneira.

---

#### 3. O que aconteceria se minha carteira ficasse inacessível ou bloqueada quando meus tickets forem selecionados pelos mineradores?

Se a sua carteira estiver offline ou trancada[^9806] quando os seus tickets forem sorteados, você perderá as recompensas e seus tickets será removido da pool imediatamente. Não há "voltar a fazer".

---

#### 4. De alguma forma é possível testar se minha máquina está acessível para votar? Em outras palavras, executando as ações de um minerador, quem vai querer o meu voto.

Você não precisa estar acessível o tempo todo. Pois a votação é determinada basicamente em cada bloco[^9806]. Ou seja, a sua carteira saberá se o seu ticket foi sorteado com base no bloco atual e, em seguida, uma "transação de voto" (transação ssgen) é transmitida para a rede, assim como outras transações.

---

#### 5. Posso executar várias carteiras apenas para votar com a mesma seed em vários servidores?

Você pode ter múltiplas carteiras somente para votar porque não estão criando novos endereços[^12697]. O problema ocorre quando você tem duas carteiras criando transações que envolvem novos endereços porque eles não sabem o que o outro está fazendo.

Se você está fazendo uma configuração hot/cold, você pode criar múltiplas carteiras hot somente para votar sem problemas, desde que ambos estejam cientes do endereço para o qual você concede direitos de voto.

Continua para [Stake Pools FAQ](/faq/proof-of-stake/stake-pools.md)

---

## <i class="fa fa-book"></i> Fontes

[^9304]: Decred Forum, [Post 9,304](https://forum.decred.org/threads/626/page-2#post-9304)
[^9311]: Decred Forum, [Post 9,311](https://forum.decred.org/threads/582/page-2#post-9311)
[^9806]: Decred Forum, [Post 9,806](https://forum.decred.org/threads/180/page-6#post-9806)
[^12697]: Decred Forum, [Post 12,697](https://forum.decred.org/threads/1127/#post-12697)
