# <i class="fa fa-life-ring"></i> Stake Pools 

---

#### 1. Existem outros benefícios em usar uma stake pool além de não precisar rodar um full node e poder manter a minha carteira desbloqueada? Por exemplo, haverá mais chances de ser sorteado ou algo do tipo?

Stake pools geralmente implementam redundância multi-wallet. Elas rodam várias wallets distribuidamente ao redor do mundo. Isso significa que a possibilidade de um voto
ser perdido por uma carteira indiposnível é menor. Isso também reduz a latência entre a wallet e a rede, o que também contribui com a redução das chances de um voto ser perdido.

---

#### 2. Uma stakepool divide a recompensa entre todos os participantes (o % com base na quantidade de tickets que você submeteu na pool)?

É tecnicamente possível criar uma pool que tenha suporte à divisão proporcional da recompensa por PoS[^9262], mas a implementação atual de `dcrstakepool` não permite isso. Ela simplesmente vota em seu nome. Isso acontece fazendo dos direitos de voto  um script 1-of-2 multi-signature P2SH. A pool assina o voto com sua chave privada no momento em que o ticket é selecionado. Como trata-se de um script 1-of-2 multi-signature P2SH, significa que, caso a pool não consiga votar por você por qualquer motivo (o quer seria extremamente improvável, já que a pool mainnet tem várias redundâncias e recuperação de erro automática), ainda assim seria possível votar por conta própria porque você teria a segunda chave privada e poderia, portanto, realizar uma assinatura válida e satisfazer a exigência de 1-of-2.

Além disso, é importante deixar claro que na compra original do ticket existe um comprometimento em retornar a recompensa a um endereço a cuja chave privada só você tem acesso. As regras de consenso da votação proof-of-stake reforçam esse comprometimento, então é impossível que a pool roube seus DCR.

Para que pudesse dividir as recompensas, a pool precisaria ser a destinatária de todas elas e então a ela seria confiada a tarefa de dividir corretamente as devidas proporções entre todos os participantes. É esperado que esse esquema seja desenvolvido, mas tendo em mente e deixando claro que é menos seguro do que a forma como as pools funcionam atualmente.

---

#### 3. Eu tenho que executar minha carteira para comprar tickets, mas eles votarão corretamente se eu desliga-la e a pool é responsável por votar para mim em vez disso?

Sim[^9274], correto. Você só precisa executar sua wallet para comprar o ticket, o que delegará seu poder de voto à pool, que irá votar por você. A recompensa é um comprometimento endossado-por-consenso no momento da compra do ticket para um de seus endereços, a cuja chave privada apenas você tem acesso.

---

#### 4. Existem problemas que poderiam surgir em uma pool tendo muitas pessoas. Por exemplo, forçar a votação de um bloco dentro ou fora?

Certamente é possível[^9311], mas uma das coisas que todas as pools deveriam oferecer é a opção de permitir que o usuário configure suas preferências de voto individuais. Dessa forma, sempre que seu ticket for selecionado, a pool vai votar de acordo com suas vontades.

---

#### 5. Os bits de votação são definidos quando você compra um ticket ou quando seu ticket é chamado para voto? Isso muda quando em uma stakepool?

Os bits de votação são definidos na realidade quando com você vota[^ 13607] (o que realmente só faz sentido porque você pode ter comprado o ticket semanas ou meses antes de uma agenda de votação específica ainda existir).

Uma stakepool pode operar da forma que quiser desde que dê espaço a muita flexibilidade por conta da forma como o comprometimento sobre compras de tickets é projetado. Dito isto, em geral deve-se evitar a utiliação de pools que não permitam controlar seus votos em assuntos que não sejam específicos a pools.

---

#### 6. Que proteções existem para evitar que os donos da pool desapareçam com os fundos?

A forma como as pools foram projetadas garante que elas NÃO CONSEGUEM roubar seus DCR[^14593]. Você apenas delega poder de voto (e, na verdade, como trata-se de um 1-of-2 multisig, tanto você como a pool podem realizar o voto). Na compra do ticket existe um comprometimento endossado-por-consenso em entregar ao seu endereço a recompensa, portanto, não existem meios que permitam à pool roubar seus DCR.

O pior que poderia acontecer se um dono de uma pool simplesmente sumisse, seria que os votos daquela pool seria perdidos, ou seja, os tickets seria revogados, o que apenas faria com que os DCR investidos retornassem aos seus donos (menos as taxas de transação iniciais, é claro). Entretanto, como já foi explicado antes, devido à natureza 1-of-2 multisig dos tickets, cada usuário poderia deixar rodando sua própria wallet para garantir que o voto fosse realizado caso o dono da pool sumisse.

---

#### 7. Where can I see an example of a stake pool ticket on the block explorer? 

Stake pools utilizam endereços 'Dc' já que usam endereços pay-to-script-hash[^17515]. Por exemplo, veja txid: [c0abc0ec63a8de15550f067e2b6fde28f0432fb91b938574b282daa69f914103](https://mainnet.decred.org/tx/c0abc0ec63a8de15550f067e2b6fde28f0432fb91b938574b282daa69f914103).

Continue em  [PoS Voting Tickets FAQ](/faq/proof-of-stake/voting-tickets.md)

---

## <i class="fa fa-book"></i> Fontes

[^9262]: Decred Forum, [Post 9,262](https://forum.decred.org/threads/626/#post-9262)
[^9274]: Decred Forum, [Post 9,274](https://forum.decred.org/threads/626/#post-9274)
[^9311]: Decred Forum, [Post 9,311](https://forum.decred.org/threads/582/page-2#post-9311)
[^13607]: Decred Forum, [Post 13,607](https://forum.decred.org/threads/1236/#post-13607)
[^14593]: Decred Forum, [Post 14,593](https://forum.decred.org/threads/1321/#post-14593)
[^17515]: Decred Forum, [Post 17,515](https://forum.decred.org/threads/1289/#post-17515)
