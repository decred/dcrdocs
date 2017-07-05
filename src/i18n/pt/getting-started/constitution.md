# <i class="fa fa-gavel"></i> Constituição da Decred

---

A *Decred* (/ˈdi:ˈkred/, /dɪˈkred/, dee-cred) é uma criptomoeda aberta, progressiva e autofinanciada com um sistema de governança baseado na comunidade, integrado à sua blockchain. A missão do projeto é desenvolver tecnologias para o benefício público, com foco principal na tecnologia da criptomoeda. A *Decred*, como moeda e como projeto, está vinculada ao seguinte conjunto de regras, o qual inclui princípios orientadores, um sistema de governança e um mecanismo de financiamento. Essas regras foram estabelecidas num esforço para criar um quadro equitativo e sustentável no intuito de atingir os objetivos da *Decred*.

---

## Princípios

* *Software Free e de Código Aberto* - Todos os softwares desenvolvidos como parte da *Decred* devem ser free e de código aberto.
* *Liberdade de Expressão e Consideração* - Todos tem o direito de expressar opiniões e ideias sem medo de censura. Deve ser dada consideração à toda ideia construtiva que seja baseada em fatos e na razão. 
* *Inclusão Multi-Stakeholder* - A inclusão representa um sistema multi-stakeholder e um esforço contínuo deve ser mantido para incluir um leque diversificado de opiniões e usuários. Embora o ideal fosse incluir a todos, a *Decred* respeita todos os órgãos jurídicos relevantes nas jurisdições, onde aplicável, tais como embargos e outras sanções comerciais. 
* *Privacidade e Segurança Incrementais* - Privacidade e segurança são prioridades e devem ser equilibradas com a complexidade de suas implementações. Privacidade adicional e tecnologia da segurança devem ser implementadas de forma contínua e incremental, tanto proativamente como sob demanda em resposta a ataques.
* *Demanda Finita e Fixada* - A emissão é finita e o número máximo total de moedas em *Decred* não deve mudar. A demanda máxima total para a *Decred* é 20,999,999.99800912 de moedas, com um subsídio por bloco que se ajusta a cada 6,144 blocos (aproximadamente 21.33 dias) reduzindo em uma proporção de 100/101. O subsídio do bloco genesis começa com 31.19582664 moedas.   
* *Fungibilidade Universal* - A fungibilidade universal é fundamental para a *Decred* ser uma reserva de valor e ataques contra ela devem ser ativamente monitorados, inclusive com contramedidas sendo tomadas, se necessário.

---

## Governança Blockchain

* A governança da rede acontece diretamente na blockchain por meio da hibridização da Proof-of-Work ("PoW") com a Proof-of-Stake ("PoS"). Contribuintes de PoS, conhecidos como stakeholders, podem efetivamente passar por cima de contribuintes PoW, conhecidos como mineradores, se 60% ou mais dos stakeholders votarem contra um bloco específico criado por um minerador.
* Um sistema de loteria é usado para determinar quais stakeholders podem votar em cada bloco e pegar um subsídio.
* Para ser um stakeholder, deve-se comprar um ou mais tickets, o que implica bloquear uma quantidade específica de moedas por aproximadamente 1 dia (256 blocos).
* Depois de esperar pelo ticket ficar "mature", o ticket é inserido em um sorteio que é realizado uma vez por bloco, onde os tickets vencedores ganham a habilidade de votar no bloco anterior.  
* Stakeholders devem esperar em média 28 dias (8.192 blocos) para votar com seus tickets. Durante esse período, os DCR usados para a compra do ticket permanecem bloqueados. Essa espera pode tanto ser bem menor quanto bem maior do que os 28 dias porque o processo de seleção dos tickets é pseudo-randômico. Tickets expiram em aproximadamente 142 dias (40.960 blocos).
* Os votos dos stakeholders registrados na blockchain são recompensados com 6% do subsídio de cada bloco, que pode ter até 5 votos, por um total de 30% de seu subsídio.
* PoW recebe 60% do subsídio de cada bloco, estando sujeito à condição de que seu subsídio varia linearmente de acordo com o número de votos PoS incluídos. Por exemplo, a inclusão de 3 de 5 votos reduz o subsídio de PoW a 60% do máximo.
* Os próprios votos decidem por decisão majoritária se a árvore de transações gerais do bloco anterior, incluindo o subsídio da PoW, é válida. Assim, se os votantes da PoS votarem contra um bloco PoW em particular, ela destrói o subsídio da PoW (e o subsídio de desenvolvimento) e invalida quaisquer transações regulares dentro desse bloco.
* Os bits de votação adicionais podem ser definidos quando os stakeholders submetem votos, assim permitindo que os stakeholders votem em assuntos além dos blocos anteriores.

