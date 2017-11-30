# Detalhes da transação

---

Transações de Decred são transferências de DCR que acontecem entre blocos. Transações são compostas basicamente de inputs e outputs, apesar de possuírem também alguns outros campos de dados.


## Formato de transação

Campo        | Descrição                                                                                    | Tamanho
---          | ---                                                                                            | ---
Versão      | Versão da transação. Esse número é usado para indicar como a transação deve ser interpretada  | 4 bytes
Contagem de entradas  | O número de inputs na transação codificadas como um inteiro ivariable-length.                   | 1-9 bytes
Entradas       | Lista serializada de todas as inputs da transações                                                | Variável
Contagem de saídas | O número de outputs na transação codificadas como um inteiro ivariable-length.                  | 1-9 bytes
Saídas      | Lista serializada de todas as outputs da transações                                               | Variável
Tempo de bloqueio    | O momento em que uma transação pode ser gasta. (Geralmente zero, em caso que não tem efeito)       | 4 bytes
Expiração       | A elevação do bloco em que a transação expira e já não é mais válida                       | 4 bytes


### Entradas
As Inputs passam as outputs gastas anteriormente. Existem dois tipos de transação inputs: Witness e non-witness.


#### Non-Witness Inputs
Uma transação non-witness é uma referência de uma output não utilizada e a um número de seqüência. A referência para uma output não utilizada é chamada de "outpoint". As outpoints têm três campos:

Campo            | Descrição                                                                                                                           | Tamanho
---              | ---                                                                                                                                   | ---
Hash da transação | O hash da transação que contém a output que está sendo gasta                                                                     | 32 bytes
Índice de saída     | O índice da saída sendo gasto                                                                                                   | 4 bytes
Árvore             | Em qual árvore está o output sendo gasto. Isso é necessário pois existe mais de uma árvore usada para localizar transações em um bloco. | 1 byte

Além de uma outpoint, as inputs non-witness contêm um número de seqüência. Este número tem mais significado histórico do que o uso relevante; No entanto, seu objetivo mais relevante é habilitar o "locking" dos pagamentos para que eles não possam ser resgatados até um certo período.


#### Witness Inputs
Uma transação de input witness contém os dados necessários para provar que uma output pode ser gasta. Inputs witness contêm quatro campos de dados:

Field            | Descrição
---              | ---
Valor            | A quantidade de moedas sendo gasta que a saída esta transferindo.
Altura do bloco     | A elevação do bloco contém a transação na qual a output que está sendo gasta está localizada.
Índice do bloco      | O índice da transação em que a saída está sendo gasta está localizada.
Script da assinatura | O script que satisfaz os requisitos do script output que está sendo gasta.


### Saídas
As outputs são transferências de DCR que podem ser gastas pelas inputs. Outputs sempre têm três campos de dados:

Field             | Descrição                                                                                     | Tamanho
---               | ---                                                                                             | ---
Valor             | A quantidade de DCR sendo enviada pela saída.                                                     | 8 bytes
Versão           | A versão da output. Este número é usado para significar como a output deve ser interpretada. | 2 bytes
Script da chave pública | O script que deve ser satisfeito para gastar a output                                           | Variável

---

## Serialização
O formato exibido acima não é o qual transações são enviadas e recebidas. Ao enviar e receber transações, elas podem ser serializadas de algumas formas. A forma como uma transação deve ser desserializada pode ser determinada por sua versão. A versão de uma transação ocupa 4 bytes, mas esses bytes na verdade são utilizados para armazenar dois valores. Os primeiros 2 bytes representam o número da versão em si. Os dois últimos bytes representam o formato de serialização da transação.


### Formatos de serialização
Ao serializar, existem duas partes principais de uma transação: O seu "prefixo" e seus witness data. O prefixo da transação é composto por:

* Inputs (without any witness data)
* Saídas
* Tempo de bloqueio
* Expiry

Os witness data de uma transação envolvem somente suas inputs. Os campos de dados incluídos em suas inputs dependem do formato específico de serialização. Este formato pode ser qualquer um dos seguintes:

* **0 (Full serialization)** - O prefixo da transação está localizado imediatamente antes dos witness data.
* **1 (No witness)** - O prefixo da transação é o único dado presente.
* **2 (Only witness)** - Os witness data da transação são os únicos dados presentes. Para cada input, isso inclui seu valor, elevação do bloco, índice do bloco e script de assinatura.
* **3 (Witness signing)** - Os witness data da transação são os únicos dados presentes e são serializados para fins de assinatura. Para cada input, isso inclui apenas o script de assinatura.
* **4 (Witness signing with value)** - Os witness data da transação são os únicos dados presentes e são serializados para fins de assinatura. Ao contrário do formato de assinatura Witness, este formato inclui o valor de cada input antes do seu script de assinatura.
