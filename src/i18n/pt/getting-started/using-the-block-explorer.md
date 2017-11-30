# <i class="fa fa-cubes"></i>Usando o Explorador de Blocos

---

## <i class="fa fa-info-circle"></i>Visão Geral

Um explorador de blocos baseado em
[Insight](https://github.com/bitpay/insight-ui) que é o provedor
da rede Decred. Todos os blocos e transações na blockchain da Decred
são visíveis através do uso deste explorador de blocos, localizado em
[`https://mainnet.decred.org`](https://mainnet.decred.org) e
[`https://testnet.decred.org`](https://testnet.decred.org) para a
wallet testnet. Abaixo está uma revisão rápida de algumas das informações sobre
isso.

Opção         | Explicação
---            | ---
`Altura`       | O número do bloco
`Idade`          | Há quanto tempo o bloco foi adicionado a blockchain.
`Transações` | O número de transações incluídas no bloco.
`Votos`        | O número de blocos proof-of-stake incluídos no bloco.
`Fresh Stake`  | O número de novos tickets comprados nesse bloco.
`Tamanho`         | O tamanho (em bytes) do bloco.

Abaixo de `Últimas transações`, você pode ver o ID da transação (txid) e
o valor (em DCR) transmitido ao redor da rede.

---

## <i class="fa fa-cube"></i>Blocos

Os blocos podem serem encontrados e pesquisados pelo sequencial mais alto do bloco,
clicando no numero mais `alto` do bloco na página inicial, ou do seu
valor `BlockHash`. 
Os blocos mais antigos terão sequenciais de números de blocos mais baixos. O topo
exibi metade das informações relevantes sobre este bloco específico.
Esta informação inclui: o numero mais alto do bloco, o bloco
Hash e vários parâmetros chave da rede, descritos abaixo:

Opção                   | Explicação
---                      | ---
`Número de Transações` | O número de transações padrões (DCR enviada de um usuário para outro).
`Altura`                 | A altura da blockchain em que reside este bloco.
`Recompensa por bloco`           | A quantidade de novas DCR geradas nesse bloco.
`Timestamp`              | A hora em que este bloco foi criado por um minerador e incluído na blockchain.
`Merkle Root`            | O hash de todos os hashes de transações incluídas neste bloco.
`Stake Root`             | Um valor de hash de todo o stake é relacionado com as hashes da transação nesse bloco. Isso inclui a compra tickets, votos e revogações de ticket.
`VoteBits`               | (1) O Bloco foi aprovado pelos votantes POS. (2) O Block foi vetado pelos votantes POS e todas as transações “non-stake” no bloco foram invalidadas, em conjunto com o prêmio de mineração POW e o fundo de desenvolvimento.
`Estado final`            | O estado final de um gerador de número pseudo-aleatório usado para a seleção de tickets.
`Votantes`                 | O numero máximo de votos POS bem sucedidos emitidos neste bloco é de 5.
`Fresh Stake`            | O número de compras de tickets confirmadas nesse bloco.
`Revocations`            | O número de tickets que não votaram e foram revogados.
`PoolSize`               | O número total de tickets proof-of-stake ativos.
`Dificuldade`             | A dificuldade da rede proof-of-work
`SBits`                  | O preço de um ticket proof-of-stake.
`Bits`                   | Uma versão compactada da dificuldade da rede na hora que o bloco foi minerado.
`Tamanho`                   | O tamanho do bloco (em bytes).
`Versão`                | A versão do bloco.
`Nonce`                  | O valor usado por um minerador para encotrar a solução correta para este bloco.

## <i class="fa fa-exchange"></i>Transações

Esta seção lista todas as transações que foram extraídas para este
bloco. As transações da rede mempool são escolhidas pela ordem da
taxa mais alta primeiro. Na visão geral de todas as transações dos blocos seguem essa
ordem: transações padrão (transferência P2P), POS
votos, compras de tickets POS. As seguintes seções serão
exibidas em cada tipo de transação.

---

### Transações padrão

Aqui está a informação incluída nas transações padrão da Decred.

Opção              | Explicação
---                 | ---
`Tamanho`              | O tamanho da transação em bytes.
`Fee rate`          | As taxas cobradas pela rede são (por kB).
`Received Time`     | A hora que a rede confirmou a transação.
`Mined Time`        | A hora que o minerador incluiu a transação em um bloco.
`Incluído em Bloco` | O número do bloco que tornou-se parte de uma transação.

Note que `Received Time`, `Mined Time`, e `Included in Block` não terá um valor até que um minerador tenha validado a transação e a inclua em um bloco Decred. Depois de ser confirmado em um bloco, a transação é considerada completa.


---

### Compras de ticket

Para uma compra de ticket (submissão stake), existem algumas diferenças
de uma transação padrão apresentada.

Observa diferentes detalhes abaixo: à esquerda a palavra `Ticket` aparece acima dos
endereços da carteira dos remetentes, e as palavras `Subsidy
Commitment` aparecem à direita. Por exemplo, um usuário comprou o
ticket por 8.75411638 DCR e recebeu alteração no montante
de 7.15994209 DCR. O endereço listado à esquerda do `Ticket` é
o endereço que contém os fundos utilizados para comprar este
ticket. À direita consta a primeira saída, sendo o endereço que retém
os direitos de voto para este ticket em específico. A segunda saída, `Subsidy
Commitment`, é o endereço onde a recompensa irá. Isso ainda não é
mostrado pelo explorador de blocos neste momento. A terceira e última saída
é o endereço onde acontece a mudança e define pra onde esta transação será enviada.

---

### Votos proof-of-stake

Note estes termos para identificação na seção de detalhes: `Vote`, `Stake
Base`, `Block Commitment`, e `Vote Bits`:

Essas palavras-chaves indicam que essa transação foi lançada com sucesso
da POS para o portador do ticket. Neste exemplo
o usuário já havia comprado um ticket por 8.99472311 DCR
e foi lhe enviado 10.82959184 DCR após a votação ter sido emitida para esta transação.
