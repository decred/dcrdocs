# Assinaturas Schnorr

---

O algoritmo de assinatura de Schnorr foi proposto para o Bitcoin. Ele também foi usado  extensivamente em outras cripitomoedas, como as moedas Nxt e CryptoNote.  Simplificando, o algoritmo de assinatura Schnorr é um criptosistema ECDSA-Elliptic Curve Digital Signature Algorithm, em português Algoritmo de Assinatura Digital de Curvas Elípticas que pode ser descrito da seguinte forma:

1. \(y = xG\) onde \(y\) é o ponto chave público na curva, \(x\) é uma escala privada, \(G\) é o gerador da curva.
2. \(R = kG\) onde \(r\) é o ponto da curva que resulta na multiplicação de \(k\), o nonce é um número arbitrário que só pode ser usado uma vez, pelo gerador.
3. \(h =H(M || r)\) onde \(H\) é uma função de hash segura, \(M\) é a mensagem (geralmente é um hash de 32 byte), e \(r\) é o ponto codificado anteriormente descrito. \(||\) que denota na concatenação.
4. \(s = k - hx\) onde \(s\) é o escalar denotado de \(k - hx\).
5. A assinatura é \((r,s)\), e a verificação é simples \(H(M || r) == hQ + sG\).

Acima, as multiplicações são feitas pela  letra maiúscula (Ex: \(kG\)) são multiplicações de pontos por um escalar e sempre resultam em um ponto da curva. A adição desses pontos resulta em outro ponto. Adições e multiplicações de escalares entre si são iguais às multiplicações regulares que você faria com qualquer número inteiro. É importante notar que ao multiplicar um ponto por um escalar é considerado um passo irreversível, porque o cálculo do escalar do novo ponto é padrão para o problema de logaritmo discreto.

Acima fica claro que \(r\) é o ponto da curva, enquanto \(s\) é um escalar. Considere o grupo de assinantes representados por \(x_{sum} = x_1 + ... + x_n\) com nonces \(k_{sum} = k_1 + ... + k_n\). A chave pública para a soma escalar privada seria: \(y = x_{sum} G\). A assinatura dessas somas (de todos os participantes do grupo) seria: \(r' = k_{sum} G s' = k_{sum} - h x_{sum}\). Para gerar essa assinatura, todos os participantes teriam que compartilhar suas chaves privadas e anteriores de antemão. Queremos, obviamente, evitar isso, então, em vez disso, deixe cada participante criar uma assinatura parcial. \(r_n = k_1 G + ... + k_n G = r'\) (A soma dos pontos públicos do nonce, os participantes podem publicar livremente e individualmente) \(s_n = k_n - h x_n\). Substituindo isso nas fórmulas gerais para assinaturas e usando adição de ponto ou escalar: \(r = r_n = r'\) (o mesmo que acima) \(s = s_1 + ... + s_n = s'\) (simples adição escalar; deve ser verdade que \((k_1 - h x_1) + ... + (k_n - h x_n) = s_1 + ... + s_n = s')\). Fazendo uma assinatura m-of-n não é trivial. Isso foi sugerido para que as árvores de dispersão contenha todos os possíveis valores de chave pública para \(m\)  participantes são usados para esses casos, gerando uma \(log(n)\) assinatura de  tamanho [28].

---

## <i class="fa fa-book"></i> Referências 

[^1]: Wuille P. 2015. [Tree signatures: Multisig on steroids using tree signatures](https://decred.org/research/wuille2015.pdf).
