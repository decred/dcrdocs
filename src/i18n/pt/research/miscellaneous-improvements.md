# Melhorias diversas

---

Como no Bitcoin, o subsídio decai exponencialmente com a elevação dos blocos. No entanto, o algoritmo Decred, embora também seja extremamente simples, intercala melhor esta deterioração ao longo do tempo, de modo a não produzir um  choque de mercado com a queda de subsídios íngremes semelhantes a CryptoNote[^1]. Como PeerCoin[^2], a dificuldade PoW é calculada a partir da média exponencialmente ponderada das diferenças dos tempos dos blocos anteriores. No entanto, esse cálculo também é intercalado em períodos de janela da dificuldade semelhantes ao do Bitcoin. O erro "timewarp" no Bitcoin é corrigido[^3], garantindo que toda diferença no tempo do bloco seja incorporada ao cálculo da dificuldade. 

Também deverá ser observado que muitos ataques de mineração bem conhecidos, como selfish mining[^4] e stubborn mining[^5], não funcionará mais vantajosamente em um sistema onde exista uma descentralização efetiva de Stake Mining e de mineração PoW-PoS. Isso é simples porque é impossível gerar extensões secretas para a blockchain sem a assistência de Stake Miners. A resiliência descrita anteriormente dos ataques de mineração recém-concebidos e de ataques específicos para nosso sistema, serão uma área com muitas oportunidades para futuras pesquisas.

---

## <i class="fa fa-book"></i> Referências 

[^1]: Buterin V. 2014. [A next-generation smart contract and decentralized application platform](https://decred.org/research/buterin2014.pdf).
[^2]: King S. and Nadal S. 2012. [PPCoin: Peer-to-peer crypto-currency with proof-of-stake](https://decred.org/research/king2012.pdf). 8
[^3]: ArtForz. 2011. [Re: Possible way to make a very profitable 50 plus-ish attack for pools?](https://decred.org/research/artforz2011.pdf)
[^4]: Eyal I. 2015. [The miner's dilemma](https://decred.org/research/eyal2015.pdf).
[^5]: Nayak K., Kumar S., Miller A., Shi E. 2015. [Stubborn mining: Generalizing selfish mining and combining with an eclipse attack](https://decred.org/research/nayak2015.pdf).
