# Mineração Proof-of-Work (PoW)

---

## Visão geral

A mineração Proof-of-work, mais conhecida como mineração PoW, é a atividade
de comprometer o hardware e os recursos do seu computador para processar as 
transações na rede e construir os blocos que compõem a blockchain.
Cada vez que um bloco é criado (por um minerador), cerca de 30 novas Decreds
são feitas. Essas moedas são então divididas da seguinte forma:

Subsídio | Festa
---     | ---
60%   | Mineradores PoW 
30%   | Votantes PoS
10%   | Subsídio de desenvolvimento Decred

Você receberá, em média, uma recompensa que é aproximadamente proporcional ao
Hashrate do seu minerador frente ao Hashrate geral da rede quando você compromete
seu hardware na mineração PoW. Para começar, você deve ter um computador com uma
placa de vídeo. A maioria das placas podem ser usadas para mineração (incluindo as "móveis"
encontradas em alguns laptops). Em geral, as placas de vídeo de qualidade superior executam em
maiores hashrates e, portanto, recebem maiores recompensas.
---

## Mineração Solo ou Mineração em Pool

><i class="fa fa-male"></i> Mineração Solo

<i class="fa fa-exclamation-triangle"></i>** A Mineração Solo não é recomendada e não está coberta por esta documentação! ** A rede Decred vê regularmente uma taxa de hash de rede de até 10,000Gh/s . A Mineração Solo geralmente é feita apenas por indivíduos avançados ou grupos organizados com um grande cluster de GPUs, por isso não é abordado aqui.

><i class="fa fa-users"></i>Mineração em Pool

Quando você minera em uma pool, seu hashrate é combinado com todos os outros associados para procurar a solução correta para um determinado bloco. Você receberá uma recompensa com base na quantidade de trabalho que seu minerador executar na pool.
A mineração na pool distribui partes com base em blocos encontrados para que você possa ganhar uma quantidade constante de Decreds em vez de "tudo ou nada" da mineração solo.

---

## Obter um endereço Decred para receber fundos

Siga o guia [Noções Básicas dcrctl](/get-started/user-guides/dcrctl-basics.md) e crie um endereço para que você possa retirar recompensas de mineração.

---

## <i class="fa fa-life-ring"></i> Inscreva-se em uma Pool de Mineração 

Essas pools de mineração são conhecidos por apoiar a Decred:

* [<i class="fa fa-external-link-square"></i> http://decredpool.org](http://decredpool.org)
* [<i class="fa fa-external-link-square"></i>http://yiimp.ccminer.org ](http://yiimp.ccminer.org)
* [<i class="fa fa-external-link-square"></i> http://coinmine.pl/dcr](http://coinmine.pl/dcr)
* [<i class="fa fa-external-link-square"></i> https://dcr.maxminers.net](https://dcr.maxminers.net)
* [<i class="fa fa-external-link-square"></i> https://dcr.suprnova.cc](https://dcr.suprnova.cc)
* [<i class="fa fa-external-link-square"></i>https://pool.mn/dcr ](https://pool.mn/dcr)
* [<i class="fa fa-external-link-square"></i> https://zpool.ca](https://zpool.ca)

As pools de mineração funcionam mais ou menos da mesma forma, mas você pode se inscrever em várias e escolher a que achar melhor .

Por favor, escolha minerar em uma pool menor para que o hashrate da rede possa ser distribuído e gerar uma melhor descentralização do poder de mineração!

---

## GPU Drivers/Software

Os drivers da GPU geralmente contêm as bibliotecas necessárias para mineração. Se você tiver dificuldades em executar o software, poderá reinstalar e verificar especificamente se as bibliotecas OpenCL (AMD) ou CUDA (NVIDIA) estão selecionadas.

---

## <i class="fa fa-download"></i> Selecione e Baixe o Software de Mineração

### Minerador Oficial Decred (gominer)

Gominer é o minerador oficial da Decred, desenvolvido e apoiado pela equipe Decred. É o minerador mais fácil de configurar e começar a mineração e, portanto, é recomendado para a maioria dos usuários. Atualmente, a versão mais recente do gominer é ** <i class="fa fa-github"></i> [v1.0.0](https://github.com/decred/gominer/releases/)** e os binários oficiais podem ser obtidos em **[https://github.com/decred/decred-binaries/releases/tag/v1.0.0](https://github.com/decred/decred-binaries/releases/tag/v1.0.0)**

Certifique-se de selecionar o sistema operacional correto (Windows/Linux) e a versão correta para o seu tipo de GPU (CUDA para placas NVIDIA, OpenCL/OpenCLADL para placas AMD). O gominer está disponível apenas para sistemas operacionais de 64 bits. Os guias do usuário para iniciar a mineração com gominer podem ser encontrados aqui:

- [Mineração Pool no Windows ](/mining/proof-of-work/pool-mining/gominer/windows.md)

### Mineradores não oficiais

* <i class="fa fa-github"></i> [cgminer](https://github.com/kR105-zz/cgminer) - cgminer é um minerador popular para GPUs **AMD** e tem um longo histórico de uso em muitas criptomoedas diferentes. É mais difícil de usar do que o gominer.

* <i class="fa fa-github"></i> [ccminer](https://github.com/tpruvot/ccminer) - ccminer é um minerador popular para GPUs **NVIDIA **e tem um longo histórico de uso em muitas criptomoedas diferentes. É mais difícil de usar do que ao gominer.

* <i class="fa fa-github"></i> [sgminer](https://github.com/tpruvot/sgminer) - Aqueles com uma placa de vídeo **AMD** e executando o Windows também podem baixar o sgminer.

---

## Executando o software

* Descomprima e instale o software em um local de sua escolha.
* Abra um prompt de comando nesse caminho.
* Siga as instruções do seu grupo de mineração para a instalação.
* Execute o minerador.

Continuar em [PoW Mining FAQ](/ faq / proof-of-work-mining.md)
