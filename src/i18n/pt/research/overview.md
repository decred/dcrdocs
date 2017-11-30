# <i class="fa fa-info-circle"></i>Visão Geral

---

Os protocolos distribuídos de marcação horária foram aplicados pela primeira vez para descentralizar uma rede financeira em um documento inovador sobre o Bitcoin por Nakamoto[^1]. O campo acompanhou a pesquisa explosiva de amadores e profissionais, concorrendo para oferecer extensões, ajustes, melhorias e aprimoramentos do protocolo existente. Implementações notáveis de novas idéias que incluem Ethereum[^2], que estendeu os scripts, CryptoNote[^3], que refinou a privacidade e cadeias laterais[^4], que investigou pinos de dois sentidos com tokens Bitcoin 1:1. Todos esses protocolos utilizam a proof-of-work (PoW) conforme descrito originalmente nos documentos do Bitcoin.

Uma extensão comum ao protocolo do Bitcoin modifica o mecanismo de consenso para usar completamente ou parcialmente o uso de proof-of-stake (PoS), ou o uso de sua participação (tokens) em vez do poder computacional, participar do processo de carimbo de data/hora. O primeiro proof-of-stake baseado na blockchain no protocolo do Bitcoin foi implementada em 2012 pelo King e Nadal[^5], e inclui os dois (PoW e PoS) que gradualmente se inclinam para completar o sistema PoS ao longo do tempo. As revisões e criticas aos sistemas de consenso PoS têm sido abundantes[^6] [^7], com a oposição mais forte proveniente daqueles que trabalham puramente com a rede blockchain e PoW. O argumento mais comum contra o sistema PoS e de carimbo data/hora distribuído é como "nada em jogo" ou uma "simulação sem custo", descrevendo certa instabilidade sistemática resultante nas partes interessadas que podem gerar histórias de datas carimbadas alternadas sem custo para si mesmas.

Apesar da controvérsia, é evidente que os sistemas com uma sobreposição de PoS é dependente de um sistema com carimbo de horário PoW pode ser capaz de alcançar o consenso de maneira independente. Isso é matematicamente explorado por Bentov e colegas[^8] em um artigo sobre seus esquemas, proof-of-activity (PoA), e parece ser uma extensão viável para os protocolos PoW que podem permitir algumas novas propriedades interessantes. Um projeto similar chamado MC2 foi proposto anteriormente pelo Mackenzie em 2013[^9]. Aqui descrevemos a construção e implementação de um sistema de consenso semelhante que denominamos de "Decred".

O trabalho de pesquisa em Decred está atualmente organizado em torno das seguintes subseções:

* [Design Híbrido](hybrid-design.md)
* [Pool de participações decentralizadas](decentralized-stake-pooling.md)
* [ECDSA, Algoritmo de Assinatura Digital de Curvas Elípticas.](elliptic-curve-signature-algorithms.md)
* [São funções de hash criptográficas. BLAKE-256 e BLAKE-224 usam palavras de 32 bits e produzem tamanhos de resumo de 256 bits e 224 bits, respectivamente, enquanto BLAKE-512 e BLAKE-384 usam palavras de 64 bits e produzem tamanhos de digestão de 512 bits e 384 bits, respectivamente.](blake-256-hash-function.md)
* [Extenções Script](script-extensions.md)
* [Isolamento de Scripts de Assinatura e Prova de Fraude](signature-script-isolation-and-fraud-proofs.md)
* [Extensões de transação](transaction-extensions.md)
* [Algoritmo de Assinatura de Schnorr](schnorr-signatures.md)
* [Melhorias Diversas](miscellaneous-improvements.md)

## <i class="fa fa-book"></i>Referências

[^1]: Nakamoto S. 2008. [Bitcoin: A peer-to-peer electronic cash system](https://decred.org/research/nakamoto2008.pdf).
[^2]: Buterin V. 2014. [A Next-generation smart contract and decentralized application platform](https://decred.org/research/buterin2014.pdf).
[^3]: von Saberhagen N. 2013. [CryptoNote v2.0](https://decred.org/research/saberhagen2013.pdf).
[^4]: Back A., Corallo M., Dashjr L., Friedenbach M., Maxwell G., Miller A., Poelstra A., Timon A., Wuille P. 2014. [Enabling Bitcoin innovations with pegged sidechains](https://decred.org/research/back2014.pdf).
[^5]: King S. and Nadal S. 2012. [PPCoin: Peer-to-peer crypto-currency with proof-of-stake](https://decred.org/research/king2012.pdf).
[^6]: Bentov I., Gabizon A., Mizrahi A. 2015. [Cryptocurrencies without proof-of-work](https://decred.org/research/bentov2015.pdf).
[^7]: Poelstra A. 2015. [On stake and consensus](https://decred.org/research/poelstra2015.pdf).
[^8]: Bentov I., Lee C., Mizrahi A., Rosenfeld M. 2014. [Proof-of-activity: Extending Bitcoin's proof-of-work via proof-of-stake](https://decred.org/research/bentov2014.pdf).
[^9]: Mackenzie A. 2013. [MEMCOIN2: A hybrid proof-of-work, proof-of-stake crypto-currency](https://decred.org/research/mackenzie2013.pdf).