---

## Projeto de Governança

* Tomadas de decisão fora da blockchain serão usadas para resolver disputas relacionadas ao desenvolvimento e votadas pelos membros da *Assembleia da Decred* à medida que surgirem, como uma "PoA" (proof-of-assembly) efetiva, até que seja integrada à blockchain.
* A *Assembléia Decred* será composta por membros selecionados pelo *Conselho de Admissão*.
* Conselhos formados por membros da Assembléia serão formados para resolver assuntos recorrentes e eventuais. Os primeiros conselhos desempenharão papéis diferentes como admissão (*Conselho de Admissão*), criação (*Conselho de Criação*) e atrito (*Conselho de Atrito*).
* O *Conselho de Admissões* votará pela inclusão de novos membros à Assembleia. Todos os Conselhos adicionais serão criados pelo *Conselho de Criações*. O *Conselho para Atritos* será responsável tanto por desativar Conselhos como por desligar membros da Assembleia, caso seja necessário.
* A associação à *Assembleia da Decred* consistirá de membros da Assembleia que tiverem atingido 60% ou mais de votos afirmativos do *Conselho de Admissões*. Não há restrições de idade ou nacionalidade aos membros da Assembleia, tendo o mérito como único requisito, conforme julgado pelo *Conselho de Admissões*. O mérito é julgado com base em duas características: (1) a quantia de tempo pela qual alguém esteve envolvido no projeto, e (2) o conjunto de trabalhos desenvolvidos por alguém e seu impacto no contexto do projeto.
* O atrito é abrangido pelo desligamento temporário ou expulsão definitiva de membros da Assembleia por 60% ou mais de votos afirmativos do *Conselho para Atritos* com base em: (1) descumprimento substancial de deveres por um ou mais Conselhos ou pela Assembleia, e/ou (2) comportamento contraproducente que vá contra o quadro estabelecido na Constituição, sem ações construtivas visando soluções.
* Todos os assuntos apresentados formalmente ao Conselho deverão ser resolvidos por meio de voto em 365 dias ou menos.

---

## Financiamento

* A sustentabilidade e a longevidade da moeda exigem que um subsídio de 10% de todas as recompensas obtidas em cada bloco sejam destinadas a uma organização de desenvolvimento constantemente. A organização inicial será a *Decred Holdings Group* LLC ("DHG"), uma Nevis LLC que é responsável pelo financiamento do desenvolvimento do projeto, como desenvolvimento de software, infraestrutura e divulgação.
* DHG financiará apenas iniciativas que estiverem de acordo com os princípios do projeto.
* A DHG deverá liberar publicamente relatórios financeiros a cada seis meses, começando no dia 8 de março de 2016. A frequência de tais relatórios poderá aumentar com a atividade do projeto, mas não deverá exceder a trimestralidade.
* A cada ano, no dia 8 de março, a DHG deverá propor um orçamento após a liberação do relatório correspondente.
* O *Conselho de Financiamento* deverá revisar, propor mudanças, fazer mudançås e finalmente aprovar a proposta até o dia 8 de abril, um mês após a proposta inicial de orçamento.
* A aprovação final do orçamento via PoA deverá acontecer após a aprovação do *Conselho de Financiamento* até dia 18 de abril, dois meses após a proposta inicial.
* A DHG deverá fazer pedidos públicos de propostas ("PPPs") para projetos que deverão ser concluídos pelas partes sob contratos. PPPs deverão incluir um escopo e uma explicação de como tal trabalho será benéfico ao projeto. As partes que enviarem propostas deverão incluir: (1) uma descrição detalhada do trabalho a ser realizado, (2) uma série de marcos que poderão ser analisados enquanto o trabalho é realizado e (3), o custo do trabalho, discriminado pelos marcos estabelecidos, em dólares americanos ("USD").
* Todas as propostas, tanto submetidas como aceitas, serão divulgadas uma semana após uma proposta ter sido selecionada. Uma vez que a seleção ocorra, o PPP associado será removido. As partes contratadas serão pagas exclusivamente em *decred* ("DCR") no câmbio DCR/USD que estiver efetivo no momento do pagamento, a não ser que esteja especificado de outra forma.  
* No futuro, a organização de desenvolvimento pode precisar sofrer uma transformação de DHG para alguma outra entidade que sirva idêntico propósito. Se e quando isto ocorrer, a DHG deverá transferir todos os recursos para a nova entidade e o subsídio destinado ao desenvolvimento deverá ser redirecionado a esta nova entidade.
